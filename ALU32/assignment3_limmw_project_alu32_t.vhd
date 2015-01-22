LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.c31L_pack.all;

ENTITY alu32_tb IS
END alu32_tb;

ARCHITECTURE behavior OF alu32_tb IS 
	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT alu32 is
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
	END COMPONENT;
	
	--Inputs
	SIGNAL b_mux_sel :  std_logic;
	SIGNAL a_alu32 : std_logic_vector(BW-1 downto 0);
	SIGNAL b_alu32 : std_logic_vector(BW-1 downto 0);
	SIGNAL alu_op : alu_function_type;
	
	--Outputs
	SIGNAL g : std_logic;
	SIGNAL e : std_logic;
	SIGNAL l : std_logic;
	SIGNAL o_alu32 : std_logic_vector(BW-1 downto 0);
	SIGNAL c_alu32: std_logic;
	SIGNAL ov_alu32 : std_logic;
	
BEGIN
	-- Instantiatiation of the 32 bit shifter
	inst: alu32 PORT MAP(b_mux_sel, a_alu32, b_alu32, alu_op, g, e, l, o_alu32, c_alu32, ov_alu32);
	
	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here
		b_mux_sel <= '0'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_nop;
		wait for 10 ns;
		
		b_mux_sel <= '0'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_add;
		wait for 10 ns;
		
		b_mux_sel <= '0'; a_alu32 <= "01111111111111111111111111111111"; b_alu32 <= "01111111111111111111111111111111"; alu_op <= alu_add;
		wait for 10 ns;
		
		b_mux_sel <= '0'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_sub;
		wait for 10 ns;
		
		b_mux_sel <= '0'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_comp;
		wait for 10 ns;
		
		b_mux_sel <= '0'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_slt;
		wait for 10 ns;
		
		b_mux_sel <= '0'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_and;
		wait for 10 ns;
		
		b_mux_sel <= '0'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_or;
		wait for 10 ns;
		
		b_mux_sel <= '0'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_not;
		wait for 10 ns;
		
		b_mux_sel <= '0'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_xor;
		wait for 10 ns;
		
		b_mux_sel <= '0'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_shift_logic_left;
		wait for 10 ns;
		
		b_mux_sel <= '0'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_shift_logic_right;
		wait for 10 ns;
		
		b_mux_sel <= '0'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_mov;
		wait for 10 ns;
		
		b_mux_sel <= '1'; a_alu32 <= "00000000000000000000000000000001"; b_alu32 <= "00000000000000000000000000000010"; alu_op <= alu_mov;
		wait for 10 ns;
		
		wait;
	END PROCESS;
END;