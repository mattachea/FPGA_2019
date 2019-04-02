-- Performs subtraction of three input bits:  a - b - c_in 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fullSubtractor is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           diff : out  STD_LOGIC;
           c_out : out  STD_LOGIC);
end fullSubtractor;

architecture Behavioral of fullSubtractor is

begin

	diff     <= a xor b xor c_in;
	c_out <= (not(a) and c_in) or (not(a) and b) or (b and c_in);

end Behavioral;

