LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Control_Logic_RISC IS
	PORT (
		i_OP					     : IN STD_LOGIC_VECTOR (5 downto 0);
		o_RegDst, o_Jump, O_Branch, o_MemRead 	     : OUT STD_LOGIC;
		o_MemtoReg, o_MemWrite, o_ALUsrc, o_RegWrite : OUT STD_LOGIC;
		o_aluOP 				     : OUT STD_LOGIC_VECTOR (1 downto 0) );
END;

ARCHITECTURE struct OF Control_Logic_RISC IS

	SIGNAL int_Rtype, int_lw, int_sw, int_beq, int_jump	 : STD_LOGIC;

BEGIN
	--Signal Assignment
	int_Rtype <=  not(i_OP(5)) AND not(i_OP(4)) AND not (i_OP(3)) AND not(i_OP(2)) AND not (i_OP(1)) AND not(i_OP(0)); --000000(0) r-type
	int_lw 	  <=  i_OP(5) AND not(i_OP(4)) AND not(i_OP(3)) AND not(i_OP(2)) AND i_OP(1) AND i_OP(0); --100011(35) load word
	int_sw 	  <=  i_OP(5) AND not(i_OP(4)) AND i_OP(3) AND not(i_OP(2)) AND i_OP(1) AND i_OP(0); --101011(43) store word
	int_beq	  <=  not(i_OP(5)) AND not(i_OP(4)) AND not (i_OP(3)) AND i_OP(2) AND not (i_OP(1)) AND not(i_OP(0)); --000100(4) branch if equal
	int_jump  <=  not(i_OP(5)) AND not(i_OP(4)) AND not (i_OP(3)) AND not(i_OP(2)) AND i_OP(1) AND not(i_OP(0)); --000010(2) jump

	--Output Assignment
	o_RegDst 	<= int_Rtype;
	o_jump   	<= int_jump;
	O_Branch 	<= int_beq;
	o_MemRead	<= int_lw;
	o_MemtoReg	<= int_lw;
	o_MemWrite	<= int_sw;
	o_ALUsrc	<= int_sw or int_lw;
	o_RegWrite	<= int_lw OR int_Rtype;
	o_aluOP(0)	<= int_beq;
	o_aluOP(1)	<= int_Rtype;
END struct;
