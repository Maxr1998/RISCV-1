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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MemMux is
    Port (
        ALUDataIn    : in  STD_LOGIC_VECTOR (31 downto 0);
        MemoryDataIn : in  STD_LOGIC_VECTOR (31 downto 0);
        Sel          : in  STD_LOGIC;
        FunctI       : in  STD_LOGIC_VECTOR (2 downto 0);
        WrData       : out STD_LOGIC_VECTOR (31 downto 0)
    );
end MemMux;

architecture Behavioral of MemMux is
begin
    WrData <= MemoryDataIn WHEN Sel = '1' ELSE ALUDataIn;
end Behavioral;
