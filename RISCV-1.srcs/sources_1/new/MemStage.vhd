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
        RamReadEn   : out STD_LOGIC;
        RamWriteEn  : out STD_LOGIC;
        RamByteEna  : out STD_LOGIC_VECTOR ( 3 downto 0);
        RamAddress  : out STD_LOGIC_VECTOR (31 downto 0);
        RamRdData   : in  STD_LOGIC_VECTOR (31 downto 0);
        RamWrData   : out STD_LOGIC_VECTOR (31 downto 0);
        RamBusy     : in  STD_LOGIC;
        FunctI      : in  STD_LOGIC_VECTOR ( 2 downto 0);
        FunctO      : out STD_LOGIC_VECTOR ( 2 downto 0);
        Stall       : in  STD_LOGIC;
        StallO      : out STD_LOGIC
    );
end MemStage;

architecture Behavioral of MemStage is
    type state_type is (Idle, Stalled);
    signal CurrentState: state_type;
begin
    PROCESS (Clock, Reset)
    BEGIN
        IF Reset = '0' THEN
            DestDataO <= x"00000000";
            DestWrEnO <= '0';
            DestRegNoO <= "00000";
            MemAccessO <= '0';
            MemRdData <= x"00000000";
            RamReadEn <= '0';
            RamWriteEn <= '0';
            FunctO <= "000";
            StallO <= '0';
            CurrentState <= Idle;
        ELSIF RISING_EDGE(Clock) THEN
            CASE CurrentState IS
                WHEN Idle =>
                    IF MemAccessI = '1' THEN
                        StallO <= '1';
                        CurrentState <= Stalled;
                    END IF;
                WHEN Stalled =>
                    StallO <= '0';
                    CurrentState <= Idle;
            END CASE;
            IF Stall = '0' THEN
                DestDataO <= DestDataI;
                DestWrEnO <= DestWrEnI;
                DestRegNoO <= DestRegNoI;
                MemAccessO <= MemAccessI;
                MemRdData <= MemWrData;
                RamReadEn <= '0';  -- TODO: changeme
                RamWriteEn <= '0'; -- TODO: changeme
                FunctO <= FunctI;
            END IF;
        END IF;
    END PROCESS;
end Behavioral;
