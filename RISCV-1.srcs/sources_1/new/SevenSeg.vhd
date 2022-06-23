----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2022 01:41:48 PM
-- Design Name: 
-- Module Name: SevenSeg - Behavioral
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

entity SevenSeg is
    Port (
        Set   : in  STD_LOGIC;
        V     : in  STD_LOGIC_VECTOR (31 downto 0);
        Clock : in  STD_LOGIC;
        Reset : in  STD_LOGIC;
        Pmod0 : out STD_LOGIC_VECTOR (3 downto 0);
        Pmod1 : out STD_LOGIC_VECTOR (3 downto 0);
        Pmod2 : out STD_LOGIC_VECTOR (3 downto 0);
        Pmod3 : out STD_LOGIC_VECTOR (3 downto 0)
    );
end SevenSeg;

architecture Behavioral of SevenSeg is
    signal State        : STD_LOGIC_VECTOR (31 downto 0);
    signal Seg1         : STD_LOGIC_VECTOR ( 7 downto 0);
    signal Seg2         : STD_LOGIC_VECTOR ( 7 downto 0);
    signal currentDigit : STD_LOGIC;
begin
    Pmod0 <= Seg1(3 downto 0);
    Pmod1 <= Seg1(7 downto 4);
    Pmod2 <= Seg2(3 downto 0);
    Pmod3 <= Seg2(7 downto 4);

    PROCESS (Clock, Reset)
        VARIABLE counter : integer := 0;
    BEGIN
        IF Reset = '0' THEN
            State <= x"00000000";
            Seg1 <= x"00";
            Seg2 <= x"00";
            currentDigit <= '0';
            counter := 0;
        ELSIF RISING_EDGE(Clock) THEN
            IF Set = '1' THEN
                State <= V;
            END IF;

            IF currentDigit = '0' THEN
                Seg1 <= currentDigit & State(6 downto 0);
                Seg2 <= currentDigit & State(22 downto 16);
            ELSE
                Seg1 <= currentDigit & State(14 downto 8);
                Seg2 <= currentDigit & State(30 downto 24);
            END IF;

            IF counter < 100_000 THEN
                counter := counter + 1;
            ELSE
                currentDigit <= not currentDigit;
                counter := 0;
            END IF;
        END IF;
    END PROCESS;
end Behavioral;