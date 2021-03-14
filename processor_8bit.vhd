--------------------------------------------------------------------------------
-- Title         : 8-bit Single Cycle Processor
-- Project       : Single Cycle MIPS Processor
-------------------------------------------------------------------------------
-- File          : processor_8bit.vhd
-- Author        : Jainil Gandhi  <jgand039@uottawa.ca>
-- Created       : 2021/03/14
-- Last modified : 2021/03/14
-------------------------------------------------------------------------------
-- Description : This file is top level file which processes one instruction
--		 from the .mif file every clock cycle.
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY processor_8bit IS
	PORT (
		GClk, GRst : IN STD_LOGIC;
		Instruct : OUT STD_LOGIC_VECTOR (31 downto 0);
		PC, aluResult, Data1, Data2, WriteData : OUT STD_LOGIC_VECTOR (7 downto 0);
		Branch, Zero, MemWrite, RegWrite, Jump, RegDst, MemtoReg, ALUSrc : OUT STD_LOGIC
	);
END;

ARCHITECTURE struct OF processor_8bit IS

SIGNAL int_instruct : STD_LOGIC_VECTOR (31 downto 0);
SIGNAL int_PC, int_incAddr, int_nextAddr, int_Data1, int_Data2, int_aluResult, int_RegData : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL int_RegAddr : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL int_ALUOp : STD_LOGIC_VECTOR (1 downto 0);
SIGNAL int_RegDst, int_Jump, int_Branch, int_MemRead, int_MemtoReg, int_MemWrite, int_ALUSrc, int_RegWrite : STD_LOGIC;
SIGNAL int_Zero : STD_LOGIC;
SIGNAL int_slowClk, int_fastClk : STD_LOGIC;	

COMPONENT clk_div_2to256 IS
	PORT(
		i_SEL			: IN 	STD_LOGIC_VECTOR(2 downto 0);
		i_resetBar		: IN	STD_LOGIC;
		i_enable		: IN 	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_q_clk, o_qBar_clk	: OUT	STD_LOGIC);
END COMPONENT;

COMPONENT instrFetch IS
	PORT (
		nextAddr : IN STD_LOGIC_VECTOR (7 downto 0);
		Rst, pcClk, instrClk : IN STD_LOGIC;
		Addr, incrAddr : OUT STD_LOGIC_VECTOR (7 downto 0);
		instruct : OUT STD_LOGIC_VECTOR (31 downto 0)
	);
END COMPONENT;

COMPONENT RegisterFile_8x8 IS
	PORT (
		in_Read1			 : IN STD_LOGIC_VECTOR (2 downto 0);
		in_Read2			 : IN STD_LOGIC_VECTOR (2 downto 0);
		in_Write_sel			 : IN STD_LOGIC_VECTOR (2 downto 0);
		in_Write_Data			 : IN STD_LOGIC_VECTOR (7 downto 0);
		in_Write_en			 : IN STD_LOGIC;
		in_clk, in_resetbar		 : IN STD_LOGIC; 
		o_Data1				 : OUT STD_LOGIC_VECTOR (7 downto 0);
		o_Data2 			 : OUT STD_LOGIC_VECTOR (7 downto 0) );
END COMPONENT;

COMPONENT instrALU IS
	PORT (
		Data1, Data2, Addr : IN STD_LOGIC_VECTOR (7 downto 0);
		Func : IN STD_LOGIC_VECTOR (5 downto 0);
		ALUOp : IN STD_LOGIC_VECTOR (1 downto 0);
		ALUSrc : IN STD_LOGIC;
		Result : OUT STD_LOGIC_VECTOR (7 downto 0);
		Zero, Ovr : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT jumpOrBranch IS
	PORT (
		Instruct : IN STD_LOGIC_VECTOR (25 downto 0);
		incAddr, instrAddr : IN STD_LOGIC_VECTOR (7 downto 0);
		Branch, Jump, Zero : IN STD_LOGIC;
		nextAddr : OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END COMPONENT;

COMPONENT instrRAM IS
	PORT (
		aluResult, dataIN : IN STD_LOGIC_VECTOR (7 downto 0);
		Clk, Rst, MemWrite, MemtoReg : IN STD_LOGIC;
		dataOUT : OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END COMPONENT;

COMPONENT Control_Logic_RISC IS
	PORT (
		i_OP					     : IN STD_LOGIC_VECTOR (5 downto 0);
		o_RegDst, o_Jump, O_Branch, o_MemRead 	     : OUT STD_LOGIC;
		o_MemtoReg, o_MemWrite, o_ALUsrc, o_RegWrite : OUT STD_LOGIC;
		o_aluOP 				     : OUT STD_LOGIC_VECTOR (1 downto 0) );
END COMPONENT;

BEGIN

	int_fastClk <= GClk;

	-- Component Instantiation --
	CLK: clk_div_2to256
	PORT MAP (i_SEL => "011",
		  i_resetBar => GRst,
		  i_enable => '1',
		  i_clock => int_fastClk,
		  o_q_clk => int_slowClk,
		  o_qBar_clk => OPEN
	);
	
	CTRL: Control_Logic_RISC
	PORT MAP (i_OP => int_instruct (31 downto 26),
		  o_RegDst => int_RegDst,
		  o_Jump => int_Jump,
		  O_Branch => int_Branch,
		  o_MemRead => int_MemRead,
		  o_MemtoReg => int_MemtoReg,
		  o_MemWrite => int_MemWrite,
		  o_ALUSrc => int_ALUSrc,
		  o_RegWrite => int_RegWrite,
		  o_aluOp => int_ALUOp
	);

	FETCH: instrFetch
	PORT MAP (nextAddr => int_nextAddr,
		  Rst => GRst,
		  pcClk => int_slowClk,
		  instrClk => int_fastClk,
		  Addr => int_PC,
		  incrAddr => int_incAddr,
		  instruct => int_instruct
	);

	REGFile: RegisterFile_8x8
	PORT MAP (in_Read1 => int_instruct (23 downto 21),
		  in_Read2 => int_instruct (18 downto 16),
		  in_Write_sel => int_RegAddr (2 downto 0),
		  in_Write_Data => int_RegData,
		  in_Write_en => int_RegWrite,
		  in_clk => int_slowClk,
		  in_resetbar => GRst,
		  o_Data1 => int_Data1,
		  o_Data2 => int_Data2
	);

	ALU: instrALU
	PORT MAP (Data1 => int_Data1,
		  Data2 => int_Data2,
		  Addr(7) => int_instruct(15),
		  Addr(6 downto 0) => int_instruct(6 downto 0),
		  Func => int_instruct (5 downto 0),
		  ALUOp => int_ALUOp,
		  ALUSrc => int_ALUSrc,
		  Result => int_aluResult,
		  Zero => int_Zero,
		  Ovr => OPEN
	);

	JMPorBRN: jumpOrBranch
	PORT MAP (Instruct => int_instruct (25 downto 0),
		  incAddr => int_incAddr,
		  instrAddr(7) => int_instruct(15),
		  instrAddr(6 downto 0) => int_instruct(6 downto 0),
		  Branch => int_Branch,
		  Jump => int_Jump,
		  Zero => int_Zero,
		  nextAddr => int_nextAddr
	);
	
	RAM: instrRAM
	PORT MAP (aluResult => int_aluResult,
		  dataIN => int_Data2,
		  Clk => int_fastClk,
		  Rst => GRst,
		  MemWrite => int_MemWrite,
		  MemtoReg => int_MemtoReg,
		  dataOut => int_RegData
	);

	-- Output Equation --
	PC <= int_PC;
	aluResult <= int_aluResult;
	Data1 <= int_Data1;
	Data2 <= int_Data2;
	WriteData <= int_RegData;
	Branch <= int_Branch;
	Zero <= int_Zero;
	MemWrite <= int_MemWrite;
	RegWrite <= int_RegWrite;
	Jump <= int_Jump;
	RegDst <= int_RegDst;
	MemtoReg <= int_MemtoReg;
	ALUSrc <= int_ALUSrc;
END struct;	   

