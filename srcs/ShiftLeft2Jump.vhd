----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2018 12:39:26 PM
-- Design Name: 
-- Module Name: ShiftLeft2Jump - Behavioral
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

entity ShiftLeft2Jump is
port(
    x:in std_logic_vector(3 downto 0);
    y:in std_logic_vector(25 downto 0);
    z:out std_logic_vector(31 downto 0)
);
end ShiftLeft2Jump;

architecture Behavioral of ShiftLeft2Jump is
begin
process(x,y)
begin
z <= x&y&"00";
end process;
end Behavioral;
