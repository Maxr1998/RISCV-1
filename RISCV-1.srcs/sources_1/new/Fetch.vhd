----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2022 11:56:00 AM
-- Design Name: 
-- Module Name: Fetch - Behavioral
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

entity Fetch is
    Port (
        PCI        : in  STD_LOGIC_VECTOR (31 downto 0);
        Jump       : in  STD_LOGIC;
        JumpTarget : in  STD_LOGIC_VECTOR (31 downto 0);
        InterlockI : in  STD_LOGIC;
        Stall      : in  STD_LOGIC;
        PCNext     : out STD_LOGIC_VECTOR (31 downto 0);
        PC         : out STD_LOGIC_VECTOR (31 downto 0);
        ImemAddr   : out STD_LOGIC_VECTOR (9 downto 0)
    );
end Fetch;

architecture Behavioral of Fetch is

begin
    PROCESS (PCI, Jump, JumpTarget, InterlockI, Stall)
        VARIABLE PCNextV : STD_LOGIC_VECTOR (31 downto 0);
    BEGIN
        PC <= PCI;
        IF Stall = '1' THEN
            PCNextV := PCI;
        ELSIF Jump = '1' THEN
            PCNextV := JumpTarget;
        ELSIF InterlockI = '1' THEN
            PCNextV := PCI;
        ELSE
            PCNextV := std_logic_vector(unsigned(PCI) + 4);
        END IF;
        PCNext <= PCNextV;
        ImemAddr <= PCNextV(11 downto 2);
    END PROCESS;
end Behavioral;
