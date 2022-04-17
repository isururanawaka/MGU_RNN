----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2022 06:45:56 PM
-- Design Name: 
-- Module Name: mgu_tb - Behavioral
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

entity mgu_tb is
--  Port ( );
end mgu_tb;

architecture mgu_tb of mgu_tb is

    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000 ms / ClockFrequency;
    
    signal clk : std_logic := '1';
    
    component mgu_unit
        Port(
            clk: in std_logic;
        h: in std_logic_vector(127 downto 0);
        x: in std_logic_vector(31 downto 0);
        h_out: out std_logic_vector(127 downto 0)
        );
    end component;
    
    signal x : std_logic_vector(31 downto 0);
    signal h : std_logic_vector(127 downto 0);
    signal h_out:  std_logic_vector(127 downto 0);
    
begin
    
    clk <= not clk after ClockPeriod / 2;
    
    uut: mgu_unit port map (h=>h, x=>x, clk=>clk, h_out=>h_out);
    stim_proc: process
    begin
        h<= x"3e9f92483e1f11be3e1a8e333eb4e4d8"; --1.89
        x<= x"3e9f9248";
        wait for 200 ns;
    end process;
end mgu_tb;
