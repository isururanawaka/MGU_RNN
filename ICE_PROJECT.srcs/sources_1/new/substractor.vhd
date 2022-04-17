----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2022 11:18:37 AM
-- Design Name: 
-- Module Name: substractor - Behavioral
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



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity substractor is
    PORT ( A: IN   std_logic_vector(31 downto 0);
           O : OUT  std_logic_vector(31 downto 0);
           CLK: IN std_logic);
end substractor;


architecture substractor_arc of substractor is
  signal B : std_logic_vector(31 downto 0) := "00111111100000000000000000000000";
  
component float_adder 
port (
    clk: in std_logic;
    f1: in std_logic_vector(31 downto 0);
    f2: in std_logic_vector(31 downto 0);
    out1: out std_logic_vector(31 downto 0));
  end component;
  
signal C: std_logic_vector(31 downto 0);

begin
   fmx: float_adder port map (
       clk=>CLK, 
       f1=>B, 
       f2=>C, 
       out1=>O
       );  
    process (CLK,A) 
   -------- decalring variables -------
       
       variable sign : std_logic := A(31);
       variable rest : std_logic_vector(30 downto 0) := A(30 downto 0);
       
       begin
             if sign = '1' then
                 sign := '0';
             else 
                 sign := '1';  
             end if;  
        C <= sign & A(30 downto 0);
   end process;
                
end  substractor_arc;  
