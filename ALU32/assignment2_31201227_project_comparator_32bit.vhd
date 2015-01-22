----------------------------------------------------------------------
-- EECS31L/CSE31L Assignment2_Project_ Template
-- 32 Bit Comparator
----------------------------------------------------------------------
-- Student First Name : Ming
-- Student Last Name : Lim
-- Student ID : 31201227
----------------------------------------------------------------------

---------The component (1 bit comparator)---------
library ieee;
use ieee.std_logic_1164.all;

entity comp1 is
   port(a         : in  std_logic;
        b         : in  std_logic;
		  gin			: in std_logic;
		  lin			: in std_logic;
		  ein			: in std_logic;
        g         : out  std_logic;
        l         : out  std_logic;
        e         : out  std_logic);
end; 

architecture logic of comp1 is
begin
-- DO NOT modify any signals, ports, or entities above this line
-- add your code below this line
-- put your code in a PROCESS
-- use AND/OR/NOT keywords for behavioral function
	PROCESS (a, b, gin, lin, ein)
	BEGIN
		--derived from minterms in truth table
		g <= gin OR (ein AND a AND NOT(b));
		l <= lin OR (ein AND NOT(a) AND b);
		e <= ein AND (a XNOR b);
	END PROCESS;
end architecture; 
-----------------------------------------------

---------Main code (32 bit comparator)---------
library ieee;
use ieee.std_logic_1164.all;

Entity comp32 is
	port(a_32 : in std_logic_vector(31 downto 0);
			b_32 : in std_logic_vector(31 downto 0);
			g_32 : out std_logic;
			l_32 : out std_logic;
			e_32 : out std_logic);
End;

architecture behavior of comp32 is
	--used to connect the 1 bit components
	SIGNAL greater : std_logic_vector(31 downto 1);
	SIGNAL less : std_logic_vector(31 downto 1);
	SIGNAL equal : std_logic_vector(31 downto 1);
-----Component declaration-----
	component comp1 is
		port(a         : in  std_logic;
        b         : in  std_logic;
		  gin			: in std_logic;
		  lin			: in std_logic;
		  ein			: in std_logic;
        g         : out  std_logic;
        l         : out  std_logic;
        e         : out  std_logic);
	end component;
begin
-----Component instantiation-----
	initial: comp1 PORT MAP (a_32(31), b_32(31), '0', '0', '1', greater(31), less(31), equal(31));
	gen: for j in 30 downto 1 generate
		middle: comp1 PORT MAP (a_32(j), b_32(j), greater(j+1), less(j+1), equal(j+1), greater(j), less(j), equal(j));
	end generate;
	final: comp1 PORT MAP (a_32(0), b_32(0), greater(1), less(1), equal(1), g_32, l_32, e_32);
end;
	