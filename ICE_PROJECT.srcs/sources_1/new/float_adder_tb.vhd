----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2022 03:20:42 PM
-- Design Name: 
-- Module Name: float_adder_tb - Behavioral
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
 
ENTITY float_adder_tb IS
END float_adder_tb;
 
ARCHITECTURE float_adder_tb_arc OF  float_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT float_adder
    PORT(
         clk  : IN  std_logic;
         f1,f2 : IN   std_logic_vector(31 downto 0);
         out1 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

--   --Inputs
   signal f1 : std_logic_vector(31 downto 0) := (others => '0');
   signal f2 : std_logic_vector(31 downto 0) := (others => '1');
   signal clk : std_logic :=  '0';
  
-- 	--Outputs
   signal out1 : std_logic_vector(31 downto 0);
   
 
   constant in_period : time :=  200 ns;
   constant cin_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: float_adder  PORT MAP (
          f1 => f1,
          f2 => f2,
          clk => clk,
          out1 => out1
        );


   
   -- Clock process definitions
   
   in_process: process
   begin
       f1 <= "01000001001000000000000000000000";
       f2 <= "01000001001100000000000000000000";
       wait for in_period/2;
       f1 <= "01000001001000000000000000000000";
       f2 <= "01000001010000000000000000000000";
       wait for in_period/2;
       f1 <= "01000001001000000000000000000000";
       f2 <= "01000001001100000000000000000000";
   end process; 
   
   

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
