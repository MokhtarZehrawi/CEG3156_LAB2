LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY clk_div_2to256 IS
	PORT(
		i_SEL			: IN 	STD_LOGIC_VECTOR(2 downto 0);
		i_resetBar		: IN	STD_LOGIC;
		i_enable		: IN 	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_q_clk, o_qBar_clk	: OUT	STD_LOGIC);
END clk_div_2to256;


ARCHITECTURE struct OF clk_div_2to256 IS

	SIGNAL int_q, int_qBar 	: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL int_d		: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL int_mux_output	: STD_LOGIC;

COMPONENT enARdFF_2
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END COMPONENT;

COMPONENT clk_div_2
	PORT(	i_resetBar		: IN	STD_LOGIC;
		i_enable		: IN 	STD_LOGIC;
		i_clock				: IN	STD_LOGIC;
		o_q_clk, o_qBar_clk	: OUT	STD_LOGIC);
END COMPONENT;

COMPONENT MUX_8x1
	PORT(
		i_SEL			: IN 	STD_LOGIC_VECTOR(2 downto 0);
		i_input			: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_output		: OUT	STD_LOGIC);
END COMPONENT;

BEGIN
	-- Component Instantiation
	MUX : MUX_8x1
	PORT MAP(
		i_SEL 		=> i_SEL,
		i_input		=> int_q,
		o_output	=> int_mux_output);

	div2_0 : clk_div_2
	PORT MAP(
		i_resetBar		=> i_resetBar,
		i_enable		=> i_enable,
		i_clock			=> i_clock,
		o_q_clk			=> int_q(0),
		o_qBar_clk		=> int_qBar(0) );
	
	div2_1: clk_div_2
	PORT MAP(
		i_resetBar		=> i_resetBar,
		i_enable		=> i_enable,
		i_clock			=> int_q(0),
		o_q_clk			=> int_q(1),
		o_qBar_clk		=> int_qBar(1) );

	div2_2: clk_div_2
	PORT MAP(
		i_resetBar		=> i_resetBar,
		i_enable		=> i_enable,
		i_clock			=> int_q(1),
		o_q_clk			=> int_q(2),
		o_qBar_clk		=> int_qBar(2) );

	div2_3: clk_div_2
	PORT MAP(
		i_resetBar		=> i_resetBar,
		i_enable		=> i_enable,
		i_clock			=> int_q(2),
		o_q_clk			=> int_q(3),
		o_qBar_clk		=> int_qBar(3) );
	
	div2_4: clk_div_2
	PORT MAP(
		i_resetBar		=> i_resetBar,
		i_enable		=> i_enable,
		i_clock			=> int_q(3),
		o_q_clk			=> int_q(4),
		o_qBar_clk		=> int_qBar(4) );

	div2_5: clk_div_2
	PORT MAP(
		i_resetBar		=> i_resetBar,
		i_enable		=> i_enable,
		i_clock			=> int_q(4),
		o_q_clk			=> int_q(5),
		o_qBar_clk		=> int_qBar(5) );

	div2_6: clk_div_2
	PORT MAP(
		i_resetBar		=> i_resetBar,
		i_enable		=> i_enable,
		i_clock			=> int_q(5),
		o_q_clk			=> int_q(6),
		o_qBar_clk		=> int_qBar(6) );

	div2_7: clk_div_2
	PORT MAP(
		i_resetBar		=> i_resetBar,
		i_enable		=> i_enable,
		i_clock			=> int_q(6),
		o_q_clk			=> int_q(7),
		o_qBar_clk		=> int_qBar(7) );
	
	-- Output Assignment
	o_q_clk 	<= int_mux_output; 
	o_qBar_clk 	<= NOT (int_mux_output);
END struct;
