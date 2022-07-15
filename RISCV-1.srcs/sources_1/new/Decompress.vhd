----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 02:13:16 PM
-- Design Name: 
-- Module Name: Decompress - Behavioral
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

entity Decompress is
    Port (
        InstI      : in  STD_LOGIC_VECTOR (31 downto 0);
        InstO      : out STD_LOGIC_VECTOR (31 downto 0);
        RVC        : in  STD_LOGIC;
        PCI        : in  STD_LOGIC_VECTOR (31 downto 0);
        PCO        : out STD_LOGIC_VECTOR (31 downto 0)
    );
end Decompress;

architecture Behavioral of Decompress is
    -- Decompress a RVC 3-bit register specification
    PURE FUNCTION DECOMPRESS_RVC_REG(reg: std_logic_vector) RETURN std_logic_vector IS
    BEGIN
        -- Assert input size
        ASSERT reg'high = 2 and reg'low = 0
        REPORT "Compressed register must have 3 bits"
        SEVERITY failure;
        RETURN "01" & reg;
    END FUNCTION;
begin
    PCO <= PCI;

    PROCESS (InstI, RVC)
        VARIABLE Imm6V       : STD_LOGIC_VECTOR ( 5 downto 0);
        VARIABLE Imm12V      : STD_LOGIC_VECTOR (11 downto 0);
        VARIABLE Imm20V      : STD_LOGIC_VECTOR (19 downto 0);
        ALIAS    CQuadrant   : STD_LOGIC_VECTOR ( 1 downto 0) IS InstI( 1 downto 0);
        ALIAS    CFunct3     : STD_LOGIC_VECTOR ( 2 downto 0) IS InstI(15 downto 13);
        ALIAS    CRegCL      : STD_LOGIC_VECTOR ( 2 downto 0) IS InstI( 4 downto 2); -- RVC compressed low register
        ALIAS    CRegCH      : STD_LOGIC_VECTOR ( 2 downto 0) IS InstI( 9 downto 7); -- RVC compressed high register
        ALIAS    CRegL       : STD_LOGIC_VECTOR ( 4 downto 0) IS InstI( 6 downto 2); -- RVC uncompressed high register
        ALIAS    CRegH       : STD_LOGIC_VECTOR ( 4 downto 0) IS InstI(11 downto 7); -- RVC uncompressed high register
    BEGIN
        IF RVC = '1' THEN
            -- Decompress instruction according to RISC-V specification
            CASE CQuadrant IS
                WHEN C0 =>
                    CASE CFunct3 IS
                        WHEN funct_CADDI4SPN =>
                            -- addi rd', sp, nzimm
                            Imm12V := "000" & InstI(10 downto 7) & InstI(12 downto 11) & InstI(5) & InstI(6) & "0";
                            InstO <= Imm12V & "00010" & funct_ADD & DECOMPRESS_RVC_REG(CRegCL) & opcode_OP_IMM;
                        WHEN funct_CLW =>
                            -- lw rd', offset[6:2](rs1')
                            Imm12V := "00000" & InstI(5) & InstI(12 downto 10) & InstI(6) & "00";
                            InstO <= Imm12V & DECOMPRESS_RVC_REG(CRegCH) & funct_MEM_W & DECOMPRESS_RVC_REG(CRegCL) & opcode_LOAD;
                        WHEN funct_CSW =>
                            -- sw rs2', offset[6:2](rs1')
                            InstO <= ("00000" & InstI(5) & InstI(12)) & DECOMPRESS_RVC_REG(CRegCL) & DECOMPRESS_RVC_REG(CRegCH) & funct_MEM_W & (InstI(11 downto 10) & InstI(6) & "00") & opcode_STORE;
                        WHEN OTHERS =>
                            InstO <= InstI; -- simply forward undefined instructions
                    END CASE;
                WHEN C1 =>
                    CASE CFunct3 IS
                        WHEN funct_CADDI =>
                            -- addi rd/rs1, rd/rs1, nzimm
                            Imm6V := InstI(12) & InstI(6 downto 2);
                            Imm12V := std_logic_vector(resize(signed(Imm6V), 12));
                            InstO <= Imm12V & CRegH & funct_ADD & CRegH & opcode_OP_IMM;
                        WHEN funct_CJAL =>
                            -- jal x1, offset[11:1]
                            Imm20V := "0" & InstI(8) & InstI(10 downto 9) & InstI(6) & InstI(7) & InstI(2) & InstI(11) & InstI(5 downto 3) & InstI(12) & x"00";
                            InstO <= Imm20V & "00001" & opcode_JAL;
                        WHEN funct_CLI =>
                            IF CRegH = "00000" THEN
                                -- HINT
                                InstO <= INST_NOP;
                            ELSE
                                -- C.LI
                                -- addi rd, x0, nzimm
                                Imm6V := InstI(12) & InstI(6 downto 2);
                                Imm12V := std_logic_vector(resize(signed(Imm6V), 12));
                                InstO <= Imm12V & "00000" & funct_ADD & CRegH & opcode_OP_IMM;
                            END IF;
                        WHEN funct_CLUI =>
                            IF CRegH = "00000" THEN
                                -- HINT
                                InstO <= INST_NOP;
                            ELSIF CRegH = "00010" THEN
                                -- C.ADDI16SP
                                -- addi x2, x2, nzimm
                                Imm6V := InstI(12) & InstI(4 downto 3) & InstI(5) & InstI(2) & InstI(6);
                                Imm12V := std_logic_vector(resize(signed(Imm6V), 8)) & "0000";
                                InstO <= Imm12V & CRegH & funct_ADD & CRegH & opcode_OP_IMM;
                            ELSE
                                -- C.LUI
                                -- lui, rd, nzuimm[17:12]
                                Imm6V := InstI(12) & InstI(6 downto 2);
                                Imm20V := std_logic_vector(resize(signed(Imm6V), 20));
                                InstO <= Imm20V & CRegH & opcode_LUI;
                            END IF;
                        WHEN funct_COP => -- various ALU operations
                            CASE InstI(11 downto 10) IS -- funct level 2
                                WHEN funct_CSRLI =>
                                    Imm6V := InstI(12) & InstI(6 downto 2);
                                    IF Imm6V = "000000" THEN
                                        -- HINT
                                        InstO <= INST_NOP;
                                    ELSE
                                        -- srli rd', rd', 64
                                        InstO <= "0000000" & InstI(6 downto 2) & DECOMPRESS_RVC_REG(CRegCH) & funct_SRL & DECOMPRESS_RVC_REG(CRegCH) & opcode_OP_IMM;
                                    END IF;
                                WHEN funct_CSRAI =>
                                    Imm6V := InstI(12) & InstI(6 downto 2);
                                    IF Imm6V = "000000" THEN
                                        -- HINT
                                        InstO <= INST_NOP;
                                    ELSE
                                        -- srai rd', rd', 64
                                        InstO <= "0100000" & InstI(6 downto 2) & DECOMPRESS_RVC_REG(CRegCH) & funct_SRL & DECOMPRESS_RVC_REG(CRegCH) & opcode_OP_IMM;
                                    END IF;
                                WHEN funct_CANDI =>
                                    -- andi rd', rd', imm[5:0]
                                    Imm6V := InstI(12) & InstI(6 downto 2);
                                    Imm12V := std_logic_vector(resize(signed(Imm6V), 12));
                                    InstO <= Imm12V & DECOMPRESS_RVC_REG(CRegCH) & funct_AND & DECOMPRESS_RVC_REG(CRegCH) & opcode_OP_IMM;
                                WHEN funct_CREGOP =>
                                    CASE InstI(12) & InstI(6 downto 5) IS -- (split) funct level 3
                                        WHEN funct_CSUB =>
                                            -- sub rd', rd', rs2'
                                            InstO <= "0100000" & DECOMPRESS_RVC_REG(CRegCL) & DECOMPRESS_RVC_REG(CRegCH) & funct_ADD & DECOMPRESS_RVC_REG(CRegCH) & opcode_OP;
                                        WHEN funct_CXOR =>
                                            -- xor rd', rd', rs2'
                                            InstO <= "0000000" & DECOMPRESS_RVC_REG(CRegCL) & DECOMPRESS_RVC_REG(CRegCH) & funct_XOR & DECOMPRESS_RVC_REG(CRegCH) & opcode_OP;
                                        WHEN funct_COR =>
                                            -- or rd', rd', rs2'
                                            InstO <= "0000000" & DECOMPRESS_RVC_REG(CRegCL) & DECOMPRESS_RVC_REG(CRegCH) & funct_OR  & DECOMPRESS_RVC_REG(CRegCH) & opcode_OP;
                                        WHEN funct_CAND =>
                                            -- and rd', rd', rs2'
                                            InstO <= "0000000" & DECOMPRESS_RVC_REG(CRegCL) & DECOMPRESS_RVC_REG(CRegCH) & funct_AND & DECOMPRESS_RVC_REG(CRegCH) & opcode_OP;
                                        WHEN OTHERS =>
                                            -- RESERVED
                                            InstO <= INST_NOP;
                                    END CASE;
                                WHEN OTHERS =>
                                    REPORT "Invalid funct2"
                                    SEVERITY failure;
                            END CASE;
                        WHEN funct_CJ =>
                            -- jal x0, offset[11:1]
                            Imm20V := "0" & InstI(8) & InstI(10 downto 9) & InstI(6) & InstI(7) & InstI(2) & InstI(11) & InstI(5 downto 3) & InstI(12) & x"00";
                            InstO <= Imm20V & "00000" & opcode_JAL;
                        WHEN funct_CBEQZ =>
                            -- beq rs1', x0, offset[8:1]
                            InstO <= "000" & InstI(12) & InstI(6 downto 5) & InstI(2) & "00000" & DECOMPRESS_RVC_REG(CRegCH) & funct_BEQ & InstI(11 downto 10) & InstI(4 downto 3) & "0" & opcode_BRANCH;
                        WHEN funct_CBNEZ =>
                            -- bne rs1', x0, offset[8:1]
                            InstO <= "000" & InstI(12) & InstI(6 downto 5) & InstI(2) & "00000" & DECOMPRESS_RVC_REG(CRegCH) & funct_BNE & InstI(11 downto 10) & InstI(4 downto 3) & "0" & opcode_BRANCH;
                        WHEN OTHERS =>
                            REPORT "Invalid funct3"
                            SEVERITY failure;
                    END CASE;
                WHEN C2 =>
                    CASE CFunct3 IS
                        WHEN funct_CSLLI =>
                            Imm6V := InstI(12) & InstI(6 downto 2);
                            IF Imm6V = "000000" THEN
                                -- HINT
                                InstO <= INST_NOP;
                            ELSE
                                -- slli rd', rd', 64
                                InstO <= "0000000" & InstI(6 downto 2) & CRegH & funct_SLL & CRegH & opcode_OP_IMM;
                            END IF;
                        WHEN funct_CLWSP =>
                            -- lw rd, offset[7:2](x2)
                            Imm12V := "0000" & InstI(3 downto 2) & InstI(12) & InstI(6 downto 4) & "00";
                            InstO <= Imm12V & "00010" & funct_MEM_W & CRegH & opcode_LOAD;
                        WHEN funct_COP =>
                            CASE InstI(12) IS
                                WHEN '0' =>
                                    IF CRegH /= "00000" and CRegL /= "00000" THEN
                                        -- C.MV
                                        -- add rd, x0, rs2
                                        InstO <= "0000000" & CRegL & "00000" & funct_ADD & CRegH & opcode_OP;
                                    ELSIF CRegH /= "00000" THEN
                                        -- C.JR
                                        -- jalr x0, rs1, 0
                                        InstO <= x"000" & CRegH & "000" & "00000" & opcode_JALR;
                                    ELSE
                                        -- RESERVED
                                        InstO <= INST_NOP;
                                    END IF;
                                WHEN '1' =>
                                    IF CRegL /= "00000" and CRegH /= "00000" THEN
                                        -- C.ADD
                                        -- add rd, rd, rs2
                                        InstO <= "0000000" & CRegL & CRegH & funct_ADD & CRegH & opcode_OP;
                                    ELSIF CRegH /= "00000" THEN
                                        -- C.JALR
                                        -- jalr x1, rs1, 0
                                        InstO <= x"000" & CRegH & "000" & "00001" & opcode_JALR; -- TODO: properly handle PCNext as +2
                                    ELSE
                                        -- C.EBREAK
                                        InstO <= INST_NOP; -- unsupported
                                    END IF;
                                WHEN OTHERS =>
                                    REPORT "Invalid funct"
                                    SEVERITY failure;
                            END CASE;
                        WHEN funct_CSWSP =>
                            -- sw rs2, offset[7:2](x2)
                            InstO <= ("0000" & InstI(8 downto 7) & InstI(12)) & CRegL & "00010" & funct_MEM_W & (InstI(11 downto 9) & "00") & opcode_STORE;
                        WHEN OTHERS =>
                            InstO <= InstI; -- simply forward undefined instructions
                    END CASE;
                WHEN OTHERS =>
                    REPORT "Invalid RVC quadrant"
                    SEVERITY failure;
            END CASE;
        ELSE
            InstO <= InstI; -- normal 32-bit instruction
        END IF;
    END PROCESS;
end Behavioral;