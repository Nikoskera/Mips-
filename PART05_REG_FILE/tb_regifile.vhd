LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_regifile IS
END entity;
 
ARCHITECTURE behavior OF tb_regifile IS 

COMPONENT regifile 
    PORT(
    Datain  : in  std_logic_vector(3 downto 0);
    Addr    : in  std_logic_vector(2 downto 0);
    we      : in  std_logic;
    clk     : in  std_logic;
    Dataout : out std_logic_vector(3 downto 0));
    END COMPONENT;

   signal Datain : std_logic_vector(3 downto 0) := (others => '0');
   signal Addr : std_logic_vector(2 downto 0) := (others => '0');
   signal we : std_logic := '0';
   signal clk : std_logic := '0';
   signal Dataout : std_logic_vector(3 downto 0);


   constant clk_period : time := 10 ns;

begin 

uut: regifile PORT MAP (
          Datain => Datain,
          Addr => Addr,
          we => we,
          clk => clk,
          Dataout => Dataout
        );

clk_process :process
   begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
  end process;

stim_proc: process
   begin  
  we <= '0'; 
  Datain <= "0101";
  Addr <= "000";
wait for 100 ns;
 for i in 0 to 5 loop 
  we <= '0'; 
  Datain <= "1101";
  Addr <= "001";
wait for clk_period*5;
end loop;
  wait for 100 ns; 
for i in 0 to 5 loop 
  we <= '0'; 
  Datain <= "0010";
  Addr <= "010";
wait for clk_period*5;
end loop;
wait for 100 ns;
 for i in 0 to 5 loop 
  we <= '0'; 
  Datain <= "1001";
  Addr <= "011";
wait for clk_period*5;
end loop;
wait for 100 ns;
end process;
end;

