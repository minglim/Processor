library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signextend is
	port ( input : in std_logic_vector (14 downto 0);
			output : out std_logic_vector (31 downto 0));
end;

architecture behavior of signextend is
begin
	output <= std_logic_vector(resize(signed(input), output'length));
end;
	