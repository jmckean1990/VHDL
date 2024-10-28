library IEEE;
use IEEE.std_logic_1164.all;

entity tb_half_adder is
end tb_half_adder;

architecture behavior of tb_half_adder is
	signal A, B : std_logic;
    signal S, C : std_logic;
begin
	half_adder_dut : entity work.half_adder
    port map(
    	A => A,
        B => B,
        S => S,
        C => C
    );
    
    process begin
      A <= '0'; B <= '0';
      wait for 10 ns;
      assert C = '0' and S = '0' report "A:0, B:0 failed test" severity error;

      A <= '0'; B <= '1';
      wait for 10 ns;
      assert C = '0' and S = '1' report "A:0, B:1 failed test" severity error;


      A <= '1'; B <= '0';
      wait for 10 ns;
      assert C = '0' and S = '1' report "A:1, B:0 failed test" severity error;

      A <= '1'; B <= '1';
      wait for 10 ns;
      assert C = '1' and S = '0' report "A:1, B:1 failed test" severity error;

      assert false
      report "Simulation Finished."
      severity failure;
  end process;
    
end behavior;
