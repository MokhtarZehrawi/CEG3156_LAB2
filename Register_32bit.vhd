LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Register_32bit IS
	PORT (
		in_Input			 : IN STD_LOGIC_VECTOR (31 downto 0);
		in_clk, in_en, in_resetbar	 : IN STD_LOGIC; 
		o_Output			 : OUT STD_LOGIC_VECTOR (31 downto 0) );
END;

ARCHITECTURE struct OF Register_32bit IS

	SIGNAL  int_R 		: STD_LOGIC_VECTOR(31 downto 0);
	
COMPONENT enARdFF_2 IS
	PORT(
		i_resetBar	: IN	STD_LOGIC;
		i_d		: IN	STD_LOGIC;
		i_enable	: IN	STD_LOGIC;
		i_clock		: IN	STD_LOGIC;
		o_q, o_qBar	: OUT	STD_LOGIC);
END COMPONENT;

BEGIN
	--Component Setup
	DFF_0 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(0),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(0),
		o_qBar		=>open);

	DFF_1 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(1),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(1),
		o_qBar		=>open);

	DFF_2 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(2),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(2),
		o_qBar		=>open);

	DFF_3 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(3),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(3),
		o_qBar		=>open);

	DFF_4 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(4),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(4),
		o_qBar		=>open);

	DFF_5 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(5),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(5),
		o_qBar		=>open);

	DFF_6 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(6),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(6),
		o_qBar		=>open);
	
	DFF_7 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(7),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(7),
		o_qBar		=>open);

	DFF_8 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(8),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(8),
		o_qBar		=>open);

	DFF_9 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(9),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(9),
		o_qBar		=>open);

	DFF_10 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(10),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(10),
		o_qBar		=>open);

	DFF_11 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(11),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(11),
		o_qBar		=>open);

	DFF_12 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(12),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(12),
		o_qBar		=>open);

	DFF_13 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(13),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(13),
		o_qBar		=>open);

	DFF_14 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(14),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(14),
		o_qBar		=>open);

	DFF_15 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(15),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(15),
		o_qBar		=>open);

	DFF_16 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(16),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(16),
		o_qBar		=>open);

	DFF_17 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(17),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(17),
		o_qBar		=>open);

	DFF_18 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(18),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(18),
		o_qBar		=>open);

	DFF_19 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(19),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(19),
		o_qBar		=>open);

	DFF_20 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(20),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(20),
		o_qBar		=>open);

	DFF_21 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(21),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(21),
		o_qBar		=>open);
	
	DFF_22 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(22),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(22),
		o_qBar		=>open);

	DFF_23 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(23),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(23),
		o_qBar		=>open);

	DFF_24 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(24),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(24),
		o_qBar		=>open);

	DFF_25 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(25),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(25),
		o_qBar		=>open);

	DFF_26 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(26),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(26),
		o_qBar		=>open);

	DFF_27 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(27),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(27),
		o_qBar		=>open);

	DFF_28 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(28),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(28),
		o_qBar		=>open);

	DFF_29 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(29),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(29),
		o_qBar		=>open);

	DFF_30 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(30),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(30),
		o_qBar		=>open);

	DFF_31 : enARdFF_2
	PORT MAP(
		i_resetBar	=>in_resetbar,
		i_d		=>in_Input(31),
		i_enable	=>in_en,
		i_clock		=>in_clk,
		o_q		=>int_R(31),
		o_qBar		=>open);	


	--output assignment
	o_Output 	<= int_R;

END struct;