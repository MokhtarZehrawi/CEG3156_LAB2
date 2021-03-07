LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY MUX_8x1_8bits IS
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
END MUX_8x1_8bits;


ARCHITECTURE struct OF MUX_8x1_8bits IS
	SIGNAL int_mux_OUT   :  STD_LOGIC_VECTOR(7 downto 0);
	

COMPONENT MUX_8x1 IS
	PORT(
		i_SEL			: IN 	STD_LOGIC_VECTOR(2 downto 0);
		i_input			: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_output		: OUT	STD_LOGIC);
END COMPONENT;

BEGIN
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

	--Output Assignment
	o_MUX 	<= int_mux_OUT;
END struct;