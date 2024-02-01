----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/01/2024 01:06:30 PM
-- Design Name: 
-- Module Name: MUX - ifMUX
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
---allows commands?
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX is
    ---Data has 8 inputs
    ---SEL has 3 inputs
    Port ( Data_in : in STD_LOGIC_VECTOR (7 downto 0);
           SEL : in STD_LOGIC_VECTOR (2 downto 0);
           F_CTRL : out STD_LOGIC);
end MUX;

architecture ifMUX of MUX is
begin

---Multiplexer of Data_in(0-7) with SEL(0-2) (Three Binary Values)
ifProcess: process (Data_in, SEL) is
begin
if (SEL = "000") then
F_CTRL <= Data_in(0);
elsif (SEL = "001") then
F_CTRL <= Data_in(1);
elsif (SEL = "010") then
F_CTRL <= Data_in(2);
elsif (SEL = "011") then
F_CTRL <= Data_in(3);
elsif (SEL = "100") then
F_CTRL <= Data_in(4);
elsif (SEL = "101") then
F_CTRL <= Data_in(5);
elsif (SEL = "110") then
F_CTRL <= Data_in(6);
elsif (SEL = "111") then
F_CTRL <= Data_in(7);
else 
F_CTRL <= '0';
end if;
end process ifProcess;

end ifMUX;

---Quicker way to do above
architecture convMUX of MUX is
begin

convProcess: process (Data_in, SEL) is
begin
