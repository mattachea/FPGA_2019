library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity registerFileFour is
    Port ( r_addr_a : in  STD_LOGIC_VECTOR (1 downto 0);
           r_data_a : out STD_LOGIC_VECTOR (7 downto 0);
           r_addr_b : in  STD_LOGIC_VECTOR (1 downto 0);
           r_data_b : out STD_LOGIC_VECTOR (7 downto 0);
           w_addr   : in  STD_LOGIC_VECTOR (1 downto 0);
           w_data   : in  STD_LOGIC_VECTOR (7 downto 0);
           w_en     : in  STD_LOGIC;
           clk      : in  STD_LOGIC);
end registerFileFour;

architecture Behavioral of registerFileFour is

	component decoder2to4 is
		Port (sel: in   STD_LOGIC_VECTOR (1 downto 0);
				en : in   STD_LOGIC;
				b0 : out  STD_LOGIC;
				b1 : out  STD_LOGIC;
				b2 : out  STD_LOGIC;
				b3 : out  STD_LOGIC);
	end component;

	component registerLoad is
		Port (d    : in  STD_LOGIC_VECTOR (7 downto 0);
				q    : out STD_LOGIC_VECTOR (7 downto 0);
				clk  : in  STD_LOGIC;
				load : in  STD_LOGIC);
	end component;

	component mux4to1 is
		Port (a0  : in  STD_LOGIC_VECTOR (7 downto 0);
				a1  : in  STD_LOGIC_VECTOR (7 downto 0);
				a2  : in  STD_LOGIC_VECTOR (7 downto 0);
				a3  : in  STD_LOGIC_VECTOR (7 downto 0);
				sel : in  STD_LOGIC_VECTOR (1 downto 0);
				b   : out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	signal reg_en0   : STD_LOGIC;
	signal reg_en1   : STD_LOGIC;
	signal reg_en2   : STD_LOGIC;
	signal reg_en3   : STD_LOGIC;
	signal mux_in0  : STD_LOGIC_VECTOR (7 downto 0);
	signal mux_in1  : STD_LOGIC_VECTOR (7 downto 0);
	signal mux_in2  : STD_LOGIC_VECTOR (7 downto 0);
	signal mux_in3  : STD_LOGIC_VECTOR (7 downto 0);

begin

	decoder0  : decoder2to4  port map (sel => w_addr, en => w_en, b0 => reg_en0, b1 => reg_en1, b2 => reg_en2, b3 => reg_en3);
	register0 : registerLoad port map (d => w_data, q => mux_in0, clk => clk, load => reg_en0);
	register1 : registerLoad port map (d => w_data, q => mux_in1, clk => clk, load => reg_en1);
	register2 : registerLoad port map (d => w_data, q => mux_in2, clk => clk, load => reg_en2);
	register3 : registerLoad port map (d => w_data, q => mux_in3, clk => clk, load => reg_en3);
	muxA      : mux4to1      port map (a0 => mux_in0, a1 => mux_in1, a2 => mux_in2, a3 => mux_in3, sel => r_addr_a, b => r_data_a);
	muxB      : mux4to1      port map (a0 => mux_in0, a1 => mux_in1, a2 => mux_in2, a3 => mux_in3, sel => r_addr_b, b => r_data_b);

end Behavioral;

