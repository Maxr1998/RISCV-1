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
        Stall       : in  STD_LOGIC;
        X           : out STD_LOGIC_VECTOR (31 downto 0);
        JumpO       : out STD_LOGIC;
        JumpTargetO : out STD_LOGIC_VECTOR (31 downto 0);
        DestRegNoO  : out STD_LOGIC_VECTOR ( 4 downto 0);
        DestWrEnO   : out STD_LOGIC;
        MemAccessO  : out STD_LOGIC;
        MemWrData   : out STD_LOGIC_VECTOR (31 downto 0);
        MemByteEna  : out STD_LOGIC_VECTOR ( 3 downto 0));
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
begin
    DestRegNoO <= DestRegNoI;
    MemWrData <= SrcData2;

    PROCESS(Funct, A, B, Aux, PCNext, JumpI, JumpRel, JumpTargetI)
        VARIABLE Result : STD_LOGIC_VECTOR (31 downto 0);
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

        -- Handle Memory
        IF MemWrEn = '1' THEN
            MemByteEna <= "1111";
        ELSE
            MemByteEna <= "0000";
        END IF;

        IF Clear = '0' THEN
            DestWrEnO <= DestWrEnI;
            MemAccessO <= MemAccessI;

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
        END IF;
    END PROCESS;
end Behavioral;
