----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2022 04:00:20 PM
-- Design Name: 
-- Module Name: sub_array - Behavioral
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



entity sub_array is
    Port (
        A : in std_logic_vector(127 downto 0);
        O : out std_logic_vector(127 downto 0);
        CLK : in std_logic
    );
end sub_array;

architecture sub_array_arc of sub_array is

component substractor
    Port(
        A: in std_logic_vector(31 downto 0);
        O : out std_logic_vector(31 downto 0);
        CLK : in std_logic
    );
end component;


begin
    float_subs:
        for i in 0 to 3 generate
            fmx : substractor port map (CLK=>CLK, A=>A((i*32)+31 downto i*32), 
                         O=>O((i*32)+31 downto i*32));
    end generate float_subs;
end sub_array_arc;
