----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/25/2018 12:35:57 PM
-- Design Name: 
-- Module Name: registers - Behavioral
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
use IEEE.STD_LOGIC_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registers is
port(
    RR1,RR2,WR:in std_logic_vector(4 downto 0);
    WD:in std_logic_vector(31 downto 0);
    clk,RegWrite:in std_logic;
    RD1,RD2:out std_logic_vector(31 downto 0)
);
end registers;

architecture Behavioral of registers is
type twodarray is array(0 to 31) of std_logic_vector(31 downto 0);
signal regcontents: twodarray;
begin
process(RR1, RR2, WR, WD, Clk, RegWrite)
variable flag: boolean:= FALSE;
begin
if flag = FALSE then
    regcontents(0)  <= (others => '0');
    regcontents(8)  <= "00000000000000000000000000000100";
    regcontents(18) <= "00000000000000000000000000001101";
    regcontents(19) <= "00000000000000000000000000000100";
    flag := TRUE;
end if;
if clk = '1' and clk'event and RegWrite = '1' and conv_integer(unsigned(WR)) /= 0 then
    regcontents(conv_integer(unsigned(WR))) <= WD;
end if;

RD1 <= regcontents(conv_integer(unsigned(RR1)));
RD2 <= regcontents(conv_integer(unsigned(RR2)));

end process;

end Behavioral;