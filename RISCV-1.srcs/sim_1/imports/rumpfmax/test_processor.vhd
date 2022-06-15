library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_processor is
end test_processor;


architecture TB of test_processor is

    component processor is
        port (
            BTNL : in STD_LOGIC;
            GCLK : in STD_LOGIC
        );
    end component processor;

    signal Reset : STD_LOGIC;
    signal Clock : STD_LOGIC;
begin

    DUT: component processor port map (
            BTNL => Reset,
            GCLK => Clock
        );

    PROCESS
    BEGIN
        Clock <= '1';
        wait for 5ns;
        Clock <= '0';
        wait for 5ns;
    END PROCESS;

    PROCESS
    BEGIN
        Reset <= '0';
        wait for 10ns;
        Reset <= '1';
        wait;
    END PROCESS;
end TB;

