--------------------------------------------------------------------------------
-- Title         : 1-bit Comparator
-- Project       : Single Cycle MIPS Processor
-------------------------------------------------------------------------------
-- File          : comparator.vhd
-- Author        : Jainil Gandhi  <jgand039@uottawa.ca>
-- Created       : 2021/03/09
-- Last modified : 2021/03/09
-------------------------------------------------------------------------------
-- Description : This file checks if bit 'a' is less than (ls), equal (eq), 
--		 or greater than (gr) bit 'b'.
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY comparator IS
	PORT (
		a, b, prevLs, prevEq, prevGr : IN STD_LOGIC;
		ls, eq, gr : OUT STD_LOGIC
	);
END;

ARCHITECTURE struct OF comparator IS

SIGNAL int_ls, int_eq, int_gr : STD_LOGIC;

BEGIN

	int_ls <= (NOT a) AND b;
	int_gr <= a AND (NOT b);
	int_eq <= int_ls NOR int_gr;

	-- Output Equations --
	eq <= int_eq AND prevEq;
	ls <= ((NOT prevEq) AND (NOT prevGr) AND int_eq) OR ((NOT prevLs) AND int_ls);
	gr <= ((NOT int_ls) AND (NOT int_eq)) OR (prevLs AND (NOT int_eq)) OR (prevGr AND (NOT int_ls));

END struct;