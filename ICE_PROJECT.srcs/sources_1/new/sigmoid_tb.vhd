----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2022 06:17:52 PM
-- Design Name: 
-- Module Name: sigmoid_tb - Behavioral
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
 
ENTITY sigmoid_tb IS
END sigmoid_tb;
 
ARCHITECTURE sigmoid_tb_arc OF  sigmoid_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT  sigmoid
    PORT(
         clk  : IN  std_logic;
         Y : IN   std_logic_vector(31 downto 0);
         O : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

--   --Inputs
   signal Y : std_logic_vector(31 downto 0) := "00111101110011001100110011001101";
   signal clk : std_logic :=  '0';
  
-- 	--Outputs
   signal O : std_logic_vector(31 downto 0);
   
 
   constant in_period : time :=  200 ns;
   constant cin_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sigmoid  PORT MAP (
          Y => Y,
          clk => clk,
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
