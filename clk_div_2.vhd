LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY clk_div_2 IS
	PORT(
		i_resetBar		: IN	STD_LOGIC;
		i_enable		: IN 	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		o_q_clk, o_qBar_clk	: OUT	STD_LOGIC);
END clk_div_2;

ARCHITECTURE struct OF clk_div_2 IS
	SIGNAL int_q, int_qBar : STD_LOGIC;

COMPONENT enARdFF_2
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END COMPONENT;


BEGIN
	-- Component Instantiation
	Counter: enARdFF_2
	PORT MAP(
		i_resetBar 	=>i_resetBar,
		i_d		=>int_qBar,
		i_enable	=>i_enable,
		i_clock		=>i_clock,
		o_q		=>int_q,
		o_qBar		=>int_qBar );
	--Signal Output Assignment
	o_q_clk <= int_q;
	o_qBar_clk <= int_qBar;

end struct;