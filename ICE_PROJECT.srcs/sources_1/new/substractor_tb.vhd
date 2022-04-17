----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2022 01:24:47 PM
-- Design Name: 
-- Module Name: substractor_tb - Behavioral
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

entity substractor_tb is
--  Port ( );
end substractor_tb;

architecture substractor_tb of substractor_tb is

    constant ClockFrequency : integer := 100e6;
    constant ClockPeriod : time := 1000 ms / ClockFrequency;
    
    signal clk : std_logic := '1';
    
    component substractor
        Port(
            A: in std_logic_vector(31 downto 0);
            O: out std_logic_vector(31 downto 0);
            CLK : in std_logic
        );
    end component;
    
    signal A : std_logic_vector(31 downto 0);
    signal O : std_logic_vector(31 downto 0);
    
begin
    
    clk <= not clk after ClockPeriod / 2;
    
    uut: substractor port map (A=>A, O=>O, CLK=>clk);
    stim_proc: process
    begin
        A<= "00111111000000000000000000000000"; --1.89
        wait for 200 ns;
    end process;
end substractor_tb;
