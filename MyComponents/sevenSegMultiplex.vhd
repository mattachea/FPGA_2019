--in my design I have the 4 left most switches as digit 3 (7 seg on the far left)
--then the 4 right switches as digit 2
--then since there are no more switches I made digit 1 and digit 0 into constants (3 and 5)

--since flag is high when the counter is equal to ((2^16) - 1), the frequency of the flag is 32 MHz / ((2^16) - 1) = 488 Hz

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sevenSegMultiplex is
	 generic(RegWidth : integer := 16); 
    Port ( digit3 : in  STD_LOGIC_VECTOR (3 downto 0);
           digit2 : in  STD_LOGIC_VECTOR (3 downto 0);
           digit1 : in  STD_LOGIC_VECTOR (3 downto 0);
           digit0 : in  STD_LOGIC_VECTOR (3 downto 0);
           Seg7_AN : out  STD_LOGIC_VECTOR (4 downto 0);
           digitOut : out  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in std_logic);
end sevenSegMultiplex;

architecture Behavioral of sevenSegMultiplex is

signal clkCounter : unsigned(RegWidth - 1 downto 0);
constant ones: unsigned(RegWidth - 1 downto 0) := (others => '1');
signal tempDigitOut: std_logic_vector(3 downto 0);
signal tempSeg7_AN: std_logic_vector(4 downto 0);
type StateType is (s0, s1, s2, s3);
signal state, nextState : StateType := s0;

signal flag : std_logic;

begin

process(clk)
begin
	if rising_edge(clk) then
		state <= nextState;
		clkCounter <= clkCounter + 1;  
		if (clkCounter = ones) then
			flag <= '1'; 
		else 
			flag <= '0';
		end if;
	end if;
end process;

process(state, flag, digit0, digit1, digit2, digit3, tempDigitOut, tempSeg7_AN)
begin
	case state is 
		when s0 =>
			DigitOut <= digit0;
			Seg7_AN <= b"10111";
			if flag = '1' then
				nextState <= s1;
			else
				nextState <= s0;
			end if;
		when s1 =>
			DigitOut <= digit1;
			Seg7_AN <= b"11011";
			if flag = '1' then
				nextState <= s2;
			else
				nextState <= s1;
			end if;
		when s2 =>
			DigitOut <= digit2;
			Seg7_AN <= b"11101";
			if flag = '1' then
				nextState <= s3;
			else
				nextState <= s2;
			end if;
		when s3 =>
			DigitOut <= digit3;
			Seg7_AN <= b"11110";
			if flag = '1' then
				nextState <= s0;
			else
				nextState <= s3;
			end if;
		when others =>
			nextState <= s0;
		end case;
end process;

end Behavioral;

