
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;  

entity IFID is
port(
 clk  : in  STD_LOGIC;
 IfIdWrite : in  STD_LOGIC; -- Only write if '1'
        rst      : in  STD_LOGIC;
 ifflush  : in std_logic;  
 IfId_pc_in: in  STD_LOGIC_VECTOR(63 downto 0);
 IfId_instruction_in: in  STD_LOGIC_VECTOR(31 downto 0);
 IfId_pc_out: out  STD_LOGIC_VECTOR(63 downto 0);
 IfId_instruction_out : out  STD_LOGIC_VECTOR(31 downto 0)
);
end IFID;

architecture behavior of IFID is

begin 
 process(clk, rst, IfIdWrite)
 begin
  if rst = '1' then
   IfId_pc_out <= X"0000000000000000";
   IfId_instruction_out <= X"00000000";
  elsif rising_edge(clk) then
   if ifflush = '1' then
    IfId_pc_out <= X"0000000000000000";
    IfId_instruction_out <= X"00000000";
   elsif IfIdWrite = '1' then
    IfId_pc_out <= IfId_pc_in;
    IfId_instruction_out <= IfId_instruction_in;
   end if;
  end if;
 end process;
end behavior;