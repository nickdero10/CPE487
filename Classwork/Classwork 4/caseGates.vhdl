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


architecture caseGates of gates is
signal ABC: std_logic_vector(2 downto 0);
begin

---Concatinating bits
ABC <= A & B & C;
caseProcess: process (ABC) is
begin

case (ABC) is
    ---A NOTB NOTC + BC
    when "100" => F_OUT <= '1';
    when "-11" => F_OUT <= '1';
    when others => F_OUT <= '0';
    end case;
    
end process caseProcess;
end caseGates;
