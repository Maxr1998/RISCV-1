----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2022 03:07:21 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port (
        A           : in  STD_LOGIC_VECTOR (31 downto 0);
        B           : in  STD_LOGIC_VECTOR (31 downto 0);
        Funct       : in  STD_LOGIC_VECTOR ( 2 downto 0);
        Aux         : in  STD_LOGIC;
        PCNext      : in  STD_LOGIC_VECTOR (31 downto 0);
        JumpI       : in  STD_LOGIC;
        JumpRel     : in  STD_LOGIC;
        JumpTargetI : in  STD_LOGIC_VECTOR (31 downto 0);
        MemAccessI  : in  STD_LOGIC;
        MemWrEn     : in  STD_LOGIC;
        SrcData2    : in  STD_LOGIC_VECTOR (31 downto 0);
        DestRegNoI  : in  STD_LOGIC_VECTOR (4 downto 0);
        DestWrEnI   : in  STD_LOGIC;
        Clear       : in  STD_LOGIC;
        X           : out STD_LOGIC_VECTOR (31 downto 0);
        JumpO       : out STD_LOGIC;
        JumpTargetO : out STD_LOGIC_VECTOR (31 downto 0);
        DestRegNoO  : out STD_LOGIC_VECTOR ( 4 downto 0);
        DestWrEnO   : out STD_LOGIC;
        MemAccessO  : out STD_LOGIC;
        MemWrData   : out STD_LOGIC_VECTOR (31 downto 0);
        MemByteEna  : out STD_LOGIC_VECTOR ( 3 downto 0);
        FunctO      : out STD_LOGIC_VECTOR ( 2 downto 0));
end ALU;

architecture Behavioral of ALU is
    PURE FUNCTION to_bit(bool: boolean) RETURN STD_LOGIC IS
    BEGIN
        IF bool THEN
            RETURN '1';
        ELSE
            RETURN '0';
        END IF;
    END FUNCTION;

    alias SrcData2B : STD_LOGIC_VECTOR (  7 downto 0) is SrcData2( 7 downto 0);
    alias SrcData2H : STD_LOGIC_VECTOR ( 15 downto 0) is SrcData2(15 downto 0);
begin
    DestRegNoO <= DestRegNoI;
    FunctO <= Funct;

    PROCESS(A, B, Funct, Aux, PCNext, JumpI, JumpRel, JumpTargetI, MemAccessI, MemWrEn, SrcData2, DestRegNoI, DestWrEnI, Clear)
        VARIABLE Result        : STD_LOGIC_VECTOR (31 downto 0);
        VARIABLE MemByteEnMask : STD_LOGIC_VECTOR ( 3 downto 0);
    BEGIN
        -- Compute result
        CASE Funct IS
            WHEN funct_ADD  =>
                IF Aux = '0' THEN
                    -- ADD
                    Result := std_logic_vector(unsigned(A) + unsigned(B));
                ELSE
                    -- SUB
                    Result := std_logic_vector(unsigned(A) - unsigned(B));
                END IF;
            WHEN funct_SLL  => Result := std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
            WHEN funct_SLT  =>
                IF signed(A) < signed(B) THEN
                    Result := std_logic_vector(to_unsigned(1, 32));
                ELSE
                    Result := std_logic_vector(to_unsigned(0, 32));
                END IF;
            WHEN funct_SLTU =>
                IF unsigned(A) < unsigned(B) THEN
                    Result := std_logic_vector(to_unsigned(1, 32));
                ELSE
                    Result := std_logic_vector(to_unsigned(0, 32));
                END IF;
            WHEN funct_XOR  => Result := A xor B;
            WHEN funct_SRL  =>
                IF Aux = '0' THEN
                    -- SRL
                    Result := std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
                ELSE
                    -- SRA
                    Result := to_stdlogicvector(to_bitvector(A) sra to_integer(unsigned(B(4 downto 0))));
                END IF;
            WHEN funct_OR   => Result := A or B;
            WHEN funct_AND  => Result := A and B;

            WHEN OTHERS => NULL;
        END CASE;

        -- Handle result
        IF MemAccessI = '1' THEN
            X <= std_logic_vector(unsigned(A) + unsigned(B));
        ELSIF JumpI = '1' THEN
            X <= PCNext;
        ELSE
            X <= Result;
        END IF;

        IF JumpRel = '0' THEN
            JumpTargetO <= Result;
        ELSE
            JumpTargetO <= JumpTargetI;
        END IF;

        IF Clear = '0' THEN
            DestWrEnO <= DestWrEnI;
            MemAccessO <= MemAccessI;

            -- Handle Memory
            IF MemWrEn = '1' THEN
                CASE Funct IS
                    WHEN funct_MEM_B => -- SB
                        MemWrData <= SrcData2B & SrcData2B & SrcData2B & SrcData2B;
                        MemByteEnMask := "0001";
                    WHEN funct_MEM_H => -- SH
                        MemWrData <= SrcData2H & SrcData2H;
                        MemByteEnMask := "0011";
                    WHEN funct_MEM_W => -- SW
                        MemWrData <= SrcData2;
                        MemByteEnMask := "1111";
                    WHEN OTHERS =>
                        MemWrData <= SrcData2; -- for optimization
                        MemByteEnMask := "1111";
                END CASE;

                MemByteEna <= std_logic_vector(
                    shift_left(
                        unsigned(MemByteEnMask),
                        -- Shift to specify which bytes are written (only for halfwords and bytes)
                        to_integer(unsigned(A(1 downto 0)) + unsigned(B(1 downto 0)))
                    )
                );
            ELSE
                MemByteEna <= "0000";
            END IF;

            -- Handle branch
            IF JumpI = '0' AND JumpRel = '1' THEN
                CASE Funct IS
                    WHEN funct_BEQ  => JumpO <= to_bit(A = B);
                    WHEN funct_BNE  => JumpO <= to_bit(A /= B);
                    WHEN funct_BLT  => JumpO <= to_bit(signed(A) < signed(B));
                    WHEN funct_BGE  => JumpO <= to_bit(signed(A) >= signed(B));
                    WHEN funct_BLTU => JumpO <= to_bit(unsigned(A) < unsigned(B));
                    WHEN funct_BGEU => JumpO <= to_bit(unsigned(A) >= unsigned(B));
                    WHEN OTHERS     => JumpO <= '-';
                END CASE;
            ELSE
                JumpO <= JumpI;
            END IF;
        ELSE -- Disable all output if clear is set
            DestWrEnO <= '0';
            JumpO <= '0';
            MemAccessO <= '0';
            MemByteEna <= "0000";
            MemWrData <= SrcData2; -- doesn't matter
        END IF;
    END PROCESS;
end Behavioral;
