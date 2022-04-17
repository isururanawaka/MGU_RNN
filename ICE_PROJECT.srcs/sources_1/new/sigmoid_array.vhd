----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2022 09:37:10 PM
-- Design Name: 
-- Module Name: sigmoid_array - Behavioral
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



entity sigmoid_array is
    Port (
        A : in std_logic_vector(127 downto 0);
        O : out std_logic_vector(127 downto 0);
        CLK : in std_logic
    );
end sigmoid_array;

architecture sigmoid_array_arc of sigmoid_array is

component sigmoid
    Port(
        Y: in std_logic_vector(31 downto 0);
        O : out std_logic_vector(31 downto 0);
        CLK : in std_logic
    );
end component;


begin
    float_sigmoid_array:
        for i in 0 to 3 generate
            sig : sigmoid port map (CLK=>CLK, Y=>A((i*32)+31 downto i*32), O=>O((i*32)+31 downto i*32));
    end generate float_sigmoid_array;
end sigmoid_array_arc;
