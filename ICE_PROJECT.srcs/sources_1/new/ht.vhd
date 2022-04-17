----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2022 01:35:40 PM
-- Design Name: 
-- Module Name: ht - Behavioral
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


entity ht is
    Port ( 
        bf: in std_logic_vector(127 downto 0);
        ht_1: in std_logic_vector(127 downto 0);
        wf: in std_logic_vector(511 downto 0);
        wh: in std_logic_vector(511 downto 0);
        xt: in std_logic_vector(31 downto 0);
        wfx: in std_logic_vector(127 downto 0);
        whx: in std_logic_vector(127 downto 0);
        bh: in std_logic_vector(127 downto 0);
        clk: in std_logic;
        ht: out std_logic_vector(127 downto 0)
    );
end ht;

architecture ht of ht is

component gb
        port(
            clk: in std_logic;
            h: in std_logic_vector(127 downto 0);
            wh: in std_logic_vector(511 downto 0);
            x: in std_logic_vector(31 downto 0);
            wx: in std_logic_vector(127 downto 0);
            b: in std_logic_vector(127 downto 0);
            o: out std_logic_vector(127 downto 0)
        );
    end component;

component gbe
        port(
        clk: std_logic;
        h: in std_logic_vector(127 downto 0);
        wh:in std_logic_vector(511 downto 0);
        x: in std_logic_vector(31 downto 0);
        wx:in std_logic_vector(127 downto 0);
        b: in std_logic_vector(127 downto 0);
        f: in std_logic_vector(127 downto 0);
        o: out std_logic_vector(127 downto 0)
        );
    end component;    
    
    
    component em
        Port (
            A,B : in std_logic_vector(127 downto 0);
            O : out std_logic_vector(127 downto 0);
            CLK : in std_logic
        );
    end component;
    
    component sigmoid_array
        Port ( 
            A : in STD_LOGIC_VECTOR (127 downto 0);
            O : out STD_LOGIC_VECTOR (127 downto 0);
            clk: in STD_LOGIC 
        );
    end component;
    
    component tanh_array
        Port (
            A: in std_logic_vector(127 downto 0);
            O: out std_logic_vector(127 downto 0);
            CLK : in std_logic
        );
    end component;
    
   component sub_array
        Port (
            A: in std_logic_vector(127 downto 0);
            O: out std_logic_vector(127 downto 0);
            CLK : in std_logic
        );
    end component;
    
    component float_adder_array
        Port (
            A,B: in std_logic_vector(127 downto 0);
            O: out std_logic_vector(127 downto 0);
            CLK : in std_logic
        );
    end component;
    
    
    signal gb_o: std_logic_vector(127 downto 0);
    signal sig_o: std_logic_vector(127 downto 0);
    signal tanh_o: std_logic_vector(127 downto 0);
    signal ft_o : std_logic_vector(127 downto 0); 
    signal gbe_o : std_logic_vector(127 downto 0); 
    signal sub_o : std_logic_vector(127 downto 0); 
    signal em_o : std_logic_vector(127 downto 0); 
    signal em_f : std_logic_vector(127 downto 0); 
begin
    gb_blck: gb port map (clk=>clk, b=>bf, h=>ht_1, wh=>wh, x=>xt, wx=> whx, o=>gb_o);
    sig_ar: sigmoid_array port map(clk=>clk, A=> gb_o, o=>sig_o);
    gbe_blck: gbe port map (clk=>clk, b=>bf, h=>ht_1, wh=>wh, x=>xt, wx=> whx,f=>sig_o, o=>gbe_o);
    tanh_ar: tanh_array port map(clk=>clk, A=> gbe_o, O=>tanh_o);
    sub_ar : sub_array port map(CLK=> clk,A=>sig_o,O=> sub_o);
    em_proc1: em port map (CLK=>clk, A=>tanh_o, B=>sig_o, O=>em_o);
    em_proc2: em port map (CLK=>clk, A=>sub_o, B=>ht_1, O=>em_f);
    final: float_adder_array port map (CLK=>clk, A=>em_f, B=>em_o, O=>ht);
end ht;
