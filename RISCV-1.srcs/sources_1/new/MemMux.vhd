----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/15/2022 12:11:31 PM
-- Design Name: 
-- Module Name: MemMux - Behavioral
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

entity MemMux is
    Port (
        ALUDataIn    : in  STD_LOGIC_VECTOR (31 downto 0);
        MemoryDataIn : in  STD_LOGIC_VECTOR (31 downto 0);
        RomDataIn    : in  STD_LOGIC_VECTOR (31 downto 0);
        Sel          : in  STD_LOGIC;
        FunctI       : in  STD_LOGIC_VECTOR (2 downto 0);
        WrData       : out STD_LOGIC_VECTOR (31 downto 0)
    );
end MemMux;

architecture Behavioral of MemMux is
begin
    PROCESS (ALUDataIn, MemoryDataIn, RomDataIn, Sel, FunctI)
        VARIABLE signed : STD_LOGIC;
        VARIABLE dataIn : STD_LOGIC_VECTOR(31 downto 0);
        VARIABLE offset : INTEGER;
        VARIABLE dbyte  : STD_LOGIC_VECTOR( 7 downto 0);
        VARIABLE dhalf  : STD_LOGIC_VECTOR(15 downto 0);
    BEGIN
        IF Sel = '1' THEN
            signed := not FunctI(2);
            IF unsigned(AluDataIn) >= 4096 THEN
                dataIn := MemoryDataIn;
            ELSE
                dataIn := RomDataIn;
            END IF;
            CASE FunctI and "011" IS
                WHEN funct_MEM_B =>
                    offset := to_integer(unsigned(ALUDataIn(1 downto 0) & "000"));
                    dbyte := dataIn(offset + 7 downto offset);
                    WrData <= (31 downto dbyte'length => signed and dbyte(7)) & dbyte;
                WHEN funct_MEM_H =>
                    offset := to_integer(unsigned(ALUDataIn(1 downto 0) & "000"));
                    dhalf := dataIn(offset + 15 downto offset);
                    WrData <= (31 downto dhalf'length => signed and dhalf(15)) & dhalf;
                WHEN funct_MEM_W =>
                    WrData <= dataIn;
                WHEN OTHERS =>
                    WrData <= dataIn;
            END CASE;
        ELSE
            WrData <= ALUDataIn;
        END IF;
    END PROCESS;
end Behavioral;
