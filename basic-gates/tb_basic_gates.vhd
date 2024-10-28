library IEEE;
use IEEE.std_logic_1164.all;

entity tb_basic_gates is
end tb_basic_gates;

architecture behavioral of tb_basic_gates is
    signal A, B : std_logic := '0';
    signal Y_buffer : std_logic;
    signal Y_not : std_logic;
    signal Y_xor : std_logic;
    signal Y_xnor : std_logic;
    signal Y_and : std_logic;
    signal Y_nand : std_logic;
    signal Y_or : std_logic;
    signal Y_nor : std_logic;
    

begin
    buffer_dut : entity work.buffer_gate
    port map(
        A => A,
        Y => Y_buffer
    );

    not_dut : entity work.not_gate
    port map(
        A => A,
        Y => Y_not
    );

    xor_dut : entity work.xor_gate
    port map(
        A => A,
        B => B,
        Y => Y_xor
    );

    xnor_dut : entity work.xnor_gate
    port map(
        A => A,
        B => B,
        Y => Y_xnor
    );

    and_dut : entity work.and_gate
    port map(
        A => A,
        B => B,
        Y => Y_and
    );

    nand_gate : entity work.nand_gate
    port map(
        A => A,
        B => B,
        Y => Y_nand
    );

    or_dut : entity work.or_gate
    port map(
        A => A,
        B => B,
        Y => Y_or
    );

    nor_dut : entity work.nor_gate
    port map(
        A => A,
        B => B,
        Y => Y_nor
    );

    stimulus_test : 
    process begin
        A <= '0'; B <= '0';
        wait for 10 ns;
        
        A <= '0'; B <= '1';
        wait for 10 ns;
        
        A <= '1'; B <= '0';
        wait for 10 ns;

        A <= '1'; B <= '1';
        wait for 10 ns;
    end process;


    end_simulation:
    process begin
        wait for 40 ns;
        assert false
        report "Ending Simulation."
        severity failure;
    end process;
end behavioral;