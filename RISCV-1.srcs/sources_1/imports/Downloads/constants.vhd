-- Include this package in your modules with: USE work.constants.all;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE constants IS

  constant opcode_LOAD    : std_logic_vector(6 downto 0) := "0000011";
  constant opcode_MISC_MEM: std_logic_vector(6 downto 0) := "0001111";
  constant opcode_regimm  : std_logic_vector(6 downto 0) := "0010011";
  constant opcode_OP_IMM  : std_logic_vector(6 downto 0) := "0010011";
  constant opcode_AUIPC   : std_logic_vector(6 downto 0) := "0010111";
  constant opcode_STORE   : std_logic_vector(6 downto 0) := "0100011";
  constant opcode_regreg  : std_logic_vector(6 downto 0) := "0110011";
  constant opcode_OP      : std_logic_vector(6 downto 0) := "0110011";
  constant opcode_LUI     : std_logic_vector(6 downto 0) := "0110111";
  constant opcode_BRANCH  : std_logic_vector(6 downto 0) := "1100011";
  constant opcode_JALR    : std_logic_vector(6 downto 0) := "1100111";
  constant opcode_JAL     : std_logic_vector(6 downto 0) := "1101111";
  constant opcode_SYSTEM  : std_logic_vector(6 downto 0) := "1110011";

  constant funct_BEQ      : std_logic_vector(2 downto 0) := "000";
  constant funct_BNE      : std_logic_vector(2 downto 0) := "001";
  constant funct_BLT      : std_logic_vector(2 downto 0) := "100";
  constant funct_BGE      : std_logic_vector(2 downto 0) := "101";
  constant funct_BLTU     : std_logic_vector(2 downto 0) := "110";
  constant funct_BGEU     : std_logic_vector(2 downto 0) := "111";

  constant funct_ADD      : std_logic_vector(2 downto 0) := "000";
  constant funct_SLL      : std_logic_vector(2 downto 0) := "001";
  constant funct_SLT      : std_logic_vector(2 downto 0) := "010";
  constant funct_SLTU     : std_logic_vector(2 downto 0) := "011";
  constant funct_XOR      : std_logic_vector(2 downto 0) := "100";
  constant funct_SRL      : std_logic_vector(2 downto 0) := "101";
  constant funct_OR       : std_logic_vector(2 downto 0) := "110";
  constant funct_AND      : std_logic_vector(2 downto 0) := "111";

  constant funct_CSRRW    : std_logic_vector(2 downto 0) := "001";
  constant funct_CSRRS    : std_logic_vector(2 downto 0) := "010";
  constant funct_CSRRC    : std_logic_vector(2 downto 0) := "011";

  constant funct_MEM_B    : std_logic_vector(2 downto 0) := "000";
  constant funct_MEM_H    : std_logic_vector(2 downto 0) := "001";
  constant funct_MEM_W    : std_logic_vector(2 downto 0) := "010";
  
  constant CSR_7_SEG      : std_logic_vector(11 downto 0) := x"788";

  -- Utility constants
  constant INST_NOP       : std_logic_vector(31 downto 0) := x"000" & "00000" & funct_ADD & "00000" & opcode_OP_IMM;
  constant IDC_32         : std_logic_vector(31 downto 0) := "--------------------------------";
  constant ZERO_32        : std_logic_vector(31 downto 0) := x"00000000";

  -- RVC CONSTANTS
  -- Quadrants
  constant C0             : std_logic_vector(1 downto 0) := "00";
  constant C1             : std_logic_vector(1 downto 0) := "01";
  constant C2             : std_logic_vector(1 downto 0) := "10";

  -- Functs
  -- Q0
  constant funct_CADDI4SPN: std_logic_vector(2 downto 0) := "000";
  constant funct_CLW      : std_logic_vector(2 downto 0) := "010";
  constant funct_CSW      : std_logic_vector(2 downto 0) := "110";

  -- Q1
  constant funct_CADDI    : std_logic_vector(2 downto 0) := "000";
  constant funct_CJAL     : std_logic_vector(2 downto 0) := "001";
  constant funct_CLI      : std_logic_vector(2 downto 0) := "010";
  constant funct_CLUI     : std_logic_vector(2 downto 0) := "011";
  constant funct_COP      : std_logic_vector(2 downto 0) := "100";
  constant funct_CJ       : std_logic_vector(2 downto 0) := "101";
  constant funct_CBEQZ    : std_logic_vector(2 downto 0) := "110";
  constant funct_CBNEZ    : std_logic_vector(2 downto 0) := "111";

  -- Bits (11 downto 10) in Quadrant 1, funct_COP
  constant funct_CSRLI    : std_logic_vector(1 downto 0) := "00";
  constant funct_CSRAI    : std_logic_vector(1 downto 0) := "01";
  constant funct_CANDI    : std_logic_vector(1 downto 0) := "10";
  constant funct_CREGOP   : std_logic_vector(1 downto 0) := "11";

  -- Bits (12 + 6 downto 5) in Quadrant 1, funct_CREGOP
  constant funct_CSUB     : std_logic_vector(2 downto 0) := "000";
  constant funct_CXOR     : std_logic_vector(2 downto 0) := "001";
  constant funct_COR      : std_logic_vector(2 downto 0) := "010";
  constant funct_CAND     : std_logic_vector(2 downto 0) := "011";

  -- Q2
  constant funct_CSLLI    : std_logic_vector(2 downto 0) := "000";
  constant funct_CLWSP    : std_logic_vector(2 downto 0) := "010";
  constant funct_CSWSP    : std_logic_vector(2 downto 0) := "110";
END constants;