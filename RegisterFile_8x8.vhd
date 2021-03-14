LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RegisterFile_8x8 IS
	PORT (
		in_Read1			 : IN STD_LOGIC_VECTOR (2 downto 0);
		in_Read2			 : IN STD_LOGIC_VECTOR (2 downto 0);
		in_Write_sel			 : IN STD_LOGIC_VECTOR (2 downto 0);
		in_Write_Data			 : IN STD_LOGIC_VECTOR (7 downto 0);
		in_Write_en			 : IN STD_LOGIC;
		in_clk, in_resetbar		 : IN STD_LOGIC; 
		o_Data1				 : OUT STD_LOGIC_VECTOR (7 downto 0);
		o_Data2 			 : OUT STD_LOGIC_VECTOR (7 downto 0) );
END;

ARCHITECTURE struct OF RegisterFile_8x8 IS

	SIGNAL  int_Write_en, int_Decoder_out	   	 : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL  int_ReadData1, int_ReadData2		 : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL  int_Reg0_out, int_Reg1_out, int_Reg2_out : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL  int_Reg3_out, int_Reg4_out, int_Reg5_out : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL  int_Reg6_out, int_Reg7_out		 : STD_LOGIC_VECTOR(7 downto 0);

COMPONENT Register_8bit IS
	PORT (
		in_Input			 : IN STD_LOGIC_VECTOR (7 downto 0);
		in_clk, in_en, in_resetbar	 : IN STD_LOGIC; 
		o_Output			 : OUT STD_LOGIC_VECTOR (7 downto 0) );
END COMPONENT;

COMPONENT Decoder_3x8 IS
	PORT (
		i_Input : IN STD_LOGIC_VECTOR (2 downto 0);
		o_Output : OUT STD_LOGIC_VECTOR (7 downto 0) );
END COMPONENT;

COMPONENT MUX_8x1_8bit IS
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
END COMPONENT;

BEGIN

	--Signal Assignment
	int_Write_en(0) <= in_Write_en AND int_Decoder_out(0);
	int_Write_en(1) <= in_Write_en AND int_Decoder_out(1);
	int_Write_en(2) <= in_Write_en AND int_Decoder_out(2);
	int_Write_en(3) <= in_Write_en AND int_Decoder_out(3);
	int_Write_en(4) <= in_Write_en AND int_Decoder_out(4);
	int_Write_en(5) <= in_Write_en AND int_Decoder_out(5);
	int_Write_en(6) <= in_Write_en AND int_Decoder_out(6);
	int_Write_en(7) <= in_Write_en AND int_Decoder_out(7);
	--Component Setup
	Decoder : Decoder_3x8
	PORT MAP(
		i_Input	 	=>in_Write_sel,
		o_Output	=>int_Decoder_out);

	Register0 : Register_8bit
	PORT MAP(
		in_Input	 =>in_Write_Data,
		in_clk		 =>in_clk, 
		in_en		 =>int_Write_en(0), 
		in_resetbar	 =>in_resetbar,
		o_Output	 =>int_Reg0_out);
	
	Register1 : Register_8bit
	PORT MAP(
		in_Input	 =>in_Write_Data,
		in_clk		 =>in_clk, 
		in_en		 =>int_Write_en(1), 
		in_resetbar	 =>in_resetbar,
		o_Output	 =>int_Reg1_out);

	Register2 : Register_8bit
	PORT MAP(
		in_Input	 =>in_Write_Data,
		in_clk		 =>in_clk, 
		in_en		 =>int_Write_en(2), 
		in_resetbar	 =>in_resetbar,
		o_Output	 =>int_Reg2_out);

	Register3 : Register_8bit
	PORT MAP(
		in_Input	 =>in_Write_Data,
		in_clk		 =>in_clk, 
		in_en		 =>int_Write_en(3), 
		in_resetbar	 =>in_resetbar,
		o_Output	 =>int_Reg3_out);
	
	Register4 : Register_8bit
	PORT MAP(
		in_Input	 =>in_Write_Data,
		in_clk		 =>in_clk, 
		in_en		 =>int_Write_en(4), 
		in_resetbar	 =>in_resetbar,
		o_Output	 =>int_Reg4_out);

	Register5 : Register_8bit
	PORT MAP(
		in_Input	 =>in_Write_Data,
		in_clk		 =>in_clk, 
		in_en		 =>int_Write_en(5), 
		in_resetbar	 =>in_resetbar,
		o_Output	 =>int_Reg5_out);

	Register6 : Register_8bit
	PORT MAP(
		in_Input	 =>in_Write_Data,
		in_clk		 =>in_clk, 
		in_en		 =>int_Write_en(6), 
		in_resetbar	 =>in_resetbar,
		o_Output	 =>int_Reg6_out);

	Register7 : Register_8bit
	PORT MAP(
		in_Input	 =>in_Write_Data,
		in_clk		 =>in_clk, 
		in_en		 =>int_Write_en(7), 
		in_resetbar	 =>in_resetbar,
		o_Output	 =>int_Reg7_out);

	Read_mux1 : MUX_8x1_8bit
	PORT MAP(
		i_SEL 	=>in_Read1,
		i_p0	=>int_Reg0_out,
		i_p1	=>int_Reg1_out,
		i_p2	=>int_Reg2_out,
		i_p3	=>int_Reg3_out,
		i_p4	=>int_Reg4_out,
		i_p5	=>int_Reg5_out,
		i_p6	=>int_Reg6_out,
		i_p7	=>int_Reg7_out,
		o_MUX 	=>int_ReadData1 );

	Read_mux2 : MUX_8x1_8bit
	PORT MAP(
		i_SEL 	=>in_Read2,
		i_p0	=>int_Reg0_out,
		i_p1	=>int_Reg1_out,
		i_p2	=>int_Reg2_out,
		i_p3	=>int_Reg3_out,
		i_p4	=>int_Reg4_out,
		i_p5	=>int_Reg5_out,
		i_p6	=>int_Reg6_out,
		i_p7	=>int_Reg7_out,
		o_MUX 	=>int_ReadData2 );

	--output assignment
	o_Data1	<= int_ReadData1;
	o_Data2 <= int_ReadData2;

END struct;
