----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2024 12:50:28 PM
-- Design Name: 
-- Module Name: gates - ifGates
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gates is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           F_OUT : out STD_LOGIC);
end gates;

architecture ifGates of gates is
begin

--If Statements always have to be in a process (ifProcess is just the title of the process)
---Two AND Gates going into one OR Gate
ifProcess: process (A, B, C) is
begin
---AND Logic Gate with A, NOT B, and NOT C
if (A = '1' AND B = '0' AND C = '0') then
F_OUT <= '1';
---AND Logic Gate with B and C
elsif (B = '1' AND C = '1') then
F_OUT <= '1';
else
---If both are 0, returns 0
F_OUT <= '0';
---Always have to end if before ending process
end if;
end process ifProcess;

end ifGates;
