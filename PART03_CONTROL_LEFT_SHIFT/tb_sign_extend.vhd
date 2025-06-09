LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_sign_extend IS
END tb_sign_extend;
ARCHITECTURE behavior OF tb_sign_extend IS
	
	SIGNAL tb_Instr_15to0 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
	
	SIGNAL tb_sign_extended : std_logic_vector(31 DOWNTO 0);
BEGIN
	
	U1_Test : ENTITY work.sign_extend(Behavioral)
		PORT MAP(
			Instr_15to0    => tb_Instr_15to0,
			sign_extended   => tb_sign_extended
		);
		
stim_proc : PROCESS
BEGIN
	tb_Instr_15to0 <= x"7FFF"; 
	WAIT FOR 100ns;
	tb_Instr_15to0 <= x"8000"; 
	WAIT FOR 100 ns;
	tb_Instr_15to0 <= x"FFFF";
	WAIT FOR 100 ns;
END PROCESS;
END;
