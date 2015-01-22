LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.c31L_pack.all;

ENTITY control_tb IS
END control_tb;

ARCHITECTURE behavior OF control_tb IS 
	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT control is
		port(instruction : in std_logic_vector(BW-1 downto 0);
		rt_and_imm : out std_logic_vector (14 downto 0);
		r, w : out std_logic;	--read, write
		rs_index : out std_logic_vector(reg_field-1 downto 0);
		rt_index : out std_logic_vector(reg_field-1 downto 0);
		rd_index : out std_logic_vector(reg_field-1 downto 0);
		b_mux_sel : out std_logic;
		alu_func : out alu_function_type );
	END COMPONENT;
	
	--Inputs
	SIGNAL I0 :  std_logic_vector(31 downto 0);
	
	--Outputs
	SIGNAL O7 :  std_logic_vector (14 downto 0);
	SIGNAL O6 :  std_logic;
	SIGNAL O5 :  std_logic;
	SIGNAL O4 :  std_logic_vector(reg_field-1 downto 0);
	SIGNAL O3 :  std_logic_vector(reg_field-1 downto 0);
	SIGNAL O2 :  std_logic_vector(reg_field-1 downto 0);
	SIGNAL O1 :  std_logic;
	SIGNAL O0 : alu_function_type;
	
BEGIN
	-- Instantiatiation of the 32 bit shifter
	inst: control PORT MAP(I0, O7, O6, O5, O4, O3, O2, O1, O0);
	
	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here
		I0 <= "10000001111110011000000111111111";
		wait for 10 ns;
		
		I0 <= "10000001111111011000000111111111";
		wait for 10 ns;
		
		I0 <= "00000001111111011000000111111111";
		wait for 10 ns;
		
		wait;
	END PROCESS;
END;