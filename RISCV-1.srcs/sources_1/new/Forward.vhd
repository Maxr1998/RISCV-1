----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2022 04:45:05 PM
-- Design Name: 
-- Module Name: Forward - Behavioral
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

entity Forward is
    Port (
        SrcRegNo1     : in  STD_LOGIC_VECTOR ( 4 downto 0);
        SrcRegNo2     : in  STD_LOGIC_VECTOR ( 4 downto 0);
        SrcData1      : in  STD_LOGIC_VECTOR (31 downto 0);
        SrcData2      : in  STD_LOGIC_VECTOR (31 downto 0);
        DestWrEn_EX   : in  STD_LOGIC;
        DestRegNo_EX  : in  STD_LOGIC_VECTOR ( 4 downto 0);
        DestData_EX   : in  STD_LOGIC_VECTOR (31 downto 0);
        DestWrEn_MEM  : in  STD_LOGIC;
        DestRegNo_MEM : in  STD_LOGIC_VECTOR ( 4 downto 0);
        DestData_MEM  : in  STD_LOGIC_VECTOR (31 downto 0);
        FwdData1      : out STD_LOGIC_VECTOR (31 downto 0);
        FwdData2      : out STD_LOGIC_VECTOR (31 downto 0)
    );
end Forward;

architecture Behavioral of Forward is

begin
    PROCESS (SrcRegNo1, SrcData1, DestWrEn_EX, DestRegNo_EX, DestData_EX, DestWrEn_MEM, DestRegNo_MEM, DestData_MEM)
    BEGIN
        IF SrcRegNo1 = "00000" THEN
            FwdData1 <= x"00000000";
        ELSIF SrcRegNo1 = DestRegNo_EX and DestWrEn_EX = '1' THEN
            FwdData1 <= DestData_EX;
        ELSIF SrcRegNo1 = DestRegNo_MEM and DestWrEn_MEM = '1' THEN
            FwdData1 <= DestData_MEM;
        ELSE
            FwdData1 <= SrcData1;
        END IF;
    END PROCESS;
    PROCESS (SrcRegNo2, SrcData2, DestWrEn_EX, DestRegNo_EX, DestData_EX, DestWrEn_MEM, DestRegNo_MEM, DestData_MEM)
    BEGIN
        IF SrcRegNo2 = "00000" THEN
            FwdData2 <= x"00000000";
        ELSIF SrcRegNo2 = DestRegNo_EX and DestWrEn_EX = '1' THEN
            FwdData2 <= DestData_EX;
        ELSIF SrcRegNo2 = DestRegNo_MEM and DestWrEn_MEM = '1' THEN
            FwdData2 <= DestData_MEM;
        ELSE
            FwdData2 <= SrcData2;
        END IF;
    END PROCESS;
end Behavioral;
