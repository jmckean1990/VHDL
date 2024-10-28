library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is 
	port(
    	A, B : in std_logic;
        C, S : out std_logic
    );
end half_adder;

architecture rtl of half_adder is

begin
	C <= A and B;
    S <= A xor B;
end rtl;