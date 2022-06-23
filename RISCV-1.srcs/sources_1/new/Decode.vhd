----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2022 12:54:29 PM
-- Design Name: 
-- Module Name: Decode - Behavioral
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

entity Decode is
    Port (
        Inst       : in  STD_LOGIC_VECTOR (31 downto 0);
        Funct      : out STD_LOGIC_VECTOR ( 2 downto 0);
        SrcRegNo1  : out STD_LOGIC_VECTOR ( 4 downto 0);
        SrcRegNo2  : out STD_LOGIC_VECTOR ( 4 downto 0);
        DestWrEn   : out STD_LOGIC;
        DestRegNo  : out STD_LOGIC_VECTOR ( 4 downto 0);

        Aux        : out STD_LOGIC;
        PC         : in  STD_LOGIC_VECTOR (31 downto 0);
        PCNext     : out STD_LOGIC_VECTOR (31 downto 0);
        Jump       : out STD_LOGIC;
        JumpRel    : out STD_LOGIC;
        JumpTarget : out STD_LOGIC_VECTOR (31 downto 0);
        MemAccess  : out STD_LOGIC;
        MemWrEn    : out STD_LOGIC;
        InterlockI : in  STD_LOGIC;
        InterlockO : out STD_LOGIC;
        Imm        : out STD_LOGIC_VECTOR (31 downto 0);
        SelSrc2    : out STD_LOGIC;
        Clear      : in  STD_LOGIC
    );
end Decode;

architecture Behavioral of Decode is
    alias OpcodeA   : STD_LOGIC_VECTOR ( 6 downto 0) is Inst(6 downto 0);
    alias RdA       : STD_LOGIC_VECTOR ( 4 downto 0) is Inst(11 downto 7);
    alias FunctA    : STD_LOGIC_VECTOR ( 2 downto 0) is Inst(14 downto 12);
    alias Rs1A      : STD_LOGIC_VECTOR ( 4 downto 0) is Inst(19 downto 15);
    alias Rs2A      : STD_LOGIC_VECTOR ( 4 downto 0) is Inst(24 downto 20);
    alias AuxA      : STD_LOGIC                      is Inst(30);
    alias Imm12A    : STD_LOGIC_VECTOR (11 downto 0) is Inst(31 downto 20);
    alias Imm20A    : STD_LOGIC_VECTOR (19 downto 0) is Inst(31 downto 12);
begin
    -- Set signals that apply to all Opcodes

    -- Funct needs special care
    -- SrcRegNo1 needs special care
    SrcRegNo2 <= Rs2A;
    -- DestWrEn needs special care
    DestRegNo <= RdA;
    -- Aux needs special care
    -- Jump needs special care
    -- JumpRel needs special care
    -- JumpTarget needs special care
    -- MemAccess needs special care
    -- MemWrEn needs special care
    -- InterlockO needs special care
    -- Imm needs special care
    -- SelSrc2 needs special care

    PROCESS (Inst, PC, InterlockI, Clear)
        VARIABLE DestWrEnV  : STD_LOGIC;
        VARIABLE JumpV      : STD_LOGIC;
        VARIABLE JumpRelV   : STD_LOGIC;
        VARIABLE MemAccessV : STD_LOGIC;
        VARIABLE MemWrEnV   : STD_LOGIC;
        VARIABLE InterlockV : STD_LOGIC;
        VARIABLE ImmS       : STD_LOGIC_VECTOR (11 downto 0);
        VARIABLE ImmB       : STD_LOGIC_VECTOR (12 downto 0);
        VARIABLE ImmJ       : STD_LOGIC_VECTOR (20 downto 0);
    BEGIN
        -- Set signals specific to an Opcode
        CASE OpcodeA is
            WHEN opcode_OP =>
                Funct <= FunctA;
                SrcRegNo1 <= Rs1A;
                DestWrEnV := '1';

                Aux <= AuxA;
                PCNext <= IDC_32;
                JumpV := '0';
                JumpRelV := '0';
                JumpTarget <= IDC_32;
                MemAccessV := '0';
                MemWrEnV := '0';
                InterlockV := '0';
                Imm <= IDC_32;
                SelSrc2 <= '1'; -- use SrcRegNo1 as B
            WHEN opcode_OP_IMM =>
                Funct <= FunctA;
                SrcRegNo1 <= Rs1A;
                DestWrEnV := '1';

                CASE FunctA is
                    WHEN funct_ADD => Aux <= '0';
                    WHEN OTHERS => Aux <= AuxA;
                END CASE;
                PCNext <= IDC_32;
                JumpV := '0';
                JumpRelV := '0';
                JumpTarget <= IDC_32;
                MemAccessV := '0';
                MemWrEnV := '0';
                InterlockV := '0';
                Imm <= std_logic_vector(resize(signed(Imm12A), 32));
                SelSrc2 <= '0'; -- use Imm as B
            WHEN opcode_LUI =>
                Funct <= funct_XOR; -- set funct to XOR so that the immediate value is written to the destination
                SrcRegNo1 <= "00000"; -- set to zero register
                DestWrEnV := '1';

                Aux <= '0';
                PCNext <= IDC_32;
                JumpV := '0';
                JumpRelV := '0';
                JumpTarget <= IDC_32;
                MemAccessV := '0';
                MemWrEnV := '0';
                InterlockV := '0';
                Imm <= Imm20A & x"000"; -- pad 20 bit immediate with 12 bits at the end
                SelSrc2 <= '0'; -- use Imm as B
            WHEN opcode_AUIPC =>
                Funct <= funct_XOR; -- set funct to XOR so that the immediate value is written to the destination
                SrcRegNo1 <= "00000"; -- set to zero register
                DestWrEnV := '1';

                Aux <= '0';
                PCNext <= IDC_32;
                JumpV := '0';
                JumpRelV := '0';
                JumpTarget <= IDC_32;
                MemAccessV := '0';
                MemWrEnV := '0';
                InterlockV := '0';
                Imm <= std_logic_vector(signed(PC) + signed(Imm20A & x"000")); -- pad 20 bit immediate with 12 bits at the end
                SelSrc2 <= '0'; -- use Imm as B
            WHEN opcode_JAL =>
                Funct <= "---";
                SrcRegNo1 <= "-----";
                DestWrEnV := '1';

                Aux <= '-';
                PCNext <= std_logic_vector(signed(PC) + 4);
                JumpV := '1';
                JumpRelV := '1';
                ImmJ := Inst(31) & Inst(19 downto 12) & Inst(20) & Inst(30 downto 21) & '0';
                JumpTarget <= std_logic_vector(signed(PC) + signed(ImmJ));
                MemAccessV := '0';
                MemWrEnV := '0';
                InterlockV := '0';
                Imm <= IDC_32;
                SelSrc2 <= '-';
            WHEN opcode_JALR =>
                Funct <= FunctA;
                SrcRegNo1 <= Rs1A;
                DestWrEnV := '1';

                Aux <= '0'; -- ADD
                PCNext <= std_logic_vector(signed(PC) + 4);
                JumpV := '1';
                JumpRelV := '0';
                JumpTarget <= IDC_32;
                MemAccessV := '0';
                MemWrEnV := '0';
                InterlockV := '0';
                Imm <= std_logic_vector(resize(signed(Imm12A), 32));
                SelSrc2 <= '0'; -- use Imm as B
            WHEN opcode_BRANCH =>
                Funct <= FunctA;
                SrcRegNo1 <= Rs1A;
                DestWrEnV := '0';

                Aux <= '-';
                PCNext <= IDC_32;
                JumpV := '0';
                JumpRelV := '1';
                ImmB := Inst(31) & Inst(7) & Inst(30 downto 25) & Inst(11 downto 8) & '0';
                JumpTarget <= std_logic_vector(signed(PC) + signed(ImmB));
                MemAccessV := '0';
                MemWrEnV := '0';
                InterlockV := '0';
                Imm <= IDC_32;
                SelSrc2 <= '1';
            WHEN opcode_LOAD =>
                Funct <= FunctA;
                SrcRegNo1 <= Rs1A;
                DestWrEnV := '1';

                Aux <= '-';
                PCNext <= IDC_32;
                JumpV := '0';
                JumpRelV := '0';
                JumpTarget <= IDC_32;
                MemAccessV := '1';
                MemWrEnV := '0';
                InterlockV := '1';
                Imm <= std_logic_vector(resize(signed(Imm12A), 32));
                SelSrc2 <= '0'; -- use Imm as B
            WHEN opcode_STORE =>
                Funct <= FunctA;
                SrcRegNo1 <= Rs1A;
                DestWrEnV := '0';

                Aux <= '-';
                PCNext <= IDC_32;
                JumpV := '0';
                JumpRelV := '0';
                JumpTarget <= IDC_32;
                MemAccessV := '1';
                MemWrEnV := '1';
                InterlockV := '0';
                ImmS := Inst(31 downto 25) & Inst(11 downto 7);
                Imm <= std_logic_vector(resize(signed(ImmS), 32));
                SelSrc2 <= '0'; -- use Imm as B
            WHEN OTHERS =>
                Funct <= "---";
                SrcRegNo1 <= "-----";
                DestWrEnV := '0';

                Aux <= '-';
                PCNext <= IDC_32;
                JumpV := '0';
                JumpRelV := '0';
                JumpTarget <= IDC_32;
                MemAccessV := '0';
                MemWrEnV := '0';
                InterlockV := '0';
                Imm <= IDC_32;
                SelSrc2 <= '-';
        END CASE;

        -- Disable all output if clear is set
        IF Clear = '1' OR InterlockI = '1' THEN
            DestWrEnV := '0';
            JumpV := '0';
            JumpRelV := '0';
            MemAccessV := '0';
            MemWrEnV := '0';
            InterlockV := '0';
        END IF;

        DestWrEn <= DestWrEnV;
        Jump <= JumpV;
        JumpRel <= JumpRelV;
        MemAccess <= MemAccessV;
        MemWrEn <= MemWrEnV;
        InterlockO <= InterlockV;
    END PROCESS;
end Behavioral;
