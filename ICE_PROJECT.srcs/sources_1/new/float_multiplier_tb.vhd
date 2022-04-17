----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2022 04:41:12 PM
-- Design Name: 
-- Module Name: float_multiplier_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY float_multiplier_tb IS
END float_multiplier_tb;
 
ARCHITECTURE float_multiplier_tb_arc OF  float_multiplier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT float_multiplier
    PORT(
         CLK  : IN  std_logic;
         A,B : IN   std_logic_vector(31 downto 0);
         O : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

--   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '1');
   signal CLK : std_logic :=  '0';
  
-- 	--Outputs
   signal O : std_logic_vector(31 downto 0);
   
 
   constant in_period : time :=  200 ns;
   constant cin_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: float_multiplier  PORT MAP (
          A => A,
          B => B,
          CLK => CLK,
          O => O
        );


   
   -- Clock process definitions
   
   in_process: process
   begin
       A <= "01000001001000000000000000000000";
       B <= "01000001001100000000000000000000";
       wait for in_period/2;
       A <= "01000001001000000000000000000000";
       B <= "01000001010000000000000000000000";
       wait for in_period/2;
       A <= "01000001001000000000000000000000";
       B <= "01000001001100000000000000000000";
   end process; 
   
   

   clk_process: process
   begin
       CLK <= '1';
       wait for cin_period/2;
       CLK <= '0';
       wait for cin_period/2;
       CLK <= '1';
   end process;    

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for cin_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
