library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity dot_1n_to_nn is
    Port ( 
        A: in std_logic_vector(127 downto 0);
        B: in std_logic_vector(511 downto 0);
        O : out std_logic_vector(127 downto 0);
        CLK : in std_logic
    );
end dot_1n_to_nn;

architecture dot_1n_to_nn_arc of dot_1n_to_nn is

component em
   Port (
        A,B : in std_logic_vector(127 downto 0);
        O : out std_logic_vector(127 downto 0);
        CLK : in std_logic
    );    
end component;

component array_elem_sum
    Port (
        A : in std_logic_vector(127 downto 0);
        O: out std_logic_vector(31 downto 0);
        CLK : in std_logic
     );
end component;

signal B_T: std_logic_vector(511 downto 0);
signal B_T_MUL: std_logic_vector(511 downto 0);

shared variable i,j: integer := 0;

begin
               
   row_loop:
    for i in 3 downto 0 generate
        col_loop:
        for j in 3 downto 0 generate
            B_T(((128*j)+(32*(i+1))) - 1 downto ((128*j)+(32*i))) <= B(((128*i)+(32*(j+1))) - 1 downto ((128*i)+(32*j)));
        end generate col_loop;
        emx: em port map (A=>B_T((128*i) + 127 downto (128*i)), B=>A, O=> B_T_MUL((128*i) + 127 downto (128*i)), CLK=>CLK);
        smx: array_elem_sum port map(CLK=>CLK, A=>B_T_MUL((128*i) + 127 downto (128*i)), O=>O((32*i) + 31 downto (32*i)));
    end generate row_loop;
end dot_1n_to_nn_arc;
