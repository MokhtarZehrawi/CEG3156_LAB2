--------------------------------------------------------------------------------
-- Title         : 8-bit Active-Low Reset High Register
-- Project       : Single Cycle MIPS Processor
-------------------------------------------------------------------------------
-- File          : highReg_8bit.vhd
-- Author        : Jainil Gandhi  <jgand039@uottawa.ca>
-- Created       : 2021/03/15
-- Last modified : 2021/03/15
-------------------------------------------------------------------------------
-- Description : This file is an 8-bit active-low reset register. This means 
--					  when reset = 0 the value defaults to 1.
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY highReg_8bit IS
	PORT (
			Input : IN STD_LOGIC_VECTOR (7 downto 0);
			Clk, En, Rst : IN STD_LOGIC;
			Output : OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END;

ARCHITECTURE struct OF highReg_8bit IS

COMPONENT enARdFF_2_Bar IS
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END COMPONENT;

BEGIN

	-- Component Instantiation --
	FF7: enARdFF_2_Bar
	PORT MAP (i_resetBar => Rst,
			  i_d => Input(7),
			  i_enable => En,
			  i_clock => Clk,
			  o_q => Output(7),
			  o_qBar => OPEN
	);
	
	FF6: enARdFF_2_Bar
	PORT MAP (i_resetBar => Rst,
			  i_d => Input(6),
			  i_enable => En,
			  i_clock => Clk,
			  o_q => Output(6),
			  o_qBar => OPEN
	);
	
	FF5: enARdFF_2_Bar
	PORT MAP (i_resetBar => Rst,
			  i_d => Input(5),
			  i_enable => En,
			  i_clock => Clk,
			  o_q => Output(5),
			  o_qBar => OPEN
	);
	
	FF4: enARdFF_2_Bar
	PORT MAP (i_resetBar => Rst,
			  i_d => Input(4),
			  i_enable => En,
			  i_clock => Clk,
			  o_q => Output(4),
			  o_qBar => OPEN
	);
	
	FF3: enARdFF_2_Bar
	PORT MAP (i_resetBar => Rst,
			  i_d => Input(3),
			  i_enable => En,
			  i_clock => Clk,
			  o_q => Output(3),
			  o_qBar => OPEN
	);
	
	FF2: enARdFF_2_Bar
	PORT MAP (i_resetBar => Rst,
			  i_d => Input(2),
			  i_enable => En,
			  i_clock => Clk,
			  o_q => Output(2),
			  o_qBar => OPEN
	);
	
	FF1: enARdFF_2_Bar
	PORT MAP (i_resetBar => Rst,
			  i_d => Input(1),
			  i_enable => En,
			  i_clock => Clk,
			  o_q => Output(1),
			  o_qBar => OPEN
	);
	
	FF0: enARdFF_2_Bar
	PORT MAP (i_resetBar => Rst,
			  i_d => Input(0),
			  i_enable => En,
			  i_clock => Clk,
			  o_q => Output(0),
			  o_qBar => OPEN
	);
	
END struct;