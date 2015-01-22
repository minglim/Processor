library ieee;
use ieee.std_logic_1164.all;
use work.c31L_pack.all;

entity processor is
	port(clk : in std_logic;
		instruction : in std_logic_vector(BW-1 downto 0);
		great : out std_logic;
		less : out std_logic;
		equal : out std_logic;
		carry : inout std_logic;
		over_flow : out std_logic);
end;

architecture behavior of processor is
	signal b_mux_sel : std_logic;
	signal a_alu32 : std_logic_vector(BW-1 downto 0);
	signal b_alu32 : std_logic_vector(BW-1 downto 0);
	signal alu_op : alu_function_type;
	signal reg_dest_v : std_logic_vector(BW-1 downto 0);
	
	signal rt_and_imm : std_logic_vector (14 downto 0);
	signal r : std_logic;
	signal w : std_logic;
	signal rs_index : std_logic_vector(reg_field-1 downto 0);
	signal rt_index : std_logic_vector(reg_field-1 downto 0);
	signal rd_index : std_logic_vector(reg_field-1 downto 0);
	
	signal reg_target_out : std_logic_vector(BW-1 downto 0);
	
	signal extended : std_logic_vector (31 downto 0);
--Component declarations
	component alu32 is
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
	end component;
	component control is
		port(instruction : in std_logic_vector(BW-1 downto 0);
		rt_and_imm : out std_logic_vector (14 downto 0);
		r, w : out std_logic;	--read, write
		rs_index : out std_logic_vector(reg_field-1 downto 0);
		rt_index : out std_logic_vector(reg_field-1 downto 0);
		rd_index : out std_logic_vector(reg_field-1 downto 0);
		b_mux_sel : out std_logic;
		alu_func : out alu_function_type );
	end component;
	component mux is
		port ( b_mux_sel : in std_logic;
				immediate : in std_logic_vector(31 downto 0);
				reg : in std_logic_vector(31 downto 0);
				output : out std_logic_vector(31 downto 0));
	end component;
	component reg_bank is
		port(clk : in std_logic;
		r, w : in std_logic;	--read, write
		rs_index : in std_logic_vector(reg_field-1 downto 0);
		rt_index : in std_logic_vector(reg_field-1 downto 0);
		rd_index : in std_logic_vector(reg_field-1 downto 0);
		reg_source_out : out std_logic_vector(BW-1 downto 0);
		reg_target_out : out std_logic_vector(BW-1 downto 0);
		reg_dest_new : in std_logic_vector(BW-1 downto 0));
	end component;
	component signextend is
		port ( input : in std_logic_vector (14 downto 0);
			output : out std_logic_vector (31 downto 0));
	end component;
	
begin

--Component instantiations
	alu: alu32 port map (b_mux_sel, a_alu32, b_alu32, alu_op, great, equal, less, reg_dest_v, carry, over_flow);
	controller: control port map (instruction, rt_and_imm, r, w, rs_index, rt_index, rd_index, b_mux_sel, alu_op);
	multiplexer: mux port map (b_mux_sel, extended, reg_target_out, b_alu32);
	reg: reg_bank port map (clk, r, w, rs_index, rt_index, rd_index, a_alu32, reg_target_out, reg_dest_v);		
	sign: signextend port map (rt_and_imm, extended);
	
end;
	