LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX_4x1_8bit IS
	PORT (
		input0, input1, input2, input3  : IN STD_LOGIC_VECTOR (7 downto 0);
		SEL 		: IN STD_LOGIC_VECTOR (1 downto 0);
		output 		: OUT STD_LOGIC_VECTOR (7 downto 0)
	);
END;

ARCHITECTURE struct OF MUX_4x1_8bit IS

COMPONENT MUX_4x1 IS
	PORT (
		input : IN STD_LOGIC_VECTOR (3 downto 0);
		sel : IN STD_LOGIC_VECTOR (1 downto 0);
		output : OUT STD_LOGIC
	);
END COMPONENT;

BEGIN

	MUX_0: MUX_4x1
	PORT MAP (
		  input(0) => input0(0),
		  input(1) => input1(0),
		  input(2) => input2(0),
		  input(3) => input3(0),
		  sel => SEL,
		  output => output(0) );

	MUX_1: MUX_4x1
	PORT MAP (
		  input(0) => input0(1),
		  input(1) => input1(1),
		  input(2) => input2(1),
		  input(3) => input3(1),
		  sel => SEL,
		  output => output(1) );

	MUX_2: MUX_4x1
	PORT MAP (
		  input(0) => input0(2),
		  input(1) => input1(2),
		  input(2) => input2(2),
		  input(3) => input3(2),
		  sel => SEL,
		  output => output(2) );

	MUX_3: MUX_4x1
	PORT MAP (
		  input(0) => input0(3),
		  input(1) => input1(3),
		  input(2) => input2(3),
		  input(3) => input3(3),
		  sel => SEL,
		  output => output(3) );

	MUX_4: MUX_4x1
	PORT MAP (
		  input(0) => input0(4),
		  input(1) => input1(4),
		  input(2) => input2(4),
		  input(3) => input3(4),
		  sel => SEL,
		  output => output(4) );

	MUX_5: MUX_4x1
	PORT MAP (
		  input(0) => input0(5),
		  input(1) => input1(5),
		  input(2) => input2(5),
		  input(3) => input3(5),
		  sel => SEL,
		  output => output(5) );
	
	MUX_6: MUX_4x1
	PORT MAP (
		  input(0) => input0(6),
		  input(1) => input1(6),
		  input(2) => input2(6),
		  input(3) => input3(6),
		  sel => SEL,
		  output => output(6) );

	MUX_7: MUX_4x1
	PORT MAP (
		  input(0) => input0(7),
		  input(1) => input1(7),
		  input(2) => input2(7),
		  input(3) => input3(7),
		  sel => SEL,
		  output => output(7) );

END struct;