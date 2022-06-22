----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2022 01:43:05 PM
-- Design Name: 
-- Module Name: ExecuteStage - Behavioral
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

entity ExecuteStage is
    Port (
        Clock       : in  STD_LOGIC;
        Reset       : in  STD_LOGIC;
        FunctI      : in  STD_LOGIC_VECTOR ( 2 downto 0);
        FunctO      : out STD_LOGIC_VECTOR ( 2 downto 0);
        SrcData1I   : in  STD_LOGIC_VECTOR (31 downto 0);
        SrcData1O   : out STD_LOGIC_VECTOR (31 downto 0);
        SrcData2I   : in  STD_LOGIC_VECTOR (31 downto 0);
        SrcData2O   : out STD_LOGIC_VECTOR (31 downto 0);
        DestWrEnI   : in  STD_LOGIC;
        DestWrEnO   : out STD_LOGIC;
        DestRegNoI  : in  STD_LOGIC_VECTOR ( 4 downto 0);
        DestRegNoO  : out STD_LOGIC_VECTOR ( 4 downto 0);
        AuxI        : in  STD_LOGIC;
        AuxO        : out STD_LOGIC;
        PCNextI     : in  STD_LOGIC_VECTOR (31 downto 0);
        PCNextO     : out STD_LOGIC_VECTOR (31 downto 0);
        JumpI       : in  STD_LOGIC;
        JumpO       : out STD_LOGIC;
        JumpRelI    : in  STD_LOGIC;
        JumpRelO    : out STD_LOGIC;
        JumpTargetI : in  STD_LOGIC_VECTOR (31 downto 0);
        JumpTargetO : out STD_LOGIC_VECTOR (31 downto 0);
        MemAccessI  : in  STD_LOGIC;
        MemAccessO  : out STD_LOGIC;
        MemWrEnI    : in  STD_LOGIC;
        MemWrEnO    : out STD_LOGIC;
        ClearI      : in  STD_LOGIC;
        ClearO      : out STD_LOGIC;
        ImmI        : in  STD_LOGIC_VECTOR (31 downto 0);
        ImmO        : out STD_LOGIC_VECTOR (31 downto 0);
        SelSrc2I    : in  STD_LOGIC;
        SelSrc2O    : out STD_LOGIC;
        Stall       : in  STD_LOGIC
    );
end ExecuteStage;

architecture Behavioral of ExecuteStage is

begin
    PROCESS (Clock, Reset)
    BEGIN
        IF Reset = '0' THEN
            FunctO <= "000";
            SrcData1O <= x"00000000";
            SrcData2O <= x"00000000";
            DestWrEnO <= '0';
            DestRegNoO <= "00000";
            AuxO <= '0';
            PCNextO <= x"00000000";
            JumpO <= '0';
            JumpRelO <= '0';
            JumpTargetO <= x"00000000";
            MemAccessO <= '0';
            MemWrEnO <= '0';
            ClearO <= '0';
            ImmO <= x"00000000";
            SelSrc2O <= '0';
        ELSIF RISING_EDGE(Clock) THEN
            IF Stall = '0' THEN
                FunctO <= FunctI;
                SrcData1O <= SrcData1I;
                SrcData2O <= SrcData2I;
                DestWrEnO <= DestWrEnI;
                DestRegNoO <= DestRegNoI;
                AuxO <= AuxI;
                PCNextO <= PCNextI;
                JumpO <= JumpI;
                JumpRelO <= JumpRelI;
                JumpTargetO <= JumpTargetI;
                MemAccessO <= MemAccessI;
                MemWrEnO <= MemWrEnI;
                ClearO <= ClearI;
                ImmO <= ImmI;
                SelSrc2O <= SelSrc2I;
            END IF;
        END IF;
    END PROCESS;
end Behavioral;
