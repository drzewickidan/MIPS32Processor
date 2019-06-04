----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2018 01:05:52 PM
-- Design Name: 
-- Module Name: pc - Behavioral
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

entity pc is
port(
    clk:in std_logic;
    AddressIn:in std_logic_vector(31 downto 0);
    AddressOut:out std_logic_vector(31 downto 0)
 );
end pc;

architecture Behavioral of pc is
begin
process(clk)
variable temp: std_logic_vector(31 downto 0);
variable count: integer := 0;
begin
if count = 0 then
    temp := (others => '0');
    count := count + 1;
    AddressOut <= temp;
else
    temp := AddressIn;
end if;
if clk = '1' and clk'event then
    AddressOut <= temp;
end if;
end process;
end Behavioral;
