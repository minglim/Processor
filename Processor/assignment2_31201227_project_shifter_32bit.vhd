Library ieee;
use ieee.std_logic_1164.all;

Entity shifter is
	port( i : in std_logic_vector(31 downto 0);
			dir: in std_logic;
			shifting: in integer;
			o: out std_logic_vector(31 downto 0));
End;

Architecture behavior of shifter is
	--signals needed because only bit_vector support sll and srl
	--therefore, must convert std_logic_vector to bit_vector before performing shifts
	SIGNAL input : bit_vector(31 downto 0);
	SIGNAL output : bit_vector(31 downto 0);
begin
	input <= to_bitvector(i);	--convert to bit_vector
	with dir select  
       output <= input sll shifting when '0',  
				     input srl shifting when '1';  
	o <= to_stdlogicvector(output);	--convert back to std_logic_vector
end;
					