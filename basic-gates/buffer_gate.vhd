library IEEE;
use IEEE.std_logic_1164.all;

entity buffer_gate is 
    port(
        A : in std_logic;
        Y : out std_logic
    );
end buffer_gate;

architecture rtl of buffer_gate is
    
begin
    Y <= A;
end rtl;