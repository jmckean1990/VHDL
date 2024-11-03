library IEEE;
use IEEE.std_logic_1164.all;


entity full_adder is
    port(
        a, b, c_in : in std_logic;
        c_out, s : out std_logic
    );
end full_adder;


architecture rtl of full_adder is 
    signal sum_1 : std_logic;
    signal carry_1, carry_2 : std_logic;
begin
    c_out <= carry_1 or carry_2;

    ha_1 : entity work.half_adder
    port map(
        A => a,
        B => b,
        S => sum_1,
        C => carry_1
    );
    
    ha_2 : entity work.half_adder
    port map(
        A => sum_1,
        B => c_in,
        S => s,
        C => carry_2
    );
end rtl;