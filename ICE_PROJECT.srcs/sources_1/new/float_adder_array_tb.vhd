----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2022 11:42:34 PM
-- Design Name: 
-- Module Name: float_adder_array_tb - Behavioral
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
 
ENTITY float_adder_array_tb IS
END float_adder_array_tb;
 
ARCHITECTURE float_adder_array_tb_arc OF  float_adder_array_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT  float_adder_array
    PORT(
         A,B : in std_logic_vector(127 downto 0);
         O : out std_logic_vector(127 downto 0);
         CLK : in std_logic
        );
    END COMPONENT;
    

--   --Inputs
   signal A : std_logic_vector(127 downto 0) := "00111101110011001100110011001101001111011100110011001100110011010011110111001100110011001100110100111101110011001100110011001101";
  
   signal B : std_logic_vector(127 downto 0) := "00111101110011001100110011001101001111011100110011001100110011010011110111001100110011001100110100111101110011001100110011001101";
   
   signal CLK : std_logic :=  '0';
  
-- 	--Outputs
   signal O : std_logic_vector(127 downto 0);
   
   constant in_period : time :=  200 ns;
   constant cin_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: float_adder_array  PORT MAP (
          A => A,
          B => B,
          CLK => CLK,
          O => O
        );


   
   -- Clock process definitions
   
   clk_process: process
   begin
       clk <= '1';
       wait for cin_period/2;
       clk <= '0';
       wait for cin_period/2;
       clk <= '1';
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
