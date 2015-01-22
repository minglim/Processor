----------------------------------------------------------------------
-- EECS31L/CSE31L Assignment2_Project_ Template
-- 32Bit_Adder_Subtractor
----------------------------------------------------------------------
-- Student First Name : Ming
-- Student Last Name : Lim
-- Student ID : 31201227
----------------------------------------------------------------------

--NOTE: 1 bit adder/subtractor is not implemented below! Please refer to assignment 1 if you want the implementation of the
--1 bit adder/subtractor. A 1 bit full adder was used for the implementation of the 32 bit adder/subtractor.
---------The component (1 bit adder)---------
library ieee;
use ieee.std_logic_1164.all;

entity adder1 is
   port(a         : in  std_logic;
        b         : in  std_logic;
        cin       : in  std_logic;
		  sum_def	: out std_logic;
		  carry_borrow	: out std_logic);
end; 

architecture logic of adder1 is
begin
-- DO NOT modify any signals, ports, or entities above this line
-- add your code below this line
-- put your code in a PROCESS
-- use AND/OR/NOT keywords for behavioral function
	PROCESS (a, b, cin)
	BEGIN
		--sum of products
		sum_def <= (NOT(a) AND NOT(b) AND cin) OR (NOT(a) AND b AND NOT(cin)) OR (a AND NOT(b) AND NOT(cin)) OR (a AND b AND cin);
		carry_borrow <= (a AND cin) OR (a AND b) OR (b AND cin);
	END PROCESS;
end architecture; --architecture logic
--------------------------------------------------------

---------Main code (32 bit adder/subtractor)---------
library ieee;
use ieee.std_logic_1164.all;

entity adder_sub32 is
	port(a_32 : in std_logic_vector(31 downto 0);
		  b_32 : in std_logic_vector(31 downto 0);
		  cin : in std_logic;
		  sub : in std_logic;
		  sum_32 : out std_logic_vector(31 downto 0);
		  cout : inout std_logic;
		  ov : out std_logic);
end;

architecture behavior of adder_sub32 is
	SIGNAL carry : std_logic_vector(30 downto 0);	--used in component instantiation
-----Component declaration-----
	component adder1 is 
		port(a         : in  std_logic;
        b         : in  std_logic;
        cin       : in  std_logic;
		  sum_def	: out std_logic;
		  carry_borrow	: out std_logic);
	end component;
begin
-----Component instantiation-----
	initial: adder1 PORT MAP (a_32(0), b_32(0) XOR sub, sub, sum_32(0), carry(0));
	gen: for j in 1 to 30 generate
		middle: adder1 PORT MAP (a_32(j), b_32(j) XOR sub, carry(j-1), sum_32(j), carry(j));
	end generate;
	final: adder1 PORT MAP (a_32(31), b_32(31) XOR sub, carry(30), sum_32(31), cout);
	ov <= cout XOR carry(30);
end;