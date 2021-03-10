--------------------------------------------------------------------------------
-- Title         : 8-bit signed 2's Complement Comparator
-- Project       : Single Cycle MIPS Processor
-------------------------------------------------------------------------------
-- File          : sgnComparator_8bit.vhd
-- Author        : Jainil Gandhi  <jgand039@uottawa.ca>
-- Created       : 2021/03/09
-- Last modified : 2021/03/09
-------------------------------------------------------------------------------
-- Description : This file compares two signed 8-bit values, 'A' and 'B'.
--		 Outputs if 'A' is less than (Ls), equal to (Eq), or 
--		 greater than (Gr) 'B'.
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sgnComparator_8bit IS
	PORT (
		A, B : IN STD_LOGIC_VECTOR (7 downto 0);
		Ls, Eq, Gr : OUT STD_LOGIC
	);
END;

ARCHITECTURE struct OF sgnComparator_8bit IS

SIGNAL int_ls, int_eq, int_gr : STD_LOGIC_VECTOR (6 downto 0);
--SIGNAL tmpEq, tmpGr : STD_LOGIC;

COMPONENT comparator IS
	PORT (
		a, b, prevLs, prevEq, prevGr : IN STD_LOGIC;
		ls, eq, gr : OUT STD_LOGIC
	);
END COMPONENT;

BEGIN

	-- Component Instantiation --
	CMP6: comparator
	PORT MAP (a => A(6),
		  b => B(6),
		  prevLs => int_ls(5),
		  prevEq => int_eq(5),
		  prevGr => int_gr(5),
		  ls => int_ls(6),
		  eq => int_eq(6),
		  gr => int_gr(6)
	);

	CMP5: comparator
	PORT MAP (a => A(5),
		  b => B(5),
		  prevLs => int_ls(4),
		  prevEq => int_eq(4),
		  prevGr => int_gr(4),
		  ls => int_ls(5),
		  eq => int_eq(5),
		  gr => int_gr(5)
	);

	CMP4: comparator
	PORT MAP (a => A(4),
		  b => B(4),
		  prevLs => int_ls(3),
		  prevEq => int_eq(3),
		  prevGr => int_gr(3),
		  ls => int_ls(4),
		  eq => int_eq(4),
		  gr => int_gr(4)
	);

	CMP3: comparator
	PORT MAP (a => A(3),
		  b => B(3),
		  prevLs => int_ls(2),
		  prevEq => int_eq(2),
		  prevGr => int_gr(2),
		  ls => int_ls(3),
		  eq => int_eq(3),
		  gr => int_gr(3)
	);

	CMP2: comparator
	PORT MAP (a => A(2),
		  b => B(2),
		  prevLs => int_ls(1),
		  prevEq => int_eq(1),
		  prevGr => int_gr(1),
		  ls => int_ls(2),
		  eq => int_eq(2),
		  gr => int_gr(2)
	);

	CMP1: comparator
	PORT MAP (a => A(1),
		  b => B(1),
		  prevLs => int_ls(0),
		  prevEq => int_eq(0),
		  prevGr => int_gr(0),
		  ls => int_ls(1),
		  eq => int_eq(1),
		  gr => int_gr(1)
	);

	CMP0: comparator
	PORT MAP (a => A(0),
		  b => B(0),
		  prevLs => '0',
		  prevEq => '1',
		  prevGr => '0',
		  ls => int_ls(0),
		  eq => int_eq(0),
		  gr => int_gr(0)
	);

	-- Output Equations --
	Ls <= ((NOT B(7)) AND int_ls(6)) OR (A(7) AND int_ls(6)) OR (A(7) AND (NOT B(7)));
	Eq <= ((NOT B(7)) AND (NOT A(7)) AND int_eq(6)) OR (A(7) AND B(7) AND int_eq(6));
	Gr <= ((NOT A(7)) AND int_gr(6)) OR (B(7) AND int_gr(6)) OR ((NOT A(7)) AND B(7));  
END struct;