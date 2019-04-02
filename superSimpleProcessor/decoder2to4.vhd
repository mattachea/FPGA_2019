library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder2to4 is
	Port (  sel: in   STD_LOGIC_VECTOR (1 downto 0);
			  en : in   STD_LOGIC;
			  b0 : out  STD_LOGIC;
           b1 : out  STD_LOGIC;
           b2 : out  STD_LOGIC;
           b3 : out  STD_LOGIC);
end decoder2to4;

architecture Behavioral of decoder2to4 is

begin
	b0 <= '1' when (sel = "00" and en = '1') else '0';
	b1 <= '1' when (sel = "01" and en = '1') else '0';
	b2 <= '1' when (sel = "10" and en = '1') else '0';
	b3 <= '1' when (sel = "11" and en = '1') else '0';
				
end Behavioral;

