----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2022 05:30:09 PM
-- Design Name: 
-- Module Name: stock_weights - Behavioral
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

entity stock_weights is
    port(
        
        clk : in std_logic;
        bf: out std_logic_vector(127 downto 0);
        wfh: out std_logic_vector(511 downto 0);
        wfx: out std_logic_vector(127 downto 0);

        bh: out std_logic_vector(127 downto 0);
        
        wh: out std_logic_vector(511 downto 0);
        whx: out std_logic_vector(127 downto 0)
    );
end stock_weights;

architecture stock_weights of stock_weights is

begin

    process(clk) is
    begin
        bf <= x"3e9f92483e1f11be3e1a8e333eb4e4d8";
        wfh <= "10000010000100101000111000100110001101010001011010010011100001111111010000011010000001110110110011001110001100010000001111101000100110001111111110011101111010000100101100101001100011010010101111000011110011101101101010100001101101101001001100100001010110011000000111010000101100000111101001011101100001110111111001110001011101100001111010111001010110001000011011010110010111000001111001101101111110110000001100010100001110101101001111101010101001111101111010100100111011111000110101011110011111001001101101011001";
        wfx <= x"3eea08c63e7c2d4a3ea998d93e8851c4";
        bh <= x"3d17b8a23dbf20f4bcad2d753ea56a83";
        wh <= x"3e6ed0b63bc46c973e5964f13c75bf573e3882ad3e2156783e8366d83e2c8230be9f71333d0a93c9be263743bddf8adabbe2c63c6be1cbd53bd0003763b9e347";
        whx <= x"3e3489033e5082da3e87b2413e5b878e";
        
    end process;
end stock_weights;
