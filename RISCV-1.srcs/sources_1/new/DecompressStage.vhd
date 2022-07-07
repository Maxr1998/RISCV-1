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
        IF inst(1 downto 0) /= "11" THEN
            RETURN true;
        ELSE
            RETURN false;
        END IF;
    END FUNCTION;

    -- Decompress a RVC 3-bit register specification
    PURE FUNCTION DECOMPRESS_RVC_REG(reg: std_logic_vector) RETURN std_logic_vector IS
    BEGIN
        -- Assert input size
        ASSERT reg'high = 2 and reg'low = 0
        REPORT "Compressed register must have 3 bits"
        SEVERITY failure;
        RETURN "01" & reg;
    END FUNCTION;

    alias  InstHigh       : STD_LOGIC_VECTOR (15 downto 0) is InstI(31 downto 16);
    alias  InstLow        : STD_LOGIC_VECTOR (15 downto 0) is InstI(15 downto  0);
    signal InstBuffer     : STD_LOGIC_VECTOR (15 downto 0);
    signal InstDebug      : STD_LOGIC_VECTOR (31 downto 0);
begin
    PROCESS (Clock, Reset)
        VARIABLE InstV      : STD_LOGIC_VECTOR (31 downto 0);
        ALIAS    CQuadrant   : STD_LOGIC_VECTOR ( 1 downto 0) IS InstV( 1 downto 0);
        ALIAS    CFunct3     : STD_LOGIC_VECTOR ( 2 downto 0) IS InstV(15 downto 13);
        VARIABLE Decompress : boolean;
    BEGIN
        IF Reset = '0' THEN
            InstO <= x"00000000";
            InstBuffer <= x"0000";
            PCO <= x"00000000";
            RepeatInst <= '0';
        ELSIF RISING_EDGE(Clock) THEN
            IF Stall = '0' THEN
                -- Check if there's an instruction remaining in buffer after a compressed instruction
                IF InstBuffer /= x"0000" THEN
                    IF IS_RVC(InstBuffer) THEN
                        -- Another 16 bit instruction - current InstI will be repeated in next clock 
                        InstV := x"0000" & InstBuffer;
                        Decompress := true;
                        InstBuffer <= x"0000";
                        RepeatInst <= '0';
                    ELSE
                        -- 32 bit instruction - combine with low part from next instruction
                        InstV := InstLow & InstBuffer;
                        Decompress := false;
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
                        InstV := x"0000" & InstLow;
                        Decompress := true;
                        InstBuffer <= InstHigh;

                        -- Repeat the following instruction if we are still only processing the current one next clock
                        IF IS_RVC(InstHigh) THEN
                            RepeatInst <= '1';
                        ELSE
                            RepeatInst <= '0';
                        END IF;
                    ELSE
                        -- 32 bit instruction
                        InstV := InstI;
                        Decompress := false;
                        InstBuffer <= x"0000";
                        RepeatInst <= '0';
                    END IF;
                    PCO <= PCI;
                END IF;

                IF Decompress THEN
                    -- Decompress instruction according to RISC-V specification
                    CASE CQuadrant IS
                        WHEN C0 =>
                            CASE CFunct3 IS
                                WHEN funct_CLW =>
                                    InstO <= "00000" & InstV(5) & InstV(12 downto 10) & InstV(6) & "00" & DECOMPRESS_RVC_REG(InstV(9 downto 7)) & funct_MEM_W & DECOMPRESS_RVC_REG(InstV(4 downto 2)) & opcode_LOAD;
                                WHEN funct_CSW =>
                                    InstO <= "00000" & InstV(5) & InstV(12) & DECOMPRESS_RVC_REG(InstV(4 downto 2)) & DECOMPRESS_RVC_REG(InstV(9 downto 7)) & funct_MEM_W & InstV(11 downto 10) & "00" & opcode_STORE;
                                WHEN OTHERS =>
                                    InstO <= InstV; -- simply forward undefined instructions
                            END CASE;
                        WHEN C1 =>
                            CASE CFunct3 IS
                                WHEN funct_CNOP =>
                                    InstO <= INST_NOP;
                                WHEN funct_CJAL =>
                                    InstO <= "0" & InstV(8) & InstV(10 downto 9) & InstV(6) & InstV(7) & InstV(2) & InstV(11) & InstV(5 downto 3) & InstV(12) & x"00" & "00001" & opcode_JAL;
                                WHEN funct_CJ =>
                                    InstO <= "0" & InstV(8) & InstV(10 downto 9) & InstV(6) & InstV(7) & InstV(2) & InstV(11) & InstV(5 downto 3) & InstV(12) & x"00" & "00000" & opcode_JAL;
                                WHEN OTHERS => -- TODO
                                    InstO <= InstV; -- TODO
                            END CASE;
                        WHEN C2 =>
                            InstO <= InstV; -- TODO
                        WHEN OTHERS =>
                            REPORT "Invalid RVC quadrant"
                            SEVERITY failure;
                    END CASE;
                ELSE
                    InstO <= InstV;
                END IF;
                InstDebug <= InstV;
            END IF;
        END IF;
    END PROCESS;
end Behavioral;
