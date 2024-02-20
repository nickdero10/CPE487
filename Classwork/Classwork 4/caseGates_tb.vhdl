-- Code your testbench here
-- As always, there are other ways this can be done, but this should do the job for our purposes
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is
component gates is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           F_OUT : out STD_LOGIC);
end component gates;
-- Any inputs or outputs of your entity should be created as signals here
-- Don't double create CLK if your entity has them too!
signal A1,B1,C1,F_OUT1,CLK: std_logic;
-- The following values can be changed as needed if you actually need a longer/shorter simulationTime, slower/faster clock period, etc.
constant period : time := 20 ns;
constant simulationTime : time := 240 ns;
begin

--Change mycomponent to what you changed "mycomponent" to above
--Inside the parentheses, include all ports from your component
mytestingcomponent: gates port map(A=>A1, B =>B1, C=>C1, F_OUT=>F_OUT1);

--Generally should keep this part the same as it allows our simulation to have a standardized clock
--It also forces the simulation to end at time "simulationTime"
---Keep this the same. don't really change it
---Just change the period if you want to change timing
clk_process: process
begin
CLK <= '0';
wait for period/2;
CLK <= '1';
wait for period/2;
if NOW >= simulationTime then
wait;
end if;
end process clk_process;

inputs_process: process
begin
-- In here, we'd create a sequence of changes to our inputs to test our system
-- This is the main point of the testbench!
-- We could test different inputs to a sequence of gates, different patterns of inputs for a finite state machine, etc.
    ---100
    A1 <= '1';
    B1 <= '0';
    C1 <= '0';
    ---without waits wouldn't be able to see results
    ---changes would be too fast
    wait for period/2;
    
    --000
    A1 <= '0';
    wait for period/2;
    
    --011
    B1 <= '1';
    C1 <= '1';
    wait for period/2;
    
    --001
    B1 <= '0';
    wait for period/2;
    
    --111
    A1 <= '1';
    B1 <= '1';
    
    
    
-- KEEP THIS WAIT STATEMENT! Otherwise your simulation will never complete
wait;
end process inputs_process;
end tb;
