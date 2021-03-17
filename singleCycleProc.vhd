--------------------------------------------------------------------------------
-- Title         : Single Cycle Processor
-- Project       : Single Cycle MIPS Processor
-------------------------------------------------------------------------------
-- File          : singleCycleProc.vhd
-- Author        : Jainil Gandhi  <jgand039@uottawa.ca>
-- Created       : 2021/03/15
-- Last modified : 2021/03/15
-------------------------------------------------------------------------------
-- Description : This file outputs the contents of the single cycle processor.
--					  It outputs 32-bit Instructions, and Control signals; ZeroOut,
--					  BranchOut, MemWriteOut, RegWriteOut. There is also a 8x1 MUX
--		  			  controlled by inputs, which output different data from processor.
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY singleCycleProc IS
	PORT (
			ValueSel : IN STD_LOGIC_VECTOR (2 downto 0);
			nextCycle, GClk, GRst : IN STD_LOGIC;
			InstructionOut : OUT STD_LOGIC_VECTOR (31 downto 0);
			MuxOut : OUT STD_LOGIC_VECTOR (7 downto 0);
			BranchOut, ZeroOut, MemWriteOut, RegWriteOut : OUT STD_LOGIC
	);
END;

ARCHITECTURE struct OF singleCycleProc IS

SIGNAL int_Instruct : STD_LOGIC_VECTOR (31 downto 0);
SIGNAL int_PC, int_aluResult, int_Data1, int_Data2, int_WriteData, int_Other : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL int_ALUOp : STD_LOGIC_VECTOR (1 downto 0);
SIGNAL int_Branch, int_Zero, int_MemWrite, int_RegWrite, int_Jump, int_RegDst, int_MemtoReg, int_ALUSrc : STD_LOGIC;
SIGNAL int_nextCycle : STD_LOGIC;

COMPONENT processor_8bit IS
	PORT (
		nextCycle, GClk, GRst : IN STD_LOGIC;
		Instruct : OUT STD_LOGIC_VECTOR (31 downto 0);
		PC, aluResult, Data1, Data2, WriteData : OUT STD_LOGIC_VECTOR (7 downto 0);
		ALUOp : OUT STD_LOGIC_VECTOR (1 downto 0);
		Branch, Zero, MemWrite, RegWrite, Jump, RegDst, MemtoReg, ALUSrc : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT MUX_8x1_8bit IS
	PORT(
		i_SEL 	: IN STD_LOGIC_VECTOR(2 downto 0);
		i_p0	: IN STD_LOGIC_VECTOR(7 downto 0);
		i_p1	: IN STD_LOGIC_VECTOR(7 downto 0);
		i_p2	: IN STD_LOGIC_VECTOR(7 downto 0);
		i_p3	: IN STD_LOGIC_VECTOR(7 downto 0);
		i_p4	: IN STD_LOGIC_VECTOR(7 downto 0);
		i_p5	: IN STD_LOGIC_VECTOR(7 downto 0);
		i_p6	: IN STD_LOGIC_VECTOR(7 downto 0);
		i_p7	: IN STD_LOGIC_VECTOR(7 downto 0);
		o_MUX 	: OUT STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;

BEGIN

	int_Other(7) <= '0';
	int_Other(6) <= int_RegDst;
	int_Other(5) <= int_Jump;
	int_Other(4) <= NOT int_MemWrite;
	int_Other(3) <= int_MemtoReg;
	int_Other(2 downto 1) <= int_ALUOp;
	int_Other(0) <= int_ALUSrc;

	-- Component Instantiation --
	PROC: processor_8bit
	PORT MAP (nextCycle => nextCycle,
			  GClk => GClk,
			  GRst => GRst,
			  Instruct => int_Instruct,
			  PC => int_PC,
			  aluResult => int_aluResult,
			  Data1 => int_Data1,
			  Data2 => int_Data2,
			  WriteData => int_WriteData,
			  ALUOp => int_ALUOp,
			  Branch => int_Branch,
			  Zero => int_Zero,
			  MemWrite => int_MemWrite,
			  RegWrite => int_RegWrite,
			  Jump => int_Jump,
			  RegDst => int_RegDst,
			  MemtoReg => int_MemtoReg,
			  ALUSrc => int_ALUSrc
	);
	
	MUX: MUX_8x1_8bit
	PORT MAP (i_SEL => ValueSel,
			  i_p0 => int_PC,
			  i_p1 => int_aluResult,
			  i_p2 => int_Data1,
			  i_p3 => int_Data2,
			  i_p4 => int_WriteData,
			  i_p5 => int_Other,
			  i_p6 => int_Other,
			  i_p7 => int_Other,
			  o_MUX => MUXOut
	);	  
	
	--  Output Equations --
	int_nextCycle <= NOT nextCycle;
	InstructionOut <= int_Instruct;
	BranchOut <= int_Branch;
	ZeroOut <= int_Zero;
	MemWriteOut <= int_MemWrite;
	RegWriteOut <= int_RegWrite;

END struct;