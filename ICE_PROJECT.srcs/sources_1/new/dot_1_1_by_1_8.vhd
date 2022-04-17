library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dot_1_1_by_1_8 is
    port(
        clk: in std_logic;
        x : in std_logic_vector(31 downto 0);
        y : in std_logic_vector(127 downto 0);
        o : out std_logic_vector(127 downto 0)
    );
end dot_1_1_by_1_8;

architecture dot_1_1_by_1_8_arc of dot_1_1_by_1_8 is

    component float_multiplier
        Port (
            A, B: in std_logic_vector(31 downto 0);
            O : out std_logic_vector(31 downto 0);
            CLK : in std_logic
        );
    end component;
    
    
    signal mult_f2_0: std_logic_vector(31 downto 0);
    signal mult_out_0: std_logic_vector(31 downto 0);
    
    signal mult_f2_1: std_logic_vector(31 downto 0);
    signal mult_out_1: std_logic_vector(31 downto 0);
    
    signal mult_f2_2: std_logic_vector(31 downto 0);
    signal mult_out_2: std_logic_vector(31 downto 0);
    
    signal mult_f2_3: std_logic_vector(31 downto 0);
    signal mult_out_3: std_logic_vector(31 downto 0);
    
    signal mult_clk: std_logic := '0';
    
begin

    
    fm0: float_multiplier port map (
        CLK => mult_clk,
        A => x,
        B => mult_f2_0,
        O => mult_out_0
    );
    
    fm1: float_multiplier port map (
        CLK => mult_clk,
        A => x,
        B => mult_f2_1,
        O => mult_out_1
    );
    
    fm2: float_multiplier port map (
        CLK => mult_clk,
        A => x,
        B => mult_f2_2,
        O => mult_out_2
    );
    
    fm3: float_multiplier port map (
        CLK => mult_clk,
        A => x,
        B => mult_f2_3,
        O => mult_out_3
    );
    
    
    process(clk) is
    begin
        if rising_edge(clk) then
            
            mult_f2_0 <= y(31 downto 0);
            mult_f2_1 <= y(63 downto 32);
            mult_f2_2 <= y(95 downto 64);
            mult_f2_3 <= y(127 downto 96);
            
            o <=  mult_out_3 & mult_out_2 & mult_out_1 & mult_out_0;
            
            mult_clk <= '1';
        else
            mult_clk <= '0';
        end if;
    end process;
end dot_1_1_by_1_8_arc;
