library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;


entity registerLoad is
    Port ( d : in  STD_LOGIC_VECTOR (2 downto 0);
           q : out  STD_LOGIC_VECTOR (2 downto 0);
           clk : in  STD_LOGIC;
           load : in  STD_LOGIC);
end registerLoad;

architecture Behavioral of registerLoad is

begin

process(clk)
begin
	if rising_edge(clk) then
		if (load = '1') then
			q <= d;
		end if;
	end if;
end process;

end Behavioral;

