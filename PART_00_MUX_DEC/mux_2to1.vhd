LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_2to1 is port
(a, b: in std_logic_vector(2 downto 0); 
     s: in std_logic;
     d: out std_logic_vector(2 downto 0));
end mux_2to1;

architecture dataflow of mux_2to1 is
begin 
    d <= a when s='0' else b;
end dataflow;