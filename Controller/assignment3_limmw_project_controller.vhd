library ieee;
use ieee.std_logic_1164.all;
use work.c31L_pack.all;

entity control is
	port(instruction : in std_logic_vector(BW-1 downto 0);
		rt_and_imm : out std_logic_vector (14 downto 0);
		r, w : out std_logic;	--read, write
		rs_index : out std_logic_vector(reg_field-1 downto 0);
		rt_index : out std_logic_vector(reg_field-1 downto 0);
		rd_index : out std_logic_vector(reg_field-1 downto 0);
		b_mux_sel : out std_logic;
		alu_func : out alu_function_type );
end; --entity control

architecture behavior of control is
begin
	b_mux_sel <= instruction(31);
	rs_index <= instruction(30 downto 25);
	rd_index <= instruction(24 downto 19);
	alu_func <= instruction(18 downto 15);
	rt_index <= instruction(14 downto 9);
	rt_and_imm <= instruction(14 downto 0);
	
	with (instruction(31) & instruction(18 downto 15)) select
		r <= '0' when "00000",	--no read for NOP
				'0' when "10000",	--no read for NOP
				'0' when "11011",	--no read for MOVI
				'1' when others;
				
	with instruction(18 downto 15) select
		w <= '0' when "0000",	--no write for NOP
				'0' when "0011",	--no write for COMP/COMPI
				'1' when others;
end;
	

