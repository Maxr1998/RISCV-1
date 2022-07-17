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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.constants.all;

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
    type state_type is (Idle, Read, Write);
    signal CurrentState: state_type;
begin
    PROCESS (Clock, Reset)
    BEGIN
        IF Reset = '0' THEN
            DestDataO <= ZERO_32;
            DestWrEnO <= '0';
            DestRegNoO <= "00000";
            MemAccessO <= '0';
            MemRdData <= ZERO_32;
            RamReadEn <= '0';
            RamWriteEn <= '0';
            RamByteEna <= "0000";
            RamAddress <= ZERO_32;
            RamWrData <= ZERO_32;
            FunctO <= "000";
            StallO <= '0';
            CurrentState <= Idle;
        ELSIF RISING_EDGE(Clock) THEN
            CASE CurrentState IS
                WHEN Idle =>
                    MemRdData <= ZERO_32;
                    IF MemAccessI = '1' AND unsigned(DestDataI) >= 4096 THEN
                        RamAddress <= DestDataI(31 downto 2) & "00";

                        IF MemByteEna = "0000" THEN
                            -- Read access
                            RamReadEn <= '1';
                            RamWriteEn <= '0';
                            RamByteEna <= "----";
                            RamWrData <= IDC_32;
                            CurrentState <= Read;
                        ELSE
                            -- Write access
                            RamReadEn <= '0';
                            RamWriteEn <= '1';
                            RamByteEna <= MemByteEna;
                            RamWrData <= MemWrData;
                            CurrentState <= Write;
                        END IF;

                        StallO <= '1';
                    END IF;
                WHEN Read =>
                    RamReadEn <= '0';
                    IF RamBusy = '0' THEN
                        MemRdData <= RamRdData;
                        StallO <= '0';
                        CurrentState <= Idle;
                    ELSE
                        MemRdData <= ZERO_32;
                    END IF;
                WHEN Write =>
                    MemRdData <= ZERO_32;
                    RamWriteEn <= '0';
                    IF RamBusy = '0' THEN
                        StallO <= '0';
                        CurrentState <= Idle;
                    END IF;
            END CASE;

            IF Stall = '0' THEN
                DestDataO <= DestDataI;
                DestWrEnO <= DestWrEnI;
                DestRegNoO <= DestRegNoI;
                MemAccessO <= MemAccessI;
                FunctO <= FunctI;
            END IF;
        END IF;
    END PROCESS;
end Behavioral;
