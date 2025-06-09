LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity dec_2to4 is
port (
a: in std_logic_vector(1 downto 0);
d: out std_logic_vector(3 downto 0)
);
end dec_2to4;
architecture dataflow of dec_2to4 is 
begin 

process(a)
begin
if (a="00") then
d<= "0001";
elsif (a="01") then
d <= "0010";
elsif (a="10") then
d <= "0100";
else 
d <= "1000";

end if;
end process;
end dataflow;