----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2022 10:29:11 AM
-- Design Name: 
-- Module Name: mgu_layer - Behavioral
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

entity mgu_layer is
    port(
         clk: in std_logic;
         h_in: in std_logic_vector(127 downto 0);
         x_in: in std_logic_vector(127 downto 0);
        h_out: out std_logic_vector(127 downto 0)
        );
end mgu_layer;

architecture mgu_layer of mgu_layer is
    
    component mgu_unit
        port(
         clk: in std_logic;
           h: in std_logic_vector(127 downto 0);
           x: in std_logic_vector(31 downto 0);
        h_out: out std_logic_vector(127 downto 0)
        );
    end component;
    
   
    signal mgu1_h: std_logic_vector(127 downto 0);
    
    signal mgu2_h: std_logic_vector(127 downto 0);
    
    signal mgu3_h: std_logic_vector(127 downto 0);
    
    signal mgu4_h: std_logic_vector(127 downto 0);
    
begin

    mgu1: mgu_unit port map(
        clk => clk,
        x => x_in(127 downto 96),
        h => h_in,
        h_out => mgu1_h
    );
    
    mgu2: mgu_unit port map(
        clk => clk,
        x => x_in(95 downto 64),
        h => mgu1_h,
        h_out => mgu2_h
    );
    
    mgu3: mgu_unit port map(
        clk => clk,
        x => x_in(63 downto 32),
        h => mgu2_h,
        h_out => mgu3_h
    );
    
    mgu4: mgu_unit port map(
        clk => clk,
        x => x_in(31 downto 0),
        h => mgu3_h,
        h_out => mgu4_h
    );
    
    h_out <= mgu4_h;
end mgu_layer;
