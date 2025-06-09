library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity tb_datamemory is 
end tb_datamemory;

architecture behavioral of tb_datamemory is 
component dataMemory 
port (
  
   Addr   : in  std_logic_vector(5 downto 0);
   writeD : in  std_logic_vector(31 downto 0);
   we     : in  std_logic;
   re     : in  std_logic;
   readD  : out std_logic_vector(31 downto 0)
); 
end component;

signal Addr : std_logic_vector(5 downto 0):= (others => '0');
signal writeD : std_logic_vector(31 downto 0):= (others => '0'); 
signal we : std_logic := '0';
signal re : std_logic := '0';

signal readD : std_logic_vector(31 downto 0);

constant re_period : time := 10 ns;


begin 
uut: dataMemory port map(
Addr => Addr,
writeD => writeD,
we => we,
re => re,
readD => readD
);

re_process : process
begin 
re <= '0';
wait for re_period/2;
re <= '1';
wait for re_period/2;
end process;

stim_proc: process
begin 
we <= '1';
Addr <= "000000";
writeD <= x"00000000";
wait for 100 ns;
for i in 0 to 5 loop
Addr <= Addr + "00001";
wait for re_period*5;
end loop;
Addr <= "000000";
we <= '1';
wait for 100 ns ;
for i in 0 to 5 loop 
Addr <= Addr + "00001";
writeD <= writeD - x"01";
wait for re_period*5;
end loop ;
we <= '0';
wait ;
end process;

end ;

