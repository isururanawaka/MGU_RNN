----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2022 03:01:45 PM
-- Design Name: 
-- Module Name: mgu - Behavioral
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


entity mgu_unit is
    port(
        clk: in std_logic;
        h: in std_logic_vector(127 downto 0);
        x: in std_logic_vector(31 downto 0);
        h_out: out std_logic_vector(127 downto 0)
    );
end mgu_unit;

architecture mgu_unit of mgu_unit is
    component ht
        port ( 
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
    
    end component;
    
   
    component stock_weights
        port(
        
        clk : in std_logic;
        bf: out std_logic_vector(127 downto 0);
        wfh: out std_logic_vector(511 downto 0);
        wfx: out std_logic_vector(127 downto 0);

        bh: out std_logic_vector(127 downto 0);
        
        wh: out std_logic_vector(511 downto 0);
        whx: out std_logic_vector(127 downto 0)
            
        );
    end component;
   
    
    signal ht_clk: std_logic := '0';
    signal ht_wh: std_logic_vector(511 downto 0);
    signal ht_wf: std_logic_vector(511 downto 0);
    signal ht_whx: std_logic_vector(127 downto 0);
    signal ht_wfx: std_logic_vector(127 downto 0);
    signal ht_x: std_logic_vector(31 downto 0);
    signal ht_bf: std_logic_vector(127 downto 0);
    signal ht_bh: std_logic_vector(127 downto 0);
    signal ht_h_out: std_logic_vector(127 downto 0);
    signal ht_h: std_logic_vector(127 downto 0);
    
    signal stock_clk: std_logic := '0';
begin

  
    ht1: ht port map(
        clk => ht_clk,
        wh => ht_wh,
        wf => ht_wf,
        wfx => ht_wfx,
        whx => ht_whx,
        ht_1 => ht_h,
        xt => ht_x,
        bf => ht_bf,
        bh => ht_bh,
        ht => ht_h_out
    );
    
    wights: stock_weights port map (
        clk => stock_clk,
        bf => ht_bf,
        wfh => ht_wf,
        wfx => ht_wfx,

        bh => ht_bh,
        
        wh => ht_wh,
        whx => ht_whx
    );
    
    process(clk) is
    begin
    
        if rising_edge(clk) then

            ht_h <= h;
            ht_x <= x;
            
            h_out <= ht_h_out;
            
            stock_clk <= '1';

            ht_clk <= '1';
        else
            stock_clk <= '0';
            ht_clk <= '0';
        end if;
    end process;
    

end mgu_unit;
    
