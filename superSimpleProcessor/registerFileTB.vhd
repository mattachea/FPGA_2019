
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY registerFileTB IS
END registerFileTB;
 
ARCHITECTURE behavior OF registerFileTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerFileFour
    PORT(
         r_addr_a : IN  std_logic_vector(1 downto 0);
         r_data_a : OUT  std_logic_vector(7 downto 0);
         r_addr_b : IN  std_logic_vector(1 downto 0);
         r_data_b : OUT  std_logic_vector(7 downto 0);
         w_addr : IN  std_logic_vector(1 downto 0);
         w_data : IN  std_logic_vector(7 downto 0);
         w_en : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal r_addr_a : std_logic_vector(1 downto 0) := (others => '0');
   signal r_addr_b : std_logic_vector(1 downto 0) := (others => '0');
   signal w_addr : std_logic_vector(1 downto 0) := (others => '0');
   signal w_data : std_logic_vector(7 downto 0) := (others => '0');
   signal w_en : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal r_data_a : std_logic_vector(7 downto 0);
   signal r_data_b : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerFileFour PORT MAP (
          r_addr_a => r_addr_a,
          r_data_a => r_data_a,
          r_addr_b => r_addr_b,
          r_data_b => r_data_b,
          w_addr => w_addr,
          w_data => w_data,
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
		w_addr <= "00";
		w_data <= "00000001";
		w_en   <= '1';
		
		wait for clk_period;
		
		w_addr <= "10";
		w_data <= "00000010";
		w_en   <= '1';
		
		wait for clk_period;
		
		r_addr_a <= "00";
		r_addr_b <= "10";
		
		wait for clk_period;
		
		w_addr <= "00";
		w_data <= "10000000";
		w_en   <= '1';
		
		wait for clk_period;
		
		w_addr <= "10";
		w_data <= "00000001";
		w_en   <= '0';   --nothing should happen

      wait;
   end process;

END;
