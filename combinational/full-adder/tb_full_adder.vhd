library IEEE;
use IEEE.std_logic_1164.all;

entity tb_full_adder is
end tb_full_adder;

architecture behavior of tb_full_adder is
    type LUT_I is array(0 to 7) of std_logic_vector(2 downto 0);
    type LUT_O is array(0 to 7) of std_logic_vector(1 downto 0);
    
    signal a, b, c_in, c_out, s : std_logic;
    constant LUT : LUT_I := (
        "000", "001", "010", "011",
        "100", "101", "110", "111"    
    );

    constant LUT_2 : LUT_O := (
        "00", "10", "10", "01",
        "10", "01", "01", "01"
    );
begin
    FA_DUT : entity work.full_adder
    port map(
        a => a,
        b => b,
        c_in => c_in,
        c_out => c_out,
        s => s
    );
    
    stimulus : process begin

        for k in 0 to 7 loop
            a <= LUT(k)(2);
            b <= LUT(k)(1);
            c_in <= LUT(k)(0);

            wait for 10 ns;

            assert s = LUT_2(k)(0) and c_out = LUT_2(k)(1) 
            report "Not Correct."
            severity error;
        end loop;

        assert false
        report "Simulation Done."
        severity failure;
    end process;
end behavior;