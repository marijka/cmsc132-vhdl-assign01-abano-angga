library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity farm_buzz_tb is

end entity farm_buzz_tb;

architecture farm_buzz_tb of farm_buzz_tb is
	signal in_boggis, out_boggis, in_bunce, out_bunce, in_bean, out_bean, alarm : std_logic;
	component farm_buzz is 
		port (in_boggis, out_boggis, in_bunce, out_bunce, in_bean, out_bean : in std_logic; alarm : out std_logic);
	end component farm_buzz;
begin
	uut: component farm_buzz port map(in_boggis, out_boggis, in_bunce, out_bunce, in_bean, out_bean);
	process
		variable error_count: integer := 0;
		variable test_in : unsigned(1 downto 0);
		variable output : std_logic;
	begin
	test_in:=B"00";
	for count in 0 to 63 loop
		in_boggis <= test_in(1); 
		out_boggis <= test_in(0);
		in_bunce <= test_in(1);
		out_bunce <= test_in(0);  
		in_bean <= test_in(0);
		out_bean <= test_in(0); 
		wait for 10 ns;
		output := in_boggis or out_boggis or in_bunce or out_bunce or in_bean or out_bean;
		assert(output=alarm) report "Err" severity error;
		if(output/=alarm) then error_count := error_count + 1;
		end if;
	
		test_in:=test_in+1; 
	end loop;
	
		report "Done with test. There were "& integer'image(error_count) & " errors.";
		wait; 
	end process;
end architecture farm_buzz_tb;
