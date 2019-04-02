library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity operationMUX is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           opcode : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end operationMUX;

architecture Behavioral of operationMUX is

signal full_product : std_logic_vector(15 downto 0) := (others => '0');

begin



process(opcode, A, B, full_product)
begin
	case opcode is 
		when "000" =>
			Y <= B;
			full_product <= (others => '0');
		when "001" =>
			Y <= A xor B;
			full_product <= (others => '0');
		when "010" =>
			Y <= A and B;
			full_product <= (others => '0');
		when "011" =>
			Y <= A or B;
			full_product <= (others => '0');
		when "100" =>
			Y <= std_logic_vector(unsigned(A) + unsigned(B));
			full_product <= (others => '0');
		when "101" =>
			Y <= std_logic_vector(unsigned(A) - unsigned(B));
			full_product <= (others => '0');
		when "110" =>
			Y <= "0" & B(7 downto 1);  --bit shift right
			full_product <= (others => '0');
		when "111" =>
			full_product <= std_logic_vector(unsigned(A) * unsigned(B));
			Y <= full_product(7 downto 0); --And truncate it to the desired size.
			--overflow <= or_reduce(std_logic_vector(full_product(full_product'high downto 8)));  --Determine if overflow occurred by checking for a '1' in any of the truncated bits.
		when others =>
			null;
		end case;
end process;

end Behavioral;

