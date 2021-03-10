--------------------------------------------------------------------------------
-- Title         : 8-bit CLA Adder
-- Project       : Single Cycle MIPS Processor
-------------------------------------------------------------------------------
-- File          : aluCLA_8bit.vhd
-- Author        : Jainil Gandhi  <jgand039@uottawa.ca>
-- Created       : 2021/03/09
-- Last modified : 2021/03/09
-------------------------------------------------------------------------------
-- Description : This file takes in 8-bit 'A', 'B' and 1-bit "Cin" in order to
--		 output the "Sum" and "Cout". The adder both adds and subtracts
--		 'A' and 'B' values. Implementation is called Carry Lookahead 
-- 		 Adder.
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY aluCLA_8bit IS
	PORT (
		A, B : IN STD_LOGIC_VECTOR (7 downto 0);
		Cin : IN STD_LOGIC;
		Sum : OUT STD_LOGIC_VECTOR (7 downto 0);
		Cout, Ovr : OUT STD_LOGIC
	);
END;

ARCHITECTURE struct OF aluCLA_8bit IS

SIGNAL int_B, int_Sum : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL int_P, int_G : STD_LOGIC_VECTOR(1 downto 0);
SIGNAL int_C : STD_LOGIC;

COMPONENT adderCLA_4bit IS
	PORT (
		a, b : IN STD_LOGIC_VECTOR (3 downto 0);
		cin : IN STD_LOGIC;
		sum : OUT STD_LOGIC_VECTOR (3 downto 0);
		P, G : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT unitCLA_8bit IS
	PORT (
		P, G : IN STD_LOGIC_VECTOR (1 downto 0);
		Cin : IN STD_LOGIC;
		C : OUT STD_LOGIC;
		Cout : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT complementer_8bit IS
	PORT (
		input : IN STD_LOGIC_VECTOR (7 downto 0);
		cin : IN STD_LOGIC;
		output : OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END COMPONENT;

BEGIN

	NEG: complementer_8bit
	PORT MAP (input => B,
		  cin => Cin,
		  output => int_B
	);
	
	UNT: unitCLA_8bit
	PORT MAP (P => int_P(1 downto 0),
		  G => int_G(1 downto 0),
		  Cin => Cin,
		  C => int_C,
		  Cout => Cout
	);

	lowCLA: adderCLA_4bit
	PORT MAP (a => A(3 downto 0),
		  b => int_B(3 downto 0),
		  cin => Cin,
		  sum => int_Sum(3 downto 0),
		  P => int_P(0),
		  G => int_G(0)
	);

	highCLA: adderCLA_4bit
	PORT MAP (a => A(7 downto 4),
		  b => int_B(7 downto 4),
		  cin => int_C,
		  sum => int_Sum(7 downto 4),
		  P => int_P(1),
		  G => int_G(1)
	);

	Ovr <= ((NOT A(7)) AND (NOT int_B(7)) AND int_Sum(7)) OR (A(7) AND int_B(7) AND (NOT int_Sum(7))); 
	Sum <= int_Sum;
	
END struct;
