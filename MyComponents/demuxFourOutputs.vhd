library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder2to4 is
	generic(dataWidth : integer := 8);  
	Port (  a : in  STD_LOGIC_VECTOR (1 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0)
			  b0 : out  STD_LOGIC_VECTOR (dataWidth-1 downto 0);
           b1 : out  STD_LOGIC_VECTOR (dataWidth-1 downto 0);
           b2 : out  STD_LOGIC_VECTOR (dataWidth-1 downto 0);
           b3 : out  STD_LOGIC_VECTOR (dataWidth-1 downto 0));
end demuxFourOutputs;

architecture Behavioral of demuxFourOutputs is

begin
	b0 <= a when (sel = "00") else (others <= '0');
	b1 <= a when (sel = "01") else (others <= '0');
	b2 <= a when (sel = "10") else (others <= '0');
	b3 <= a when (sel = "11") else (others <= '0');
				
end Behavioral;

