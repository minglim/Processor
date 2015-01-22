library ieee;
use ieee.std_logic_1164.all;
use work.c31L_pack.all;

entity processor_tb is
end;

architecture behavior of processor_tb is
	CONSTANT clk_period : TIME := 5 ns;
	--Component declaration
	component processor is
		port(clk : in std_logic;
		instruction : in std_logic_vector(BW-1 downto 0);
		great : out std_logic;
		less : out std_logic;
		equal : out std_logic;
		carry : inout std_logic;
		over_flow : out std_logic);
	end component;
	
	--inputs
	signal clk : std_logic;
	signal instruction : std_logic_vector(BW-1 downto 0);
	
	--outputs
	signal great : std_logic;
	signal less : std_logic;
	signal equal : std_logic;
	signal carry : std_logic; 
	signal over_flow : std_logic;
	
begin

	--Component instantiation
	inst: processor port map (clk, instruction, great, less, equal, carry, over_flow);
	
	process
	begin
		
		wait for 100 ns;
		
		--"0_000000_000010_0000_000001_000000001"
		
		--movi
		instruction <= "10000000000001011000000000000000";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		instruction <= "10000000000011011000000000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		instruction <= "10000000000101011000000000000010";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		instruction <= "10000000000111011000000000000011";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--mov
		instruction <= "00000000001001011000000000000010";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		instruction <= "00000010001011011000001000000010";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		instruction <= "00000100001101011000000000000010";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		instruction <= "00000110001111011000000000000010";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--sll
		instruction <= "00001110010001001000010000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--slli
		instruction <= "10001110010011001000000000000010";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--srl
		instruction <= "00010000010101010000001000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--srli
		instruction <= "10010000010111010000000000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--xor
		instruction <= "00000000011001000000011000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--xori
		instruction <= "10000000011011000000000000001111";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--not
		instruction <= "00000000011100111000001000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--or
		instruction <= "00000010011110110000010000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--ori
		instruction <= "10000000100000110000000000000111";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--and
		instruction <= "00000010100010101000111000000111";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--andi
		instruction <= "10000110100100101000000000011111";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--slt
		instruction <= "00011010100110100001001000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--slti
		instruction <= "10011010101000100000000000011111";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--comp/compi
		instruction <= "00011010100110011001001000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		instruction <= "10011010101000011000000000011111";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		instruction <= "10000010101000011000000000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--sub
		instruction <= "00010100101010010001001000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--subi
		instruction <= "10010100101100010000000000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--add/overflow
		instruction <= "10011100101111010000000000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		instruction <= "00101110110000001010111000000001";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--addi
		instruction <= "10000110110010001000000000000110";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		--nop
		instruction <= "10000110110010000000000000000110";
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
		wait for 10 ns;
		
		wait;
		
	end process;
	
end;