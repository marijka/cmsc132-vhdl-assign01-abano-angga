-- CMSC 132 Lecture Assignment on VHDL
-- Abano, Naomi; Angga, Marijka
-- T-3L

library IEEE;
use IEEE.std_logic_1164.all;

entity farm_buzz is
	port(in_boggis, out_boggis, in_bunce, out_bunce, in_bean, out_bean: in std_logic; alarm: out std_logic);
end farm_buzz;

architecture behav of farm_buzz is
begin
	alarm <= ((in_boggis and out_boggis) or (in_boggis and out_bunce) or (in_boggis and out_bean) or (in_bunce and out_bunce) or (in_bunce and out_bean) or (in_bean and out_bean) or ((in_boggis and out_boggis) and (in_bunce and out_bunce) and (in_bean and out_bean)));

end architecture behav;
