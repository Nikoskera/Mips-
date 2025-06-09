
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
  
ENTITY tb_alu4 IS
END tb_alu4;
  
ARCHITECTURE behavior OF tb_alu4 IS
  
 
  
 COMPONENT alu4
 PORT(
 ALUin1 : IN signed(3 downto 0);
 ALUin2 : IN signed(3 downto 0);
 ALUctrl : IN std_logic_vector(2 downto 0);
 ALUout1 : OUT signed(3 downto 0)
 );
 END COMPONENT;
  
 
 
 signal ALUin1 : signed(3 downto 0) := (others => '0');
 signal ALUin2 : signed(3 downto 0) := (others => '0');
 signal ALUctrl : std_logic_vector(2 downto 0) := (others => '0');
 signal ALUout1 : signed(3 downto 0);
  
BEGIN
  
 
 uut: alu4 PORT MAP (
 ALUin1 => ALUin1,
 ALUin2 => ALUin2,
 ALUctrl => ALUctrl,
 ALUout1 => ALUout1
 );
 
 
 stim_proc: process
 begin
 
 wait for 100 ns;
 
 ALUin1 <= "0010";
 ALUin2 <= "0100";
 ALUctrl <= "010";
 wait for 100 ns;
 ALUin1 <= "0100";
 ALUin2 <= "1111";
 ALUctrl <= "000";
 wait for 100 ns;
 ALUin1 <= "0100";
 ALUin2 <= "1111";
 ALUctrl <= "001";
 wait for 100 ns;
 ALUin1 <= "0100";
 ALUin2 <= "0010";
 ALUctrl <= "110";
 wait for 100 ns;
 ALUin1 <= "0100";
 ALUin2 <= "0010";
 ALUctrl <= "110";
 wait for 100 ns;
 end process;
 
END;

