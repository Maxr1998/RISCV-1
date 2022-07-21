----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 01:30:40 PM
-- Design Name: 
-- Module Name: DecompressStage - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.constants.all;

entity DecompressStage is
    Port (
        Clock      : in  STD_LOGIC;
        Reset      : in  STD_LOGIC;
        InstI      : in  STD_LOGIC_VECTOR (31 downto 0);
        InstO      : out STD_LOGIC_VECTOR (31 downto 0);
        RVC        : out STD_LOGIC;
        PCI        : in  STD_LOGIC_VECTOR (31 downto 0);
        PCO        : out STD_LOGIC_VECTOR (31 downto 0);
        Interlock  : in  STD_LOGIC;
        Clear      : in  STD_LOGIC;
        Stall      : in  STD_LOGIC;
        RepeatInst : out STD_LOGIC
    );
end DecompressStage;

architecture Behavioral of DecompressStage is
    -- Return '1' if this instrution is compressed
    PURE FUNCTION IS_RVC(inst: std_logic_vector) RETURN boolean IS
    BEGIN
        -- Assert input size
        ASSERT inst'high >= 15 and inst'low = 0
        REPORT "Instruction requires at least 15 downto 0"
        SEVERITY failure;
        IF inst(1) = '0' or inst(0) = '0' THEN
            RETURN true;
        ELSE
            RETURN false;
        END IF;
    END FUNCTION;

    signal RVCBuffer      : STD_LOGIC_VECTOR (15 downto 0);

    alias  InstHigh       : STD_LOGIC_VECTOR (15 downto 0) is InstI(31 downto 16);
    alias  InstLow        : STD_LOGIC_VECTOR (15 downto 0) is InstI(15 downto  0);
begin
    PROCESS (Clock, Reset)
        VARIABLE RVCBufferV  : STD_LOGIC_VECTOR (15 downto 0);
        VARIABLE RepeatInstV : STD_LOGIC;
        VARIABLE InstV       : STD_LOGIC_VECTOR (31 downto 0);
        VARIABLE RVCV        : STD_LOGIC;
    BEGIN
        IF Reset = '0' THEN
            InstO <= ZERO_32;
            RVC <= '0';
            RVCBuffer <= x"0000";
            PCO <= ZERO_32;
            RepeatInst <= '0';
        ELSIF RISING_EDGE(Clock) THEN
            IF Stall = '0' and (Clear = '1' or Interlock = '0') THEN
                -- Check if there's an instruction remaining in buffer after a compressed instruction
                IF RVCBuffer /= x"0000" THEN
                    IF IS_RVC(RVCBuffer) THEN
                        -- Another 16 bit instruction - current InstI will be repeated in next clock 
                        InstV := x"0000" & RVCBuffer;
                        RVCV := '1';
                        RVCBufferV := x"0000";
                        RepeatInstV := '0';
                    ELSE
                        -- 32 bit instruction - combine with low part from next instruction
                        InstV := InstLow & RVCBuffer;
                        RVCV := '0';
                        RVCBufferV := InstHigh;

                        -- Repeat the following instruction if we are still only processing the current one next clock
                        IF IS_RVC(InstHigh) THEN
                            RepeatInstV := '1';
                        ELSE
                            RepeatInstV := '0';
                        END IF;
                    END IF;
                    PCO <= std_logic_vector(unsigned(PCI) - 2); -- PC of instruction is 2 bytes before the current one
                ELSE
                    IF PCI(1) = '1' THEN -- unaligned instruction after jump
                        IF IS_RVC(InstHigh) THEN
                            -- Just process the remaining 16 bit instruction
                            InstV := x"0000" & InstHigh;
                            RVCV := '1';
                            RVCBufferV := x"0000";
                        ELSE
                            -- Incomplete 32 bit instruction, save to buffer and nop
                            InstV := ZERO_32;
                            RVCV := '0';
                            RVCBufferV := InstHigh;
                        END IF;
                        RepeatInstV := '0';
                    ELSIF IS_RVC(InstI) and InstI /= ZERO_32 THEN -- all zeros is an illegal instruction, handle in decode
                        -- Fresh 16 bit instruction
                        InstV := x"0000" & InstLow;
                        RVCV := '1';
                        RVCBufferV := InstHigh;

                        -- Repeat the following instruction if we are still only processing the current one next clock
                        IF IS_RVC(InstHigh) THEN
                            RepeatInstV := '1';
                        ELSE
                            RepeatInstV := '0';
                        END IF;
                    ELSE
                        -- 32 bit instruction
                        InstV := InstI;
                        RVCV := '0';
                        RVCBufferV := x"0000";
                        RepeatInstV := '0';
                    END IF;
                    PCO <= PCI;
                END IF;

                IF Clear = '1' THEN
                    InstO <= ZERO_32;
                    RVC <= '0';
                    RVCBuffer <= x"0000";
                    PCO <= ZERO_32;
                    RepeatInst <= '0';
                ELSE
                    InstO <= InstV;
                    RVC <= RVCV;
                    RVCBuffer <= RVCBufferV;
                    RepeatInst <= RepeatInstV;
                END IF;
            END IF;
        END IF;
    END PROCESS;
end Behavioral;
