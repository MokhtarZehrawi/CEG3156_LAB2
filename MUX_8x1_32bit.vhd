LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY MUX_8x1_32bit IS
	PORT(
		i_SEL 	: IN STD_LOGIC_VECTOR(2 downto 0);
		i_p0	: IN STD_LOGIC_VECTOR(31 downto 0);
		i_p1	: IN STD_LOGIC_VECTOR(31 downto 0);
		i_p2	: IN STD_LOGIC_VECTOR(31 downto 0);
		i_p3	: IN STD_LOGIC_VECTOR(31 downto 0);
		i_p4	: IN STD_LOGIC_VECTOR(31 downto 0);
		i_p5	: IN STD_LOGIC_VECTOR(31 downto 0);
		i_p6	: IN STD_LOGIC_VECTOR(31 downto 0);
		i_p7	: IN STD_LOGIC_VECTOR(31 downto 0);
		o_MUX 	: OUT STD_LOGIC_VECTOR(31 downto 0));
END MUX_8x1_32bit;


ARCHITECTURE struct OF MUX_8x1_32bit IS

	SIGNAL int_mux_OUT   :  STD_LOGIC_VECTOR(31 downto 0);
	
COMPONENT MUX_8x1 IS
	PORT(
		i_SEL			: IN 	STD_LOGIC_VECTOR(2 downto 0);
		i_input			: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_output		: OUT	STD_LOGIC);
END COMPONENT;

BEGIN
	--Component Setup
	mux0: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(0),
		i_input(1)	=>i_p1(0),
		i_input(2)	=>i_p2(0),
		i_input(3)	=>i_p3(0),
		i_input(4)	=>i_p4(0),
		i_input(5)	=>i_p5(0),
		i_input(6)	=>i_p6(0),
		i_input(7)	=>i_p7(0),
		o_output	=>int_mux_OUT(0) );

	mux1: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(1),
		i_input(1)	=>i_p1(1),
		i_input(2)	=>i_p2(1),
		i_input(3)	=>i_p3(1),
		i_input(4)	=>i_p4(1),
		i_input(5)	=>i_p5(1),
		i_input(6)	=>i_p6(1),
		i_input(7)	=>i_p7(1),
		o_output	=>int_mux_OUT(1) );

	mux2: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(2),
		i_input(1)	=>i_p1(2),
		i_input(2)	=>i_p2(2),
		i_input(3)	=>i_p3(2),
		i_input(4)	=>i_p4(2),
		i_input(5)	=>i_p5(2),
		i_input(6)	=>i_p6(2),
		i_input(7)	=>i_p7(2),
		o_output	=>int_mux_OUT(2) );

	mux3: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(3),
		i_input(1)	=>i_p1(3),
		i_input(2)	=>i_p2(3),
		i_input(3)	=>i_p3(3),
		i_input(4)	=>i_p4(3),
		i_input(5)	=>i_p5(3),
		i_input(6)	=>i_p6(3),
		i_input(7)	=>i_p7(3),
		o_output	=>int_mux_OUT(3) );

	mux4: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(4),
		i_input(1)	=>i_p1(4),
		i_input(2)	=>i_p2(4),
		i_input(3)	=>i_p3(4),
		i_input(4)	=>i_p4(4),
		i_input(5)	=>i_p5(4),
		i_input(6)	=>i_p6(4),
		i_input(7)	=>i_p7(4),
		o_output	=>int_mux_OUT(4) );

	mux5: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(5),
		i_input(1)	=>i_p1(5),
		i_input(2)	=>i_p2(5),
		i_input(3)	=>i_p3(5),
		i_input(4)	=>i_p4(5),
		i_input(5)	=>i_p5(5),
		i_input(6)	=>i_p6(5),
		i_input(7)	=>i_p7(5),
		o_output	=>int_mux_OUT(5) );

	mux6: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(6),
		i_input(1)	=>i_p1(6),
		i_input(2)	=>i_p2(6),
		i_input(3)	=>i_p3(6),
		i_input(4)	=>i_p4(6),
		i_input(5)	=>i_p5(6),
		i_input(6)	=>i_p6(6),
		i_input(7)	=>i_p7(6),
		o_output	=>int_mux_OUT(6) );

	mux7: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(7),
		i_input(1)	=>i_p1(7),
		i_input(2)	=>i_p2(7),
		i_input(3)	=>i_p3(7),
		i_input(4)	=>i_p4(7),
		i_input(5)	=>i_p5(7),
		i_input(6)	=>i_p6(7),
		i_input(7)	=>i_p7(7),
		o_output	=>int_mux_OUT(7) );

	mux8: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(8),
		i_input(1)	=>i_p1(8),
		i_input(2)	=>i_p2(8),
		i_input(3)	=>i_p3(8),
		i_input(4)	=>i_p4(8),
		i_input(5)	=>i_p5(8),
		i_input(6)	=>i_p6(8),
		i_input(7)	=>i_p7(8),
		o_output	=>int_mux_OUT(8) );

	mux9: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(9),
		i_input(1)	=>i_p1(9),
		i_input(2)	=>i_p2(9),
		i_input(3)	=>i_p3(9),
		i_input(4)	=>i_p4(9),
		i_input(5)	=>i_p5(9),
		i_input(6)	=>i_p6(9),
		i_input(7)	=>i_p7(9),
		o_output	=>int_mux_OUT(9) );

	mux10: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(10),
		i_input(1)	=>i_p1(10),
		i_input(2)	=>i_p2(10),
		i_input(3)	=>i_p3(10),
		i_input(4)	=>i_p4(10),
		i_input(5)	=>i_p5(10),
		i_input(6)	=>i_p6(10),
		i_input(7)	=>i_p7(10),
		o_output	=>int_mux_OUT(10) );

	mux11: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(11),
		i_input(1)	=>i_p1(11),
		i_input(2)	=>i_p2(11),
		i_input(3)	=>i_p3(11),
		i_input(4)	=>i_p4(11),
		i_input(5)	=>i_p5(11),
		i_input(6)	=>i_p6(11),
		i_input(7)	=>i_p7(11),
		o_output	=>int_mux_OUT(11) );

	mux12: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(12),
		i_input(1)	=>i_p1(12),
		i_input(2)	=>i_p2(12),
		i_input(3)	=>i_p3(12),
		i_input(4)	=>i_p4(12),
		i_input(5)	=>i_p5(12),
		i_input(6)	=>i_p6(12),
		i_input(7)	=>i_p7(12),
		o_output	=>int_mux_OUT(12) );

	mux13: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(13),
		i_input(1)	=>i_p1(13),
		i_input(2)	=>i_p2(13),
		i_input(3)	=>i_p3(13),
		i_input(4)	=>i_p4(13),
		i_input(5)	=>i_p5(13),
		i_input(6)	=>i_p6(13),
		i_input(7)	=>i_p7(13),
		o_output	=>int_mux_OUT(13) );

	mux14: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(14),
		i_input(1)	=>i_p1(14),
		i_input(2)	=>i_p2(14),
		i_input(3)	=>i_p3(14),
		i_input(4)	=>i_p4(14),
		i_input(5)	=>i_p5(14),
		i_input(6)	=>i_p6(14),
		i_input(7)	=>i_p7(14),
		o_output	=>int_mux_OUT(14) );

	mux15: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(15),
		i_input(1)	=>i_p1(15),
		i_input(2)	=>i_p2(15),
		i_input(3)	=>i_p3(15),
		i_input(4)	=>i_p4(15),
		i_input(5)	=>i_p5(15),
		i_input(6)	=>i_p6(15),
		i_input(7)	=>i_p7(15),
		o_output	=>int_mux_OUT(15) );

	mux16: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(16),
		i_input(1)	=>i_p1(16),
		i_input(2)	=>i_p2(16),
		i_input(3)	=>i_p3(16),
		i_input(4)	=>i_p4(16),
		i_input(5)	=>i_p5(16),
		i_input(6)	=>i_p6(16),
		i_input(7)	=>i_p7(16),
		o_output	=>int_mux_OUT(16) );

	mux17: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(17),
		i_input(1)	=>i_p1(17),
		i_input(2)	=>i_p2(17),
		i_input(3)	=>i_p3(17),
		i_input(4)	=>i_p4(17),
		i_input(5)	=>i_p5(17),
		i_input(6)	=>i_p6(17),
		i_input(7)	=>i_p7(17),
		o_output	=>int_mux_OUT(17) );

	mux18: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(18),
		i_input(1)	=>i_p1(18),
		i_input(2)	=>i_p2(18),
		i_input(3)	=>i_p3(18),
		i_input(4)	=>i_p4(18),
		i_input(5)	=>i_p5(18),
		i_input(6)	=>i_p6(18),
		i_input(7)	=>i_p7(18),
		o_output	=>int_mux_OUT(18) );

	mux19: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(19),
		i_input(1)	=>i_p1(19),
		i_input(2)	=>i_p2(19),
		i_input(3)	=>i_p3(19),
		i_input(4)	=>i_p4(19),
		i_input(5)	=>i_p5(19),
		i_input(6)	=>i_p6(19),
		i_input(7)	=>i_p7(19),
		o_output	=>int_mux_OUT(19) );

	mux20: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(20),
		i_input(1)	=>i_p1(20),
		i_input(2)	=>i_p2(20),
		i_input(3)	=>i_p3(20),
		i_input(4)	=>i_p4(20),
		i_input(5)	=>i_p5(20),
		i_input(6)	=>i_p6(20),
		i_input(7)	=>i_p7(20),
		o_output	=>int_mux_OUT(20) );

	mux21: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(21),
		i_input(1)	=>i_p1(21),
		i_input(2)	=>i_p2(21),
		i_input(3)	=>i_p3(21),
		i_input(4)	=>i_p4(21),
		i_input(5)	=>i_p5(21),
		i_input(6)	=>i_p6(21),
		i_input(7)	=>i_p7(21),
		o_output	=>int_mux_OUT(21) );

	mux22: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(22),
		i_input(1)	=>i_p1(22),
		i_input(2)	=>i_p2(22),
		i_input(3)	=>i_p3(22),
		i_input(4)	=>i_p4(22),
		i_input(5)	=>i_p5(22),
		i_input(6)	=>i_p6(22),
		i_input(7)	=>i_p7(22),
		o_output	=>int_mux_OUT(22) );

	mux23: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(23),
		i_input(1)	=>i_p1(23),
		i_input(2)	=>i_p2(23),
		i_input(3)	=>i_p3(23),
		i_input(4)	=>i_p4(23),
		i_input(5)	=>i_p5(23),
		i_input(6)	=>i_p6(23),
		i_input(7)	=>i_p7(23),
		o_output	=>int_mux_OUT(23) );

	mux24: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(24),
		i_input(1)	=>i_p1(24),
		i_input(2)	=>i_p2(24),
		i_input(3)	=>i_p3(24),
		i_input(4)	=>i_p4(24),
		i_input(5)	=>i_p5(24),
		i_input(6)	=>i_p6(24),
		i_input(7)	=>i_p7(24),
		o_output	=>int_mux_OUT(24) );

	mux25: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(25),
		i_input(1)	=>i_p1(25),
		i_input(2)	=>i_p2(25),
		i_input(3)	=>i_p3(25),
		i_input(4)	=>i_p4(25),
		i_input(5)	=>i_p5(25),
		i_input(6)	=>i_p6(25),
		i_input(7)	=>i_p7(25),
		o_output	=>int_mux_OUT(25) );

	mux26: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(26),
		i_input(1)	=>i_p1(26),
		i_input(2)	=>i_p2(26),
		i_input(3)	=>i_p3(26),
		i_input(4)	=>i_p4(26),
		i_input(5)	=>i_p5(26),
		i_input(6)	=>i_p6(26),
		i_input(7)	=>i_p7(26),
		o_output	=>int_mux_OUT(26) );

	mux27: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(27),
		i_input(1)	=>i_p1(27),
		i_input(2)	=>i_p2(27),
		i_input(3)	=>i_p3(27),
		i_input(4)	=>i_p4(27),
		i_input(5)	=>i_p5(27),
		i_input(6)	=>i_p6(27),
		i_input(7)	=>i_p7(27),
		o_output	=>int_mux_OUT(27) );

	mux28: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(28),
		i_input(1)	=>i_p1(28),
		i_input(2)	=>i_p2(28),
		i_input(3)	=>i_p3(28),
		i_input(4)	=>i_p4(28),
		i_input(5)	=>i_p5(28),
		i_input(6)	=>i_p6(28),
		i_input(7)	=>i_p7(28),
		o_output	=>int_mux_OUT(28) );

	mux29: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(29),
		i_input(1)	=>i_p1(29),
		i_input(2)	=>i_p2(29),
		i_input(3)	=>i_p3(29),
		i_input(4)	=>i_p4(29),
		i_input(5)	=>i_p5(29),
		i_input(6)	=>i_p6(29),
		i_input(7)	=>i_p7(29),
		o_output	=>int_mux_OUT(29) );

	mux30: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(30),
		i_input(1)	=>i_p1(30),
		i_input(2)	=>i_p2(30),
		i_input(3)	=>i_p3(30),
		i_input(4)	=>i_p4(30),
		i_input(5)	=>i_p5(30),
		i_input(6)	=>i_p6(30),
		i_input(7)	=>i_p7(30),
		o_output	=>int_mux_OUT(30) );

	mux31: MUX_8x1
	PORT MAP(
		i_SEL		=>i_SEL,
		i_input(0)	=>i_p0(31),
		i_input(1)	=>i_p1(31),
		i_input(2)	=>i_p2(31),
		i_input(3)	=>i_p3(31),
		i_input(4)	=>i_p4(31),
		i_input(5)	=>i_p5(31),
		i_input(6)	=>i_p6(31),
		i_input(7)	=>i_p7(31),
		o_output	=>int_mux_OUT(31) );

	--Output Assignment
	o_MUX 	<= int_mux_OUT;
END struct;