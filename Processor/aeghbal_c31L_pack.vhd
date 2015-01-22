library ieee;
use ieee.std_logic_1164.all;

package c31L_pack is

 constant ZERO          : std_logic_vector(31 downto 0) :=
      "00000000000000000000000000000000";
   constant ONES          : std_logic_vector(31 downto 0) :=
      "11111111111111111111111111111111";


constant BW	: integer:=32;
constant SEL3	: integer:=3;
constant SEL1	: integer:=1;
constant OP	: integer:=16;
constant reg_field: integer:=6;
constant immediate_size: integer:=15;


subtype alu_function_type is std_logic_vector(3 downto 0);
  
   constant alu_nop   : alu_function_type := "0000";
   constant alu_add       : alu_function_type := "0001";
   constant alu_sub  : alu_function_type := "0010";
   constant alu_comp : alu_function_type := "0011";
   constant alu_slt : alu_function_type := "0100";
   constant alu_and     : alu_function_type := "0101";
   constant alu_or : alu_function_type := "0110";
   constant alu_not       : alu_function_type := "0111";
   constant alu_xor       : alu_function_type := "1000";
   constant alu_shift_logic_left       : alu_function_type := "1001";
   constant alu_shift_logic_right      : alu_function_type := "1010";
   constant alu_mov       : alu_function_type := "1011";
--  constant alu_gtz       : alu_function_type := "01101";
--  constant alu_or        : alu_function_type := "01110";
--   constant alu_and       : alu_function_type := "01111";
--   constant alu_xor       : alu_function_type := "10001";
--   constant alu_nor       : alu_function_type := "10010";


type mux_in_16 is array((OP-1) downto 0) of std_logic_vector(BW-1 downto 0);
type mux_in_2 is array(1 downto 0) of std_logic_vector(BW-1 downto 0);
end;

