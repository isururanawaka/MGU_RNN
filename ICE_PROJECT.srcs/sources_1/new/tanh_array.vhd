----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2022 09:10:07 PM
-- Design Name: 
-- Module Name: tanh_array - Behavioral
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



entity tanh_array is
    Port (
        A : in std_logic_vector(127 downto 0);
        O : out std_logic_vector(127 downto 0);
        CLK : in std_logic
    );
end tanh_array;

architecture tanh_array_arc of tanh_array is

component tanh
    Port(
        A: in std_logic_vector(31 downto 0);
        O : out std_logic_vector(31 downto 0);
        CLK : in std_logic
    );
end component;


begin
    float_tanh_array:
        for i in 0 to 3 generate
            tnx : tanh port map (CLK=>CLK, A=>A((i*32)+31 downto i*32), O=>O((i*32)+31 downto i*32));
    end generate float_tanh_array;
end tanh_array_arc;
