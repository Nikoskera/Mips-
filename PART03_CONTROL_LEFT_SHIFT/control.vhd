LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY control IS
	PORT (
		OP_5to0        : IN std_logic_vector(5 DOWNTO 0); 
		RegDst,RegWrite,ALUsrc,Branch: OUT std_logic;
		memRead,memWrite,memToReg: OUT std_logic;
		ALU_op         : OUT std_logic_vector(1 DOWNTO 0)
);
	
END control;
ARCHITECTURE Behavioral OF control IS
BEGIN
PROCESS (OP_5to0)
	BEGIN
regWrite <= '0'; 
		CASE OP_5to0 IS
			WHEN "000000" => 
				RegDst        <= '1';
				Branch        <= '0';
				memRead       <= '0';
				memToReg      <= '0';
				ALU_op         <= "10";
				memWrite      <= '0';
				ALUsrc        <= '0';
				regWrite      <= '1' AFTER 10 ns;
                         WHEN "100011" => 
				RegDst        <= '0';
				Branch        <= '0';
				memRead       <= '1';
				memToReg      <= '1';
				ALU_op         <= "00";
				memWrite      <= '0';
				ALUsrc        <= '1';
				regWrite      <= '1' AFTER 10 ns;
                         WHEN "101011" => 
				RegDst       <= 'X'; 
				Branch        <= '0' AFTER 2 ns;
				memRead       <= '0';
				memToReg      <= 'X'; 
				ALU_op         <= "00";
				memWrite      <= '1';
				ALUsrc        <= '1';
				regWrite      <= '0';
                         WHEN "000100" => 
				RegDst        <= 'X';
				Branch        <= '1' AFTER 2 ns;
				memRead       <= '0';
				memToReg      <= 'X'; 
				ALU_op         <= "01";
				memWrite      <= '0';
				ALUsrc        <= '0';
				regWrite      <= '0';
                       WHEN OTHERS => NULL; 
				RegDst        <= '0';
				Branch        <= '0';
				memRead       <= '0';
				memToReg <= '0';
				ALU_op         <= "00";
				memWrite      <= '0';
				ALUsrc        <= '0';
				regWrite      <= '0';
            END CASE;
	END PROCESS;
END Behavioral;