----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2022 01:43:05 PM
-- Design Name: 
-- Module Name: DecodeStage - Behavioral
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

entity DecodeStage is
    Port (
        Clock      : in  STD_LOGIC;
        Reset      : in  STD_LOGIC;
        InstI      : in  STD_LOGIC_VECTOR (31 downto 0);
        InstO      : out STD_LOGIC_VECTOR (31 downto 0);
        PCI        : in  STD_LOGIC_VECTOR (31 downto 0);
        PCO        : out STD_LOGIC_VECTOR (31 downto 0);
        InterlockI : in  STD_LOGIC;
        InterlockO : out STD_LOGIC;
        ClearI     : in  STD_LOGIC;
        ClearO     : out STD_LOGIC;
        Stall      : in  STD_LOGIC
    );
end DecodeStage;

architecture Behavioral of DecodeStage is

begin
    PROCESS (Clock, Reset)
    BEGIN
        IF Reset = '0' THEN
            InstO <= x"00000000";
            PCO <= x"00000000";
            InterlockO <= '0';
            ClearO <= '0';
        ELSIF RISING_EDGE(Clock) THEN
            IF Stall = '0' THEN
                InstO <= InstI;
                PCO <= PCI;
                InterlockO <= InterlockI;
                ClearO <= ClearI;
            END IF;
        END IF;
    END PROCESS;
end Behavioral;
