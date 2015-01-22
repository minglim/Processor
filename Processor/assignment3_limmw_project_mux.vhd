library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port ( b_mux_sel : in std_logic;
				immediate : in std_logic_vector(31 downto 0);
				reg : in std_logic_vector(31 downto 0);
				output : out std_logic_vector(31 downto 0));
end;

architecture behavior of mux is
begin
	with b_mux_sel select
		output <= reg when '0',
						immediate when '1';
end;