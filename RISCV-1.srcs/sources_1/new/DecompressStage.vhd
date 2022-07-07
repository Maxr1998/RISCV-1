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
        PCI        : in  STD_LOGIC_VECTOR (31 downto 0);
        PCO        : out STD_LOGIC_VECTOR (31 downto 0);
        Interlock  : in  STD_LOGIC;
        Clear      : in  STD_LOGIC;
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
        IF inst(1 downto 0) /= "11" THEN
            RETURN true;
        ELSE
            RETURN false;
        END IF;
    END FUNCTION;

    alias  InstHigh       : STD_LOGIC_VECTOR (15 downto 0) is InstI(31 downto 16);
    alias  InstLow        : STD_LOGIC_VECTOR (15 downto 0) is InstI(15 downto  0);
    signal InstBuffer     : STD_LOGIC_VECTOR (15 downto 0);
begin
    PROCESS (Clock, Reset)
    BEGIN
        IF Reset = '0' THEN
            InstO <= x"00000000";
            InstBuffer <= x"0000";
            PCO <= x"00000000";
            RepeatInst <= '0';
        ELSIF RISING_EDGE(Clock) THEN
            -- Check if there's an instruction remaining in buffer after a compressed instruction
            IF InstBuffer /= x"0000" THEN
                IF IS_RVC(InstBuffer) THEN
                    -- Another 16 bit instruction - current InstI will be repeated in next clock 
                    --InstO <= x"000" & "00000" & funct_ADD & "00000" & opcode_OP_IMM; -- NOP
                    InstO <= x"0000" & InstBuffer;
                    InstBuffer <= x"0000";
                    RepeatInst <= '0';
                ELSE
                    -- 32 bit instruction - combine with low part from next instruction
                    InstO <= InstLow & InstBuffer;
                    InstBuffer <= InstHigh;

                    -- Repeat the following instruction if we are still only processing the current one next clock
                    IF IS_RVC(InstHigh) THEN
                        RepeatInst <= '1';
                    ELSE
                        RepeatInst <= '0';
                    END IF;
                END IF;
                PCO <= std_logic_vector(unsigned(PCI) - 2);
            ELSE
                IF IS_RVC(InstI) and InstI /= x"00000000" THEN -- all zeros is an illegal instruction, handle in decode
                    -- Fresh 16 bit instruction
                    --InstO <= x"000" & "00000" & funct_ADD & "00000" & opcode_OP_IMM; -- NOP
                    InstO <= x"0000" & InstLow;
                    InstBuffer <= InstHigh;

                    -- Repeat the following instruction if we are still only processing the current one next clock
                    IF IS_RVC(InstHigh) THEN
                        RepeatInst <= '1';
                    ELSE
                        RepeatInst <= '0';
                    END IF;
                ELSE
                    -- 32 bit instruction
                    InstO <= InstI;
                    InstBuffer <= x"0000";
                    RepeatInst <= '0';
                END IF;
                PCO <= PCI;
            END IF;
        END IF;
    END PROCESS;
end Behavioral;
