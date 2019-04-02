library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity processor is
    Port ( opcode   : in  STD_LOGIC_VECTOR (2 downto 0);
           operand  : in  STD_LOGIC;
           input    : in  STD_LOGIC_VECTOR (7 downto 0);
			  r_addr_a : in  STD_LOGIC_VECTOR (1 downto 0);
           r_data_a : out STD_LOGIC_VECTOR (7 downto 0);
           r_addr_b : in  STD_LOGIC_VECTOR (1 downto 0);
           r_data_b : out STD_LOGIC_VECTOR (7 downto 0);
           w_addr   : in  STD_LOGIC_VECTOR (1 downto 0);
           w_en     : in  STD_LOGIC;
           clk      : in  STD_LOGIC);
end processor;

architecture Behavioral of processor is
	
	component Mux2Bit is
		Port (  a0 : in  STD_LOGIC_VECTOR (7 downto 0);
				  a1 : in  STD_LOGIC_VECTOR (7 downto 0);
              sel : in  STD_LOGIC;
              b_out : out  STD_LOGIC_VECTOR (7 downto 0)
				);
	end component;
	
	component operationMUX is --this is the ALU
		Port(
			  A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           opcode : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
	end component;
	
	component registerFileFour is
		Port (r_addr_a : in  STD_LOGIC_VECTOR (1 downto 0);
				r_data_a : out STD_LOGIC_VECTOR (7 downto 0);
				r_addr_b : in  STD_LOGIC_VECTOR (1 downto 0);
				r_data_b : out STD_LOGIC_VECTOR (7 downto 0);
				w_addr   : in  STD_LOGIC_VECTOR (1 downto 0);
				w_data   : in  STD_LOGIC_VECTOR (7 downto 0);
				w_en     : in  STD_LOGIC;
				clk      : in  STD_LOGIC);
	end component;
	
	signal temp_r_data_a : STD_LOGIC_VECTOR (7 downto 0); --signal from read port A
	signal temp_r_data_b : STD_LOGIC_VECTOR (7 downto 0); --signal from read port B
	signal temp_alu_b    : STD_LOGIC_VECTOR (7 downto 0); --signal from Mux2bit to ALU
	signal w_data        : STD_LOGIC_VECTOR (7 downto 0); --signal from the ALU to register file
	
begin
	r_data_a <= temp_r_data_a;
	r_data_b <= temp_r_data_b;
	
	Mux2Bit0      : Mux2Bit port map (a0 => input, a1 => temp_r_data_b, sel => operand, b_out => temp_alu_b);
	operationMUX0 : operationMUX port map (A => temp_r_data_a, B => temp_alu_b, opcode => opcode, Y => w_data);
	registerFile0 : registerFileFour port map (r_addr_a => r_addr_a, r_data_a => temp_r_data_a, r_addr_b => r_addr_b, r_data_b => temp_r_data_b, w_addr => w_addr, w_data => w_data, w_en => w_en, clk => clk);

end Behavioral;


