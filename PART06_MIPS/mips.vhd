
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

entity mips is
port (
 clk : in std_logic;
 reset: in std_logic;
 pc_out, alu_result: out std_logic_vector(15 downto 0)
);
end mips;


architecture Behavioral of mips is
 signal pc_current: std_logic_vector(31 downto 0);
 signal pc_current2: std_logic_vector(15 downto 0);
 signal pc2: std_logic_vector(31 downto 0);
 signal pc_next: std_logic_vector(31 downto 0);
 signal instr: std_logic_vector(3 downto 0);
 signal reg_dst,mem_to_reg,alu_op: std_logic_vector(1 downto 0);
 signal jump,branch,mem_read,mem_write,alu_src,reg_write: std_logic;
 signal reg_write_dest: std_logic_vector(2 downto 0);
 signal reg_write_data: std_logic_vector(3 downto 0);
 signal reg_read_addr_1: std_logic_vector(2 downto 0);
 signal reg_read_data_1: signed (3 downto 0);
 signal reg_read_addr_2: std_logic_vector(2 downto 0);
 signal reg_read_data_2: signed(3 downto 0);
 signal reg_read_data_W2: std_logic_vector(31 downto 0);
 signal sign_ext_im,read_data2,zero_ext_im,imm_ext: std_logic_vector(31 downto 0);
 signal JRControl: std_logic;
 signal ALU_Control: std_logic_vector(2 downto 0);
 signal OP_5to: std_logic_vector(5 downto 0);
 signal ALU_out: signed(3 downto 0);
 signal ALU_out4: std_logic_vector(15 downto 0);
 signal ALU_Addr : std_logic_vector (5 downto 0);
 signal zero_flag: std_logic;
 signal PC_j, PC_beq, PC_4beq,PC_4beqj,PC_jr: std_logic_vector(31 downto 0);
 signal im_shift_1: std_logic_vector(31 downto 0);
 signal beq_control: std_logic;
 signal jump_shift_1: std_logic_vector(14 downto 0);
 signal mem_read_data: std_logic_vector(31 downto 0);
 signal no_sign_ext: std_logic_vector(15 downto 0);
 signal sign_or_zero: std_logic;
 signal tmp1: std_logic_vector(8 downto 0);
begin

process(clk,reset)
begin 
 if(reset='1') then
  pc_current <= x"00000000";
 elsif(rising_edge(clk)) then
  pc_current <= x"00000000";
 end if;
end process;

  pc2 <= pc_current+ x"0002";

Instruction_Memory: entity work.instrMemory
        port map
       (
        C=> pc_current,
        Addr => instr
        );

 

ALUControl: entity work.ALU_Control port map
  (
   ALU_op => alu_op,
   Operation => instr(3 downto 0),
   OP_5to0 => OP_5to
   );

 read_data2 <= imm_ext when alu_src='1' ; 

alu: entity work.alu4 port map
  (
  ALUin1 => reg_read_data_1,
  ALUin2 => reg_read_data_2,
  ALUctrl => ALU_Control,
  ALUout1 => ALU_out
   );

 im_shift_1 <= imm_ext;
 no_sign_ext <=  x"0001";

 PC_beq <= (pc2 - no_sign_ext) when im_shift_1(15) = '1' else (pc2 +im_shift_1);

   beq_control <= branch and zero_flag;

 PC_4beq <= PC_beq when beq_control='1' else pc2;

 PC_j <= pc2;

 PC_4beqj <= PC_j when jump = '1' else  PC_4beq;

 pc_next <= PC_jr when (JRControl='1') else PC_4beqj;

data_memory: entity work.datamemory port map
  (
  clk => clk,
  Addr => ALU_Addr,
  writeD => reg_read_data_W2,
  we  => mem_write,
  re => mem_read,
  readD  => mem_read_data
  );

 pc_out <= pc_current2;
 alu_result <= ALU_out4;

end Behavioral;