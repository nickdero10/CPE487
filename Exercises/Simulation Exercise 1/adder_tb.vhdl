--  https://ghdl.readthedocs.io/en/stable/using/QuickStartGuide.html
--  A testbench has no ports.
entity adder_tb is
end adder_tb;

architecture behav of adder_tb is
  --  Declaration of the component that will be instantiated.
  component adder
    port (
            A, B : in bit; 
            ci : in bit; 
            s : out bit; 
            co : out bit
          );
  end component;

  --  Specifies which entity is bound with the component.
  for adder_0: adder use entity work.adder;
  signal A0, A1, A2, A3, B0, B1, B2, B3, ci, s0, s1, s2, s3, co, c0, c1, c2: bit;
begin
  --  Component instantiation.
  adder_0: adder port map (A => A0, B => B0, ci => ci,
                           s => s0, co => c0);
  adder_1: adder port map (A => A1, B => B1, ci => c0,
                           s => s1, co => c1);
  adder_2: adder port map (A => A2, B => B2, ci => c1,
                           s => s2, co => c2);
  adder_3: adder port map (A => A3, B => B3, ci => c2,
                           s => s3, co => co);

  --  This process does the real job.
  process
    type pattern_type is record
      --  The inputs of the adder.
      A, B, ci : bit;
      --  The expected outputs of the adder.
      s, co : bit;
    end record;
    --  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (('0', '0', '0', '0', '0'),
       ('0', '0', '1', '1', '0'),
       ('0', '1', '0', '1', '0'),
       ('0', '1', '1', '0', '1'),
       ('1', '0', '0', '1', '0'),
       ('1', '0', '1', '0', '1'),
       ('1', '1', '0', '0', '1'),
       ('1', '1', '1', '1', '1'));
  begin
    --  Check each pattern.
    for i in patterns'range loop
      --  Set the inputs.
      A0 <= patterns(i).A;
      A1 <= '1';
      A2 <= '1';
      A3 <= '1';
      B0 <= patterns(i).B;
      B1 <= '0';
      B2 <= '0';
      B3 <= '0';
      ci <= patterns(i).ci;
      --  Wait for the results.
      wait for 1 ns;
      --  Check the outputs.
      assert s0 = patterns(i).s
        report "bad sum value" severity error;
      assert co = patterns(i).co
        report "bad carry out value" severity error;
    end loop;
    assert false report "end of test" severity note;
    --  Wait forever; this will finish the simulation.
    wait;
  end process;
end behav;
