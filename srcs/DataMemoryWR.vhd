library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity DataMemoryWR is
port(WriteData:in std_logic_vector(31 downto 0);
	Address:in std_logic_vector(31 downto 0);
	MemRead,MemWrite,CLK:in std_logic;
	ReadData:out std_logic_vector(31 downto 0));
end DataMemoryWR;

architecture Behavioral of DataMemoryWR is

type mem_type is array(0 to 255) of std_logic_vector(7 downto 0);
signal memcontents: mem_type;

begin

process(WriteData, MemRead, MemWrite, CLK)
variable check_begin:boolean := true;

begin

if(check_begin) then
	-- branch untaken test
	memcontents(4)<="00000000";
	memcontents(5)<="00000000";
	memcontents(6)<="00000000";
	memcontents(7)<="00000100";
	memcontents(8)<="00000000";
	memcontents(9)<="00000000";
	memcontents(10)<="00000000";
	memcontents(11)<="00000101";
	
	-- branch taken test
	-- memcontents(4)<="11111111";
	-- memcontents(5)<="11111111";
	-- memcontents(6)<="11111111";
	-- memcontents(7)<="11111100";
	-- memcontents(8)<="11111111";
	-- memcontents(9)<="11111111";
	-- memcontents(10)<="11111111";
	-- memcontents(11)<="11111011";
	
	check_begin := false;
end if;
if CLK='0' then
	if (MemWrite /= '1') and (MemRead = '1') then
		ReadData <= memcontents(conv_integer(unsigned(Address))) & memcontents(conv_integer(unsigned(Address)) + 1) & memcontents(conv_integer(unsigned(Address)) + 2) & memcontents(conv_integer(unsigned(Address)) + 3);
	end if;
end if;
if CLK='1' and CLK'event then
	if (MemWrite = '1') and (MemRead /= '1') then
		memcontents(conv_integer(unsigned(Address))) <= WriteData(31 downto 24);
		memcontents(conv_integer(unsigned(Address)) + 1) <= WriteData(23 downto 16);
		memcontents(conv_integer(unsigned(Address)) + 2) <= WriteData(15 downto 8);
		memcontents(conv_integer(unsigned(Address)) + 3) <= WriteData(7 downto 0);
	end if;
end if;
end process;

end Behavioral;