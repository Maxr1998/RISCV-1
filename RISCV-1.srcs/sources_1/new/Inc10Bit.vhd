----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2022 01:13:52 PM
-- Design Name: 
-- Module Name: Inc3Bit - Behavioral
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

entity Inc10Bit is
    Port (
        Clock : in STD_LOGIC;
        Reset : in STD_LOGIC;
        O : out STD_LOGIC_VECTOR (9 downto 0)
    );
end Inc10Bit;

architecture Behavioral of Inc10Bit is

BEGIN
    PROCESS (Clock, Reset)
        VARIABLE counter : STD_LOGIC_VECTOR (9 downto 0);
    BEGIN
        IF Reset = '0' THEN
            counter := "0000000000";
        ELSIF RISING_EDGE(Clock) THEN
            counter := std_logic_vector(unsigned(counter) + 1);
        END IF;
        O <= counter;
    END PROCESS;
END Behavioral;
