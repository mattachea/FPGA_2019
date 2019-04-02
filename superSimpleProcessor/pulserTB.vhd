--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:53:11 03/26/2019
-- Design Name:   
-- Module Name:   Z:/Users/matthewchea/Documents/School 2/Senior Year/Senior Spring/AdvDigSys/Lab6_AdvDig/pulserTB.vhd
-- Project Name:  Lab6_AdvDig
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pulser
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY pulserTB IS
END pulserTB;
 
ARCHITECTURE behavior OF pulserTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pulser
    PORT(
         input : IN  std_logic;
         clk : IN  std_logic;
         pulse : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal pulse : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pulser PORT MAP (
          input => input,
          clk => clk,
          pulse => pulse
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
		input <= '0';
		wait for clk_period;
		input <= '1';
		wait for clk_period;
		input <= '1';
		wait for clk_period;
		input <= '0';
		wait for clk_period;
		input <= '0';
		wait for clk_period;
		input <= '0';
		wait for clk_period;
		input <= '1';
		wait for clk_period;
		input <= '0';
		wait for clk_period;
		input <= '0';
		wait for clk_period;
		input <= '1';
		wait for clk_period;
		input <= '1';
		wait for clk_period;
		input <= '1';
		wait for clk_period;
		input <= '1';
		wait for clk_period;
      wait;
   end process;

END;
