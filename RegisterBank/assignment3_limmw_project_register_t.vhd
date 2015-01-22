LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.c31L_pack.all;

ENTITY reg_bank_tb IS
END reg_bank_tb;

ARCHITECTURE behavior OF reg_bank_tb IS
	CONSTANT clk_period : TIME := 5 ns;
	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT reg_bank is
		port(clk : in std_logic;
		r, w : in std_logic;	--read, write
		rs_index : in std_logic_vector(reg_field-1 downto 0);
		rt_index : in std_logic_vector(reg_field-1 downto 0);
		rd_index : in std_logic_vector(reg_field-1 downto 0);
		reg_source_out : out std_logic_vector(BW-1 downto 0);
		reg_target_out : out std_logic_vector(BW-1 downto 0);
		reg_dest_new : in std_logic_vector(BW-1 downto 0));
	END COMPONENT;
	
	--Inputs
	SIGNAL clk :  std_logic;
	SIGNAL r :  std_logic;
	SIGNAL w :  std_logic;
	SIGNAL rs_index :  std_logic_vector(reg_field-1 downto 0);
	SIGNAL rt_index :  std_logic_vector(reg_field-1 downto 0);
	SIGNAL rd_index :  std_logic_vector(reg_field-1 downto 0);
	SIGNAL reg_dest_new : std_logic_vector(BW-1 downto 0);
	
	--Outputs
	SIGNAL reg_source_out : std_logic_vector(BW-1 downto 0);
	SIGNAL reg_target_out : std_logic_vector(BW-1 downto 0);
	
BEGIN
	-- Instantiatiation of the 32 bit shifter
	inst: reg_bank PORT MAP(clk, r, w, rs_index, rt_index, rd_index, reg_source_out, reg_target_out, reg_dest_new);
	
	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;
		
		-- Place stimulus here
		r <= '1'; w <= '1'; rs_index <= "000001"; rt_index <= "000010"; rd_index <= "000011"; reg_dest_new <= "10000001111110011000000111111111";
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for 10 ns;
		
		r <= '1'; w <= '0'; rs_index <= "000011"; rt_index <= "000010"; rd_index <= "000010"; reg_dest_new <= "10000001111110011000000111111111";
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for 10 ns;
		
		r <= '1'; w <= '1'; rs_index <= "000011"; rt_index <= "000010"; rd_index <= "000011"; reg_dest_new <= "10000001111110011000000111111111";
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for 10 ns;
		
		r <= '0'; w <= '0'; rs_index <= "000011"; rt_index <= "000010"; rd_index <= "000011"; reg_dest_new <= "10000001111110011000000111111111";
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for 10 ns;
		
		wait;
		END PROCESS;
END;
		
		