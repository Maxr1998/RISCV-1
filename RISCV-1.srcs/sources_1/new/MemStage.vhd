----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2022 01:43:06 PM
-- Design Name: 
-- Module Name: MemStage - Behavioral
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

entity MemStage is
    Port (
        Clock       : in  STD_LOGIC;
        Reset       : in  STD_LOGIC;
        DestDataI   : in  STD_LOGIC_VECTOR (31 downto 0);
        DestDataO   : out STD_LOGIC_VECTOR (31 downto 0);
        DestWrEnI   : in  STD_LOGIC;
        DestWrEnO   : out STD_LOGIC;
        DestRegNoI  : in  STD_LOGIC_VECTOR ( 4 downto 0);
        DestRegNoO  : out STD_LOGIC_VECTOR ( 4 downto 0);
        MemAccessI  : in  STD_LOGIC;
        MemAccessO  : out STD_LOGIC;
        MemWrData   : in  STD_LOGIC_VECTOR (31 downto 0);
        MemRdData   : out STD_LOGIC_VECTOR (31 downto 0);
        MemByteEna  : in  STD_LOGIC_VECTOR ( 3 downto 0);
        FunctI      : in  STD_LOGIC_VECTOR ( 2 downto 0);
        FunctO      : out STD_LOGIC_VECTOR ( 2 downto 0);
        Stall       : in  STD_LOGIC
    );
end MemStage;

architecture Behavioral of MemStage is

begin
    PROCESS (Clock, Reset)
    BEGIN
        IF Reset = '0' THEN
            DestDataO <= x"00000000";
            DestWrEnO <= '0';
            DestRegNoO <= "00000";
            MemAccessO <= '0';
            MemRdData <= x"00000000";
            FunctO <= "000";
        ELSIF RISING_EDGE(Clock) THEN
            DestDataO <= DestDataI;
            DestWrEnO <= DestWrEnI;
            DestRegNoO <= DestRegNoI;
            MemAccessO <= MemAccessI;
            MemRdData <= MemWrData;
            FunctO <= FunctI;
        END IF;
    END PROCESS;
end Behavioral;
