LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_mips IS
END tb_mips;
 
ARCHITECTURE behavior OF tb_mips IS 
   
    COMPONENT mips
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         pc_out : OUT  std_logic_vector(15 downto 0);
         alu_result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   
   signal pc_out : std_logic_vector(15 downto 0);
   signal alu_result : std_logic_vector(15 downto 0);
   
   constant clk_period : time := 10 ns;
BEGIN

   uut: mips PORT MAP (
          clk => clk,
          reset => reset,
          pc_out => pc_out,
          alu_result => alu_result
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
      reset <= '1';
      wait for clk_period*10;
  reset <= '0';
      
      wait;
   end process;

END;
