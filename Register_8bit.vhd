LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Register_8bit IS
	PORT (
		in_Input			 : IN STD_LOGIC_VECTOR (7 downto 0);
		in_clk, in_en, in_resetbar	 : IN STD_LOGIC; 
		o_Output			 : OUT STD_LOGIC_VECTOR (7 downto 0) );
END;

ARCHITECTURE struct OF Register_8bit IS

	SIGNAL  int_R 		: STD_LOGIC_VECTOR(7 downto 0);
	
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

	--output assignment
	o_Output 	<= int_R;

END struct;
