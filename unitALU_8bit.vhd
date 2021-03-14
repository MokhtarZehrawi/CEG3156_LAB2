--------------------------------------------------------------------------------
-- Title         : 8-bit ALU unit
-- Project       : Single Cycle MIPS Processor
-------------------------------------------------------------------------------
-- File          : unitALU_8bit.vhd
-- Author        : Jainil Gandhi  <jgand039@uottawa.ca>
-- Created       : 2021/03/09
-- Last modified : 2021/03/10
-------------------------------------------------------------------------------
-- Description : This file takes in 8-bit 'A', 'B' and 3-bit "aluOp". The 
--		 "aluOp" help decide whether to OR inputs, AND inputs, compare
--		 them or Add/Sub.
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY unitALU_8bit IS
	PORT (
		A, B : IN STD_LOGIC_VECTOR (7 downto 0);
		Op : IN STD_LOGIC_VECTOR (2 downto 0);
		Output : OUT STD_LOGIC_VECTOR (7 downto 0);
		Zero, Ovr : OUT STD_LOGIC
	);
END;

ARCHITECTURE struct OF unitALU_8bit IS

SIGNAL int_OR, int_AND, int_CLA, int_Out : STD_LOGIC_VECTOR (7 downto 0); 
SIGNAL int_SLT : STD_LOGIC;

COMPONENT aluCLA_8bit IS
	PORT (
		A, B : IN STD_LOGIC_VECTOR (7 downto 0);
		Cin : IN STD_LOGIC;
		Sum : OUT STD_LOGIC_VECTOR (7 downto 0);
		Cout, Ovr : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT sgnComparator_8bit IS
	PORT (
		A, B : IN STD_LOGIC_VECTOR (7 downto 0);
		Ls, Eq, Gr : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT MUX_4x1_8bit IS
	PORT (
		input0, input1, input2, input3  : IN STD_LOGIC_VECTOR (7 downto 0);
		SEL 		: IN STD_LOGIC_VECTOR (1 downto 0);
		output 		: OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END COMPONENT;

BEGIN

	MUX: MUX_4x1_8bit
	PORT MAP (input0 => int_OR,
		  input1 => int_AND,
		  input2 => int_CLA,
		  input3(7 downto 1) => "0000000",
		  input3(0) => int_SLT,
		  SEL => Op (1 downto 0),
	  	  output => int_Out
	);

	SLT: sgnComparator_8bit
	PORT MAP (A => A,
		  B => B,
		  Ls => int_SLT,
		  Eq => OPEN,
		  Gr => OPEN
	);

	CLA: aluCLA_8bit
	PORT MAP (A => A,
		  B => B,
		  Cin => Op(2),
		  Sum => int_CLA,
		  Cout => OPEN,
		  Ovr => Ovr
	);

	int_OR <= A OR B;
	int_AND <= A AND B;
	Zero <= (NOT (int_Out(7) OR int_Out(6) OR int_Out(5) OR int_Out(4) OR int_Out(3) OR int_Out(2) OR int_Out(1) OR int_Out(0)));
	Output <= int_Out;

END struct;
