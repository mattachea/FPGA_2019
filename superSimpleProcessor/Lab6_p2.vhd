library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Lab6_p2 is
    Port ( result    : out  STD_LOGIC_VECTOR (7 downto 0);
           input     : in  STD_LOGIC_VECTOR (7 downto 0);
           clk       : in  STD_LOGIC;
			  button_up : in std_logic);
end Lab6_p2;

architecture Behavioral of Lab6_p2 is

	component buttonPress is
		Port (button : in  STD_LOGIC;
				pulsed : out  STD_LOGIC;
				clk 	 : in  STD_LOGIC);
	end component;

	component processor is
		Port (opcode   : in  STD_LOGIC_VECTOR (2 downto 0);
				operand  : in  STD_LOGIC;
				input    : in  STD_LOGIC_VECTOR (7 downto 0);
				r_addr_a : in  STD_LOGIC_VECTOR (1 downto 0);
				r_data_a : out STD_LOGIC_VECTOR (7 downto 0);
				r_addr_b : in  STD_LOGIC_VECTOR (1 downto 0);
				r_data_b : out STD_LOGIC_VECTOR (7 downto 0);
				w_addr   : in  STD_LOGIC_VECTOR (1 downto 0);
				w_en     : in  STD_LOGIC;
				clk      : in  STD_LOGIC);
	end component;

	signal pulsed   : STD_LOGIC;
	signal opcode   : STD_LOGIC_VECTOR (2 downto 0);
	signal operand  : STD_LOGIC;
	signal r_addr_a : STD_LOGIC_VECTOR (1 downto 0);
	signal r_data_a : STD_LOGIC_VECTOR (7 downto 0);
	signal r_addr_b : STD_LOGIC_VECTOR (1 downto 0);
	signal r_data_b : STD_LOGIC_VECTOR (7 downto 0);
	signal w_addr   : STD_LOGIC_VECTOR (1 downto 0);
	signal w_en     : STD_LOGIC;
	
	type stateType is (s0, s1, s2, s3, s4, s5, s6);
	signal state, nextState : stateType := s0;
	
begin

	buttonPress0 : buttonPress port map (button => button_up, pulsed => pulsed, clk => clk);
	processor0   : processor port map (opcode => opcode, operand => operand, input => input, r_addr_a => r_addr_a, r_data_a => r_data_a, r_addr_b => r_addr_b, r_data_b => r_data_b, w_addr => w_addr, w_en => w_en, clk => pulsed);


	process(pulsed)
	begin
		if (rising_edge(pulsed)) then
			state <= nextState;
		end if;
	end process;
	
	process(state, r_data_a, r_data_b)
	begin
		case state is 
			when s0 => 
				opcode <= "000"; --load in input into reg0
				operand <= '1'; 
				r_addr_a <= "00"; 
				r_addr_b <= "00"; 
				w_addr <= "00";
				w_en <= '1';
				result <= (others => '0');
				nextState <= s1;
			when s1 => 
				opcode <= "111"; --multiply reg0 by input, save into reg1
				operand <= '1'; 
				r_addr_a <= "00"; 
				r_addr_b <= "00"; 
				w_addr <= "01"; 
				w_en <= '1';
				result <= (others => '0');
				nextState <= s2;
			when s2 => 
				opcode <= "111"; --multiply reg1 by input, save into reg1
				operand <= '1'; 
				r_addr_a <= "01"; 
				r_addr_b <= "00"; 
				w_addr <= "01"; 
				w_en <= '1';
				result <= (others => '0');
				nextState <= s3;
			when s3 => 
				opcode <= "100"; --double reg0 and save into reg2
				operand <= '0'; 
				r_addr_a <= "00"; 
				r_addr_b <= "00"; 
				w_addr <= "10"; 
				w_en <= '1';
				result <= (others => '0');
				nextState <= s4;
			when s4 => 
				opcode <= "111"; --square reg2 and save in reg2
				operand <= '0'; 
				r_addr_a <= "10"; 
				r_addr_b <= "10"; 
				w_addr <= "10"; 
				w_en <= '1';
				result <= (others => '0');
				nextState <= s5;
			when s5 => 
				opcode <= "101"; --reg1 - reg2, save in reg3
				operand <= '0'; 
				r_addr_a <= "01"; 
				r_addr_b <= "10"; 
				w_addr <= "11"; 
				w_en <= '1';
				result <= (others => '0');
				nextState <= s6;		
			when s6 =>
				opcode <= "111"; --unsused
				operand <= '0'; --unsused
				r_addr_a <= "11"; --read from reg3
				r_addr_b <= "00"; --unsused
				w_addr <= "00"; --unsused
				w_en <= '0'; --off

				result <= r_data_a;
				nextState <= s0;		

				
		end case;
	end process;

end Behavioral;

