----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 11:56:00 AM
-- Design Name: 
-- Module Name: FetchStage - Behavioral
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

entity FetchStage is
    Port (
        PCI        : in  STD_LOGIC_VECTOR (31 downto 0);
        PCO        : out STD_LOGIC_VECTOR (31 downto 0);
        Clock      : in  STD_LOGIC;
        Reset      : in  STD_LOGIC
    );
end FetchStage;

architecture Behavioral of FetchStage is

begin
    PROCESS (PCI, Clock, Reset)
    BEGIN
        IF Reset = '0' THEN
            PCO <= std_logic_vector(to_signed(-4, 32));
        ELSIF RISING_EDGE(Clock) THEN
            PCO <= PCI;
        END IF;
    END PROCESS;
end Behavioral;