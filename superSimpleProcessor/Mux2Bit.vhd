
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2Bit is
	Port (  a0 : in  STD_LOGIC_VECTOR (7 downto 0);
           a1 : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC;
           b_out : out  STD_LOGIC_VECTOR (7 downto 0)
		   );
end Mux2Bit;

architecture Behavioral of Mux2Bit is

begin
	b_out <= a0 when (sel = '1') else
				a1;


end Behavioral;

