library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.c31L_pack.all;

entity alu32 is
	port(b_mux_sel : in std_logic;
		a_alu32 : in std_logic_vector(BW-1 downto 0);
		b_alu32 : in std_logic_vector(BW-1 downto 0);
		alu_op : in alu_function_type;
		g : out std_logic;
		e : out std_logic;
		l : out std_logic;
		o_alu32: out std_logic_vector(BW-1 downto 0);
		c_alu32: inout std_logic;
		ov_alu32 : out std_logic);
end;

architecture behavior of alu32 is
	type output_type is array (0 to 1) of std_logic_vector(BW-1 downto 0);
	signal subtract : std_logic;
	signal direction : std_logic;
	signal greater : std_logic;
	signal equal : std_logic;
	signal less : std_logic;
	signal output : output_type;
	signal cout : std_logic;
	signal overflow : std_logic;
--Component declarations
	component adder_sub32 is
		port(a_32 : in std_logic_vector(31 downto 0);
		  b_32 : in std_logic_vector(31 downto 0);
		  cin : in std_logic;
		  sub : in std_logic;
		  sum_32 : out std_logic_vector(31 downto 0);
		  cout : inout std_logic;
		  ov : out std_logic);
	end component;
	component comp32 is
		port(a_32 : in std_logic_vector(31 downto 0);
			b_32 : in std_logic_vector(31 downto 0);
			g_32 : out std_logic;
			l_32 : out std_logic;
			e_32 : out std_logic);
	end component;
	component shifter is
		port( i : in std_logic_vector(31 downto 0);
			dir: in std_logic;
			shifting: in integer;
			o: out std_logic_vector(31 downto 0));
	end component;
begin
--Component instantiations
	addsub: adder_sub32 port map (a_alu32, b_alu32, '0', subtract, output(0), cout, overflow);
	comp: comp32 port map (a_alu32, b_alu32, greater, less, equal);
	shift: shifter port map (a_alu32, direction, conv_integer(b_alu32), output(1));
	
	subtract <= '0' when alu_op = alu_add else
					'1' when alu_op = alu_sub;
					
	direction <= '0' when alu_op = alu_shift_logic_left else
						'1' when alu_op = alu_shift_logic_right;
						
	g <= 'Z' when alu_op = alu_nop else
			greater when alu_op = alu_comp else
			'Z';
	
	e <= 'Z' when alu_op = alu_nop else
			equal when alu_op = alu_comp else
			'Z';
	
	l <= 'Z' when alu_op = alu_nop else
			less when alu_op = alu_comp else
			'Z';
	
	o_alu32 <= zero when alu_op = alu_nop else
					output(0) when alu_op = alu_add else
					output(0) when alu_op = alu_sub else
					"00000000000000000000000000000001" when less = '1' AND alu_op = alu_slt else
					zero when less = '0' AND alu_op = alu_slt else
					a_alu32 AND b_alu32 when alu_op = alu_and else
					a_alu32 OR b_alu32 when alu_op = alu_or else
					NOT(a_alu32) when alu_op = alu_not else
					a_alu32 XOR b_alu32 when alu_op = alu_xor else
					output(1) when alu_op = alu_shift_logic_left else
					output(1) when alu_op = alu_shift_logic_right else
					a_alu32 when b_mux_sel = '0' AND alu_op = alu_mov else
					b_alu32 when b_mux_sel = '1' AND alu_op = alu_mov else
					zero;
					
	c_alu32 <= 'Z' when alu_op = alu_nop else
					cout when alu_op = alu_add else
					cout when alu_op = alu_sub else
					'Z';
					
	ov_alu32 <= 'Z' when alu_op = alu_nop else
					overflow when alu_op = alu_add else
					overflow when alu_op = alu_sub else
					'Z';
end;
		
