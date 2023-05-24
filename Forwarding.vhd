library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Forwarding is
port(	 
	 forwarding_exmem_regwrite   : in STD_LOGIC;
     	 forwarding_memwb_regwrite   : in STD_LOGIC;
	 forwarding_Rn    : in  STD_LOGIC_VECTOR(4 downto 0);
	 forwarding_Rm	  : in  STD_LOGIC_VECTOR(4 downto 0);
	 forwarding_exmem_Rd    : in  STD_LOGIC_VECTOR(4 downto 0);
	 forwarding_memwb_Rd    : in  STD_LOGIC_VECTOR(4 downto 0);
  
	 forwarding_sturinstruct  : in  STD_LOGIC_VECTOR(10 downto 0);
	 forwarding_Rd    : in  STD_LOGIC_VECTOR(4 downto 0);

     ForwardA  	: out STD_LOGIC_VECTOR(1 downto 0);
     ForwardB   : out STD_LOGIC_VECTOR(1 downto 0)


);
end Forwarding;

ARCHITECTURE behavioral of Forwarding is
BEGIN

process(forwarding_exmem_regwrite, forwarding_Rn, forwarding_Rm, forwarding_exmem_Rd, forwarding_memwb_Rd,forwarding_memwb_regwrite)
begin

 if ((forwarding_exmem_regwrite='1') and  (forwarding_exmem_Rd /="11111")  and (forwarding_exmem_Rd=forwarding_Rn))then

   ForwardA <= "10";
elsif ((forwarding_memwb_regwrite='1') and  (forwarding_memwb_Rd /="11111") and(forwarding_memwb_Rd=forwarding_Rn)) then
  ForwardA <= "01";
else
   ForwardA <= "00";
  end if;

if ((forwarding_exmem_regwrite='1') and  (forwarding_exmem_Rd /="11111")  and (forwarding_exmem_Rd=forwarding_Rm))then
   
   ForwardB <= "10"; 
elsif ((forwarding_memwb_regwrite='1') and  (forwarding_memwb_Rd /="11111") and(forwarding_memwb_Rd=forwarding_Rm)) then
   ForwardB <= "01"; 
else 
   ForwardB <= "00"; 
   end if;

if(forwarding_sturinstruct="11111000000")then 
 if (forwarding_exmem_Rd=forwarding_Rd)then
  ForwardB<="10";
  end if;
 if (forwarding_memwb_Rd=forwarding_Rd)then
  ForwardB<="01";
 end if;
end if;

end process;
end behavioral;

