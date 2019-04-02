--W, X, Y, Z is the 4 bit number that we want to display on the seven segment display
--where W is the MSB and Z is the LSB

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sevenSeg is
	port(
		W   : in std_logic;
		X   : in std_logic;
		Y   : in std_logic;
		Z   : in std_logic;
		Seg7_A  : out std_logic;
		Seg7_B  : out std_logic;
		Seg7_C  : out std_logic;
		Seg7_D  : out std_logic;
		Seg7_E  : out std_logic;
		Seg7_F  : out std_logic;
		Seg7_G  : out std_logic
	);
end sevenSeg;

architecture Behavioral of sevenSeg is

begin

Seg7_A <= not((not(X) and not(Z)) or (not(W) and Y) or (X and Y) or (W and not(Z)) or (not(W) and X and Z) or (W and not(X) and not(Y)));
Seg7_B <= not((not(X) and not(Z)) or (not(W) and not(X)) or (not(W) and not(Y) and not(Z)) or (W and not(Y) and Z) or (not(W) and Y and Z));
Seg7_C <= not((not(W) and not(Y)) or (not(Y) and Z) or (not(W) and Z) or (not(W) and X) or (W and not(X)));
Seg7_D <= not((not(W) and not(X) and not(Z)) or (not(X) and Y and Z) or (X and not(Y) and Z) or (X and Y and not(Z)) or (W and not(Y) and not(Z)));
Seg7_E <= not((not(X) and not(Z)) or (W and Y) or (W and X) or (Y and not(Z)));
Seg7_F <= not((not(Y) and not(Z)) or (X and not(Z)) or (W and not(X)) or (W and Y) or (not(W) and X and not(Y)));
Seg7_G <= not((not(X) and Y) or (Y and not(Z)) or (W and Z) or (W and not(X)) or (not(W) and X and not(Y)));

end Behavioral;

