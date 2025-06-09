LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity tb_mux_2to1 is 
end tb_mux_2to1;
architecture test_b of tb_mux_2to1 is
signal A1, B1: std_logic_vector(2 downto 0);
signal D1: std_logic_vector(2 downto 0);
signal S1: std_logic;
component mux_2to1 port (a, b: in std_logic_vector(2 downto 0); s: in std_logic; d:out std_logic_vector(2 downto 0));
end component; 
begin 
M1: mux_2to1 PORT MAP (a=>A1,b=>B1,s=>S1,d=>D1);
process
begin
A1 <= "001";B1 <= "010";S1 <= '0'; wait for 20 ps;
A1 <= "010";B1 <= "100";S1 <= '0'; wait for 20 ps;
A1 <= "111";B1 <= "011";S1 <= '0'; wait for 20 ps;
A1 <= "101";B1 <= "111";S1 <= '0'; wait for 20 ps; 
A1 <= "010";B1 <= "001";S1 <= '1'; wait for 20 ps;
A1 <= "000";B1 <= "101";S1 <= '1'; wait for 20 ps; 
A1 <= "101";B1 <= "010";S1 <= '1'; wait for 20 ps;
A1 <= "111";B1 <= "101";S1 <= '1'; wait for 20 ps;  
end process; 
end test_b;