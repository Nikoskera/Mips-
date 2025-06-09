
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_dec_2to4 IS
END tb_dec_2to4;
 
ARCHITECTURE behavior OF tb_dec_2to4 IS
 
 COMPONENT dec_2to4
 PORT(
 a : IN std_logic_vector(1 downto 0);
 d : OUT std_logic_vector(3 downto 0)
 );
 END COMPONENT;
 

 signal a : std_logic_vector(1 downto 0) := (others => '0');
 

 signal d : std_logic_vector(3 downto 0);

 
BEGIN
 

 uut: dec_2to4  PORT MAP (
 a => a,
 d => d
 );
 

 stim_proc: process
 begin

 wait for 100 ns;
 
 a <= "00";
 
 wait for 100 ns;
 
 a <= "01";
 
 wait for 100 ns;
 
 a <= "10";
 
 wait for 100 ns;
 
 a <= "11";
 
 wait;
 end process;
 
END;

