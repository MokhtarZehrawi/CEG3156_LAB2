--------------------------------------------------------------------------------
-- Title         : Jump or Branch Unit
-- Project       : Single Cycle MIPS Processor
-------------------------------------------------------------------------------
-- File          : jumpOrBranch.vhd
-- Author        : Jainil Gandhi  <jgand039@uottawa.ca>
-- Created       : 2021/03/13
-- Last modified : 2021/03/13
-------------------------------------------------------------------------------
-- Description : This file calulates the target address of the next instruction
--		 depending on if it is a jump or branch instruction or neither.
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY jumpOrBranch IS
	PORT (
		Instruct : IN STD_LOGIC_VECTOR (25 downto 0);
		incAddr, instrAddr : IN STD_LOGIC_VECTOR (7 downto 0);
		Branch, Jump, Zero : IN STD_LOGIC;
		nextAddr : OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END;

ARCHITECTURE struct OF jumpOrBranch IS

SIGNAL int_branch, int_BRN : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL int_branchSEL : STD_LOGIC;

COMPONENT aluCLA_8bit IS
	PORT (
		A, B : IN STD_LOGIC_VECTOR (7 downto 0);
		Cin : IN STD_LOGIC;
		Sum : OUT STD_LOGIC_VECTOR (7 downto 0);
		Cout, Ovr : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT MUX_2x1_8bit IS
	PORT (
		input0, input1  : IN STD_LOGIC_VECTOR (7 downto 0);
		SEL 		: IN STD_LOGIC;
		output 		: OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END COMPONENT;

BEGIN

	brnAdder: aluCLA_8bit
	PORT MAP (A => incAddr,
		  B => instrAddr, 
		  Cin => '0',
		  Sum => int_branch,
		  Cout => OPEN,
		  Ovr => OPEN
	);

	BRN: MUX_2x1_8bit
	PORT MAP (input0 => incAddr,
		  input1 => int_branch,
		  SEL => int_branchSEL,
		  output => int_BRN
	);

	JMP: MUX_2x1_8bit
	PORT MAP (input0 => int_BRN,
		  input1 => Instruct(7 downto 0),
		  SEL => Jump,
		  output => nextAddr
	);

	int_branchSEL <= Branch AND Zero;

END struct;
		