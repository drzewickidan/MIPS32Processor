----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2018 12:52:55 PM
-- Design Name: 
-- Module Name: nor32 - Behavioral
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

entity nor32 is
port(
    x:in std_logic_vector(31 downto 0);
    y:out std_logic
);
end nor32;
architecture Behavioral of nor32 is
begin
process(x)
variable temp : std_logic:= '1';
begin
for i in 31 downto 0 loop
if x(i) = '1' then
    temp := '0';
end if;
end loop;
y <= temp;
end process;
end Behavioral;
