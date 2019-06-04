----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2018 12:43:49 PM
-- Design Name: 
-- Module Name: mux5 - Behavioral
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

entity mux5 is
port(
    x,y:in std_logic_vector (4 downto 0);
    sel:in std_logic;
    z:out std_logic_vector(4 downto 0)
);
end mux5;

architecture Behavioral of mux5 is
begin
process(x,y,sel)
begin
if sel = '0' then
    z <= x;
elsif sel = '1' then
    z <= y;
elsif sel = 'U' then
    z <= "UUUUU";
end if;
end process;
end Behavioral;
