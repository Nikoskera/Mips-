
library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity regifile is	port ( 
    Datain  : in  std_logic_vector(3 downto 0);
    Addr    : in  std_logic_vector(2 downto 0);
    we      : in  std_logic;
    clk     : in  std_logic;
    Dataout : out std_logic_vector(3 downto 0));
end regifile;

architecture behavioral of regifile is
type regArray is array(0 to 7) of std_logic_vector(3 downto 0);
signal regifile: regArray;

begin
 process(clk)
 begin
  if (clk'event and clk='0') then
   if we='1' then
    regifile(to_integer(unsigned(Addr))) <= Datain; 
   end if;
  end if;
 Dataout <= regifile(to_integer(unsigned(Addr)));
 end process;
end behavioral;
