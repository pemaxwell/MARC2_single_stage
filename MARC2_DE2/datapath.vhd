--  Author: MAJ Paul Maxwell
--	 File:  Datapath.vhd
--  date modified:  5 Aug 03
--  This file contains initial entity information for the design
--  of a datapath as described in the CS380 DP1 Handout for AY041. 

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY DP_MARC1 IS
	PORT(
	clk: IN std_logic; 		-- clock	
	R_we: IN std_logic; 	-- register file & flag write enable
	ld_op: IN std_logic;	-- op is load (from control unit)
	st_op: IN std_logic; 	-- op is store (from control unit)
	Z: OUT std_logic; 	-- zero flag (Z=1, result of Func Unit is 0)
	N: OUT std_logic; 	-- negative flag (N=1, sign of result is neg)
	ctl_wd: IN  std_logic_vector(14 downto 0);			-- control word
	const_in: IN  std_logic_vector(15 downto 0);		-- constant in
	reset : IN STD_LOGIC;		--added 19 Nov 2012
	R1out,R2out,R3out,R4out,R5out,R6out,R7out : out std_logic_vector(15 downto 0);
	dp_data_bus: INOUT  std_logic_vector(15 downto 0);	-- data to/from memory
	dp_addr_bus: INOUT  std_logic_vector(15 downto 0)	  	-- address to memory
		 );
END DP_MARC1;

ARCHITECTURE dataflow OF DP_MARC1 IS
--------------------------------------------------------------------------- 
-- control word format
--      |cw(13)|cw(12)|cw(11-9)|cw(8-6)|cw(5-3)|cw(2-0)|
--      |  MD  |  MB  |  selD  |  FS   |  selA |  selB |
----------------------------------------------------------------------- 
CONSTANT highZ: std_logic_vector(15 downto 0) := "ZZZZZZZZZZZZZZZZ";
Constant R0 : Std_logic_vector(15 downto 0) := "0000000000000000";

component reg16bit is
	 port(
		 data_in : in STD_LOGIC_VECTOR(15 downto 0);
		 Wr_en : in STD_LOGIC;
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;					--added 19 Nov 2012
		 data_out : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end component; 

component function_unit is
	 port(
		 Bus_A : in STD_LOGIC_VECTOR(15 downto 0);
		 Bus_B : in STD_LOGIC_VECTOR(15 downto 0);
		 Sel : in STD_LOGIC_VECTOR(3 downto 0);
		 zero : out STD_LOGIC;
		 Neg : out STD_LOGIC;
		 F_out : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end component; 

signal R1outT,R2outT,R3outT,R4outT,R5outT,R6outT,R7outT : std_logic_vector(15 downto 0);
signal Abus, Bbus, btemp :std_logic_vector(15 downto 0);
signal func_out, func_data : std_logic_vector(15 downto 0);
signal R1in, R2in,R3in,R4in,R5in,R6in,R7in : std_logic;
signal R1Wr,R2Wr,R3Wr,R4Wr,R5Wr,R6Wr,R7Wr : std_logic;

BEGIN 
	R1out <= R1outT;
	R2out <= R2outT;
	R3out <= R3outT;
	R4out <= R4outT;
	R5out <= R5outT;
	R6out <= R6outT;
	R7out <= R7outT;

	dp_addr_bus <= Abus when (ld_op='1' or st_op='1') else (others=>'Z');
	dp_data_bus <= Bbus when (st_op='1') else (others=>'Z');


	R1 :  reg16bit port map (data_in=> func_data,Wr_en=>R1in,clk=> clk,reset=>reset,data_out=> R1outT); 
	R2 :  reg16bit port map (data_in=> func_data,Wr_en=>R2in,clk=> clk,reset=>reset,data_out=> R2outT); 
	R3 :  reg16bit port map (data_in=> func_data,Wr_en=>R3in,clk=> clk,reset=>reset,data_out=> R3outT); 
	R4 :  reg16bit port map (data_in=> func_data,Wr_en=>r4in,clk=> clk,reset=>reset,data_out=> R4outT); 
	R5 :  reg16bit port map (data_in=> func_data,Wr_en=>R5in,clk=> clk,reset=>reset,data_out=> R5outT); 
	R6 :  reg16bit port map (data_in=> func_data,Wr_en=>R6in,clk=> clk,reset=>reset,data_out=> R6outT); 
	R7 :  reg16bit port map (data_in=> func_data,Wr_en=>R7in,clk=> clk,reset=>reset,data_out=> R7outT); 
	
	Fnc_unit : function_unit port map(Bus_A=>Abus,Bus_B=> Bbus,Sel=> ctl_wd(9 downto 6),zero=>Z,Neg=>N,F_out=> func_out);
	
	with ctl_wd(5 downto 3) select
	Abus    <= R0 when "000",
			R1outT when "001",
			R2outT when "010",
			R3outT when "011",
			R4outT when "100",
			R5outT when "101",
			R6outT when "110",
			R7outT when others;
			
	with ctl_wd(2 downto 0) select
	Btemp   <= R0 when "000",					   --input from reg file
			R1outT when "001",
			R2outT when "010",
			R3outT when "011",
			R4outT when "100",
			R5outT when "101",
			R6outT when "110",
			R7outT when others;	
			
	Bbus <= Btemp when ctl_wd(13)= '0' else	--constant or register input		
			const_in when ctl_wd(13)= '1';
			
	func_data <= func_out when ctl_wd(14)= '0' else  --FU output or data bus
				 dp_data_bus when ctl_wd(14) = '1';
		
	R1in <= '1' when (R_we = '1' and ctl_wd(12 downto 10)="001" )else
			'0';
			
	R2in <= '1' when (R_we = '1' and ctl_wd(12 downto 10)="010") else
			'0';
	
	R3in <= '1' when (R_we = '1' and ctl_wd(12 downto 10)="011") else
			'0';		  
	
	R4in <= '1' when (R_we = '1' and ctl_wd(12 downto 10)="100") else
			'0';   
			
	R5in <= '1' when (R_we = '1' and ctl_wd(12 downto 10)="101") else
		'0';	 
		
	R6in <= '1' when (R_we = '1' and ctl_wd(12 downto 10)="110") else
			'0';												   
			
	R7in <= '1' when (R_we = '1' and ctl_wd(12 downto 10)="111") else
			'0';		
	
END dataflow;
	



