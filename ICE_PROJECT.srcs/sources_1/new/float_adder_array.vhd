----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2022 10:45:51 PM
-- Design Name: 
-- Module Name: float_adder_array - Behavioral
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



entity float_adder_array is
    Port (
        A,B : in std_logic_vector(127 downto 0);
        O : out std_logic_vector(127 downto 0);
        CLK : in std_logic
    );
end float_adder_array;

architecture float_adder_array_arc of float_adder_array is

component float_adder
    Port(
        clk  : IN  std_logic;
         f1,f2 : IN   std_logic_vector(31 downto 0);
         out1 : OUT  std_logic_vector(31 downto 0)
    );
end component;

type a_array is array (7 downto 0) of std_logic_vector(31 downto 0);
type b_array is array (7 downto 0) of std_logic_vector(31 downto 0);
shared variable i: integer :=0;

begin
    float_adders:
        for i in 0 to 3 generate
            fmx : float_adder port map (clk=>CLK, f1=>A((i*32)+31 downto i*32), 
                        f2=> B((i*32)+31 downto i*32), out1=>O((i*32)+31 downto i*32));
    end generate float_adders;
end float_adder_array_arc;
