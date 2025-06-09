
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY sign_extend IS
	PORT (
		Instr_15to0   : IN STD_logic_vector(15 DOWNTO 0);
		sign_extended : OUT STD_logic_vector(31 DOWNTO 0)
	);
END Sign_extend;
ARCHITECTURE Behavioral OF sign_extend IS
BEGIN
	
	sign_extended <= x"0000" & Instr_15to0 WHEN Instr_15to0(15) = '0'
	          ELSE
	          x"FFFF" & Instr_15to0;
END Behavioral; 