--------------------------------------------------------------------------------
-- Title         : ALU control unit
-- Project       : Single Cycle MIPS Processor
-------------------------------------------------------------------------------
-- File          : controlALU.vhd
-- Author        : Jainil Gandhi  <jgand039@uottawa.ca>
-- Created       : 2021/03/10
-- Last modified : 2021/03/10
-------------------------------------------------------------------------------
-- Description : This file takes in 2-bit "ALUOp" from the control unit and 
--		 6-bit "Func" from instruction and generates 3-bit "Op". This 
--		 "Op" value is sent to the unitALU.vhd
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY controlALU IS
	PORT (
		Func : IN STD_LOGIC_VECTOR (5 downto 0);
		ALUOp : IN STD_LOGIC_VECTOR (1 downto 0);
		Op : OUT STD_LOGIC_VECTOR (2 downto 0)
	);
END;

ARCHITECTURE struct OF controlALU IS
 
BEGIN
	
	-- Output Equation --
	Op(2) <= ALUOp(0) OR (Func(1) AND ALUOp(1));
	Op(1) <= ((NOT ALUOp(1)) OR (NOT Func(2)));
	Op(0) <= ALUOp(1) AND (Func(3) OR Func(0));
END struct;