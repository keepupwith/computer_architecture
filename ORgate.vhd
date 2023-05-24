library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ORgate is
port (
in0 : in STD_LOGIC;
in1 : in STD_LOGIC;
output : out STD_LOGIC 
);
end ORgate;

architecture structure of ORgate is 
begin 
    output <= in0 or in1; 
end structure;