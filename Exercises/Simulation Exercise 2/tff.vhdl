--  https://electronicstopper.blogspot.com/2017/07/t-flip-flop-in-vhdl-with-testbench.html
library ieee;
use ieee.std_logic_1164.all;

entity TFF is
port( T: in std_logic;
clk: in std_logic;
set: in std_logic;
rst: in std_logic;
Q: out std_logic);
end TFF;

architecture behavioral of TFF is
signal q_temp: std_logic := '0';
begin
process(rst,clk,set)
begin
    if (rst='1') then
        q_temp <= '0';
    elsif (set='1') then
        q_temp <= '1';
    elsif (rising_edge(clk)) then
        q_temp <= T XOR q_temp;
    end if;
end process;

Q <= q_temp;

end behavioral;
