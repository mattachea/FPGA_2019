library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity pulser is
    Port ( input : in  STD_LOGIC;
           pulsed : out  STD_LOGIC;
			  clk : in  STD_LOGIC);
end pulser;

architecture Behavioral of pulser is

signal buttonRegisters : std_logic_vector(1 downto 0);

begin

pulsed <= buttonRegisters(0) and not(buttonRegisters(1));

process(clk)
begin
	if rising_edge(clk) then
		buttonRegisters(0) <= input;
		buttonRegisters(1) <= buttonRegisters(0);
	end if;
end process;

end Behavioral;

