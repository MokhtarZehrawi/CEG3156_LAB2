--------------------------------------------------------------------------------
-- Title         : 8-bit Complementer
-- Project       : Single Cycle MIPS Processor
-------------------------------------------------------------------------------
-- File          : sgnComparator_8bit.vhd
-- Author        : Jainil Gandhi  <jgand039@uottawa.ca>
-- Created       : 2021/03/09
-- Last modified : 2021/03/09
-------------------------------------------------------------------------------
-- Description : This file takes in 8-bit value, and complements it if "Cin"
--		 is equal to 1.
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY complementer_8bit IS
	PORT (
		input : IN STD_LOGIC_VECTOR (7 downto 0);
		cin : IN STD_LOGIC;
		output : OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END;

ARCHITECTURE struct OF complementer_8bit IS

BEGIN
	
	output(7) <= input(7) XOR cin;
	output(6) <= input(6) XOR cin;
	output(5) <= input(5) XOR cin;
	output(4) <= input(4) XOR cin;
	output(3) <= input(3) XOR cin;
	output(2) <= input(2) XOR cin;
	output(1) <= input(1) XOR cin;
	output(0) <= input(0) XOR cin;

END struct;
