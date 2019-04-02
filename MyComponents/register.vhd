library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;


entity registerBasic is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC
          );
end registerBasic;

architecture Behavioral of registerBasic is

begin

process(clk)
begin
	if rising_edge(clk) then
			q <= d;
	end if;
end process;

end Behavioral;