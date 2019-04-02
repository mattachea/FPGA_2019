library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4to1 is
	 generic(dataWidth : integer := 8); 
    Port ( a0 : in  STD_LOGIC_VECTOR (dataWidth-1 downto 0);
           a1 : in  STD_LOGIC_VECTOR (dataWidth-1 downto 0);
           a2 : in  STD_LOGIC_VECTOR (dataWidth-1 downto 0);
           a3 : in  STD_LOGIC_VECTOR (dataWidth-1 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           b : out  STD_LOGIC_VECTOR (dataWidth-1 downto 0));
end mux4to1;

architecture Behavioral of mux4to1 is

begin
	b <= a0 when (sel = "00") else
		  a1 when (sel = "01") else
		  a2 when (sel = "10") else
		  a3;
end Behavioral;
