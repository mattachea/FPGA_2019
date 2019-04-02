LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY proccessorTB IS
END proccessorTB;
 
ARCHITECTURE behavior OF proccessorTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processor
    PORT(
         opcode : IN  std_logic_vector(2 downto 0);
         operand : IN  std_logic;
         input : IN  std_logic_vector(7 downto 0);
         r_addr_a : IN  std_logic_vector(1 downto 0);
         r_data_a : OUT  std_logic_vector(7 downto 0);
         r_addr_b : IN  std_logic_vector(1 downto 0);
         r_data_b : OUT  std_logic_vector(7 downto 0);
         w_addr : IN  std_logic_vector(1 downto 0);
         w_en : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal opcode : std_logic_vector(2 downto 0) := (others => '0');
   signal operand : std_logic := '0';
   signal input : std_logic_vector(7 downto 0) := (others => '0');
   signal r_addr_a : std_logic_vector(1 downto 0) := (others => '0');
   signal r_addr_b : std_logic_vector(1 downto 0) := (others => '0');
   signal w_addr : std_logic_vector(1 downto 0) := (others => '0');
   signal w_en : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal r_data_a : std_logic_vector(7 downto 0);
   signal r_data_b : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processor PORT MAP (
          opcode => opcode,
          operand => operand,
          input => input,
          r_addr_a => r_addr_a,
          r_data_a => r_data_a,
          r_addr_b => r_addr_b,
          r_data_b => r_data_b,
          w_addr => w_addr,
          w_en => w_en,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      wait for clk_period;

      -- insert stimulus here 
		opcode <= "000"; --load in 5
      operand <= '1';
      input <= "00000110"; 
      w_addr <= "00"; --save in reg0
      w_en <= '1';
		wait for clk_period;

		opcode <= "111"; --multiply reg0 value by 5
      operand <= '1';
      input <= "00000110"; --5
		r_addr_a <= "00"; --read from reg0
      w_addr <= "01"; --save in reg1
      w_en <= '1';
		wait for clk_period;

		opcode <= "111"; --multiply reg1 value by 5
      operand <= '1';
      input <= "00000110"; --5
		r_addr_a <= "01"; --read from reg1
      w_addr <= "01"; --save in reg1
      w_en <= '1';
		wait for clk_period;
		
		opcode <= "100"; --double reg0 value --possible error here, might need to use r_addr_b <= "00"
      operand <= '0';
      input <= "00000000"; --unused
		r_addr_a <= "00"; --read from reg0
      w_addr <= "10"; --save in reg2
      w_en <= '1';
		wait for clk_period;
		
		opcode <= "111"; --square reg2 value
      operand <= '0'; 
      input <= "00000000"; --unused
		r_addr_a <= "10"; --read from reg2
		r_addr_b <= "10"; --read from reg2
      w_addr <= "10"; --save in reg2
      w_en <= '1'; 
		wait for clk_period;
		
		--should have
			--P^3 stored in reg1
			--(2P)^2 stored in reg2
		
		opcode <= "101"; --subtract reg2 from reg1
      operand <= '0'; 
      input <= "00000000"; --unused
		r_addr_a <= "01"; --read from reg1
		r_addr_b <= "10"; --read from reg2
      w_addr <= "11"; --save in reg3
      w_en <= '1'; 
		wait for clk_period;
	
		w_en <= '0';
		wait for clk_period;
		
		r_addr_a <= "11";
		r_addr_b <= "11";
		
      wait;
   end process;

END;
