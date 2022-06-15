----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2022 04:53:12 PM
-- Design Name: 
-- Module Name: RegisterSet - Behavioral
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

entity RegisterSet is
    Port (
        RdRegNo1 : in STD_LOGIC_VECTOR (4 downto 0);
        RdRegNo2 : in STD_LOGIC_VECTOR (4 downto 0);
        WrEn : in STD_LOGIC;
        WrRegNo : in STD_LOGIC_VECTOR (4 downto 0);
        WrData : in STD_LOGIC_VECTOR (31 downto 0);
        RdData1 : out STD_LOGIC_VECTOR (31 downto 0);
        RdData2 : out STD_LOGIC_VECTOR (31 downto 0);
        Clock : in STD_LOGIC;
        Reset : in STD_LOGIC
    );
end RegisterSet;

architecture Behavioral of RegisterSet is
    type TRegisters is array (0 to 31) of std_logic_vector(31 downto 0);
    signal Registers : TRegisters;
BEGIN
    RdData1 <= Registers(to_integer(unsigned(RdRegNo1)));
    RdData2 <= Registers(to_integer(unsigned(RdRegNo2)));

    PROCESS(Clock, Reset)
    BEGIN
        Registers(0) <= std_logic_vector(to_unsigned(0, 32));
        IF Reset = '0' THEN
            Registers(1) <= std_logic_vector(to_unsigned(1, 32));
            FOR i IN 2 to 31 LOOP
                Registers(i) <= std_logic_vector(to_unsigned(0, 32));
            END LOOP;
        ELSIF RISING_EDGE(Clock) AND WrEn = '1' AND WrRegNo /= "00000" THEN
            Registers(to_integer(unsigned(WrRegNo))) <= WrData;
        END IF;
    END PROCESS;
END Behavioral;
