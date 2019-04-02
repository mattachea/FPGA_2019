library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity pulser is
    Port ( button : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           pulse : out  STD_LOGIC);
end pulser;

architecture Behavioral of pulser is

signal buttonRegisters : std_logic_vector(1 downto 0);

begin

pulse <= buttonRegisters(0) and not(buttonRegisters(1));

process(clk)
begin
	if rising_edge(clk) then
		buttonRegisters(0) <= button;
		buttonRegisters(1) <= buttonRegisters(0);
	end if;
end process;

end Behavioral;

