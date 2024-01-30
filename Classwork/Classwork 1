----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/25/2024 01:17:56 PM
-- Design Name: 
-- Module Name: logic - equation
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

entity logic is
    Port ( F3 : out STD_LOGIC;
    L, M, N : in std_logic);
end logic;

architecture equation of logic is
begin
    F3 <= ((NOT L) AND (NOT M) AND N) OR (L AND M);
end equation;

architecture gates of logic is
signal O, P : std_logic;
begin
--L <= '1';
--M <= '1';
--N <= '1';
O <= ((NOT L) AND (NOT M) AND N);
P <= (L AND M);
F3 <= O OR P;
end gates;

architecture whentest of logic is
begin
F3 <= '1' when (L='0' AND M='0' AND N='1') else
      '1' when (L='1' AND M='1') else
      '0';
end whentest;
