LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY ALU_Control IS PORT ( 	
 OP_5to0:     IN STD_LOGIC_VECTOR(5 DOWNTO 0);
 ALU_op:      IN STD_LOGIC_VECTOR(1 DOWNTO 0);
 Operation:   OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ALU_Control;

architecture Behavioral of ALU_Control is
begin
process(ALU_op,OP_5to0)
begin
case ALU_op is
when "00" => 
 Operation <= "0010";
when "01" => 
 Operation <= "0111";
when "10" => 
 Operation <= "1000";
when "11" => 
Operation <= "1001";
when others => Operation <= "0000";
end case;
end process;
end Behavioral;