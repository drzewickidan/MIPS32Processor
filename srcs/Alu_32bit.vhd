----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/16/2018 09:38:51 AM
-- Design Name: 
-- Module Name: Alu_1bit - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu is
generic(n:natural:=32);
port(a,b:in std_logic_vector(n-1 downto 0);
	  Oper:in std_logic_vector(3 downto 0);
	  Result:buffer std_logic_vector(n-1 downto 0);
	  Zero,Overflow:buffer std_logic);
 end Alu;



architecture Behavioral of Alu is
begin
process(Oper,a,b,Result)
variable store: std_logic_vector(n-1 downto 0);
begin
zero <= '1';
overflow <= '0';
case Oper is
    when "0000" => -- and
        Result<= a and b;
    when "0001" =>
        for i in n-1 downto 0 loop
            Result(i) <= a(i) or b(i);
        end loop;
       
    when "0011" => -- nor
        for i in n-1 downto 0 loop
            Result(i) <= a(i) nor b(i);
            
        end loop;
    when "0010" => --ADD
        Result <= signed(a) + signed(b);
        if a(31) = '1' and b(31) = '1' and Result(31) = '0' then
            overflow <= '1';
        end if;
        if a(31) = '0' and b(31) = '0' and Result(31) = '1' then
            overflow <= '1';
        end if;
	if (a = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" or b = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU") then
	    result <= (others => 'U');
	end if;
        
    when "0110" =>-- Sub
        Result <= signed(a) - signed(b);
        if a(31) = '0' and b(31) = '1' and Result(31) = '1' then
            overflow <= '1';
        end if;
        if a(31) = '1' and b(31) = '0' and Result(31) = '0' then
            overflow <= '1';
        end if;
	if (a = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" or b = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU") then
	    result <= (others => 'U');
	end if;
               
    when "0111" => -- SLT
    store := signed(a) - signed(b);
    if (signed(store) < 0) then
        Result <= (0 => '1', others => '0');
    else
        Result <= (others => '0'); 
    end if;
    if a(31) = '0' and b(31) = '1' and store(31) = '1' then
        overflow <= '1';
    end if;
    if a(31) = '1' and b(31) = '0' and store(31) = '0' then
        overflow <= '1';
    end if;
    if (a = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" or b = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU") then
	    result <= (others => 'U');
    end if;

    when others =>
        result <= (others => 'U');
    end case;
  
for i in 31 downto 0 loop
    if Result(i) = '1' then
        zero <= '0';
    end if;
end loop;

end process;
end Behavioral;