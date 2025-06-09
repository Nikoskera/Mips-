
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity alu4 is
 Port ( ALUin1 : in signed(3 downto 0);
 ALUin2 : in signed(3 downto 0);
 ALUctrl : in std_logic_vector (2 downto 0);
 ALUout1 : out signed(3 downto 0));
end alu4;
 
architecture Behavioral of alu4 is
begin
process(ALUin1, ALUin2, ALUctrl)
begin
case ALUctrl is
 when "000" =>
 ALUout1<= ALUin1 + ALUin2; 
 when "001" =>
 ALUout1<= ALUin1 - ALUin2; 
 when "010" =>
 ALUout1<= ALUin1 - 1; 
 when "011" =>
 ALUout1<= ALUin1 + 1; 
 when "100" =>
 ALUout1<= ALUin1 and ALUin2; 
 when "101" =>
 ALUout1<= ALUin1 or ALUin2; 
 when "110" =>
 ALUout1<= not ALUin1 ; 
 when "111" =>
 ALUout1<= ALUin1 xor ALUin2; 
 when others =>
 NULL;
end case;
  
end process;
 
end Behavioral;