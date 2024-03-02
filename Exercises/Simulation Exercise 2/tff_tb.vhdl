--  https://electronicstopper.blogspot.com/2017/07/t-flip-flop-in-vhdl-with-testbench.html
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TFF_tb IS
END TFF_tb;

ARCHITECTURE behavior OF TFF_tb IS 

    COMPONENT TFF
    PORT(
         T : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         set : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    
    COMPONENT ha is
    PORT(
        a : IN std_logic;
        b : IN std_logic;
        s : OUT std_logic;
        c : OUT std_logic
        );
    END COMPONENT;
    
   signal T : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal set : std_logic := '0';
   signal Q : std_logic;
   signal q_halfadder : std_logic;

   constant clk_period : time := 10 ns;

BEGIN

   uut: TFF PORT MAP (
          T => q_halfadder,
          clk => clk,
          rst => rst,
          set => set,
          Q => Q
        );
        
   half_adder_inst : ha PORT MAP (
          a => T,
          b => clk,
          s => q_halfadder,
          c => open
        );
        
         
  clk_process :process
  begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
  if NOW > 200 ns then
  wait;
  end if;
  end process;

  stim_proc: process
  begin  
  set <= '0';
  rst <= '1';
  wait for 50 ns; 

  set <= '1';
  rst <= '0';
  T <= '0';
  wait for 50 ns;
  
  set <= '0';
  rst <= '0';
  T <= '1';  
  wait for 50 ns;

  set <= '1';
  rst <= '1';
  wait;

  end process;

END;
