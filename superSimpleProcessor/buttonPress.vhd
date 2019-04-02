library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity buttonPress is
    Port ( button : in  STD_LOGIC;
           pulsed : out  STD_LOGIC;
           clk : in  STD_LOGIC);
end buttonPress;

architecture Behavioral of buttonPress is

signal debounce_out : std_logic;

component debouncer is
	 Port ( b           : in  STD_LOGIC;
           b_debounced : out  STD_LOGIC;
           clk         : in  STD_LOGIC);
end component;

component pulser is
    Port ( input : in  STD_LOGIC;
           pulsed : out  STD_LOGIC;
			  clk   : in  STD_LOGIC);
end component;

begin

debouncer0 : debouncer port map (b => button, b_debounced => debounce_out, clk => clk);
pulser0    : pulser    port map (input => debounce_out, pulsed => pulsed, clk => clk);

end Behavioral;

