library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.c31L_pack.all;

entity reg_bank is
	port(clk : in std_logic;
		r, w : in std_logic;	--read, write
		rs_index : in std_logic_vector(reg_field-1 downto 0);
		rt_index : in std_logic_vector(reg_field-1 downto 0);
		rd_index : in std_logic_vector(reg_field-1 downto 0);
		reg_source_out : out std_logic_vector(BW-1 downto 0);
		reg_target_out : out std_logic_vector(BW-1 downto 0);
		reg_dest_new : in std_logic_vector(BW-1 downto 0));
end; --entity reg_bank

architecture behavior of reg_bank is
	type regfile_type is array (0 to 63) of std_logic_vector(BW-1 downto 0);
	signal regfile : regfile_type := (others => (others => '0'));
begin
	process(clk)
	begin
		if (clk = '1' AND clk'event) then
			if (r = '1') then
				reg_source_out <= regfile(conv_integer(rs_index));
				reg_target_out <= regfile(conv_integer(rt_index));
			end if;
		end if;
		if (clk = '0' AND clk'event) then
			if (w = '1') then
				regfile(conv_integer(rd_index)) <= reg_dest_new;
			end if;
		end if;
	end process;	
end;