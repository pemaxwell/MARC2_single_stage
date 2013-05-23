-- Copyright (C) 1991-2011 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 11.1 Build 216 11/23/2011 Service Pack 1 SJ Web Edition"

-- DATE "08/02/2012 14:15:21"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CPU_chip IS
    PORT (
	LCD_RS : OUT std_logic;
	LCD_E : OUT std_logic;
	LCD_ON : OUT std_logic;
	LCD_RW : OUT std_logic;
	RESET_LED : OUT std_logic;
	SEC_LED : OUT std_logic;
	clk : IN std_logic;
	reset : IN std_logic;
	run : IN std_logic;
	reg_select : IN std_logic_vector(2 DOWNTO 0);
	lcd_data : INOUT std_logic_vector(7 DOWNTO 0)
	);
END CPU_chip;

-- Design Ports Information
-- lcd_data[0]	=>  Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[1]	=>  Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[2]	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[3]	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[4]	=>  Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[5]	=>  Location: PIN_J3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[6]	=>  Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- lcd_data[7]	=>  Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_RS	=>  Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_E	=>  Location: PIN_K3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_ON	=>  Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- LCD_RW	=>  Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- RESET_LED	=>  Location: PIN_AD12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SEC_LED	=>  Location: PIN_AE12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- reset	=>  Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reg_select[2]	=>  Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reg_select[1]	=>  Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reg_select[0]	=>  Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- run	=>  Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF CPU_chip IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LCD_RS : std_logic;
SIGNAL ww_LCD_E : std_logic;
SIGNAL ww_LCD_ON : std_logic;
SIGNAL ww_LCD_RW : std_logic;
SIGNAL ww_RESET_LED : std_logic;
SIGNAL ww_SEC_LED : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_run : std_logic;
SIGNAL ww_reg_select : std_logic_vector(2 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ProgMem|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ProgMem|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ProgMem|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ProgMem|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a8_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ProgMem|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ProgMem|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a10_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a12_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ProgMem|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ProgMem|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a14_PORTADATAIN_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \lcd_out|CLK_400HZ~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \lcd_out|CLK_COUNT_400HZ[0]~20_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[6]~33_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[14]~50\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[15]~51_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[15]~52\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[16]~53_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[16]~54\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[17]~55_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[17]~56\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[18]~57_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[18]~58\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[19]~59_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~25_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~46_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[4]~4_combout\ : std_logic;
SIGNAL \CPU|CU|SP[10]~37\ : std_logic;
SIGNAL \CPU|CU|AR[11]~11_combout\ : std_logic;
SIGNAL \CPU|CU|SP[11]~40_combout\ : std_logic;
SIGNAL \CPU|CU|SP[11]~41\ : std_logic;
SIGNAL \CPU|CU|AR[12]~12_combout\ : std_logic;
SIGNAL \CPU|CU|SP[12]~42_combout\ : std_logic;
SIGNAL \CPU|CU|SP[12]~43\ : std_logic;
SIGNAL \CPU|CU|Add0~12_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~20_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd[12]~8_combout\ : std_logic;
SIGNAL \CPU|CU|SP[13]~44_combout\ : std_logic;
SIGNAL \CPU|CU|SP[13]~45\ : std_logic;
SIGNAL \CPU|CU|SP[14]~46_combout\ : std_logic;
SIGNAL \CPU|CU|SP[14]~47\ : std_logic;
SIGNAL \CPU|CU|SP[15]~48_combout\ : std_logic;
SIGNAL \CPU|CU|AR[13]~13_combout\ : std_logic;
SIGNAL \CPU|CU|AR[14]~14_combout\ : std_logic;
SIGNAL \CPU|CU|AR[15]~15_combout\ : std_logic;
SIGNAL \CPU|CU|AR[0]~0_combout\ : std_logic;
SIGNAL \CPU|CU|AR[5]~5_combout\ : std_logic;
SIGNAL \CPU|CU|PC[5]~5_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~24_combout\ : std_logic;
SIGNAL \CPU|CU|PC[0]~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC[12]~12_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~52_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~57\ : std_logic;
SIGNAL \CPU|CU|PC[14]~14_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~60_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~61\ : std_logic;
SIGNAL \CPU|CU|PC[15]~15_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~64_combout\ : std_logic;
SIGNAL \CPU|CU|PSR[0]~0_combout\ : std_logic;
SIGNAL \CPU|CU|offset[7]~7_combout\ : std_logic;
SIGNAL \lcd_out|LessThan0~1_combout\ : std_logic;
SIGNAL \lcd_out|LessThan0~4_combout\ : std_logic;
SIGNAL \lcd_out|state.DISPLAY_CLEAR~regout\ : std_logic;
SIGNAL \lcd_out|Selector9~1_combout\ : std_logic;
SIGNAL \DisplayReg[10]~50_combout\ : std_logic;
SIGNAL \lcd_out|Selector7~2_combout\ : std_logic;
SIGNAL \lcd_out|state.DISPLAY_OFF~regout\ : std_logic;
SIGNAL \lcd_out|Selector6~5_combout\ : std_logic;
SIGNAL \lcd_out|state.RESET1~regout\ : std_logic;
SIGNAL \lcd_out|Selector4~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector3~4_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[2]~14_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux10~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux10~1_combout\ : std_logic;
SIGNAL \CPU|address[11]~28_combout\ : std_logic;
SIGNAL \CPU|address[12]~29_combout\ : std_logic;
SIGNAL \Equal12~1_combout\ : std_logic;
SIGNAL \Equal12~2_combout\ : std_logic;
SIGNAL \Equal12~3_combout\ : std_logic;
SIGNAL \Equal12~4_combout\ : std_logic;
SIGNAL \CPU|address[0]~30_combout\ : std_logic;
SIGNAL \CPU|address[5]~35_combout\ : std_logic;
SIGNAL \Equal12~7_combout\ : std_logic;
SIGNAL \data_bus_temp[0]~15_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~27_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux15~2_combout\ : std_logic;
SIGNAL \data_bus_temp[1]~18_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|F_temp~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux13~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux13~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux13~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux13~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux12~6_combout\ : std_logic;
SIGNAL \lcd_out|next_command.DISPLAY_CLEAR~regout\ : std_logic;
SIGNAL \lcd_out|state~44_combout\ : std_logic;
SIGNAL \data_bus_temp[9]~30_combout\ : std_logic;
SIGNAL \data_bus_temp[10]~33_combout\ : std_logic;
SIGNAL \data_bus_temp[11]~36_combout\ : std_logic;
SIGNAL \data_bus_temp[14]~45_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~48_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux0~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux0~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux0~4_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux0~5_combout\ : std_logic;
SIGNAL \lcd_out|next_command.DISPLAY_ON~regout\ : std_logic;
SIGNAL \lcd_out|next_command.DISPLAY_OFF~regout\ : std_logic;
SIGNAL \lcd_out|state~46_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~13_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~15_combout\ : std_logic;
SIGNAL \CPU|CU|Selector100~0_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~18_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~20_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~23_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~24_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~25_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~26_combout\ : std_logic;
SIGNAL \CPU|CU|Mem_wr~regout\ : std_logic;
SIGNAL \CPU|CU|PC~16_combout\ : std_logic;
SIGNAL \CPU|CU|Add1~1_combout\ : std_logic;
SIGNAL \CPU|CU|SP[0]~38_combout\ : std_logic;
SIGNAL \CPU|CU|Selector105~1_combout\ : std_logic;
SIGNAL \CPU|CU|Mux1~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector73~0_combout\ : std_logic;
SIGNAL \CPU|CU|Mux1~1_combout\ : std_logic;
SIGNAL \CPU|CU|PC~17_combout\ : std_logic;
SIGNAL \CPU|CU|Selector110~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC~18_combout\ : std_logic;
SIGNAL \CPU|CU|Selector109~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC[9]~21_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~3_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~5_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~7_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~8_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~11_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~30_combout\ : std_logic;
SIGNAL \CPU|CU|Selector76~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.orx~regout\ : std_logic;
SIGNAL \CPU|CU|op.notx~regout\ : std_logic;
SIGNAL \CPU|CU|PC~29_combout\ : std_logic;
SIGNAL \CPU|CU|Selector108~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC~30_combout\ : std_logic;
SIGNAL \CPU|CU|Selector107~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC~31_combout\ : std_logic;
SIGNAL \CPU|CU|Selector106~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC~32_combout\ : std_logic;
SIGNAL \CPU|CU|Selector121~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC~36_combout\ : std_logic;
SIGNAL \CPU|CU|Selector116~0_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~23_combout\ : std_logic;
SIGNAL \CPU|CU|PC[5]~41_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~27_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~30_combout\ : std_logic;
SIGNAL \CPU|CU|PC[0]~44_combout\ : std_logic;
SIGNAL \lcd_out|Selector25~0_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~35_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~38_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~42_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~46_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~50_combout\ : std_logic;
SIGNAL \CPU|CU|PC[12]~52_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~54_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~58_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~59_combout\ : std_logic;
SIGNAL \CPU|CU|PC[14]~54_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~62_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~63_combout\ : std_logic;
SIGNAL \CPU|CU|PC[15]~55_combout\ : std_logic;
SIGNAL \lcd_out|Selector13~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector24~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector53~0_combout\ : std_logic;
SIGNAL \CPU|CU|offset~23_combout\ : std_logic;
SIGNAL \CPU|CU|Selector69~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector69~1_combout\ : std_logic;
SIGNAL \CPU|CU|offset~33_combout\ : std_logic;
SIGNAL \CPU|CU|offset~34_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Equal0~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Equal0~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Equal0~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Equal0~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Equal0~4_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Equal0~5_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Equal0~6_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Equal0~7_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Equal0~8_combout\ : std_logic;
SIGNAL \CPU|CU|Selector67~0_combout\ : std_logic;
SIGNAL \CPU|CU|Mux1~5_combout\ : std_logic;
SIGNAL \CPU|CU|op.orx~1_combout\ : std_logic;
SIGNAL \CPU|CU|Mux1~7_combout\ : std_logic;
SIGNAL \CPU|CU|op.notx~0_combout\ : std_logic;
SIGNAL \CPU|CU|offset~35_combout\ : std_logic;
SIGNAL \CPU|CU|offset~36_combout\ : std_logic;
SIGNAL \CPU|CU|Selector125~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector123~0_combout\ : std_logic;
SIGNAL \CPU|CU|offset~39_combout\ : std_logic;
SIGNAL \CPU|CU|Selector131~0_combout\ : std_logic;
SIGNAL \CPU|CU|offset~40_combout\ : std_logic;
SIGNAL \CPU|CU|offset~41_combout\ : std_logic;
SIGNAL \CPU|CU|offset~48_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~38_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~39_combout\ : std_logic;
SIGNAL \CPU|FNU|R2|data_out[0]~feeder_combout\ : std_logic;
SIGNAL \lcd_out|state.RESET1~feeder_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[0]~21\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[1]~22_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[2]~24_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[4]~29_combout\ : std_logic;
SIGNAL \lcd_out|LessThan0~0_combout\ : std_logic;
SIGNAL \lcd_out|LessThan0~2_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[6]~26_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[1]~23\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[2]~25\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[3]~27_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[3]~28\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[4]~30\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[5]~31_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[5]~32\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[6]~34\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[7]~35_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[7]~36\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[8]~37_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[8]~38\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[9]~39_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[9]~40\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[10]~41_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[10]~42\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[11]~43_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[11]~44\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[12]~45_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[12]~46\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[13]~47_combout\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[13]~48\ : std_logic;
SIGNAL \lcd_out|CLK_COUNT_400HZ[14]~49_combout\ : std_logic;
SIGNAL \lcd_out|LessThan0~3_combout\ : std_logic;
SIGNAL \lcd_out|CLK_400HZ~0_combout\ : std_logic;
SIGNAL \lcd_out|CLK_400HZ~regout\ : std_logic;
SIGNAL \lcd_out|CLK_400HZ~clkctrl_outclk\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \run~combout\ : std_logic;
SIGNAL \CPU|CU|current_state.Reset~0_combout\ : std_logic;
SIGNAL \CPU|CU|current_state.Reset~regout\ : std_logic;
SIGNAL \CPU|CU|Selector57~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector50~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector139~0_combout\ : std_logic;
SIGNAL \CPU|CU|current_state.Fetch~regout\ : std_logic;
SIGNAL \CPU|CU|current_state.Decode~regout\ : std_logic;
SIGNAL \CPU|CU|current_state.Execute~regout\ : std_logic;
SIGNAL \CPU|CU|Selector122~0_combout\ : std_logic;
SIGNAL \CPU|CU|PCd_EN~regout\ : std_logic;
SIGNAL \CPU|CU|Selector51~0_combout\ : std_logic;
SIGNAL \CPU|CU|SP[0]~16_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \CPU|CU|SP[0]~39_combout\ : std_logic;
SIGNAL \CPU|CU|SP[0]~17\ : std_logic;
SIGNAL \CPU|CU|SP[1]~18_combout\ : std_logic;
SIGNAL \CPU|CU|Selector105~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector105~2_combout\ : std_logic;
SIGNAL \CPU|CU|SP_EN~regout\ : std_logic;
SIGNAL \CPU|CU|Selector56~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC[2]~2_combout\ : std_logic;
SIGNAL \CPU|CU|current_state.WB~regout\ : std_logic;
SIGNAL \CPU|CU|Selector63~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector55~0_combout\ : std_logic;
SIGNAL \CPU|CU|SP[1]~19\ : std_logic;
SIGNAL \CPU|CU|SP[2]~20_combout\ : std_logic;
SIGNAL \CPU|CU|SP[2]~21\ : std_logic;
SIGNAL \CPU|CU|SP[3]~22_combout\ : std_logic;
SIGNAL \CPU|CU|Selector62~0_combout\ : std_logic;
SIGNAL \CPU|CU|offset[3]~3_combout\ : std_logic;
SIGNAL \CPU|CU|Selector135~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC~35_combout\ : std_logic;
SIGNAL \CPU|CU|AR[3]~3_combout\ : std_logic;
SIGNAL \CPU|CU|Selector118~0_combout\ : std_logic;
SIGNAL \CPU|CU|AR[0]~16_combout\ : std_logic;
SIGNAL \CPU|address[3]~33_combout\ : std_logic;
SIGNAL \CPU|CU|st_op~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector73~1_combout\ : std_logic;
SIGNAL \CPU|CU|st_op~regout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~29_combout\ : std_logic;
SIGNAL \CPU|CU|Selector54~0_combout\ : std_logic;
SIGNAL \CPU|CU|SP[3]~23\ : std_logic;
SIGNAL \CPU|CU|SP[4]~24_combout\ : std_logic;
SIGNAL \CPU|CU|Selector61~0_combout\ : std_logic;
SIGNAL \CPU|CU|offset~44_combout\ : std_logic;
SIGNAL \CPU|CU|offset[4]~4_combout\ : std_logic;
SIGNAL \CPU|CU|Selector134~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC~19_combout\ : std_logic;
SIGNAL \CPU|CU|PC[4]~4_combout\ : std_logic;
SIGNAL \CPU|CU|op.orx~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.jmp~regout\ : std_logic;
SIGNAL \CPU|CU|op.bn~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.bn~regout\ : std_logic;
SIGNAL \CPU|CU|Selector58~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC~38_combout\ : std_logic;
SIGNAL \CPU|CU|PC[7]~7_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~31_combout\ : std_logic;
SIGNAL \CPU|CU|Selector59~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.addi~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.addi~regout\ : std_logic;
SIGNAL \CPU|CU|op.sethi~1_combout\ : std_logic;
SIGNAL \CPU|CU|op.sethi~regout\ : std_logic;
SIGNAL \CPU|CU|const_out~16_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[6]~6_combout\ : std_logic;
SIGNAL \CPU|CU|Selector98~0_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~11_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd[13]~3_combout\ : std_logic;
SIGNAL \CPU|CU|Selector75~0_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd[1]~1_combout\ : std_logic;
SIGNAL \CPU|CU|Selector87~0_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~12_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~14_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd[2]~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector86~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[12]~0_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd[0]~2_combout\ : std_logic;
SIGNAL \CPU|CU|Selector88~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[12]~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[12]~4_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~16_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd[9]~6_combout\ : std_logic;
SIGNAL \CPU|CU|Selector79~0_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd[8]~4_combout\ : std_logic;
SIGNAL \CPU|CU|Selector80~0_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd[7]~5_combout\ : std_logic;
SIGNAL \CPU|CU|Selector81~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux3~4_combout\ : std_logic;
SIGNAL \CPU|CU|Selector82~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux3~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux3~0_combout\ : std_logic;
SIGNAL \CPU|FNU|R2|data_out[6]~feeder_combout\ : std_logic;
SIGNAL \CPU|CU|Selector71~1_combout\ : std_logic;
SIGNAL \CPU|CU|ld_op~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.ld~regout\ : std_logic;
SIGNAL \CPU|CU|Selector71~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector71~2_combout\ : std_logic;
SIGNAL \CPU|CU|R_we~regout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~32_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd[11]~9_combout\ : std_logic;
SIGNAL \CPU|CU|Selector77~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Equal0~4_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~19_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~22_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~17_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~34_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~35_combout\ : std_logic;
SIGNAL \CPU|CU|Selector85~0_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~21_combout\ : std_logic;
SIGNAL \CPU|CU|Selector52~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC[10]~24_combout\ : std_logic;
SIGNAL \CPU|CU|PC[13]~13_combout\ : std_logic;
SIGNAL \CPU|CU|op.bz~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.bz~regout\ : std_logic;
SIGNAL \CPU|CU|op.ba~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.ba~regout\ : std_logic;
SIGNAL \CPU|CU|Add0~1_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~55_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~51_combout\ : std_logic;
SIGNAL \CPU|CU|PC[11]~11_combout\ : std_logic;
SIGNAL \CPU|CU|PC[10]~10_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~33_combout\ : std_logic;
SIGNAL \CPU|CU|offset~47_combout\ : std_logic;
SIGNAL \CPU|CU|offset~42_combout\ : std_logic;
SIGNAL \CPU|CU|offset~43_combout\ : std_logic;
SIGNAL \CPU|CU|Selector129~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC~40_combout\ : std_logic;
SIGNAL \CPU|CU|PC[9]~9_combout\ : std_logic;
SIGNAL \CPU|CU|Selector130~0_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~34_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~33\ : std_logic;
SIGNAL \CPU|CU|Add0~37\ : std_logic;
SIGNAL \CPU|CU|Add0~40_combout\ : std_logic;
SIGNAL \CPU|CU|PC[9]~49_combout\ : std_logic;
SIGNAL \CPU|CU|PC[9]~26_combout\ : std_logic;
SIGNAL \CPU|CU|PC[15]~27_combout\ : std_logic;
SIGNAL \CPU|CU|PC[15]~28_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~39_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~41\ : std_logic;
SIGNAL \CPU|CU|Add0~44_combout\ : std_logic;
SIGNAL \CPU|CU|PC[10]~50_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~43_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~45\ : std_logic;
SIGNAL \CPU|CU|Add0~48_combout\ : std_logic;
SIGNAL \CPU|CU|PC[11]~51_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~47_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~49\ : std_logic;
SIGNAL \CPU|CU|Add0~53\ : std_logic;
SIGNAL \CPU|CU|Add0~56_combout\ : std_logic;
SIGNAL \CPU|CU|PC[13]~53_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[13]~13_combout\ : std_logic;
SIGNAL \CPU|CU|Selector91~0_combout\ : std_logic;
SIGNAL \CPU|FNU|R3|data_out[13]~feeder_combout\ : std_logic;
SIGNAL \CPU|CU|Selector84~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux8~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Equal0~3_combout\ : std_logic;
SIGNAL \CPU|FNU|R4|data_out[13]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Equal0~5_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux2~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux2~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux2~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux2~combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~45_combout\ : std_logic;
SIGNAL \CPU|CU|Selector126~0_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[12]~12_combout\ : std_logic;
SIGNAL \CPU|CU|Selector92~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Equal0~2_combout\ : std_logic;
SIGNAL \CPU|FNU|R5|data_out[12]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Equal0~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Equal0~6_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[12]~72_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[12]~73_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[12]~74_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[12]~75_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[12]~76_combout\ : std_logic;
SIGNAL \data_bus_temp[12]~39_combout\ : std_logic;
SIGNAL \CPU|CU|Selector60~0_combout\ : std_logic;
SIGNAL \CPU|FNU|R2|data_out[5]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|R1|data_out[5]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|R5|data_out[5]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[5]~24_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[5]~25_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[5]~26_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[5]~28_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[5]~29_combout\ : std_logic;
SIGNAL \data_bus_temp[5]~6_combout\ : std_logic;
SIGNAL \CPU|CU|AR_EN~0_combout\ : std_logic;
SIGNAL \CPU|CU|AR_EN~regout\ : std_logic;
SIGNAL \CPU|CU|PC[6]~6_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~22_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~2_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~4_combout\ : std_logic;
SIGNAL \CPU|CU|SP[4]~25\ : std_logic;
SIGNAL \CPU|CU|SP[5]~26_combout\ : std_logic;
SIGNAL \CPU|CU|SP[5]~27\ : std_logic;
SIGNAL \CPU|CU|SP[6]~28_combout\ : std_logic;
SIGNAL \CPU|CU|SP[6]~29\ : std_logic;
SIGNAL \CPU|CU|SP[7]~30_combout\ : std_logic;
SIGNAL \CPU|CU|AR[7]~7_combout\ : std_logic;
SIGNAL \CPU|CU|Selector114~0_combout\ : std_logic;
SIGNAL \CPU|address[7]~37_combout\ : std_logic;
SIGNAL \CPU|address[7]~50_combout\ : std_logic;
SIGNAL \CPU|CU|AR[8]~8_combout\ : std_logic;
SIGNAL \CPU|CU|Selector113~0_combout\ : std_logic;
SIGNAL \CPU|CU|SP[7]~31\ : std_logic;
SIGNAL \CPU|CU|SP[8]~32_combout\ : std_logic;
SIGNAL \CPU|address[8]~38_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[8]~8_combout\ : std_logic;
SIGNAL \CPU|CU|Selector96~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[8]~48_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[8]~49_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[8]~50_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[8]~53_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~30_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[7]~7_combout\ : std_logic;
SIGNAL \CPU|CU|Selector97~0_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~27_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~28_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd[14]~7_combout\ : std_logic;
SIGNAL \CPU|CU|Selector74~0_combout\ : std_logic;
SIGNAL \CPU|FNU|R6|data_out[7]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|R5|data_out[7]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux8~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux8~4_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux8~5_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux8~combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux3~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|F_temp~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux3~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[7]~36_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[7]~37_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[7]~38_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[7]~40_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[7]~41_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux8~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux8~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux8~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux8~3_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[7]~5_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[7]~6_combout\ : std_logic;
SIGNAL \CPU|FNU|R3|data_out[7]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[7]~39_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~24_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[6]~35_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~21_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux8~0_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[3]~3_combout\ : std_logic;
SIGNAL \CPU|CU|Selector101~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[3]~7_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[3]~8_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[3]~9_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[3]~10_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~2_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[1]~1_combout\ : std_logic;
SIGNAL \CPU|CU|Selector103~0_combout\ : std_logic;
SIGNAL \CPU|CU|offset~26_combout\ : std_logic;
SIGNAL \CPU|CU|offset~27_combout\ : std_logic;
SIGNAL \CPU|CU|Selector65~0_combout\ : std_logic;
SIGNAL \CPU|CU|offset~28_combout\ : std_logic;
SIGNAL \CPU|CU|offset[0]~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector138~0_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[0]~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector104~0_combout\ : std_logic;
SIGNAL \CPU|FNU|R6|data_out[0]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|R4|data_out[0]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux15~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux15~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux15~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux15~combout\ : std_logic;
SIGNAL \CPU|FNU|R2|data_out[1]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|R5|data_out[1]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|R6|data_out[1]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux14~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux14~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux14~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux14~combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~28_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux15~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~7_cout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~8_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[0]~42_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~29_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux15~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux3~5_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux15~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux15~4_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[0]~7_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[0]~19_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[0]~20_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[0]~21_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[0]~22_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~5_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~9\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~10_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[1]~43_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux14~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux14~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux14~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux14~3_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[1]~8_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[1]~9_combout\ : std_logic;
SIGNAL \CPU|FNU|R7|data_out[1]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[1]~15_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[1]~16_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[1]~17_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[1]~18_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~4_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~11\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~12_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux13~4_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[2]~10_combout\ : std_logic;
SIGNAL \CPU|FNU|R6|data_out[2]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|R4|data_out[2]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux13~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux13~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux13~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux13~combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~13\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~15\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~16_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[4]~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[4]~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[4]~5_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[4]~6_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[4]~23_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux11~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux11~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux11~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux11~3_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[4]~0_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[4]~1_combout\ : std_logic;
SIGNAL \CPU|FNU|R2|data_out[4]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|R4|data_out[4]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux11~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux11~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux11~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux11~combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~17\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~20\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~23\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~26\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~31_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux7~9_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux7~4_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux7~5_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux5~9_combout\ : std_logic;
SIGNAL \CPU|CU|offset~46_combout\ : std_logic;
SIGNAL \CPU|CU|offset~29_combout\ : std_logic;
SIGNAL \CPU|CU|offset~30_combout\ : std_logic;
SIGNAL \CPU|CU|Selector128~0_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[10]~10_combout\ : std_logic;
SIGNAL \CPU|CU|Selector94~0_combout\ : std_logic;
SIGNAL \CPU|FNU|R6|data_out[10]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[10]~60_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[10]~61_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[10]~62_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[10]~63_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[10]~64_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux5~4_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux5~5_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[11]~66_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[11]~67_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[11]~68_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[11]~71_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~39_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[10]~65_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~36_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[9]~9_combout\ : std_logic;
SIGNAL \CPU|CU|Selector95~0_combout\ : std_logic;
SIGNAL \CPU|FNU|R7|data_out[9]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|R4|data_out[9]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|R5|data_out[9]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[9]~54_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[9]~55_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[9]~56_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[9]~57_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~33_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~32\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~35\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~38\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~40_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux3~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux3~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux3~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux3~combout\ : std_logic;
SIGNAL \CPU|CU|offset~31_combout\ : std_logic;
SIGNAL \CPU|CU|offset~32_combout\ : std_logic;
SIGNAL \CPU|CU|Selector127~0_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[11]~11_combout\ : std_logic;
SIGNAL \CPU|CU|Selector93~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|F_temp~4_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[11]~69_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[11]~70_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux4~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux4~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux4~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux4~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux4~4_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[11]~16_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux4~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux4~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux4~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux4~combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux5~6_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux5~7_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~37_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux5~8_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[10]~15_combout\ : std_logic;
SIGNAL \CPU|FNU|R5|data_out[10]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux5~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux5~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux5~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux5~combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|F_temp~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[9]~58_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[9]~59_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux6~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux6~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux6~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux6~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~34_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[9]~13_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[9]~14_combout\ : std_logic;
SIGNAL \CPU|FNU|R2|data_out[9]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux6~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux6~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux6~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux6~combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux7~6_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux7~7_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux7~8_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[8]~12_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux7~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux7~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux7~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux7~combout\ : std_logic;
SIGNAL \CPU|address[8]~51_combout\ : std_logic;
SIGNAL \CPU|CU|AR[9]~9_combout\ : std_logic;
SIGNAL \CPU|CU|Selector112~0_combout\ : std_logic;
SIGNAL \CPU|CU|SP[8]~33\ : std_logic;
SIGNAL \CPU|CU|SP[9]~34_combout\ : std_logic;
SIGNAL \CPU|address[9]~39_combout\ : std_logic;
SIGNAL \CPU|address[9]~52_combout\ : std_logic;
SIGNAL \CPU|CU|AR[10]~10_combout\ : std_logic;
SIGNAL \CPU|CU|Selector111~0_combout\ : std_logic;
SIGNAL \CPU|CU|SP[9]~35\ : std_logic;
SIGNAL \CPU|CU|SP[10]~36_combout\ : std_logic;
SIGNAL \CPU|address[10]~26_combout\ : std_logic;
SIGNAL \CPU|address[10]~40_combout\ : std_logic;
SIGNAL \data_bus_temp[0]~14_combout\ : std_logic;
SIGNAL \data_bus_temp[0]~16_combout\ : std_logic;
SIGNAL \CPU|address[11]~41_combout\ : std_logic;
SIGNAL \mem_cs_ram~1_combout\ : std_logic;
SIGNAL \data_bus_temp[1]~17_combout\ : std_logic;
SIGNAL \data_bus_temp[1]~19_combout\ : std_logic;
SIGNAL \CPU|CU|PC[1]~1_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~10_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~13\ : std_logic;
SIGNAL \CPU|CU|Add0~14_combout\ : std_logic;
SIGNAL \CPU|CU|PC[1]~45_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~9_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~15\ : std_logic;
SIGNAL \CPU|CU|Add0~17\ : std_logic;
SIGNAL \CPU|CU|Add0~19\ : std_logic;
SIGNAL \CPU|CU|Add0~21\ : std_logic;
SIGNAL \CPU|CU|Add0~25\ : std_logic;
SIGNAL \CPU|CU|Add0~28_combout\ : std_logic;
SIGNAL \CPU|CU|PC[6]~42_combout\ : std_logic;
SIGNAL \CPU|CU|PC~37_combout\ : std_logic;
SIGNAL \CPU|CU|AR[6]~6_combout\ : std_logic;
SIGNAL \CPU|CU|Selector115~0_combout\ : std_logic;
SIGNAL \CPU|address[6]~36_combout\ : std_logic;
SIGNAL \CPU|address[6]~49_combout\ : std_logic;
SIGNAL \data_bus_temp[5]~5_combout\ : std_logic;
SIGNAL \data_bus_temp[5]~7_combout\ : std_logic;
SIGNAL \CPU|CU|offset[5]~5_combout\ : std_logic;
SIGNAL \CPU|CU|Selector133~0_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[5]~5_combout\ : std_logic;
SIGNAL \CPU|CU|Selector99~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[5]~27_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~18_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~19_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux10~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux10~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|F_temp~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux10~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux10~3_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[5]~2_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[5]~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux10~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux10~combout\ : std_logic;
SIGNAL \CPU|address[5]~48_combout\ : std_logic;
SIGNAL \data_bus_temp[12]~38_combout\ : std_logic;
SIGNAL \data_bus_temp[12]~40_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|F_temp~5_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux3~6_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux3~7_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux3~8_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux3~9_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~41\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~43_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux3~10_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[12]~17_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[12]~77_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~42_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~44\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~47\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~49_combout\ : std_logic;
SIGNAL \CPU|FNU|R4|data_out[14]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[14]~83_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[14]~84_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[14]~85_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[14]~88_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|F_temp~6_combout\ : std_logic;
SIGNAL \CPU|CU|offset~37_combout\ : std_logic;
SIGNAL \CPU|CU|offset~38_combout\ : std_logic;
SIGNAL \CPU|CU|Selector124~0_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[14]~14_combout\ : std_logic;
SIGNAL \CPU|CU|Selector90~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[14]~86_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[14]~87_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux1~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux1~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux1~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux1~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux1~4_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[14]~19_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux1~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux1~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux1~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux1~combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux2~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux2~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux2~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux2~3_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux2~4_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[13]~18_combout\ : std_logic;
SIGNAL \CPU|FNU|R5|data_out[13]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[13]~78_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[13]~79_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[13]~80_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[13]~81_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[13]~82_combout\ : std_logic;
SIGNAL \data_bus_temp[13]~42_combout\ : std_logic;
SIGNAL \data_bus_temp[13]~41_combout\ : std_logic;
SIGNAL \data_bus_temp[13]~43_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~36_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~37_combout\ : std_logic;
SIGNAL \CPU|CU|Selector83~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux8~1_combout\ : std_logic;
SIGNAL \CPU|FNU|R4|data_out[6]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux9~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux9~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux9~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux9~combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux9~4_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux9~5_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux9~9_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux9~6_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux9~7_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~22_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux9~8_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[6]~4_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[6]~30_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[6]~31_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[6]~32_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[6]~33_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[6]~34_combout\ : std_logic;
SIGNAL \data_bus_temp[6]~9_combout\ : std_logic;
SIGNAL \data_bus_temp[6]~8_combout\ : std_logic;
SIGNAL \data_bus_temp[6]~10_combout\ : std_logic;
SIGNAL \CPU|CU|offset~22_combout\ : std_logic;
SIGNAL \CPU|CU|offset~49_combout\ : std_logic;
SIGNAL \CPU|CU|offset[6]~6_combout\ : std_logic;
SIGNAL \CPU|CU|Selector132~0_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~26_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~29\ : std_logic;
SIGNAL \CPU|CU|Add0~32_combout\ : std_logic;
SIGNAL \CPU|CU|PC[7]~43_combout\ : std_logic;
SIGNAL \data_bus_temp[7]~12_combout\ : std_logic;
SIGNAL \data_bus_temp[7]~11_combout\ : std_logic;
SIGNAL \data_bus_temp[7]~13_combout\ : std_logic;
SIGNAL \CPU|CU|Mux1~8_combout\ : std_logic;
SIGNAL \CPU|CU|op.srlx~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.srlx~regout\ : std_logic;
SIGNAL \CPU|CU|Mux1~9_combout\ : std_logic;
SIGNAL \CPU|CU|op.sllx~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.sllx~regout\ : std_logic;
SIGNAL \CPU|CU|Mux1~6_combout\ : std_logic;
SIGNAL \CPU|CU|op.andx~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.andx~regout\ : std_logic;
SIGNAL \CPU|CU|main~1_combout\ : std_logic;
SIGNAL \CPU|CU|Mux1~3_combout\ : std_logic;
SIGNAL \CPU|CU|op.addx~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.addx~regout\ : std_logic;
SIGNAL \CPU|CU|Mux1~4_combout\ : std_logic;
SIGNAL \CPU|CU|op.subx~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.subx~regout\ : std_logic;
SIGNAL \CPU|CU|main~0_combout\ : std_logic;
SIGNAL \CPU|CU|main~2_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[15]~20_combout\ : std_logic;
SIGNAL \CPU|FNU|R7|data_out[15]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux0~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux0~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux0~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux0~combout\ : std_logic;
SIGNAL \CPU|CU|Selector123~1_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[15]~15_combout\ : std_logic;
SIGNAL \CPU|CU|Selector89~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[15]~89_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[15]~90_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[15]~91_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[15]~92_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~51_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~50\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~52_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux0~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux0~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux0~6_combout\ : std_logic;
SIGNAL \CPU|CU|PSR[1]~1_combout\ : std_logic;
SIGNAL \CPU|CU|Selector66~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.nop~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.nop~regout\ : std_logic;
SIGNAL \CPU|CU|PC[9]~20_combout\ : std_logic;
SIGNAL \CPU|CU|PC[9]~22_combout\ : std_logic;
SIGNAL \CPU|CU|PC[9]~23_combout\ : std_logic;
SIGNAL \CPU|CU|PC[4]~25_combout\ : std_logic;
SIGNAL \data_bus_temp[4]~2_combout\ : std_logic;
SIGNAL \data_bus_temp[4]~1_combout\ : std_logic;
SIGNAL \data_bus_temp[4]~4_combout\ : std_logic;
SIGNAL \CPU|CU|AR[4]~4_combout\ : std_logic;
SIGNAL \CPU|CU|Selector117~0_combout\ : std_logic;
SIGNAL \CPU|address[4]~34_combout\ : std_logic;
SIGNAL \CPU|address[4]~47_combout\ : std_logic;
SIGNAL \data_bus_temp[11]~35_combout\ : std_logic;
SIGNAL \data_bus_temp[11]~37_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd~31_combout\ : std_logic;
SIGNAL \CPU|CU|ctl_wd[10]~10_combout\ : std_logic;
SIGNAL \CPU|CU|Selector78~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Equal0~1_combout\ : std_logic;
SIGNAL \CPU|FNU|R6|data_out[3]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux12~0_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux12~1_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux12~2_combout\ : std_logic;
SIGNAL \CPU|FNU|Mux12~combout\ : std_logic;
SIGNAL \CPU|address[3]~46_combout\ : std_logic;
SIGNAL \data_bus_temp[10]~32_combout\ : std_logic;
SIGNAL \data_bus_temp[10]~34_combout\ : std_logic;
SIGNAL \CPU|CU|offset~24_combout\ : std_logic;
SIGNAL \CPU|CU|offset[2]~2_combout\ : std_logic;
SIGNAL \CPU|CU|Selector136~0_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~6_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~16_combout\ : std_logic;
SIGNAL \CPU|CU|PC[2]~46_combout\ : std_logic;
SIGNAL \CPU|CU|PC~34_combout\ : std_logic;
SIGNAL \CPU|CU|AR[2]~2_combout\ : std_logic;
SIGNAL \CPU|CU|Selector119~0_combout\ : std_logic;
SIGNAL \CPU|address[2]~32_combout\ : std_logic;
SIGNAL \CPU|address[2]~45_combout\ : std_logic;
SIGNAL \data_bus_temp[9]~29_combout\ : std_logic;
SIGNAL \data_bus_temp[9]~31_combout\ : std_logic;
SIGNAL \CPU|CU|offset~45_combout\ : std_logic;
SIGNAL \CPU|CU|Selector64~0_combout\ : std_logic;
SIGNAL \CPU|CU|offset~25_combout\ : std_logic;
SIGNAL \CPU|CU|offset[1]~1_combout\ : std_logic;
SIGNAL \CPU|CU|Selector137~0_combout\ : std_logic;
SIGNAL \CPU|CU|PC~33_combout\ : std_logic;
SIGNAL \CPU|CU|AR[1]~1_combout\ : std_logic;
SIGNAL \CPU|CU|Selector120~0_combout\ : std_logic;
SIGNAL \CPU|address[1]~31_combout\ : std_logic;
SIGNAL \CPU|address[1]~44_combout\ : std_logic;
SIGNAL \data_bus_temp[14]~44_combout\ : std_logic;
SIGNAL \data_bus_temp[14]~46_combout\ : std_logic;
SIGNAL \CPU|CU|op.sethi~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.ret~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.ret~regout\ : std_logic;
SIGNAL \CPU|CU|Selector68~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector68~1_combout\ : std_logic;
SIGNAL \CPU|CU|Mem_rd~regout\ : std_logic;
SIGNAL \CPU|CU|Selector70~0_combout\ : std_logic;
SIGNAL \CPU|CU|Mux1~2_combout\ : std_logic;
SIGNAL \CPU|CU|op.st~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.st~regout\ : std_logic;
SIGNAL \CPU|CU|Selector70~1_combout\ : std_logic;
SIGNAL \CPU|CU|Mem_cs~regout\ : std_logic;
SIGNAL \mem_cs_ram~0_combout\ : std_logic;
SIGNAL \data_bus_temp[2]~0_combout\ : std_logic;
SIGNAL \data_bus_temp[0]~3_combout\ : std_logic;
SIGNAL \data_bus_temp[15]~47_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[15]~93_combout\ : std_logic;
SIGNAL \data_bus_temp[15]~48_combout\ : std_logic;
SIGNAL \data_bus_temp[15]~49_combout\ : std_logic;
SIGNAL \CPU|CU|op.call~regout\ : std_logic;
SIGNAL \CPU|CU|PC~39_combout\ : std_logic;
SIGNAL \CPU|CU|PC[8]~8_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~36_combout\ : std_logic;
SIGNAL \CPU|CU|PC[8]~48_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[8]~51_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[8]~52_combout\ : std_logic;
SIGNAL \data_bus_temp[8]~27_combout\ : std_logic;
SIGNAL \data_bus_temp[8]~26_combout\ : std_logic;
SIGNAL \data_bus_temp[8]~28_combout\ : std_logic;
SIGNAL \CPU|CU|op.hlt~0_combout\ : std_logic;
SIGNAL \CPU|CU|op.hlt~regout\ : std_logic;
SIGNAL \CPU|CU|Selector72~0_combout\ : std_logic;
SIGNAL \CPU|CU|Selector72~1_combout\ : std_logic;
SIGNAL \CPU|CU|ld_op~regout\ : std_logic;
SIGNAL \CPU|address[0]~43_combout\ : std_logic;
SIGNAL \data_bus_temp[2]~20_combout\ : std_logic;
SIGNAL \CPU|CU|const_out[2]~2_combout\ : std_logic;
SIGNAL \CPU|CU|Selector102~0_combout\ : std_logic;
SIGNAL \CPU|FNU|R2|data_out[2]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|R7|data_out[2]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[2]~11_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[2]~12_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[2]~13_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[2]~44_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[2]~45_combout\ : std_logic;
SIGNAL \data_bus_temp[2]~21_combout\ : std_logic;
SIGNAL \data_bus_temp[2]~22_combout\ : std_logic;
SIGNAL \data_bus_temp[3]~23_combout\ : std_logic;
SIGNAL \CPU|FNU|R2|data_out[3]~feeder_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[3]~46_combout\ : std_logic;
SIGNAL \CPU|FNU|Bbus[3]~47_combout\ : std_logic;
SIGNAL \CPU|CU|PC[3]~3_combout\ : std_logic;
SIGNAL \CPU|CU|Add0~18_combout\ : std_logic;
SIGNAL \CPU|CU|PC[3]~47_combout\ : std_logic;
SIGNAL \data_bus_temp[3]~24_combout\ : std_logic;
SIGNAL \data_bus_temp[3]~25_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux12~9_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux12~4_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux12~5_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux12~7_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Add0~14_combout\ : std_logic;
SIGNAL \CPU|FNU|Fnc_unit|Mux12~8_combout\ : std_logic;
SIGNAL \CPU|FNU|func_data[3]~11_combout\ : std_logic;
SIGNAL \CPU|FNU|R1|data_out[3]~feeder_combout\ : std_logic;
SIGNAL \DisplayReg[3]~35_combout\ : std_logic;
SIGNAL \DisplayReg[3]~36_combout\ : std_logic;
SIGNAL \Equal12~6_combout\ : std_logic;
SIGNAL \CPU|address[12]~42_combout\ : std_logic;
SIGNAL \CPU|address~27_combout\ : std_logic;
SIGNAL \Equal12~0_combout\ : std_logic;
SIGNAL \Equal12~5_combout\ : std_logic;
SIGNAL \Equal12~8_combout\ : std_logic;
SIGNAL \Equal12~9_combout\ : std_logic;
SIGNAL \DisplayReg[3]~37_combout\ : std_logic;
SIGNAL \DisplayReg[3]~38_combout\ : std_logic;
SIGNAL \DisplayReg[3]~39_combout\ : std_logic;
SIGNAL \DisplayReg[2]~32_combout\ : std_logic;
SIGNAL \DisplayReg[2]~33_combout\ : std_logic;
SIGNAL \DisplayReg[2]~30_combout\ : std_logic;
SIGNAL \DisplayReg[2]~31_combout\ : std_logic;
SIGNAL \DisplayReg[2]~34_combout\ : std_logic;
SIGNAL \DisplayReg[0]~22_combout\ : std_logic;
SIGNAL \DisplayReg[0]~23_combout\ : std_logic;
SIGNAL \DisplayReg[0]~20_combout\ : std_logic;
SIGNAL \DisplayReg[0]~21_combout\ : std_logic;
SIGNAL \DisplayReg[0]~24_combout\ : std_logic;
SIGNAL \lcd_out|Mux27~0_combout\ : std_logic;
SIGNAL \lcd_out|state.HOLD~regout\ : std_logic;
SIGNAL \lcd_out|WideOr0~0_combout\ : std_logic;
SIGNAL \lcd_out|state.TOGGLE_E~regout\ : std_logic;
SIGNAL \lcd_out|state~45_combout\ : std_logic;
SIGNAL \lcd_out|state.DISPLAY_ON~regout\ : std_logic;
SIGNAL \lcd_out|Selector14~0_combout\ : std_logic;
SIGNAL \lcd_out|next_command.MODE_SET~regout\ : std_logic;
SIGNAL \lcd_out|state~43_combout\ : std_logic;
SIGNAL \lcd_out|state.MODE_SET~regout\ : std_logic;
SIGNAL \lcd_out|Selector15~0_combout\ : std_logic;
SIGNAL \lcd_out|next_command.WRITE_CHAR1~regout\ : std_logic;
SIGNAL \lcd_out|state~40_combout\ : std_logic;
SIGNAL \lcd_out|state.WRITE_CHAR1~regout\ : std_logic;
SIGNAL \lcd_out|Selector16~0_combout\ : std_logic;
SIGNAL \lcd_out|next_command.WRITE_CHAR2~regout\ : std_logic;
SIGNAL \lcd_out|state~41_combout\ : std_logic;
SIGNAL \lcd_out|state.WRITE_CHAR2~regout\ : std_logic;
SIGNAL \lcd_out|Selector17~0_combout\ : std_logic;
SIGNAL \lcd_out|next_command.WRITE_CHAR3~regout\ : std_logic;
SIGNAL \lcd_out|state~36_combout\ : std_logic;
SIGNAL \lcd_out|state.WRITE_CHAR3~regout\ : std_logic;
SIGNAL \lcd_out|Selector18~0_combout\ : std_logic;
SIGNAL \lcd_out|next_command.WRITE_CHAR4~regout\ : std_logic;
SIGNAL \lcd_out|state~38_combout\ : std_logic;
SIGNAL \lcd_out|state.WRITE_CHAR4~regout\ : std_logic;
SIGNAL \lcd_out|Selector19~0_combout\ : std_logic;
SIGNAL \lcd_out|next_command.WRITE_CHAR5~regout\ : std_logic;
SIGNAL \lcd_out|state~39_combout\ : std_logic;
SIGNAL \lcd_out|state.WRITE_CHAR5~regout\ : std_logic;
SIGNAL \lcd_out|Selector20~0_combout\ : std_logic;
SIGNAL \lcd_out|next_command.WRITE_CHAR6~regout\ : std_logic;
SIGNAL \lcd_out|state~37_combout\ : std_logic;
SIGNAL \lcd_out|state.WRITE_CHAR6~regout\ : std_logic;
SIGNAL \DisplayReg[6]~10_combout\ : std_logic;
SIGNAL \DisplayReg[6]~11_combout\ : std_logic;
SIGNAL \DisplayReg[6]~12_combout\ : std_logic;
SIGNAL \DisplayReg[6]~13_combout\ : std_logic;
SIGNAL \DisplayReg[6]~14_combout\ : std_logic;
SIGNAL \CPU|FNU|R4|data_out[5]~feeder_combout\ : std_logic;
SIGNAL \DisplayReg[5]~7_combout\ : std_logic;
SIGNAL \DisplayReg[5]~8_combout\ : std_logic;
SIGNAL \DisplayReg[5]~5_combout\ : std_logic;
SIGNAL \DisplayReg[5]~6_combout\ : std_logic;
SIGNAL \DisplayReg[5]~9_combout\ : std_logic;
SIGNAL \DisplayReg[4]~2_combout\ : std_logic;
SIGNAL \DisplayReg[4]~3_combout\ : std_logic;
SIGNAL \DisplayReg[4]~0_combout\ : std_logic;
SIGNAL \DisplayReg[4]~1_combout\ : std_logic;
SIGNAL \DisplayReg[4]~4_combout\ : std_logic;
SIGNAL \lcd_out|Mux20~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector9~0_combout\ : std_logic;
SIGNAL \DisplayReg[9]~45_combout\ : std_logic;
SIGNAL \DisplayReg[9]~46_combout\ : std_logic;
SIGNAL \DisplayReg[9]~47_combout\ : std_logic;
SIGNAL \DisplayReg[9]~48_combout\ : std_logic;
SIGNAL \DisplayReg[9]~49_combout\ : std_logic;
SIGNAL \DisplayReg[8]~40_combout\ : std_logic;
SIGNAL \DisplayReg[8]~41_combout\ : std_logic;
SIGNAL \DisplayReg[8]~42_combout\ : std_logic;
SIGNAL \DisplayReg[8]~43_combout\ : std_logic;
SIGNAL \DisplayReg[8]~44_combout\ : std_logic;
SIGNAL \DisplayReg[10]~51_combout\ : std_logic;
SIGNAL \DisplayReg[10]~52_combout\ : std_logic;
SIGNAL \DisplayReg[10]~53_combout\ : std_logic;
SIGNAL \DisplayReg[10]~54_combout\ : std_logic;
SIGNAL \lcd_out|Mux13~0_combout\ : std_logic;
SIGNAL \DisplayReg[15]~77_combout\ : std_logic;
SIGNAL \DisplayReg[15]~78_combout\ : std_logic;
SIGNAL \DisplayReg[15]~75_combout\ : std_logic;
SIGNAL \DisplayReg[15]~76_combout\ : std_logic;
SIGNAL \DisplayReg[15]~79_combout\ : std_logic;
SIGNAL \DisplayReg[14]~70_combout\ : std_logic;
SIGNAL \DisplayReg[14]~71_combout\ : std_logic;
SIGNAL \display_buf[14]~feeder_combout\ : std_logic;
SIGNAL \DisplayReg[14]~72_combout\ : std_logic;
SIGNAL \DisplayReg[14]~73_combout\ : std_logic;
SIGNAL \DisplayReg[14]~74_combout\ : std_logic;
SIGNAL \DisplayReg[13]~67_combout\ : std_logic;
SIGNAL \DisplayReg[13]~68_combout\ : std_logic;
SIGNAL \CPU|FNU|R1|data_out[13]~feeder_combout\ : std_logic;
SIGNAL \DisplayReg[13]~65_combout\ : std_logic;
SIGNAL \DisplayReg[13]~66_combout\ : std_logic;
SIGNAL \DisplayReg[13]~69_combout\ : std_logic;
SIGNAL \lcd_out|Mux6~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector9~2_combout\ : std_logic;
SIGNAL \lcd_out|Selector9~3_combout\ : std_logic;
SIGNAL \lcd_out|Mux19~0_combout\ : std_logic;
SIGNAL \lcd_out|Mux26~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector8~0_combout\ : std_logic;
SIGNAL \lcd_out|Mux12~0_combout\ : std_logic;
SIGNAL \lcd_out|Mux5~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector8~1_combout\ : std_logic;
SIGNAL \lcd_out|Selector8~2_combout\ : std_logic;
SIGNAL \lcd_out|Selector8~3_combout\ : std_logic;
SIGNAL \DisplayReg[12]~60_combout\ : std_logic;
SIGNAL \DisplayReg[12]~61_combout\ : std_logic;
SIGNAL \DisplayReg[12]~62_combout\ : std_logic;
SIGNAL \DisplayReg[12]~63_combout\ : std_logic;
SIGNAL \DisplayReg[12]~64_combout\ : std_logic;
SIGNAL \lcd_out|Mux4~0_combout\ : std_logic;
SIGNAL \lcd_out|Mux11~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector7~1_combout\ : std_logic;
SIGNAL \lcd_out|Mux25~0_combout\ : std_logic;
SIGNAL \lcd_out|Mux18~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector7~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector7~3_combout\ : std_logic;
SIGNAL \lcd_out|Selector6~4_combout\ : std_logic;
SIGNAL \lcd_out|Selector23~0_combout\ : std_logic;
SIGNAL \lcd_out|next_command.RESET3~regout\ : std_logic;
SIGNAL \lcd_out|state~49_combout\ : std_logic;
SIGNAL \lcd_out|state.RESET3~regout\ : std_logic;
SIGNAL \lcd_out|Selector22~0_combout\ : std_logic;
SIGNAL \lcd_out|next_command.RESET2~regout\ : std_logic;
SIGNAL \lcd_out|state~48_combout\ : std_logic;
SIGNAL \lcd_out|state.RESET2~regout\ : std_logic;
SIGNAL \lcd_out|Selector12~0_combout\ : std_logic;
SIGNAL \lcd_out|next_command.FUNC_SET~regout\ : std_logic;
SIGNAL \lcd_out|state~47_combout\ : std_logic;
SIGNAL \lcd_out|state.FUNC_SET~regout\ : std_logic;
SIGNAL \lcd_out|Selector6~6_combout\ : std_logic;
SIGNAL \lcd_out|Selector6~7_combout\ : std_logic;
SIGNAL \DisplayReg[1]~27_combout\ : std_logic;
SIGNAL \DisplayReg[1]~28_combout\ : std_logic;
SIGNAL \DisplayReg[1]~25_combout\ : std_logic;
SIGNAL \DisplayReg[1]~26_combout\ : std_logic;
SIGNAL \DisplayReg[1]~29_combout\ : std_logic;
SIGNAL \lcd_out|Selector6~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector6~1_combout\ : std_logic;
SIGNAL \lcd_out|Selector6~2_combout\ : std_logic;
SIGNAL \lcd_out|Selector6~3_combout\ : std_logic;
SIGNAL \lcd_out|Selector6~8_combout\ : std_logic;
SIGNAL \lcd_out|Selector5~2_combout\ : std_logic;
SIGNAL \lcd_out|Selector4~3_combout\ : std_logic;
SIGNAL \DisplayReg[7]~15_combout\ : std_logic;
SIGNAL \DisplayReg[7]~16_combout\ : std_logic;
SIGNAL \DisplayReg[7]~17_combout\ : std_logic;
SIGNAL \DisplayReg[7]~18_combout\ : std_logic;
SIGNAL \DisplayReg[7]~19_combout\ : std_logic;
SIGNAL \lcd_out|Selector4~1_combout\ : std_logic;
SIGNAL \display_buf[11]~feeder_combout\ : std_logic;
SIGNAL \DisplayReg[11]~57_combout\ : std_logic;
SIGNAL \DisplayReg[11]~58_combout\ : std_logic;
SIGNAL \DisplayReg[11]~55_combout\ : std_logic;
SIGNAL \DisplayReg[11]~56_combout\ : std_logic;
SIGNAL \DisplayReg[11]~59_combout\ : std_logic;
SIGNAL \lcd_out|Selector4~2_combout\ : std_logic;
SIGNAL \lcd_out|Selector4~4_combout\ : std_logic;
SIGNAL \lcd_out|Selector5~3_combout\ : std_logic;
SIGNAL \lcd_out|Selector4~5_combout\ : std_logic;
SIGNAL \lcd_out|Selector3~3_combout\ : std_logic;
SIGNAL \lcd_out|Selector3~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector3~1_combout\ : std_logic;
SIGNAL \lcd_out|Selector3~2_combout\ : std_logic;
SIGNAL \lcd_out|Selector3~5_combout\ : std_logic;
SIGNAL \lcd_out|Selector21~0_combout\ : std_logic;
SIGNAL \lcd_out|next_command.RETURN_HOME~regout\ : std_logic;
SIGNAL \lcd_out|state~42_combout\ : std_logic;
SIGNAL \lcd_out|state.RETURN_HOME~regout\ : std_logic;
SIGNAL \lcd_out|Selector2~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector1~0_combout\ : std_logic;
SIGNAL \lcd_out|Selector1~1_combout\ : std_logic;
SIGNAL \lcd_out|Selector1~2_combout\ : std_logic;
SIGNAL \lcd_out|LCD_RS~regout\ : std_logic;
SIGNAL \lcd_out|LCD_E~0_combout\ : std_logic;
SIGNAL \lcd_out|LCD_E~regout\ : std_logic;
SIGNAL \reg_select~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \lcd_out|CLK_COUNT_400HZ\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \lcd_out|DATA_BUS_VALUE\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \CPU|FNU|R1|data_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CPU|CU|AR\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CPU|CU|IR\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CPU|CU|PC\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CPU|CU|PSR\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \CPU|CU|SP\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CPU|CU|const_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CPU|CU|ctl_wd\ : std_logic_vector(14 DOWNTO 0);
SIGNAL \CPU|CU|offset\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ProgMem|altsyncram_component|auto_generated|q_a\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \Ram1|altsyncram_component|auto_generated|q_a\ : std_logic_vector(15 DOWNTO 0);
SIGNAL display_buf : std_logic_vector(15 DOWNTO 0);
SIGNAL \CPU|FNU|R7|data_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CPU|FNU|R6|data_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CPU|FNU|R5|data_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CPU|FNU|R4|data_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CPU|FNU|R3|data_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \CPU|FNU|R2|data_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \lcd_out|ALT_INV_LCD_E~regout\ : std_logic;
SIGNAL \lcd_out|ALT_INV_DATA_BUS_VALUE\ : std_logic_vector(5 DOWNTO 3);
SIGNAL \CPU|CU|ALT_INV_current_state.Reset~regout\ : std_logic;
SIGNAL \CPU|CU|ALT_INV_current_state.Decode~regout\ : std_logic;
SIGNAL \CPU|CU|ALT_INV_current_state.Execute~regout\ : std_logic;
SIGNAL \CPU|CU|ALT_INV_Mem_wr~regout\ : std_logic;
SIGNAL \CPU|CU|ALT_INV_current_state.WB~regout\ : std_logic;
SIGNAL \ALT_INV_reset~combout\ : std_logic;

BEGIN

LCD_RS <= ww_LCD_RS;
LCD_E <= ww_LCD_E;
LCD_ON <= ww_LCD_ON;
LCD_RW <= ww_LCD_RW;
RESET_LED <= ww_RESET_LED;
SEC_LED <= ww_SEC_LED;
ww_clk <= clk;
ww_reset <= reset;
ww_run <= run;
ww_reg_select <= reg_select;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Ram1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\ <= (\data_bus_temp[5]~7_combout\ & \data_bus_temp[4]~4_combout\);

\Ram1|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\CPU|address[10]~40_combout\ & \CPU|address[9]~52_combout\ & \CPU|address[8]~51_combout\ & \CPU|address[7]~50_combout\ & \CPU|address[6]~49_combout\ & \CPU|address[5]~48_combout\ & 
\CPU|address[4]~47_combout\ & \CPU|address[3]~46_combout\ & \CPU|address[2]~45_combout\ & \CPU|address[1]~44_combout\ & \CPU|address[0]~43_combout\);

\Ram1|altsyncram_component|auto_generated|q_a\(4) <= \Ram1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);
\Ram1|altsyncram_component|auto_generated|q_a\(5) <= \Ram1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(1);

\ProgMem|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\CPU|address[9]~52_combout\ & \CPU|address[8]~51_combout\ & \CPU|address[7]~50_combout\ & \CPU|address[6]~49_combout\ & \CPU|address[5]~48_combout\ & \CPU|address[4]~47_combout\
& \CPU|address[3]~46_combout\ & \CPU|address[2]~45_combout\ & \CPU|address[1]~44_combout\ & \CPU|address[0]~43_combout\);

\ProgMem|altsyncram_component|auto_generated|q_a\(4) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);
\ProgMem|altsyncram_component|auto_generated|q_a\(5) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(1);
\ProgMem|altsyncram_component|auto_generated|q_a\(6) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(2);
\ProgMem|altsyncram_component|auto_generated|q_a\(7) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(3);

\Ram1|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\ <= (\data_bus_temp[7]~13_combout\ & \data_bus_temp[6]~10_combout\);

\Ram1|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\CPU|address[10]~40_combout\ & \CPU|address[9]~52_combout\ & \CPU|address[8]~51_combout\ & \CPU|address[7]~50_combout\ & \CPU|address[6]~49_combout\ & \CPU|address[5]~48_combout\ & 
\CPU|address[4]~47_combout\ & \CPU|address[3]~46_combout\ & \CPU|address[2]~45_combout\ & \CPU|address[1]~44_combout\ & \CPU|address[0]~43_combout\);

\Ram1|altsyncram_component|auto_generated|q_a\(6) <= \Ram1|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);
\Ram1|altsyncram_component|auto_generated|q_a\(7) <= \Ram1|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(1);

\Ram1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (\data_bus_temp[1]~19_combout\ & \data_bus_temp[0]~16_combout\);

\Ram1|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\CPU|address[10]~40_combout\ & \CPU|address[9]~52_combout\ & \CPU|address[8]~51_combout\ & \CPU|address[7]~50_combout\ & \CPU|address[6]~49_combout\ & \CPU|address[5]~48_combout\ & 
\CPU|address[4]~47_combout\ & \CPU|address[3]~46_combout\ & \CPU|address[2]~45_combout\ & \CPU|address[1]~44_combout\ & \CPU|address[0]~43_combout\);

\Ram1|altsyncram_component|auto_generated|q_a\(0) <= \Ram1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\Ram1|altsyncram_component|auto_generated|q_a\(1) <= \Ram1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);

\ProgMem|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\CPU|address[9]~52_combout\ & \CPU|address[8]~51_combout\ & \CPU|address[7]~50_combout\ & \CPU|address[6]~49_combout\ & \CPU|address[5]~48_combout\ & \CPU|address[4]~47_combout\
& \CPU|address[3]~46_combout\ & \CPU|address[2]~45_combout\ & \CPU|address[1]~44_combout\ & \CPU|address[0]~43_combout\);

\ProgMem|altsyncram_component|auto_generated|q_a\(0) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\ProgMem|altsyncram_component|auto_generated|q_a\(1) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\ProgMem|altsyncram_component|auto_generated|q_a\(2) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\ProgMem|altsyncram_component|auto_generated|q_a\(3) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);

\Ram1|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\ <= (\data_bus_temp[3]~25_combout\ & \data_bus_temp[2]~22_combout\);

\Ram1|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\CPU|address[10]~40_combout\ & \CPU|address[9]~52_combout\ & \CPU|address[8]~51_combout\ & \CPU|address[7]~50_combout\ & \CPU|address[6]~49_combout\ & \CPU|address[5]~48_combout\ & 
\CPU|address[4]~47_combout\ & \CPU|address[3]~46_combout\ & \CPU|address[2]~45_combout\ & \CPU|address[1]~44_combout\ & \CPU|address[0]~43_combout\);

\Ram1|altsyncram_component|auto_generated|q_a\(2) <= \Ram1|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);
\Ram1|altsyncram_component|auto_generated|q_a\(3) <= \Ram1|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(1);

\Ram1|altsyncram_component|auto_generated|ram_block1a8_PORTADATAIN_bus\ <= (\data_bus_temp[9]~31_combout\ & \data_bus_temp[8]~28_combout\);

\Ram1|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\CPU|address[10]~40_combout\ & \CPU|address[9]~52_combout\ & \CPU|address[8]~51_combout\ & \CPU|address[7]~50_combout\ & \CPU|address[6]~49_combout\ & \CPU|address[5]~48_combout\ & 
\CPU|address[4]~47_combout\ & \CPU|address[3]~46_combout\ & \CPU|address[2]~45_combout\ & \CPU|address[1]~44_combout\ & \CPU|address[0]~43_combout\);

\Ram1|altsyncram_component|auto_generated|q_a\(8) <= \Ram1|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(0);
\Ram1|altsyncram_component|auto_generated|q_a\(9) <= \Ram1|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(1);

\ProgMem|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\CPU|address[9]~52_combout\ & \CPU|address[8]~51_combout\ & \CPU|address[7]~50_combout\ & \CPU|address[6]~49_combout\ & \CPU|address[5]~48_combout\ & \CPU|address[4]~47_combout\
& \CPU|address[3]~46_combout\ & \CPU|address[2]~45_combout\ & \CPU|address[1]~44_combout\ & \CPU|address[0]~43_combout\);

\ProgMem|altsyncram_component|auto_generated|q_a\(8) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(0);
\ProgMem|altsyncram_component|auto_generated|q_a\(9) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(1);
\ProgMem|altsyncram_component|auto_generated|q_a\(10) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(2);
\ProgMem|altsyncram_component|auto_generated|q_a\(11) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(3);

\Ram1|altsyncram_component|auto_generated|ram_block1a10_PORTADATAIN_bus\ <= (\data_bus_temp[11]~37_combout\ & \data_bus_temp[10]~34_combout\);

\Ram1|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\CPU|address[10]~40_combout\ & \CPU|address[9]~52_combout\ & \CPU|address[8]~51_combout\ & \CPU|address[7]~50_combout\ & \CPU|address[6]~49_combout\ & \CPU|address[5]~48_combout\
& \CPU|address[4]~47_combout\ & \CPU|address[3]~46_combout\ & \CPU|address[2]~45_combout\ & \CPU|address[1]~44_combout\ & \CPU|address[0]~43_combout\);

\Ram1|altsyncram_component|auto_generated|q_a\(10) <= \Ram1|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(0);
\Ram1|altsyncram_component|auto_generated|q_a\(11) <= \Ram1|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(1);

\Ram1|altsyncram_component|auto_generated|ram_block1a12_PORTADATAIN_bus\ <= (\data_bus_temp[13]~43_combout\ & \data_bus_temp[12]~40_combout\);

\Ram1|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (\CPU|address[10]~40_combout\ & \CPU|address[9]~52_combout\ & \CPU|address[8]~51_combout\ & \CPU|address[7]~50_combout\ & \CPU|address[6]~49_combout\ & \CPU|address[5]~48_combout\
& \CPU|address[4]~47_combout\ & \CPU|address[3]~46_combout\ & \CPU|address[2]~45_combout\ & \CPU|address[1]~44_combout\ & \CPU|address[0]~43_combout\);

\Ram1|altsyncram_component|auto_generated|q_a\(12) <= \Ram1|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\(0);
\Ram1|altsyncram_component|auto_generated|q_a\(13) <= \Ram1|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\(1);

\ProgMem|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (\CPU|address[9]~52_combout\ & \CPU|address[8]~51_combout\ & \CPU|address[7]~50_combout\ & \CPU|address[6]~49_combout\ & \CPU|address[5]~48_combout\ & \CPU|address[4]~47_combout\
& \CPU|address[3]~46_combout\ & \CPU|address[2]~45_combout\ & \CPU|address[1]~44_combout\ & \CPU|address[0]~43_combout\);

\ProgMem|altsyncram_component|auto_generated|q_a\(12) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\(0);
\ProgMem|altsyncram_component|auto_generated|q_a\(13) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\(1);
\ProgMem|altsyncram_component|auto_generated|q_a\(14) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\(2);
\ProgMem|altsyncram_component|auto_generated|q_a\(15) <= \ProgMem|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\(3);

\Ram1|altsyncram_component|auto_generated|ram_block1a14_PORTADATAIN_bus\ <= (\data_bus_temp[15]~49_combout\ & \data_bus_temp[14]~46_combout\);

\Ram1|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (\CPU|address[10]~40_combout\ & \CPU|address[9]~52_combout\ & \CPU|address[8]~51_combout\ & \CPU|address[7]~50_combout\ & \CPU|address[6]~49_combout\ & \CPU|address[5]~48_combout\
& \CPU|address[4]~47_combout\ & \CPU|address[3]~46_combout\ & \CPU|address[2]~45_combout\ & \CPU|address[1]~44_combout\ & \CPU|address[0]~43_combout\);

\Ram1|altsyncram_component|auto_generated|q_a\(14) <= \Ram1|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(0);
\Ram1|altsyncram_component|auto_generated|q_a\(15) <= \Ram1|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(1);

\lcd_out|CLK_400HZ~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \lcd_out|CLK_400HZ~regout\);

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);
\lcd_out|ALT_INV_LCD_E~regout\ <= NOT \lcd_out|LCD_E~regout\;
\lcd_out|ALT_INV_DATA_BUS_VALUE\(3) <= NOT \lcd_out|DATA_BUS_VALUE\(3);
\lcd_out|ALT_INV_DATA_BUS_VALUE\(4) <= NOT \lcd_out|DATA_BUS_VALUE\(4);
\lcd_out|ALT_INV_DATA_BUS_VALUE\(5) <= NOT \lcd_out|DATA_BUS_VALUE\(5);
\CPU|CU|ALT_INV_current_state.Reset~regout\ <= NOT \CPU|CU|current_state.Reset~regout\;
\CPU|CU|ALT_INV_current_state.Decode~regout\ <= NOT \CPU|CU|current_state.Decode~regout\;
\CPU|CU|ALT_INV_current_state.Execute~regout\ <= NOT \CPU|CU|current_state.Execute~regout\;
\CPU|CU|ALT_INV_Mem_wr~regout\ <= NOT \CPU|CU|Mem_wr~regout\;
\CPU|CU|ALT_INV_current_state.WB~regout\ <= NOT \CPU|CU|current_state.WB~regout\;
\ALT_INV_reset~combout\ <= NOT \reset~combout\;

-- Location: LCFF_X31_Y23_N25
\lcd_out|CLK_COUNT_400HZ[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[6]~33_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(6));

-- Location: LCFF_X31_Y22_N11
\lcd_out|CLK_COUNT_400HZ[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[15]~51_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(15));

-- Location: LCFF_X31_Y22_N13
\lcd_out|CLK_COUNT_400HZ[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[16]~53_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(16));

-- Location: LCFF_X31_Y22_N15
\lcd_out|CLK_COUNT_400HZ[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[17]~55_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(17));

-- Location: LCFF_X31_Y22_N17
\lcd_out|CLK_COUNT_400HZ[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[18]~57_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(18));

-- Location: LCFF_X31_Y22_N19
\lcd_out|CLK_COUNT_400HZ[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[19]~59_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(19));

-- Location: LCFF_X31_Y23_N13
\lcd_out|CLK_COUNT_400HZ[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[0]~20_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(0));

-- Location: LCCOMB_X31_Y23_N12
\lcd_out|CLK_COUNT_400HZ[0]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[0]~20_combout\ = \lcd_out|CLK_COUNT_400HZ\(0) $ (VCC)
-- \lcd_out|CLK_COUNT_400HZ[0]~21\ = CARRY(\lcd_out|CLK_COUNT_400HZ\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|CLK_COUNT_400HZ\(0),
	datad => VCC,
	combout => \lcd_out|CLK_COUNT_400HZ[0]~20_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[0]~21\);

-- Location: LCCOMB_X31_Y23_N24
\lcd_out|CLK_COUNT_400HZ[6]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[6]~33_combout\ = (\lcd_out|CLK_COUNT_400HZ\(6) & (\lcd_out|CLK_COUNT_400HZ[5]~32\ $ (GND))) # (!\lcd_out|CLK_COUNT_400HZ\(6) & (!\lcd_out|CLK_COUNT_400HZ[5]~32\ & VCC))
-- \lcd_out|CLK_COUNT_400HZ[6]~34\ = CARRY((\lcd_out|CLK_COUNT_400HZ\(6) & !\lcd_out|CLK_COUNT_400HZ[5]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|CLK_COUNT_400HZ\(6),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[5]~32\,
	combout => \lcd_out|CLK_COUNT_400HZ[6]~33_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[6]~34\);

-- Location: LCCOMB_X31_Y22_N8
\lcd_out|CLK_COUNT_400HZ[14]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[14]~49_combout\ = (\lcd_out|CLK_COUNT_400HZ\(14) & (\lcd_out|CLK_COUNT_400HZ[13]~48\ $ (GND))) # (!\lcd_out|CLK_COUNT_400HZ\(14) & (!\lcd_out|CLK_COUNT_400HZ[13]~48\ & VCC))
-- \lcd_out|CLK_COUNT_400HZ[14]~50\ = CARRY((\lcd_out|CLK_COUNT_400HZ\(14) & !\lcd_out|CLK_COUNT_400HZ[13]~48\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|CLK_COUNT_400HZ\(14),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[13]~48\,
	combout => \lcd_out|CLK_COUNT_400HZ[14]~49_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[14]~50\);

-- Location: LCCOMB_X31_Y22_N10
\lcd_out|CLK_COUNT_400HZ[15]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[15]~51_combout\ = (\lcd_out|CLK_COUNT_400HZ\(15) & (!\lcd_out|CLK_COUNT_400HZ[14]~50\)) # (!\lcd_out|CLK_COUNT_400HZ\(15) & ((\lcd_out|CLK_COUNT_400HZ[14]~50\) # (GND)))
-- \lcd_out|CLK_COUNT_400HZ[15]~52\ = CARRY((!\lcd_out|CLK_COUNT_400HZ[14]~50\) # (!\lcd_out|CLK_COUNT_400HZ\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|CLK_COUNT_400HZ\(15),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[14]~50\,
	combout => \lcd_out|CLK_COUNT_400HZ[15]~51_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[15]~52\);

-- Location: LCCOMB_X31_Y22_N12
\lcd_out|CLK_COUNT_400HZ[16]~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[16]~53_combout\ = (\lcd_out|CLK_COUNT_400HZ\(16) & (\lcd_out|CLK_COUNT_400HZ[15]~52\ $ (GND))) # (!\lcd_out|CLK_COUNT_400HZ\(16) & (!\lcd_out|CLK_COUNT_400HZ[15]~52\ & VCC))
-- \lcd_out|CLK_COUNT_400HZ[16]~54\ = CARRY((\lcd_out|CLK_COUNT_400HZ\(16) & !\lcd_out|CLK_COUNT_400HZ[15]~52\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|CLK_COUNT_400HZ\(16),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[15]~52\,
	combout => \lcd_out|CLK_COUNT_400HZ[16]~53_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[16]~54\);

-- Location: LCCOMB_X31_Y22_N14
\lcd_out|CLK_COUNT_400HZ[17]~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[17]~55_combout\ = (\lcd_out|CLK_COUNT_400HZ\(17) & (!\lcd_out|CLK_COUNT_400HZ[16]~54\)) # (!\lcd_out|CLK_COUNT_400HZ\(17) & ((\lcd_out|CLK_COUNT_400HZ[16]~54\) # (GND)))
-- \lcd_out|CLK_COUNT_400HZ[17]~56\ = CARRY((!\lcd_out|CLK_COUNT_400HZ[16]~54\) # (!\lcd_out|CLK_COUNT_400HZ\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|CLK_COUNT_400HZ\(17),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[16]~54\,
	combout => \lcd_out|CLK_COUNT_400HZ[17]~55_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[17]~56\);

-- Location: LCCOMB_X31_Y22_N16
\lcd_out|CLK_COUNT_400HZ[18]~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[18]~57_combout\ = (\lcd_out|CLK_COUNT_400HZ\(18) & (\lcd_out|CLK_COUNT_400HZ[17]~56\ $ (GND))) # (!\lcd_out|CLK_COUNT_400HZ\(18) & (!\lcd_out|CLK_COUNT_400HZ[17]~56\ & VCC))
-- \lcd_out|CLK_COUNT_400HZ[18]~58\ = CARRY((\lcd_out|CLK_COUNT_400HZ\(18) & !\lcd_out|CLK_COUNT_400HZ[17]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|CLK_COUNT_400HZ\(18),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[17]~56\,
	combout => \lcd_out|CLK_COUNT_400HZ[18]~57_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[18]~58\);

-- Location: LCCOMB_X31_Y22_N18
\lcd_out|CLK_COUNT_400HZ[19]~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[19]~59_combout\ = \lcd_out|CLK_COUNT_400HZ[18]~58\ $ (\lcd_out|CLK_COUNT_400HZ\(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \lcd_out|CLK_COUNT_400HZ\(19),
	cin => \lcd_out|CLK_COUNT_400HZ[18]~58\,
	combout => \lcd_out|CLK_COUNT_400HZ[19]~59_combout\);

-- Location: LCFF_X33_Y27_N25
\CPU|CU|const_out[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[4]~4_combout\,
	sdata => \CPU|CU|Selector100~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(4));

-- Location: M4K_X52_Y26
\Ram1|altsyncram_component|auto_generated|ram_block1a4\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "system_ram:Ram1|altsyncram:altsyncram_component|altsyncram_59a1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_width => 11,
	port_b_data_width => 2,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \CPU|CU|ALT_INV_Mem_wr~regout\,
	clk0 => \clk~clkctrl_outclk\,
	portadatain => \Ram1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \Ram1|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Ram1|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: M4K_X52_Y27
\ProgMem|altsyncram_component|auto_generated|ram_block1a4\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044545244440FFF724C0F002A00F90A0090000000000000000000000000000000000000000000000000000000000000000000000000000000F",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPU_chip.hex",
	init_file_layout => "port_a",
	logical_ram_name => "system_rom:ProgMem|altsyncram:altsyncram_component|altsyncram_ce71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 4,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \clk~clkctrl_outclk\,
	portaaddr => \ProgMem|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ProgMem|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: LCFF_X33_Y26_N11
\CPU|CU|AR[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[11]~11_combout\,
	sdata => \CPU|CU|Selector110~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(11));

-- Location: LCFF_X33_Y25_N23
\CPU|CU|SP[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[11]~40_combout\,
	sdata => \~GND~combout\,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(11));

-- Location: LCFF_X33_Y26_N5
\CPU|CU|AR[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[12]~12_combout\,
	sdata => \CPU|CU|Selector109~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(12));

-- Location: LCFF_X33_Y25_N25
\CPU|CU|SP[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[12]~42_combout\,
	sdata => \~GND~combout\,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(12));

-- Location: LCFF_X42_Y24_N9
\CPU|CU|ctl_wd[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|ctl_wd[12]~8_combout\,
	sdata => \CPU|CU|Selector76~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(12));

-- Location: LCFF_X33_Y25_N27
\CPU|CU|SP[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[13]~44_combout\,
	sdata => \~GND~combout\,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(13));

-- Location: LCFF_X33_Y25_N29
\CPU|CU|SP[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[14]~46_combout\,
	sdata => \~GND~combout\,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(14));

-- Location: LCFF_X33_Y25_N31
\CPU|CU|SP[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[15]~48_combout\,
	sdata => \~GND~combout\,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(15));

-- Location: LCFF_X33_Y26_N31
\CPU|CU|AR[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[13]~13_combout\,
	sdata => \CPU|CU|Selector108~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(13));

-- Location: LCFF_X33_Y26_N25
\CPU|CU|AR[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[14]~14_combout\,
	sdata => \CPU|CU|Selector107~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(14));

-- Location: LCFF_X33_Y26_N27
\CPU|CU|AR[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[15]~15_combout\,
	sdata => \CPU|CU|Selector106~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(15));

-- Location: LCFF_X35_Y26_N17
\CPU|CU|AR[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[0]~0_combout\,
	sdata => \CPU|CU|Selector121~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(0));

-- Location: LCFF_X35_Y25_N25
\CPU|CU|AR[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[5]~5_combout\,
	sdata => \CPU|CU|Selector116~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(5));

-- Location: LCFF_X34_Y27_N11
\CPU|CU|PC[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[5]~5_combout\,
	sdata => \CPU|CU|PC[5]~41_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(5));

-- Location: M4K_X26_Y23
\Ram1|altsyncram_component|auto_generated|ram_block1a6\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "system_ram:Ram1|altsyncram:altsyncram_component|altsyncram_59a1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_width => 11,
	port_b_data_width => 2,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \CPU|CU|ALT_INV_Mem_wr~regout\,
	clk0 => \clk~clkctrl_outclk\,
	portadatain => \Ram1|altsyncram_component|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \Ram1|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Ram1|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

-- Location: LCCOMB_X40_Y26_N0
\CPU|FNU|Fnc_unit|Add0~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~25_combout\ = ((\CPU|FNU|Mux8~combout\ $ (\CPU|FNU|Fnc_unit|Add0~24_combout\ $ (!\CPU|FNU|Fnc_unit|Add0~23\)))) # (GND)
-- \CPU|FNU|Fnc_unit|Add0~26\ = CARRY((\CPU|FNU|Mux8~combout\ & ((\CPU|FNU|Fnc_unit|Add0~24_combout\) # (!\CPU|FNU|Fnc_unit|Add0~23\))) # (!\CPU|FNU|Mux8~combout\ & (\CPU|FNU|Fnc_unit|Add0~24_combout\ & !\CPU|FNU|Fnc_unit|Add0~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~24_combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~23\,
	combout => \CPU|FNU|Fnc_unit|Add0~25_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~26\);

-- Location: M4K_X26_Y27
\ProgMem|altsyncram_component|auto_generated|ram_block1a0\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004C2F70FC58097F60E87F130008E714A020000000000000000000000000000000000000000000000000000000000000000000000000000000F",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPU_chip.hex",
	init_file_layout => "port_a",
	logical_ram_name => "system_rom:ProgMem|altsyncram:altsyncram_component|altsyncram_ce71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 4,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \clk~clkctrl_outclk\,
	portaaddr => \ProgMem|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ProgMem|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCFF_X34_Y27_N1
\CPU|CU|PC[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[0]~0_combout\,
	sdata => \CPU|CU|PC[0]~44_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(0));

-- Location: M4K_X26_Y26
\Ram1|altsyncram_component|auto_generated|ram_block1a8\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "system_ram:Ram1|altsyncram:altsyncram_component|altsyncram_59a1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_width => 11,
	port_b_data_width => 2,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \CPU|CU|ALT_INV_Mem_wr~regout\,
	clk0 => \clk~clkctrl_outclk\,
	portadatain => \Ram1|altsyncram_component|auto_generated|ram_block1a8_PORTADATAIN_bus\,
	portaaddr => \Ram1|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Ram1|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\);

-- Location: M4K_X52_Y28
\ProgMem|altsyncram_component|auto_generated|ram_block1a8\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000046303746B34B8BFC374BFC0000000000000000000000000000000000000000000000000000000000000000000000000000000F",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPU_chip.hex",
	init_file_layout => "port_a",
	logical_ram_name => "system_rom:ProgMem|altsyncram:altsyncram_component|altsyncram_ce71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 4,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \clk~clkctrl_outclk\,
	portaaddr => \ProgMem|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ProgMem|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\);

-- Location: M4K_X52_Y24
\Ram1|altsyncram_component|auto_generated|ram_block1a12\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "system_ram:Ram1|altsyncram:altsyncram_component|altsyncram_59a1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 12,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_width => 11,
	port_b_data_width => 2,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \CPU|CU|ALT_INV_Mem_wr~regout\,
	clk0 => \clk~clkctrl_outclk\,
	portadatain => \Ram1|altsyncram_component|auto_generated|ram_block1a12_PORTADATAIN_bus\,
	portaaddr => \Ram1|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Ram1|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\);

-- Location: M4K_X26_Y28
\ProgMem|altsyncram_component|auto_generated|ram_block1a12\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000444606624454517735514400000000000000000000000000000000000000000000000000000000000000000000000000000000F",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "CPU_chip.hex",
	init_file_layout => "port_a",
	logical_ram_name => "system_rom:ProgMem|altsyncram:altsyncram_component|altsyncram_ce71:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 12,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 1024,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_a_write_enable_clock => "none",
	port_b_address_width => 10,
	port_b_data_width => 4,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	clk0 => \clk~clkctrl_outclk\,
	portaaddr => \ProgMem|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ProgMem|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\);

-- Location: LCFF_X32_Y26_N7
\CPU|CU|PC[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[12]~12_combout\,
	sdata => \CPU|CU|PC[12]~52_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(12));

-- Location: LCCOMB_X40_Y26_N12
\CPU|FNU|Fnc_unit|Add0~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~46_combout\ = ((\CPU|FNU|Mux2~combout\ $ (\CPU|FNU|Fnc_unit|Add0~45_combout\ $ (!\CPU|FNU|Fnc_unit|Add0~44\)))) # (GND)
-- \CPU|FNU|Fnc_unit|Add0~47\ = CARRY((\CPU|FNU|Mux2~combout\ & ((\CPU|FNU|Fnc_unit|Add0~45_combout\) # (!\CPU|FNU|Fnc_unit|Add0~44\))) # (!\CPU|FNU|Mux2~combout\ & (\CPU|FNU|Fnc_unit|Add0~45_combout\ & !\CPU|FNU|Fnc_unit|Add0~44\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux2~combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~45_combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~44\,
	combout => \CPU|FNU|Fnc_unit|Add0~46_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~47\);

-- Location: LCFF_X32_Y25_N17
\CPU|CU|PC[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[14]~14_combout\,
	sdata => \CPU|CU|PC[14]~54_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(14));

-- Location: LCFF_X32_Y25_N27
\CPU|CU|PC[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[15]~15_combout\,
	sdata => \CPU|CU|PC[15]~55_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(15));

-- Location: LCCOMB_X33_Y27_N24
\CPU|CU|const_out[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[4]~4_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(4)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(4),
	datac => \CPU|CU|const_out\(4),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[4]~4_combout\);

-- Location: LCFF_X43_Y27_N17
\CPU|CU|IR[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector53~0_combout\,
	sdata => \data_bus_temp[12]~40_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(12));

-- Location: LCCOMB_X33_Y25_N20
\CPU|CU|SP[10]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[10]~36_combout\ = ((\CPU|CU|SP\(10) $ (\CPU|CU|current_state.Decode~regout\ $ (\CPU|CU|SP[9]~35\)))) # (GND)
-- \CPU|CU|SP[10]~37\ = CARRY((\CPU|CU|SP\(10) & ((!\CPU|CU|SP[9]~35\) # (!\CPU|CU|current_state.Decode~regout\))) # (!\CPU|CU|SP\(10) & (!\CPU|CU|current_state.Decode~regout\ & !\CPU|CU|SP[9]~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP\(10),
	datab => \CPU|CU|current_state.Decode~regout\,
	datad => VCC,
	cin => \CPU|CU|SP[9]~35\,
	combout => \CPU|CU|SP[10]~36_combout\,
	cout => \CPU|CU|SP[10]~37\);

-- Location: LCCOMB_X33_Y26_N10
\CPU|CU|AR[11]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[11]~11_combout\ = (\CPU|CU|op.ret~regout\ & (\data_bus_temp[11]~37_combout\)) # (!\CPU|CU|op.ret~regout\ & ((\CPU|CU|PC~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[11]~37_combout\,
	datab => \CPU|CU|op.ret~regout\,
	datad => \CPU|CU|PC~17_combout\,
	combout => \CPU|CU|AR[11]~11_combout\);

-- Location: LCCOMB_X33_Y25_N22
\CPU|CU|SP[11]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[11]~40_combout\ = (\CPU|CU|SP\(11) & ((\CPU|CU|current_state.Decode~regout\ & (!\CPU|CU|SP[10]~37\)) # (!\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|SP[10]~37\ & VCC)))) # (!\CPU|CU|SP\(11) & ((\CPU|CU|current_state.Decode~regout\ & 
-- ((\CPU|CU|SP[10]~37\) # (GND))) # (!\CPU|CU|current_state.Decode~regout\ & (!\CPU|CU|SP[10]~37\))))
-- \CPU|CU|SP[11]~41\ = CARRY((\CPU|CU|SP\(11) & (\CPU|CU|current_state.Decode~regout\ & !\CPU|CU|SP[10]~37\)) # (!\CPU|CU|SP\(11) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|SP[10]~37\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP\(11),
	datab => \CPU|CU|current_state.Decode~regout\,
	datad => VCC,
	cin => \CPU|CU|SP[10]~37\,
	combout => \CPU|CU|SP[11]~40_combout\,
	cout => \CPU|CU|SP[11]~41\);

-- Location: LCCOMB_X33_Y26_N4
\CPU|CU|AR[12]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[12]~12_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[12]~40_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC~18_combout\,
	datab => \CPU|CU|op.ret~regout\,
	datad => \data_bus_temp[12]~40_combout\,
	combout => \CPU|CU|AR[12]~12_combout\);

-- Location: LCCOMB_X33_Y25_N24
\CPU|CU|SP[12]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[12]~42_combout\ = ((\CPU|CU|SP\(12) $ (\CPU|CU|current_state.Decode~regout\ $ (\CPU|CU|SP[11]~41\)))) # (GND)
-- \CPU|CU|SP[12]~43\ = CARRY((\CPU|CU|SP\(12) & ((!\CPU|CU|SP[11]~41\) # (!\CPU|CU|current_state.Decode~regout\))) # (!\CPU|CU|SP\(12) & (!\CPU|CU|current_state.Decode~regout\ & !\CPU|CU|SP[11]~41\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP\(12),
	datab => \CPU|CU|current_state.Decode~regout\,
	datad => VCC,
	cin => \CPU|CU|SP[11]~41\,
	combout => \CPU|CU|SP[12]~42_combout\,
	cout => \CPU|CU|SP[12]~43\);

-- Location: LCFF_X40_Y25_N9
\CPU|CU|PSR[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PSR[0]~0_combout\,
	sdata => \CPU|CU|Selector67~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PSR\(0));

-- Location: LCCOMB_X33_Y29_N0
\CPU|CU|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~12_combout\ = (\CPU|CU|Add0~11_combout\ & (\CPU|CU|Add0~10_combout\ $ (VCC))) # (!\CPU|CU|Add0~11_combout\ & (\CPU|CU|Add0~10_combout\ & VCC))
-- \CPU|CU|Add0~13\ = CARRY((\CPU|CU|Add0~11_combout\ & \CPU|CU|Add0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~11_combout\,
	datab => \CPU|CU|Add0~10_combout\,
	datad => VCC,
	combout => \CPU|CU|Add0~12_combout\,
	cout => \CPU|CU|Add0~13\);

-- Location: LCCOMB_X33_Y29_N8
\CPU|CU|Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~20_combout\ = ((\CPU|CU|Add0~3_combout\ $ (\CPU|CU|Add0~2_combout\ $ (!\CPU|CU|Add0~19\)))) # (GND)
-- \CPU|CU|Add0~21\ = CARRY((\CPU|CU|Add0~3_combout\ & ((\CPU|CU|Add0~2_combout\) # (!\CPU|CU|Add0~19\))) # (!\CPU|CU|Add0~3_combout\ & (\CPU|CU|Add0~2_combout\ & !\CPU|CU|Add0~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~3_combout\,
	datab => \CPU|CU|Add0~2_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~19\,
	combout => \CPU|CU|Add0~20_combout\,
	cout => \CPU|CU|Add0~21\);

-- Location: LCCOMB_X42_Y24_N8
\CPU|CU|ctl_wd[12]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd[12]~8_combout\ = (\CPU|CU|IR\(15) & (\CPU|CU|ctl_wd\(12))) # (!\CPU|CU|IR\(15) & ((\CPU|CU|ctl_wd~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|IR\(15),
	datac => \CPU|CU|ctl_wd\(12),
	datad => \CPU|CU|ctl_wd~30_combout\,
	combout => \CPU|CU|ctl_wd[12]~8_combout\);

-- Location: LCCOMB_X33_Y25_N26
\CPU|CU|SP[13]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[13]~44_combout\ = (\CPU|CU|SP\(13) & ((\CPU|CU|current_state.Decode~regout\ & (!\CPU|CU|SP[12]~43\)) # (!\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|SP[12]~43\ & VCC)))) # (!\CPU|CU|SP\(13) & ((\CPU|CU|current_state.Decode~regout\ & 
-- ((\CPU|CU|SP[12]~43\) # (GND))) # (!\CPU|CU|current_state.Decode~regout\ & (!\CPU|CU|SP[12]~43\))))
-- \CPU|CU|SP[13]~45\ = CARRY((\CPU|CU|SP\(13) & (\CPU|CU|current_state.Decode~regout\ & !\CPU|CU|SP[12]~43\)) # (!\CPU|CU|SP\(13) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|SP[12]~43\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP\(13),
	datab => \CPU|CU|current_state.Decode~regout\,
	datad => VCC,
	cin => \CPU|CU|SP[12]~43\,
	combout => \CPU|CU|SP[13]~44_combout\,
	cout => \CPU|CU|SP[13]~45\);

-- Location: LCCOMB_X33_Y25_N28
\CPU|CU|SP[14]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[14]~46_combout\ = ((\CPU|CU|SP\(14) $ (\CPU|CU|current_state.Decode~regout\ $ (\CPU|CU|SP[13]~45\)))) # (GND)
-- \CPU|CU|SP[14]~47\ = CARRY((\CPU|CU|SP\(14) & ((!\CPU|CU|SP[13]~45\) # (!\CPU|CU|current_state.Decode~regout\))) # (!\CPU|CU|SP\(14) & (!\CPU|CU|current_state.Decode~regout\ & !\CPU|CU|SP[13]~45\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP\(14),
	datab => \CPU|CU|current_state.Decode~regout\,
	datad => VCC,
	cin => \CPU|CU|SP[13]~45\,
	combout => \CPU|CU|SP[14]~46_combout\,
	cout => \CPU|CU|SP[14]~47\);

-- Location: LCCOMB_X33_Y25_N30
\CPU|CU|SP[15]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[15]~48_combout\ = \CPU|CU|SP\(15) $ (\CPU|CU|SP[14]~47\ $ (!\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|SP\(15),
	datad => \CPU|CU|current_state.Decode~regout\,
	cin => \CPU|CU|SP[14]~47\,
	combout => \CPU|CU|SP[15]~48_combout\);

-- Location: LCCOMB_X33_Y26_N30
\CPU|CU|AR[13]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[13]~13_combout\ = (\CPU|CU|op.ret~regout\ & (\data_bus_temp[13]~43_combout\)) # (!\CPU|CU|op.ret~regout\ & ((\CPU|CU|PC~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[13]~43_combout\,
	datab => \CPU|CU|PC~29_combout\,
	datad => \CPU|CU|op.ret~regout\,
	combout => \CPU|CU|AR[13]~13_combout\);

-- Location: LCCOMB_X33_Y26_N24
\CPU|CU|AR[14]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[14]~14_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[14]~46_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC~30_combout\,
	datab => \CPU|CU|op.ret~regout\,
	datad => \data_bus_temp[14]~46_combout\,
	combout => \CPU|CU|AR[14]~14_combout\);

-- Location: LCCOMB_X33_Y26_N26
\CPU|CU|AR[15]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[15]~15_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[15]~49_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC~31_combout\,
	datab => \CPU|CU|op.ret~regout\,
	datad => \data_bus_temp[15]~49_combout\,
	combout => \CPU|CU|AR[15]~15_combout\);

-- Location: LCCOMB_X35_Y26_N16
\CPU|CU|AR[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[0]~0_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[0]~16_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ret~regout\,
	datab => \CPU|CU|PC~32_combout\,
	datad => \data_bus_temp[0]~16_combout\,
	combout => \CPU|CU|AR[0]~0_combout\);

-- Location: LCCOMB_X35_Y25_N24
\CPU|CU|AR[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[5]~5_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[5]~7_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~36_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ret~regout\,
	datab => \CPU|CU|PC~36_combout\,
	datad => \data_bus_temp[5]~7_combout\,
	combout => \CPU|CU|AR[5]~5_combout\);

-- Location: LCFF_X35_Y28_N29
\CPU|CU|offset[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|offset[7]~7_combout\,
	sdata => \CPU|CU|Selector131~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(7));

-- Location: LCCOMB_X34_Y27_N10
\CPU|CU|PC[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[5]~5_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~36_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[5]~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC[10]~24_combout\,
	datab => \CPU|CU|PC~36_combout\,
	datad => \data_bus_temp[5]~7_combout\,
	combout => \CPU|CU|PC[5]~5_combout\);

-- Location: LCCOMB_X33_Y29_N10
\CPU|CU|Add0~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~24_combout\ = (\CPU|CU|Add0~23_combout\ & ((\CPU|CU|Add0~22_combout\ & (\CPU|CU|Add0~21\ & VCC)) # (!\CPU|CU|Add0~22_combout\ & (!\CPU|CU|Add0~21\)))) # (!\CPU|CU|Add0~23_combout\ & ((\CPU|CU|Add0~22_combout\ & (!\CPU|CU|Add0~21\)) # 
-- (!\CPU|CU|Add0~22_combout\ & ((\CPU|CU|Add0~21\) # (GND)))))
-- \CPU|CU|Add0~25\ = CARRY((\CPU|CU|Add0~23_combout\ & (!\CPU|CU|Add0~22_combout\ & !\CPU|CU|Add0~21\)) # (!\CPU|CU|Add0~23_combout\ & ((!\CPU|CU|Add0~21\) # (!\CPU|CU|Add0~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~23_combout\,
	datab => \CPU|CU|Add0~22_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~21\,
	combout => \CPU|CU|Add0~24_combout\,
	cout => \CPU|CU|Add0~25\);

-- Location: LCCOMB_X34_Y27_N0
\CPU|CU|PC[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[0]~0_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~32_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[0]~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC[10]~24_combout\,
	datab => \CPU|CU|PC~32_combout\,
	datad => \data_bus_temp[0]~16_combout\,
	combout => \CPU|CU|PC[0]~0_combout\);

-- Location: LCCOMB_X32_Y26_N6
\CPU|CU|PC[12]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[12]~12_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~18_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[12]~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC~18_combout\,
	datab => \CPU|CU|PC[10]~24_combout\,
	datad => \data_bus_temp[12]~40_combout\,
	combout => \CPU|CU|PC[12]~12_combout\);

-- Location: LCCOMB_X33_Y29_N24
\CPU|CU|Add0~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~52_combout\ = ((\CPU|CU|Add0~50_combout\ $ (\CPU|CU|Add0~51_combout\ $ (!\CPU|CU|Add0~49\)))) # (GND)
-- \CPU|CU|Add0~53\ = CARRY((\CPU|CU|Add0~50_combout\ & ((\CPU|CU|Add0~51_combout\) # (!\CPU|CU|Add0~49\))) # (!\CPU|CU|Add0~50_combout\ & (\CPU|CU|Add0~51_combout\ & !\CPU|CU|Add0~49\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~50_combout\,
	datab => \CPU|CU|Add0~51_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~49\,
	combout => \CPU|CU|Add0~52_combout\,
	cout => \CPU|CU|Add0~53\);

-- Location: LCCOMB_X33_Y29_N26
\CPU|CU|Add0~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~56_combout\ = (\CPU|CU|Add0~54_combout\ & ((\CPU|CU|Add0~55_combout\ & (\CPU|CU|Add0~53\ & VCC)) # (!\CPU|CU|Add0~55_combout\ & (!\CPU|CU|Add0~53\)))) # (!\CPU|CU|Add0~54_combout\ & ((\CPU|CU|Add0~55_combout\ & (!\CPU|CU|Add0~53\)) # 
-- (!\CPU|CU|Add0~55_combout\ & ((\CPU|CU|Add0~53\) # (GND)))))
-- \CPU|CU|Add0~57\ = CARRY((\CPU|CU|Add0~54_combout\ & (!\CPU|CU|Add0~55_combout\ & !\CPU|CU|Add0~53\)) # (!\CPU|CU|Add0~54_combout\ & ((!\CPU|CU|Add0~53\) # (!\CPU|CU|Add0~55_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~54_combout\,
	datab => \CPU|CU|Add0~55_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~53\,
	combout => \CPU|CU|Add0~56_combout\,
	cout => \CPU|CU|Add0~57\);

-- Location: LCCOMB_X32_Y25_N16
\CPU|CU|PC[14]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[14]~14_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~30_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[14]~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC~30_combout\,
	datab => \data_bus_temp[14]~46_combout\,
	datad => \CPU|CU|PC[10]~24_combout\,
	combout => \CPU|CU|PC[14]~14_combout\);

-- Location: LCCOMB_X33_Y29_N28
\CPU|CU|Add0~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~60_combout\ = ((\CPU|CU|Add0~58_combout\ $ (\CPU|CU|Add0~59_combout\ $ (!\CPU|CU|Add0~57\)))) # (GND)
-- \CPU|CU|Add0~61\ = CARRY((\CPU|CU|Add0~58_combout\ & ((\CPU|CU|Add0~59_combout\) # (!\CPU|CU|Add0~57\))) # (!\CPU|CU|Add0~58_combout\ & (\CPU|CU|Add0~59_combout\ & !\CPU|CU|Add0~57\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~58_combout\,
	datab => \CPU|CU|Add0~59_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~57\,
	combout => \CPU|CU|Add0~60_combout\,
	cout => \CPU|CU|Add0~61\);

-- Location: LCCOMB_X32_Y25_N26
\CPU|CU|PC[15]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[15]~15_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~31_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[15]~49_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC[10]~24_combout\,
	datab => \CPU|CU|PC~31_combout\,
	datad => \data_bus_temp[15]~49_combout\,
	combout => \CPU|CU|PC[15]~15_combout\);

-- Location: LCCOMB_X33_Y29_N30
\CPU|CU|Add0~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~64_combout\ = \CPU|CU|Add0~63_combout\ $ (\CPU|CU|Add0~61\ $ (\CPU|CU|Add0~62_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~63_combout\,
	datad => \CPU|CU|Add0~62_combout\,
	cin => \CPU|CU|Add0~61\,
	combout => \CPU|CU|Add0~64_combout\);

-- Location: LCCOMB_X40_Y25_N8
\CPU|CU|PSR[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PSR[0]~0_combout\ = (\CPU|CU|main~2_combout\ & ((\CPU|FNU|Fnc_unit|Equal0~8_combout\))) # (!\CPU|CU|main~2_combout\ & (\CPU|CU|PSR\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|main~2_combout\,
	datac => \CPU|CU|PSR\(0),
	datad => \CPU|FNU|Fnc_unit|Equal0~8_combout\,
	combout => \CPU|CU|PSR[0]~0_combout\);

-- Location: LCCOMB_X35_Y28_N28
\CPU|CU|offset[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset[7]~7_combout\ = (\CPU|CU|offset~45_combout\ & (\CPU|CU|IR\(7))) # (!\CPU|CU|offset~45_combout\ & ((\CPU|CU|offset~39_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(7),
	datab => \CPU|CU|offset~45_combout\,
	datad => \CPU|CU|offset~39_combout\,
	combout => \CPU|CU|offset[7]~7_combout\);

-- Location: LCCOMB_X32_Y23_N12
\lcd_out|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|LessThan0~1_combout\ = (!\lcd_out|CLK_COUNT_400HZ\(8) & (!\lcd_out|CLK_COUNT_400HZ\(6) & (!\lcd_out|CLK_COUNT_400HZ\(9) & !\lcd_out|CLK_COUNT_400HZ\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|CLK_COUNT_400HZ\(8),
	datab => \lcd_out|CLK_COUNT_400HZ\(6),
	datac => \lcd_out|CLK_COUNT_400HZ\(9),
	datad => \lcd_out|CLK_COUNT_400HZ\(7),
	combout => \lcd_out|LessThan0~1_combout\);

-- Location: LCCOMB_X32_Y23_N16
\lcd_out|LessThan0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|LessThan0~4_combout\ = (!\lcd_out|CLK_COUNT_400HZ\(16) & (!\lcd_out|CLK_COUNT_400HZ\(19) & (!\lcd_out|CLK_COUNT_400HZ\(17) & !\lcd_out|CLK_COUNT_400HZ\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|CLK_COUNT_400HZ\(16),
	datab => \lcd_out|CLK_COUNT_400HZ\(19),
	datac => \lcd_out|CLK_COUNT_400HZ\(17),
	datad => \lcd_out|CLK_COUNT_400HZ\(18),
	combout => \lcd_out|LessThan0~4_combout\);

-- Location: LCFF_X41_Y23_N25
\CPU|FNU|R3|data_out[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[6]~4_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(6));

-- Location: LCFF_X36_Y25_N17
\CPU|FNU|R1|data_out[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[7]~6_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(7));

-- Location: LCFF_X37_Y23_N5
\display_buf[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \data_bus_temp[7]~13_combout\,
	sload => VCC,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(7));

-- Location: LCFF_X40_Y23_N11
\CPU|FNU|R2|data_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R2|data_out[0]~feeder_combout\,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(0));

-- Location: LCFF_X33_Y23_N23
\lcd_out|state.DISPLAY_CLEAR\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~44_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.DISPLAY_CLEAR~regout\);

-- Location: LCCOMB_X35_Y24_N10
\lcd_out|Selector9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector9~1_combout\ = (\lcd_out|state.DISPLAY_CLEAR~regout\) # ((\lcd_out|DATA_BUS_VALUE\(0) & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datab => \lcd_out|DATA_BUS_VALUE\(0),
	datac => \lcd_out|state.TOGGLE_E~regout\,
	datad => \lcd_out|state.DISPLAY_CLEAR~regout\,
	combout => \lcd_out|Selector9~1_combout\);

-- Location: LCCOMB_X38_Y26_N16
\DisplayReg[10]~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[10]~50_combout\ = (\reg_select~combout\(2) & (\reg_select~combout\(1))) # (!\reg_select~combout\(2) & ((\reg_select~combout\(1) & ((\CPU|FNU|R3|data_out\(10)))) # (!\reg_select~combout\(1) & (\CPU|FNU|R1|data_out\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \reg_select~combout\(1),
	datac => \CPU|FNU|R1|data_out\(10),
	datad => \CPU|FNU|R3|data_out\(10),
	combout => \DisplayReg[10]~50_combout\);

-- Location: LCFF_X41_Y26_N11
\CPU|FNU|R5|data_out[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[11]~16_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(11));

-- Location: LCCOMB_X34_Y23_N16
\lcd_out|Selector7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector7~2_combout\ = (\lcd_out|state.DISPLAY_ON~regout\) # ((\lcd_out|DATA_BUS_VALUE\(2) & ((\lcd_out|state.TOGGLE_E~regout\) # (\lcd_out|state.HOLD~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.TOGGLE_E~regout\,
	datab => \lcd_out|state.DISPLAY_ON~regout\,
	datac => \lcd_out|state.HOLD~regout\,
	datad => \lcd_out|DATA_BUS_VALUE\(2),
	combout => \lcd_out|Selector7~2_combout\);

-- Location: LCFF_X35_Y23_N3
\lcd_out|state.DISPLAY_OFF\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~46_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.DISPLAY_OFF~regout\);

-- Location: LCCOMB_X34_Y23_N12
\lcd_out|Selector6~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector6~5_combout\ = (\lcd_out|state.WRITE_CHAR3~regout\ & (\DisplayReg[15]~79_combout\ & (!\DisplayReg[13]~69_combout\ & !\DisplayReg[14]~74_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.WRITE_CHAR3~regout\,
	datab => \DisplayReg[15]~79_combout\,
	datac => \DisplayReg[13]~69_combout\,
	datad => \DisplayReg[14]~74_combout\,
	combout => \lcd_out|Selector6~5_combout\);

-- Location: LCFF_X35_Y23_N21
\lcd_out|state.RESET1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state.RESET1~feeder_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.RESET1~regout\);

-- Location: LCCOMB_X35_Y23_N8
\lcd_out|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector4~0_combout\ = (\lcd_out|state.WRITE_CHAR6~regout\ & (((!\DisplayReg[2]~34_combout\ & !\DisplayReg[1]~29_combout\)) # (!\DisplayReg[3]~39_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[2]~34_combout\,
	datab => \lcd_out|state.WRITE_CHAR6~regout\,
	datac => \DisplayReg[1]~29_combout\,
	datad => \DisplayReg[3]~39_combout\,
	combout => \lcd_out|Selector4~0_combout\);

-- Location: LCCOMB_X36_Y23_N20
\lcd_out|Selector3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector3~4_combout\ = (\lcd_out|state.WRITE_CHAR3~regout\ & (\DisplayReg[15]~79_combout\ & ((\DisplayReg[13]~69_combout\) # (\DisplayReg[14]~74_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.WRITE_CHAR3~regout\,
	datab => \DisplayReg[13]~69_combout\,
	datac => \DisplayReg[15]~79_combout\,
	datad => \DisplayReg[14]~74_combout\,
	combout => \lcd_out|Selector3~4_combout\);

-- Location: LCCOMB_X40_Y27_N12
\CPU|FNU|Fnc_unit|Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~1_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(4))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[4]~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(9),
	datab => \CPU|CU|const_out\(4),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[4]~6_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~1_combout\);

-- Location: LCCOMB_X35_Y27_N18
\CPU|FNU|Bbus[2]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[2]~14_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[2]~13_combout\ & ((\CPU|FNU|R3|data_out\(2)))) # (!\CPU|FNU|Bbus[2]~13_combout\ & (\CPU|FNU|R2|data_out\(2))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[2]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(2),
	datab => \CPU|FNU|Bbus[12]~0_combout\,
	datac => \CPU|FNU|Bbus[2]~13_combout\,
	datad => \CPU|FNU|R3|data_out\(2),
	combout => \CPU|FNU|Bbus[2]~14_combout\);

-- Location: LCCOMB_X35_Y27_N20
\CPU|FNU|Fnc_unit|Add0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~3_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(2))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[2]~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(13),
	datab => \CPU|CU|const_out\(2),
	datac => \CPU|CU|ctl_wd\(9),
	datad => \CPU|FNU|Bbus[2]~14_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~3_combout\);

-- Location: LCCOMB_X43_Y24_N6
\CPU|FNU|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux10~0_combout\ = (\CPU|CU|ctl_wd\(4) & (((\CPU|CU|ctl_wd\(3))))) # (!\CPU|CU|ctl_wd\(4) & ((\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|R5|data_out\(5)))) # (!\CPU|CU|ctl_wd\(3) & (\CPU|FNU|R4|data_out\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R4|data_out\(5),
	datab => \CPU|FNU|R5|data_out\(5),
	datac => \CPU|CU|ctl_wd\(4),
	datad => \CPU|CU|ctl_wd\(3),
	combout => \CPU|FNU|Mux10~0_combout\);

-- Location: LCCOMB_X43_Y24_N16
\CPU|FNU|Mux10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux10~1_combout\ = (\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|Mux10~0_combout\ & ((\CPU|FNU|R7|data_out\(5)))) # (!\CPU|FNU|Mux10~0_combout\ & (\CPU|FNU|R6|data_out\(5))))) # (!\CPU|CU|ctl_wd\(4) & (((\CPU|FNU|Mux10~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R6|data_out\(5),
	datab => \CPU|CU|ctl_wd\(4),
	datac => \CPU|FNU|R7|data_out\(5),
	datad => \CPU|FNU|Mux10~0_combout\,
	combout => \CPU|FNU|Mux10~1_combout\);

-- Location: LCCOMB_X36_Y26_N10
\CPU|address[11]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[11]~28_combout\ = (\CPU|CU|AR_EN~regout\ & (\CPU|CU|AR\(11))) # (!\CPU|CU|AR_EN~regout\ & (((\CPU|CU|SP\(11)) # (!\CPU|CU|SP_EN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|AR\(11),
	datab => \CPU|CU|AR_EN~regout\,
	datac => \CPU|CU|SP\(11),
	datad => \CPU|CU|SP_EN~regout\,
	combout => \CPU|address[11]~28_combout\);

-- Location: LCCOMB_X34_Y25_N2
\CPU|address[12]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[12]~29_combout\ = (\CPU|CU|AR_EN~regout\ & (((\CPU|CU|AR\(12))))) # (!\CPU|CU|AR_EN~regout\ & ((\CPU|CU|SP\(12)) # ((!\CPU|CU|SP_EN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|AR_EN~regout\,
	datab => \CPU|CU|SP\(12),
	datac => \CPU|CU|SP_EN~regout\,
	datad => \CPU|CU|AR\(12),
	combout => \CPU|address[12]~29_combout\);

-- Location: LCCOMB_X34_Y25_N4
\Equal12~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal12~1_combout\ = (!\CPU|CU|ld_op~regout\ & (!\CPU|CU|st_op~regout\ & ((\CPU|CU|AR_EN~regout\) # (\CPU|CU|SP_EN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|AR_EN~regout\,
	datab => \CPU|CU|ld_op~regout\,
	datac => \CPU|CU|SP_EN~regout\,
	datad => \CPU|CU|st_op~regout\,
	combout => \Equal12~1_combout\);

-- Location: LCCOMB_X34_Y25_N30
\Equal12~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal12~2_combout\ = (!\CPU|CU|AR_EN~regout\ & (!\CPU|CU|SP\(14) & (!\CPU|CU|SP\(15) & !\CPU|CU|SP\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|AR_EN~regout\,
	datab => \CPU|CU|SP\(14),
	datac => \CPU|CU|SP\(15),
	datad => \CPU|CU|SP\(13),
	combout => \Equal12~2_combout\);

-- Location: LCCOMB_X34_Y25_N0
\Equal12~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal12~3_combout\ = (\CPU|CU|AR_EN~regout\ & (!\CPU|CU|AR\(15) & (!\CPU|CU|AR\(13) & !\CPU|CU|AR\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|AR_EN~regout\,
	datab => \CPU|CU|AR\(15),
	datac => \CPU|CU|AR\(13),
	datad => \CPU|CU|AR\(14),
	combout => \Equal12~3_combout\);

-- Location: LCCOMB_X34_Y25_N10
\Equal12~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal12~4_combout\ = (\Equal12~1_combout\ & ((\Equal12~2_combout\) # (\Equal12~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal12~2_combout\,
	datac => \Equal12~1_combout\,
	datad => \Equal12~3_combout\,
	combout => \Equal12~4_combout\);

-- Location: LCCOMB_X34_Y25_N6
\CPU|address[0]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[0]~30_combout\ = (\CPU|CU|AR_EN~regout\ & (((\CPU|CU|AR\(0))))) # (!\CPU|CU|AR_EN~regout\ & ((\CPU|CU|SP\(0)) # ((!\CPU|CU|SP_EN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP\(0),
	datab => \CPU|CU|AR\(0),
	datac => \CPU|CU|SP_EN~regout\,
	datad => \CPU|CU|AR_EN~regout\,
	combout => \CPU|address[0]~30_combout\);

-- Location: LCCOMB_X35_Y25_N6
\CPU|address[5]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[5]~35_combout\ = (\CPU|CU|AR_EN~regout\ & (\CPU|CU|AR\(5))) # (!\CPU|CU|AR_EN~regout\ & (((\CPU|CU|SP\(5)) # (!\CPU|CU|SP_EN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|AR\(5),
	datab => \CPU|CU|SP_EN~regout\,
	datac => \CPU|CU|AR_EN~regout\,
	datad => \CPU|CU|SP\(5),
	combout => \CPU|address[5]~35_combout\);

-- Location: LCCOMB_X35_Y25_N16
\Equal12~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal12~7_combout\ = (!\CPU|address[5]~48_combout\ & (!\CPU|address[4]~47_combout\ & (!\CPU|address[6]~49_combout\ & !\CPU|address[3]~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|address[5]~48_combout\,
	datab => \CPU|address[4]~47_combout\,
	datac => \CPU|address[6]~49_combout\,
	datad => \CPU|address[3]~46_combout\,
	combout => \Equal12~7_combout\);

-- Location: LCCOMB_X37_Y23_N16
\data_bus_temp[0]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[0]~15_combout\ = (\CPU|CU|PCd_EN~regout\ & (\CPU|CU|PC\(0) & ((\CPU|FNU|Bbus[0]~42_combout\) # (!\CPU|CU|st_op~regout\)))) # (!\CPU|CU|PCd_EN~regout\ & (((\CPU|FNU|Bbus[0]~42_combout\) # (!\CPU|CU|st_op~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PCd_EN~regout\,
	datab => \CPU|CU|PC\(0),
	datac => \CPU|FNU|Bbus[0]~42_combout\,
	datad => \CPU|CU|st_op~regout\,
	combout => \data_bus_temp[0]~15_combout\);

-- Location: LCCOMB_X40_Y23_N16
\CPU|FNU|Fnc_unit|Add0~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~27_combout\ = (\CPU|CU|ctl_wd\(6) & (\CPU|FNU|Mux15~combout\ & \CPU|FNU|Bbus[0]~42_combout\)) # (!\CPU|CU|ctl_wd\(6) & (!\CPU|FNU|Mux15~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(6),
	datac => \CPU|FNU|Mux15~combout\,
	datad => \CPU|FNU|Bbus[0]~42_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~27_combout\);

-- Location: LCCOMB_X41_Y23_N12
\CPU|FNU|Fnc_unit|Mux15~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux15~2_combout\ = (\CPU|FNU|Mux15~combout\ & (((\CPU|CU|ctl_wd\(8)) # (\CPU|CU|ctl_wd\(7))) # (!\CPU|CU|ctl_wd\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux15~combout\,
	datab => \CPU|CU|ctl_wd\(6),
	datac => \CPU|CU|ctl_wd\(8),
	datad => \CPU|CU|ctl_wd\(7),
	combout => \CPU|FNU|Fnc_unit|Mux15~2_combout\);

-- Location: LCCOMB_X37_Y29_N8
\data_bus_temp[1]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[1]~18_combout\ = (\CPU|CU|PC\(1) & ((\CPU|FNU|Bbus[1]~43_combout\) # ((!\CPU|CU|st_op~regout\)))) # (!\CPU|CU|PC\(1) & (!\CPU|CU|PCd_EN~regout\ & ((\CPU|FNU|Bbus[1]~43_combout\) # (!\CPU|CU|st_op~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(1),
	datab => \CPU|FNU|Bbus[1]~43_combout\,
	datac => \CPU|CU|PCd_EN~regout\,
	datad => \CPU|CU|st_op~regout\,
	combout => \data_bus_temp[1]~18_combout\);

-- Location: LCCOMB_X35_Y27_N28
\CPU|FNU|Fnc_unit|F_temp~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|F_temp~2_combout\ = (\CPU|FNU|Mux13~combout\) # ((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(2))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[2]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux13~combout\,
	datab => \CPU|CU|const_out\(2),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[2]~14_combout\,
	combout => \CPU|FNU|Fnc_unit|F_temp~2_combout\);

-- Location: LCCOMB_X36_Y27_N0
\CPU|FNU|Fnc_unit|Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux13~0_combout\ = (\CPU|FNU|Fnc_unit|Mux3~2_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~3_combout\) # ((\CPU|FNU|Bbus[2]~45_combout\ & \CPU|FNU|Mux13~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & 
-- ((!\CPU|FNU|Mux13~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datac => \CPU|FNU|Bbus[2]~45_combout\,
	datad => \CPU|FNU|Mux13~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux13~0_combout\);

-- Location: LCCOMB_X36_Y27_N18
\CPU|FNU|Fnc_unit|Mux13~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux13~1_combout\ = (\CPU|FNU|Fnc_unit|Mux3~3_combout\ & ((\CPU|FNU|Fnc_unit|Mux13~0_combout\ & (\CPU|FNU|Bbus[2]~45_combout\)) # (!\CPU|FNU|Fnc_unit|Mux13~0_combout\ & ((\CPU|FNU|Mux14~combout\))))) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ 
-- & (((\CPU|FNU|Fnc_unit|Mux13~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[2]~45_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datac => \CPU|FNU|Mux14~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux13~0_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux13~1_combout\);

-- Location: LCCOMB_X36_Y27_N4
\CPU|FNU|Fnc_unit|Mux13~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux13~2_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|F_temp~2_combout\) # ((\CPU|FNU|Fnc_unit|Mux3~1_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (((!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- \CPU|FNU|Fnc_unit|Mux13~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datab => \CPU|FNU|Fnc_unit|F_temp~2_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux13~1_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux13~2_combout\);

-- Location: LCCOMB_X36_Y27_N6
\CPU|FNU|Fnc_unit|Mux13~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux13~3_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux13~2_combout\ & ((\CPU|FNU|Mux13~combout\))) # (!\CPU|FNU|Fnc_unit|Mux13~2_combout\ & (\CPU|FNU|Mux12~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux13~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Mux12~combout\,
	datac => \CPU|FNU|Fnc_unit|Mux13~2_combout\,
	datad => \CPU|FNU|Mux13~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux13~3_combout\);

-- Location: LCCOMB_X36_Y27_N30
\CPU|FNU|Fnc_unit|Mux12~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux12~6_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|Mux12~4_combout\))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (\CPU|FNU|Mux11~combout\)))) # 
-- (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (((\CPU|FNU|Fnc_unit|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Mux11~combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux12~4_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux12~6_combout\);

-- Location: LCFF_X33_Y23_N7
\lcd_out|next_command.DISPLAY_CLEAR\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector25~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.DISPLAY_CLEAR~regout\);

-- Location: LCCOMB_X33_Y23_N22
\lcd_out|state~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~44_combout\ = (\lcd_out|state.HOLD~regout\ & \lcd_out|next_command.DISPLAY_CLEAR~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lcd_out|state.HOLD~regout\,
	datad => \lcd_out|next_command.DISPLAY_CLEAR~regout\,
	combout => \lcd_out|state~44_combout\);

-- Location: LCCOMB_X37_Y24_N4
\data_bus_temp[9]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[9]~30_combout\ = (\CPU|CU|PCd_EN~regout\ & (\CPU|CU|PC\(9) & ((\CPU|FNU|Bbus[9]~59_combout\) # (!\CPU|CU|st_op~regout\)))) # (!\CPU|CU|PCd_EN~regout\ & (((\CPU|FNU|Bbus[9]~59_combout\)) # (!\CPU|CU|st_op~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PCd_EN~regout\,
	datab => \CPU|CU|st_op~regout\,
	datac => \CPU|CU|PC\(9),
	datad => \CPU|FNU|Bbus[9]~59_combout\,
	combout => \data_bus_temp[9]~30_combout\);

-- Location: LCCOMB_X36_Y24_N16
\data_bus_temp[10]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[10]~33_combout\ = (\CPU|CU|PC\(10) & (((\CPU|FNU|Bbus[10]~64_combout\) # (!\CPU|CU|st_op~regout\)))) # (!\CPU|CU|PC\(10) & (!\CPU|CU|PCd_EN~regout\ & ((\CPU|FNU|Bbus[10]~64_combout\) # (!\CPU|CU|st_op~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(10),
	datab => \CPU|CU|PCd_EN~regout\,
	datac => \CPU|CU|st_op~regout\,
	datad => \CPU|FNU|Bbus[10]~64_combout\,
	combout => \data_bus_temp[10]~33_combout\);

-- Location: LCCOMB_X36_Y26_N18
\data_bus_temp[11]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[11]~36_combout\ = (\CPU|CU|PCd_EN~regout\ & (\CPU|CU|PC\(11) & ((\CPU|FNU|Bbus[11]~70_combout\) # (!\CPU|CU|st_op~regout\)))) # (!\CPU|CU|PCd_EN~regout\ & (((\CPU|FNU|Bbus[11]~70_combout\) # (!\CPU|CU|st_op~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PCd_EN~regout\,
	datab => \CPU|CU|PC\(11),
	datac => \CPU|FNU|Bbus[11]~70_combout\,
	datad => \CPU|CU|st_op~regout\,
	combout => \data_bus_temp[11]~36_combout\);

-- Location: LCCOMB_X43_Y25_N30
\data_bus_temp[14]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[14]~45_combout\ = (\CPU|CU|st_op~regout\ & (\CPU|FNU|Bbus[14]~87_combout\ & ((\CPU|CU|PC\(14)) # (!\CPU|CU|PCd_EN~regout\)))) # (!\CPU|CU|st_op~regout\ & ((\CPU|CU|PC\(14)) # ((!\CPU|CU|PCd_EN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|st_op~regout\,
	datab => \CPU|CU|PC\(14),
	datac => \CPU|CU|PCd_EN~regout\,
	datad => \CPU|FNU|Bbus[14]~87_combout\,
	combout => \data_bus_temp[14]~45_combout\);

-- Location: LCCOMB_X42_Y27_N8
\CPU|FNU|Fnc_unit|Add0~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~48_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(14))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[14]~88_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(14),
	datab => \CPU|CU|ctl_wd\(9),
	datac => \CPU|FNU|Bbus[14]~88_combout\,
	datad => \CPU|CU|ctl_wd\(13),
	combout => \CPU|FNU|Fnc_unit|Add0~48_combout\);

-- Location: LCCOMB_X43_Y25_N24
\CPU|FNU|Fnc_unit|Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux0~2_combout\ = (\CPU|CU|ctl_wd\(7) & (\CPU|FNU|Mux1~combout\)) # (!\CPU|CU|ctl_wd\(7) & ((\CPU|FNU|Mux0~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux1~combout\,
	datab => \CPU|FNU|Mux0~combout\,
	datad => \CPU|CU|ctl_wd\(7),
	combout => \CPU|FNU|Fnc_unit|Mux0~2_combout\);

-- Location: LCCOMB_X43_Y25_N28
\CPU|FNU|Fnc_unit|Mux0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux0~3_combout\ = (\CPU|CU|ctl_wd\(8) & (\CPU|CU|ctl_wd\(6) $ (((!\CPU|FNU|Fnc_unit|Mux0~2_combout\ & !\CPU|CU|ctl_wd\(7)))))) # (!\CPU|CU|ctl_wd\(8) & (\CPU|FNU|Fnc_unit|Mux0~2_combout\ & ((!\CPU|CU|ctl_wd\(7)) # 
-- (!\CPU|CU|ctl_wd\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(6),
	datab => \CPU|CU|ctl_wd\(8),
	datac => \CPU|FNU|Fnc_unit|Mux0~2_combout\,
	datad => \CPU|CU|ctl_wd\(7),
	combout => \CPU|FNU|Fnc_unit|Mux0~3_combout\);

-- Location: LCCOMB_X43_Y25_N14
\CPU|FNU|Fnc_unit|Mux0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux0~4_combout\ = (\CPU|CU|ctl_wd\(8) & ((\CPU|CU|ctl_wd\(7)) # ((\CPU|CU|ctl_wd\(6) & \CPU|FNU|Fnc_unit|Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(6),
	datab => \CPU|CU|ctl_wd\(8),
	datac => \CPU|FNU|Fnc_unit|Mux0~2_combout\,
	datad => \CPU|CU|ctl_wd\(7),
	combout => \CPU|FNU|Fnc_unit|Mux0~4_combout\);

-- Location: LCCOMB_X40_Y25_N12
\CPU|FNU|Fnc_unit|Mux0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux0~5_combout\ = (\CPU|FNU|Fnc_unit|Mux0~4_combout\ & ((\CPU|FNU|Fnc_unit|Mux0~3_combout\ & (\CPU|FNU|Bbus[15]~93_combout\)) # (!\CPU|FNU|Fnc_unit|Mux0~3_combout\ & ((\CPU|FNU|Fnc_unit|Add0~52_combout\))))) # 
-- (!\CPU|FNU|Fnc_unit|Mux0~4_combout\ & (((\CPU|FNU|Fnc_unit|Mux0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[15]~93_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux0~4_combout\,
	datac => \CPU|FNU|Fnc_unit|Add0~52_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux0~3_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux0~5_combout\);

-- Location: LCFF_X33_Y23_N25
\lcd_out|next_command.DISPLAY_ON\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector13~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.DISPLAY_ON~regout\);

-- Location: LCFF_X35_Y23_N17
\lcd_out|next_command.DISPLAY_OFF\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector24~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.DISPLAY_OFF~regout\);

-- Location: LCCOMB_X35_Y23_N2
\lcd_out|state~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~46_combout\ = (\lcd_out|next_command.DISPLAY_OFF~regout\ & \lcd_out|state.HOLD~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lcd_out|next_command.DISPLAY_OFF~regout\,
	datad => \lcd_out|state.HOLD~regout\,
	combout => \lcd_out|state~46_combout\);

-- Location: LCCOMB_X33_Y24_N12
\CPU|CU|ctl_wd~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~13_combout\ = (\CPU|CU|IR\(2) & (((!\CPU|CU|IR\(10) & !\CPU|CU|IR\(14))) # (!\CPU|CU|ctl_wd~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(2),
	datab => \CPU|CU|IR\(10),
	datac => \CPU|CU|ctl_wd~12_combout\,
	datad => \CPU|CU|IR\(14),
	combout => \CPU|CU|ctl_wd~13_combout\);

-- Location: LCCOMB_X34_Y24_N6
\CPU|CU|ctl_wd~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~15_combout\ = (\CPU|CU|IR\(1) & (((!\CPU|CU|IR\(10) & !\CPU|CU|IR\(14))) # (!\CPU|CU|ctl_wd~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(10),
	datab => \CPU|CU|IR\(1),
	datac => \CPU|CU|ctl_wd~12_combout\,
	datad => \CPU|CU|IR\(14),
	combout => \CPU|CU|ctl_wd~15_combout\);

-- Location: LCCOMB_X32_Y27_N24
\CPU|CU|Selector100~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector100~0_combout\ = (\CPU|CU|const_out\(4) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|const_out\(4),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector100~0_combout\);

-- Location: LCCOMB_X34_Y24_N10
\CPU|CU|ctl_wd~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~18_combout\ = (\CPU|CU|ctl_wd~12_combout\ & !\CPU|CU|IR\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|ctl_wd~12_combout\,
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|ctl_wd~18_combout\);

-- Location: LCCOMB_X34_Y24_N14
\CPU|CU|ctl_wd~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~20_combout\ = (\CPU|CU|ctl_wd~18_combout\ & (((\CPU|CU|ctl_wd~19_combout\)))) # (!\CPU|CU|ctl_wd~18_combout\ & ((\CPU|CU|ctl_wd~19_combout\ & (\CPU|CU|ctl_wd\(4))) # (!\CPU|CU|ctl_wd~19_combout\ & ((\CPU|CU|IR\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd~18_combout\,
	datab => \CPU|CU|ctl_wd\(4),
	datac => \CPU|CU|IR\(5),
	datad => \CPU|CU|ctl_wd~19_combout\,
	combout => \CPU|CU|ctl_wd~20_combout\);

-- Location: LCCOMB_X34_Y24_N4
\CPU|CU|ctl_wd~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~23_combout\ = (\CPU|CU|ctl_wd~18_combout\ & (\CPU|CU|ctl_wd~19_combout\)) # (!\CPU|CU|ctl_wd~18_combout\ & ((\CPU|CU|ctl_wd~19_combout\ & ((\CPU|CU|ctl_wd\(6)))) # (!\CPU|CU|ctl_wd~19_combout\ & (\CPU|CU|IR\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd~18_combout\,
	datab => \CPU|CU|ctl_wd~19_combout\,
	datac => \CPU|CU|IR\(7),
	datad => \CPU|CU|ctl_wd\(6),
	combout => \CPU|CU|ctl_wd~23_combout\);

-- Location: LCCOMB_X34_Y24_N22
\CPU|CU|ctl_wd~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~24_combout\ = (\CPU|CU|IR\(10) & (\CPU|CU|ctl_wd~23_combout\ $ (((\CPU|CU|ctl_wd~17_combout\))))) # (!\CPU|CU|IR\(10) & (\CPU|CU|ctl_wd~23_combout\ & ((\CPU|CU|IR\(7)) # (!\CPU|CU|ctl_wd~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(10),
	datab => \CPU|CU|ctl_wd~23_combout\,
	datac => \CPU|CU|IR\(7),
	datad => \CPU|CU|ctl_wd~17_combout\,
	combout => \CPU|CU|ctl_wd~24_combout\);

-- Location: LCCOMB_X36_Y22_N12
\CPU|CU|ctl_wd~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~25_combout\ = (\CPU|CU|IR\(9) & ((\CPU|CU|IR\(14) & ((\CPU|CU|IR\(10)) # (\CPU|CU|IR\(8)))) # (!\CPU|CU|IR\(14) & (!\CPU|CU|IR\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(14),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|ctl_wd~25_combout\);

-- Location: LCCOMB_X36_Y28_N20
\CPU|CU|ctl_wd~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~26_combout\ = (\CPU|CU|IR\(8) & ((\CPU|CU|IR\(14)) # (!\CPU|CU|IR\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(8),
	datab => \CPU|CU|IR\(14),
	datac => \CPU|CU|IR\(10),
	combout => \CPU|CU|ctl_wd~26_combout\);

-- Location: LCFF_X34_Y26_N15
\CPU|CU|Mem_wr\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector69~1_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|Mem_wr~regout\);

-- Location: LCCOMB_X33_Y26_N28
\CPU|CU|PC~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~16_combout\ = (\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(10))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(10),
	datac => \CPU|CU|PC\(10),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|PC~16_combout\);

-- Location: LCCOMB_X42_Y24_N0
\CPU|CU|Add1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add1~1_combout\ = (\CPU|CU|IR\(8)) # (!\CPU|CU|current_state.Decode~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|IR\(8),
	datac => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add1~1_combout\);

-- Location: LCCOMB_X38_Y28_N0
\CPU|CU|SP[0]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[0]~38_combout\ = (\CPU|CU|current_state.Fetch~regout\) # ((\CPU|CU|current_state.Execute~regout\) # ((!\CPU|CU|op.call~regout\ & \CPU|CU|current_state.WB~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Fetch~regout\,
	datab => \CPU|CU|current_state.Execute~regout\,
	datac => \CPU|CU|op.call~regout\,
	datad => \CPU|CU|current_state.WB~regout\,
	combout => \CPU|CU|SP[0]~38_combout\);

-- Location: LCCOMB_X35_Y26_N0
\CPU|CU|Selector105~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector105~1_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.ret~regout\) # (\CPU|CU|op.call~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|current_state.Execute~regout\,
	datac => \CPU|CU|op.ret~regout\,
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|Selector105~1_combout\);

-- Location: LCCOMB_X36_Y28_N6
\CPU|CU|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Mux1~0_combout\ = (!\CPU|CU|IR\(8) & (!\CPU|CU|IR\(9) & (!\CPU|CU|IR\(10) & \CPU|CU|IR\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(8),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|Mux1~0_combout\);

-- Location: LCCOMB_X40_Y28_N20
\CPU|CU|Selector73~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector73~0_combout\ = (\CPU|CU|op.st~regout\) # ((\CPU|CU|st_op~regout\ & ((\CPU|CU|op.nop~regout\) # (\CPU|CU|op.hlt~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.nop~regout\,
	datab => \CPU|CU|st_op~regout\,
	datac => \CPU|CU|op.hlt~regout\,
	datad => \CPU|CU|op.st~regout\,
	combout => \CPU|CU|Selector73~0_combout\);

-- Location: LCCOMB_X36_Y28_N0
\CPU|CU|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Mux1~1_combout\ = (\CPU|CU|IR\(8) & (\CPU|CU|IR\(9) & (!\CPU|CU|IR\(10) & \CPU|CU|IR\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(8),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|Mux1~1_combout\);

-- Location: LCCOMB_X33_Y26_N18
\CPU|CU|PC~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~17_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(11)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(11),
	datac => \CPU|CU|offset\(11),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|PC~17_combout\);

-- Location: LCCOMB_X33_Y26_N20
\CPU|CU|Selector110~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector110~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(11))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(11)))))) # (!\CPU|CU|current_state.Execute~regout\ & (((\CPU|CU|PC\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(11),
	datab => \CPU|CU|current_state.Execute~regout\,
	datac => \CPU|CU|PC\(11),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|Selector110~0_combout\);

-- Location: LCCOMB_X33_Y26_N22
\CPU|CU|PC~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~18_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(12)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(12),
	datab => \CPU|CU|offset\(12),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|PC~18_combout\);

-- Location: LCCOMB_X33_Y26_N8
\CPU|CU|Selector109~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector109~0_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|current_state.Execute~regout\ & (\CPU|CU|offset\(12))) # (!\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|PC\(12)))))) # (!\CPU|CU|op.call~regout\ & (((\CPU|CU|PC\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.call~regout\,
	datab => \CPU|CU|offset\(12),
	datac => \CPU|CU|current_state.Execute~regout\,
	datad => \CPU|CU|PC\(12),
	combout => \CPU|CU|Selector109~0_combout\);

-- Location: LCCOMB_X37_Y28_N10
\CPU|CU|PC[9]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[9]~21_combout\ = (\CPU|CU|op.bz~regout\ & (!\CPU|CU|PSR\(0))) # (!\CPU|CU|op.bz~regout\ & (((!\CPU|CU|op.jmp~regout\ & !\CPU|CU|op.ba~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PSR\(0),
	datab => \CPU|CU|op.jmp~regout\,
	datac => \CPU|CU|op.ba~regout\,
	datad => \CPU|CU|op.bz~regout\,
	combout => \CPU|CU|PC[9]~21_combout\);

-- Location: LCCOMB_X33_Y28_N0
\CPU|CU|Add0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~3_combout\ = (\CPU|CU|PC\(4) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~1_combout\,
	datab => \CPU|CU|PC\(4),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~3_combout\);

-- Location: LCCOMB_X34_Y28_N18
\CPU|CU|Add0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~5_combout\ = (\CPU|CU|PC\(3) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(3),
	datac => \CPU|CU|Add0~1_combout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~5_combout\);

-- Location: LCCOMB_X33_Y28_N4
\CPU|CU|Add0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~7_combout\ = (\CPU|CU|PC\(2) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|PC\(2),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~7_combout\);

-- Location: LCCOMB_X34_Y28_N20
\CPU|CU|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~8_combout\ = (\CPU|CU|offset\(1) & (!\CPU|CU|Add0~1_combout\ & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(1),
	datac => \CPU|CU|Add0~1_combout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~8_combout\);

-- Location: LCCOMB_X38_Y28_N26
\CPU|CU|Add0~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~11_combout\ = (\CPU|CU|PC\(0) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(0),
	datac => \CPU|CU|Add0~1_combout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~11_combout\);

-- Location: LCCOMB_X43_Y27_N6
\CPU|CU|ctl_wd~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~30_combout\ = (!\CPU|CU|ctl_wd~29_combout\ & \CPU|CU|IR\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd~29_combout\,
	datad => \CPU|CU|IR\(13),
	combout => \CPU|CU|ctl_wd~30_combout\);

-- Location: LCCOMB_X38_Y28_N4
\CPU|CU|Selector76~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector76~0_combout\ = (\CPU|CU|ctl_wd\(12) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(12),
	datac => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector76~0_combout\);

-- Location: LCFF_X37_Y28_N13
\CPU|CU|op.orx\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.orx~1_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.orx~regout\);

-- Location: LCFF_X36_Y28_N13
\CPU|CU|op.notx\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.notx~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.notx~regout\);

-- Location: LCFF_X32_Y28_N7
\CPU|CU|offset[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector125~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(13));

-- Location: LCCOMB_X33_Y26_N2
\CPU|CU|PC~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~29_combout\ = (\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(13))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(13),
	datac => \CPU|CU|PC\(13),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|PC~29_combout\);

-- Location: LCCOMB_X33_Y26_N12
\CPU|CU|Selector108~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector108~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(13))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(13)))))) # (!\CPU|CU|current_state.Execute~regout\ & (((\CPU|CU|PC\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Execute~regout\,
	datab => \CPU|CU|offset\(13),
	datac => \CPU|CU|PC\(13),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|Selector108~0_combout\);

-- Location: LCCOMB_X32_Y25_N6
\CPU|CU|PC~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~30_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(14)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(14),
	datab => \CPU|CU|op.call~regout\,
	datad => \CPU|CU|offset\(14),
	combout => \CPU|CU|PC~30_combout\);

-- Location: LCCOMB_X32_Y25_N0
\CPU|CU|Selector107~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector107~0_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|current_state.Execute~regout\ & (\CPU|CU|offset\(14))) # (!\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|PC\(14)))))) # (!\CPU|CU|op.call~regout\ & (((\CPU|CU|PC\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(14),
	datab => \CPU|CU|op.call~regout\,
	datac => \CPU|CU|PC\(14),
	datad => \CPU|CU|current_state.Execute~regout\,
	combout => \CPU|CU|Selector107~0_combout\);

-- Location: LCCOMB_X32_Y25_N2
\CPU|CU|PC~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~31_combout\ = (\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(15))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(15),
	datab => \CPU|CU|op.call~regout\,
	datad => \CPU|CU|PC\(15),
	combout => \CPU|CU|PC~31_combout\);

-- Location: LCCOMB_X32_Y25_N28
\CPU|CU|Selector106~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector106~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(15)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(15))))) # (!\CPU|CU|current_state.Execute~regout\ & (((\CPU|CU|PC\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Execute~regout\,
	datab => \CPU|CU|op.call~regout\,
	datac => \CPU|CU|PC\(15),
	datad => \CPU|CU|offset\(15),
	combout => \CPU|CU|Selector106~0_combout\);

-- Location: LCCOMB_X38_Y28_N2
\CPU|CU|PC~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~32_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(0)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(0),
	datab => \CPU|CU|op.call~regout\,
	datad => \CPU|CU|offset\(0),
	combout => \CPU|CU|PC~32_combout\);

-- Location: LCCOMB_X33_Y26_N6
\CPU|CU|Selector121~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector121~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(0)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(0))))) # (!\CPU|CU|current_state.Execute~regout\ & (\CPU|CU|PC\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Execute~regout\,
	datab => \CPU|CU|PC\(0),
	datac => \CPU|CU|offset\(0),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|Selector121~0_combout\);

-- Location: LCCOMB_X33_Y28_N30
\CPU|CU|PC~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~36_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(5)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|PC\(5),
	datac => \CPU|CU|op.call~regout\,
	datad => \CPU|CU|offset\(5),
	combout => \CPU|CU|PC~36_combout\);

-- Location: LCCOMB_X33_Y28_N8
\CPU|CU|Selector116~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector116~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(5)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(5))))) # (!\CPU|CU|current_state.Execute~regout\ & (\CPU|CU|PC\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Execute~regout\,
	datab => \CPU|CU|PC\(5),
	datac => \CPU|CU|op.call~regout\,
	datad => \CPU|CU|offset\(5),
	combout => \CPU|CU|Selector116~0_combout\);

-- Location: LCCOMB_X33_Y28_N12
\CPU|CU|Add0~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~23_combout\ = (\CPU|CU|PC\(5) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|PC\(5),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~23_combout\);

-- Location: LCCOMB_X34_Y27_N14
\CPU|CU|PC[5]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[5]~41_combout\ = (\CPU|CU|current_state.Reset~regout\ & (\CPU|CU|Add0~24_combout\ & (!\CPU|CU|current_state.WB~regout\ & !\CPU|CU|PC[9]~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datab => \CPU|CU|Add0~24_combout\,
	datac => \CPU|CU|current_state.WB~regout\,
	datad => \CPU|CU|PC[9]~23_combout\,
	combout => \CPU|CU|PC[5]~41_combout\);

-- Location: LCCOMB_X37_Y26_N6
\CPU|CU|Add0~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~27_combout\ = (\CPU|CU|PC\(6) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|PC\(6),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~27_combout\);

-- Location: LCCOMB_X33_Y28_N6
\CPU|CU|Add0~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~30_combout\ = (!\CPU|CU|Add0~1_combout\ & (\CPU|CU|offset\(7) & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|offset\(7),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~30_combout\);

-- Location: LCCOMB_X34_Y27_N28
\CPU|CU|PC[0]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[0]~44_combout\ = (\CPU|CU|current_state.Reset~regout\ & (!\CPU|CU|current_state.WB~regout\ & (\CPU|CU|Add0~12_combout\ & !\CPU|CU|PC[9]~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datab => \CPU|CU|current_state.WB~regout\,
	datac => \CPU|CU|Add0~12_combout\,
	datad => \CPU|CU|PC[9]~23_combout\,
	combout => \CPU|CU|PC[0]~44_combout\);

-- Location: LCCOMB_X33_Y23_N6
\lcd_out|Selector25~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector25~0_combout\ = (\lcd_out|state.DISPLAY_OFF~regout\) # ((\lcd_out|next_command.DISPLAY_CLEAR~regout\ & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datab => \lcd_out|state.TOGGLE_E~regout\,
	datac => \lcd_out|next_command.DISPLAY_CLEAR~regout\,
	datad => \lcd_out|state.DISPLAY_OFF~regout\,
	combout => \lcd_out|Selector25~0_combout\);

-- Location: LCCOMB_X32_Y28_N8
\CPU|CU|Add0~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~35_combout\ = (\CPU|CU|PC\(8) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|PC\(8),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~35_combout\);

-- Location: LCCOMB_X32_Y26_N24
\CPU|CU|Add0~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~38_combout\ = (\CPU|CU|offset\(9) & (!\CPU|CU|Add0~1_combout\ & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(9),
	datac => \CPU|CU|Add0~1_combout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~38_combout\);

-- Location: LCCOMB_X32_Y28_N10
\CPU|CU|Add0~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~42_combout\ = (\CPU|CU|offset\(10) & (!\CPU|CU|current_state.Decode~regout\ & !\CPU|CU|Add0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(10),
	datac => \CPU|CU|current_state.Decode~regout\,
	datad => \CPU|CU|Add0~1_combout\,
	combout => \CPU|CU|Add0~42_combout\);

-- Location: LCCOMB_X32_Y28_N0
\CPU|CU|Add0~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~46_combout\ = (!\CPU|CU|Add0~1_combout\ & (\CPU|CU|offset\(11) & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|offset\(11),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~46_combout\);

-- Location: LCCOMB_X32_Y28_N22
\CPU|CU|Add0~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~50_combout\ = (!\CPU|CU|Add0~1_combout\ & (!\CPU|CU|current_state.Decode~regout\ & \CPU|CU|offset\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|current_state.Decode~regout\,
	datad => \CPU|CU|offset\(12),
	combout => \CPU|CU|Add0~50_combout\);

-- Location: LCCOMB_X32_Y26_N10
\CPU|CU|PC[12]~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[12]~52_combout\ = (!\CPU|CU|current_state.WB~regout\ & (!\CPU|CU|PC[9]~23_combout\ & (\CPU|CU|Add0~52_combout\ & \CPU|CU|current_state.Reset~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.WB~regout\,
	datab => \CPU|CU|PC[9]~23_combout\,
	datac => \CPU|CU|Add0~52_combout\,
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|PC[12]~52_combout\);

-- Location: LCCOMB_X32_Y28_N18
\CPU|CU|Add0~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~54_combout\ = (\CPU|CU|offset\(13) & (!\CPU|CU|Add0~1_combout\ & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(13),
	datab => \CPU|CU|Add0~1_combout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~54_combout\);

-- Location: LCCOMB_X32_Y25_N30
\CPU|CU|Add0~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~58_combout\ = (\CPU|CU|offset\(14) & (!\CPU|CU|Add0~1_combout\ & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(14),
	datab => \CPU|CU|Add0~1_combout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~58_combout\);

-- Location: LCCOMB_X32_Y25_N24
\CPU|CU|Add0~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~59_combout\ = (\CPU|CU|PC\(14) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|PC\(14),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~59_combout\);

-- Location: LCCOMB_X32_Y25_N10
\CPU|CU|PC[14]~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[14]~54_combout\ = (!\CPU|CU|current_state.WB~regout\ & (!\CPU|CU|PC[9]~23_combout\ & (\CPU|CU|current_state.Reset~regout\ & \CPU|CU|Add0~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.WB~regout\,
	datab => \CPU|CU|PC[9]~23_combout\,
	datac => \CPU|CU|current_state.Reset~regout\,
	datad => \CPU|CU|Add0~60_combout\,
	combout => \CPU|CU|PC[14]~54_combout\);

-- Location: LCCOMB_X32_Y25_N20
\CPU|CU|Add0~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~62_combout\ = (!\CPU|CU|Add0~1_combout\ & (\CPU|CU|offset\(15) & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|offset\(15),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~62_combout\);

-- Location: LCCOMB_X32_Y25_N14
\CPU|CU|Add0~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~63_combout\ = (\CPU|CU|PC\(15) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|Add0~1_combout\,
	datad => \CPU|CU|PC\(15),
	combout => \CPU|CU|Add0~63_combout\);

-- Location: LCCOMB_X32_Y25_N8
\CPU|CU|PC[15]~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[15]~55_combout\ = (!\CPU|CU|current_state.WB~regout\ & (!\CPU|CU|PC[9]~23_combout\ & (\CPU|CU|current_state.Reset~regout\ & \CPU|CU|Add0~64_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.WB~regout\,
	datab => \CPU|CU|PC[9]~23_combout\,
	datac => \CPU|CU|current_state.Reset~regout\,
	datad => \CPU|CU|Add0~64_combout\,
	combout => \CPU|CU|PC[15]~55_combout\);

-- Location: LCCOMB_X33_Y23_N24
\lcd_out|Selector13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector13~0_combout\ = (\lcd_out|state.DISPLAY_CLEAR~regout\) # ((\lcd_out|next_command.DISPLAY_ON~regout\ & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datab => \lcd_out|state.TOGGLE_E~regout\,
	datac => \lcd_out|next_command.DISPLAY_ON~regout\,
	datad => \lcd_out|state.DISPLAY_CLEAR~regout\,
	combout => \lcd_out|Selector13~0_combout\);

-- Location: LCCOMB_X35_Y23_N16
\lcd_out|Selector24~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector24~0_combout\ = (\lcd_out|state.FUNC_SET~regout\) # ((\lcd_out|next_command.DISPLAY_OFF~regout\ & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.FUNC_SET~regout\,
	datab => \lcd_out|state.HOLD~regout\,
	datac => \lcd_out|next_command.DISPLAY_OFF~regout\,
	datad => \lcd_out|state.TOGGLE_E~regout\,
	combout => \lcd_out|Selector24~0_combout\);

-- Location: LCCOMB_X43_Y27_N16
\CPU|CU|Selector53~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector53~0_combout\ = (\CPU|CU|IR\(12) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(12),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector53~0_combout\);

-- Location: LCCOMB_X34_Y28_N12
\CPU|CU|offset~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~23_combout\ = (\CPU|CU|offset~22_combout\ & (!\CPU|CU|IR\(10) & ((\CPU|CU|IR\(3))))) # (!\CPU|CU|offset~22_combout\ & (((\CPU|CU|offset\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(10),
	datab => \CPU|CU|offset\(3),
	datac => \CPU|CU|offset~22_combout\,
	datad => \CPU|CU|IR\(3),
	combout => \CPU|CU|offset~23_combout\);

-- Location: LCCOMB_X40_Y28_N12
\CPU|CU|Selector69~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector69~0_combout\ = (!\CPU|CU|Mem_wr~regout\ & (((!\CPU|CU|op.call~regout\ & !\CPU|CU|op.st~regout\)) # (!\CPU|CU|current_state.Execute~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.call~regout\,
	datab => \CPU|CU|Mem_wr~regout\,
	datac => \CPU|CU|current_state.Execute~regout\,
	datad => \CPU|CU|op.st~regout\,
	combout => \CPU|CU|Selector69~0_combout\);

-- Location: LCCOMB_X34_Y26_N14
\CPU|CU|Selector69~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector69~1_combout\ = (!\CPU|CU|Selector69~0_combout\ & ((\CPU|CU|current_state.Decode~regout\) # ((\CPU|CU|current_state.Fetch~regout\) # (\CPU|CU|current_state.Execute~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|Selector69~0_combout\,
	datac => \CPU|CU|current_state.Fetch~regout\,
	datad => \CPU|CU|current_state.Execute~regout\,
	combout => \CPU|CU|Selector69~1_combout\);

-- Location: LCCOMB_X33_Y24_N20
\CPU|CU|offset~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~33_combout\ = (\CPU|CU|offset~47_combout\ & ((\CPU|CU|offset~46_combout\) # ((\CPU|CU|IR\(4))))) # (!\CPU|CU|offset~47_combout\ & (!\CPU|CU|offset~46_combout\ & ((\CPU|CU|offset\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~47_combout\,
	datab => \CPU|CU|offset~46_combout\,
	datac => \CPU|CU|IR\(4),
	datad => \CPU|CU|offset\(12),
	combout => \CPU|CU|offset~33_combout\);

-- Location: LCCOMB_X33_Y24_N14
\CPU|CU|offset~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~34_combout\ = (\CPU|CU|offset~33_combout\ & (((\CPU|CU|IR\(7))) # (!\CPU|CU|offset~46_combout\))) # (!\CPU|CU|offset~33_combout\ & (\CPU|CU|offset~46_combout\ & (\CPU|CU|IR\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~33_combout\,
	datab => \CPU|CU|offset~46_combout\,
	datac => \CPU|CU|IR\(12),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|offset~34_combout\);

-- Location: LCCOMB_X40_Y25_N26
\CPU|FNU|Fnc_unit|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Equal0~0_combout\ = (!\CPU|FNU|Fnc_unit|Mux3~10_combout\ & (!\CPU|FNU|Fnc_unit|Mux4~4_combout\ & (!\CPU|FNU|Fnc_unit|Mux1~4_combout\ & !\CPU|FNU|Fnc_unit|Mux2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~10_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux4~4_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux1~4_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux2~4_combout\,
	combout => \CPU|FNU|Fnc_unit|Equal0~0_combout\);

-- Location: LCCOMB_X41_Y23_N6
\CPU|FNU|Fnc_unit|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Equal0~1_combout\ = (!\CPU|FNU|Fnc_unit|Mux15~4_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (!\CPU|FNU|Fnc_unit|Add0~10_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((!\CPU|FNU|Fnc_unit|Mux14~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~10_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux15~4_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux14~3_combout\,
	combout => \CPU|FNU|Fnc_unit|Equal0~1_combout\);

-- Location: LCCOMB_X40_Y25_N20
\CPU|FNU|Fnc_unit|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Equal0~2_combout\ = (!\CPU|FNU|Fnc_unit|Mux13~4_combout\ & ((\CPU|CU|ctl_wd\(9) & (!\CPU|FNU|Fnc_unit|Mux0~1_combout\)) # (!\CPU|CU|ctl_wd\(9) & ((!\CPU|FNU|Fnc_unit|Mux0~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(9),
	datab => \CPU|FNU|Fnc_unit|Mux0~1_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux13~4_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux0~5_combout\,
	combout => \CPU|FNU|Fnc_unit|Equal0~2_combout\);

-- Location: LCCOMB_X41_Y26_N6
\CPU|FNU|Fnc_unit|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Equal0~3_combout\ = (!\CPU|FNU|Fnc_unit|Mux12~8_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((!\CPU|FNU|Fnc_unit|Add0~16_combout\))) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (!\CPU|FNU|Fnc_unit|Mux11~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux11~3_combout\,
	datac => \CPU|FNU|Fnc_unit|Add0~16_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux12~8_combout\,
	combout => \CPU|FNU|Fnc_unit|Equal0~3_combout\);

-- Location: LCCOMB_X41_Y24_N30
\CPU|FNU|Fnc_unit|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Equal0~4_combout\ = (!\CPU|FNU|Fnc_unit|Mux9~8_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (!\CPU|FNU|Fnc_unit|Add0~19_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((!\CPU|FNU|Fnc_unit|Mux10~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~19_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux10~3_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux9~8_combout\,
	combout => \CPU|FNU|Fnc_unit|Equal0~4_combout\);

-- Location: LCCOMB_X40_Y25_N22
\CPU|FNU|Fnc_unit|Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Equal0~5_combout\ = (!\CPU|FNU|Fnc_unit|Mux7~8_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((!\CPU|FNU|Fnc_unit|Add0~25_combout\))) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (!\CPU|FNU|Fnc_unit|Mux8~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux8~3_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datac => \CPU|FNU|Fnc_unit|Add0~25_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux7~8_combout\,
	combout => \CPU|FNU|Fnc_unit|Equal0~5_combout\);

-- Location: LCCOMB_X40_Y25_N16
\CPU|FNU|Fnc_unit|Equal0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Equal0~6_combout\ = (!\CPU|FNU|Fnc_unit|Mux5~8_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (!\CPU|FNU|Fnc_unit|Add0~34_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((!\CPU|FNU|Fnc_unit|Mux6~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~34_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux6~3_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux5~8_combout\,
	combout => \CPU|FNU|Fnc_unit|Equal0~6_combout\);

-- Location: LCCOMB_X40_Y25_N10
\CPU|FNU|Fnc_unit|Equal0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Equal0~7_combout\ = (\CPU|FNU|Fnc_unit|Equal0~3_combout\ & (\CPU|FNU|Fnc_unit|Equal0~4_combout\ & (\CPU|FNU|Fnc_unit|Equal0~6_combout\ & \CPU|FNU|Fnc_unit|Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Equal0~3_combout\,
	datab => \CPU|FNU|Fnc_unit|Equal0~4_combout\,
	datac => \CPU|FNU|Fnc_unit|Equal0~6_combout\,
	datad => \CPU|FNU|Fnc_unit|Equal0~5_combout\,
	combout => \CPU|FNU|Fnc_unit|Equal0~7_combout\);

-- Location: LCCOMB_X40_Y25_N28
\CPU|FNU|Fnc_unit|Equal0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Equal0~8_combout\ = (\CPU|FNU|Fnc_unit|Equal0~2_combout\ & (\CPU|FNU|Fnc_unit|Equal0~0_combout\ & (\CPU|FNU|Fnc_unit|Equal0~1_combout\ & \CPU|FNU|Fnc_unit|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Equal0~2_combout\,
	datab => \CPU|FNU|Fnc_unit|Equal0~0_combout\,
	datac => \CPU|FNU|Fnc_unit|Equal0~1_combout\,
	datad => \CPU|FNU|Fnc_unit|Equal0~7_combout\,
	combout => \CPU|FNU|Fnc_unit|Equal0~8_combout\);

-- Location: LCCOMB_X40_Y25_N14
\CPU|CU|Selector67~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector67~0_combout\ = (\CPU|CU|PSR\(0) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|PSR\(0),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector67~0_combout\);

-- Location: LCCOMB_X36_Y28_N14
\CPU|CU|Mux1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Mux1~5_combout\ = (!\CPU|CU|IR\(8) & (!\CPU|CU|IR\(9) & (\CPU|CU|IR\(10) & !\CPU|CU|IR\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(8),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|Mux1~5_combout\);

-- Location: LCCOMB_X37_Y28_N12
\CPU|CU|op.orx~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.orx~1_combout\ = (\CPU|CU|Mux1~5_combout\ & (!\CPU|CU|IR\(14) & !\CPU|CU|IR\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Mux1~5_combout\,
	datac => \CPU|CU|IR\(14),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|op.orx~1_combout\);

-- Location: LCCOMB_X36_Y28_N2
\CPU|CU|Mux1~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Mux1~7_combout\ = (!\CPU|CU|IR\(8) & (\CPU|CU|IR\(9) & (!\CPU|CU|IR\(10) & !\CPU|CU|IR\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(8),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|Mux1~7_combout\);

-- Location: LCCOMB_X36_Y28_N12
\CPU|CU|op.notx~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.notx~0_combout\ = (\CPU|CU|Mux1~7_combout\ & (!\CPU|CU|IR\(14) & !\CPU|CU|IR\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Mux1~7_combout\,
	datac => \CPU|CU|IR\(14),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|op.notx~0_combout\);

-- Location: LCCOMB_X33_Y24_N24
\CPU|CU|offset~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~35_combout\ = (\CPU|CU|offset~46_combout\ & (((\CPU|CU|IR\(13)) # (\CPU|CU|offset~47_combout\)))) # (!\CPU|CU|offset~46_combout\ & (\CPU|CU|offset\(13) & ((!\CPU|CU|offset~47_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(13),
	datab => \CPU|CU|offset~46_combout\,
	datac => \CPU|CU|IR\(13),
	datad => \CPU|CU|offset~47_combout\,
	combout => \CPU|CU|offset~35_combout\);

-- Location: LCCOMB_X33_Y24_N10
\CPU|CU|offset~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~36_combout\ = (\CPU|CU|offset~35_combout\ & ((\CPU|CU|IR\(7)) # ((!\CPU|CU|offset~47_combout\)))) # (!\CPU|CU|offset~35_combout\ & (((\CPU|CU|IR\(5) & \CPU|CU|offset~47_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(7),
	datab => \CPU|CU|IR\(5),
	datac => \CPU|CU|offset~35_combout\,
	datad => \CPU|CU|offset~47_combout\,
	combout => \CPU|CU|offset~36_combout\);

-- Location: LCCOMB_X32_Y28_N6
\CPU|CU|Selector125~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector125~0_combout\ = (\CPU|CU|current_state.Decode~regout\ & (((\CPU|CU|offset~36_combout\)))) # (!\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|current_state.Reset~regout\ & (\CPU|CU|offset\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|current_state.Reset~regout\,
	datac => \CPU|CU|offset\(13),
	datad => \CPU|CU|offset~36_combout\,
	combout => \CPU|CU|Selector125~0_combout\);

-- Location: LCCOMB_X32_Y25_N22
\CPU|CU|Selector123~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector123~0_combout\ = (\CPU|CU|offset~22_combout\ & ((\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|IR\(7)))) # (!\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|offset\(15))))) # (!\CPU|CU|offset~22_combout\ & (\CPU|CU|offset\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(15),
	datab => \CPU|CU|offset~22_combout\,
	datac => \CPU|CU|current_state.Decode~regout\,
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|Selector123~0_combout\);

-- Location: LCCOMB_X43_Y27_N20
\CPU|CU|offset~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~39_combout\ = (\CPU|CU|offset~22_combout\ & (((!\CPU|CU|IR\(10) & \CPU|CU|IR\(7))))) # (!\CPU|CU|offset~22_combout\ & (\CPU|CU|offset\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~22_combout\,
	datab => \CPU|CU|offset\(7),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|offset~39_combout\);

-- Location: LCCOMB_X35_Y28_N10
\CPU|CU|Selector131~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector131~0_combout\ = (\CPU|CU|offset\(7) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(7),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector131~0_combout\);

-- Location: LCCOMB_X36_Y22_N20
\CPU|CU|offset~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~40_combout\ = (\CPU|CU|offset~47_combout\ & (((\CPU|CU|offset~46_combout\) # (\CPU|CU|IR\(0))))) # (!\CPU|CU|offset~47_combout\ & (\CPU|CU|offset\(8) & (!\CPU|CU|offset~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~47_combout\,
	datab => \CPU|CU|offset\(8),
	datac => \CPU|CU|offset~46_combout\,
	datad => \CPU|CU|IR\(0),
	combout => \CPU|CU|offset~40_combout\);

-- Location: LCCOMB_X36_Y22_N6
\CPU|CU|offset~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~41_combout\ = (\CPU|CU|offset~40_combout\ & (((\CPU|CU|IR\(7)) # (!\CPU|CU|offset~46_combout\)))) # (!\CPU|CU|offset~40_combout\ & (\CPU|CU|IR\(8) & (\CPU|CU|offset~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~40_combout\,
	datab => \CPU|CU|IR\(8),
	datac => \CPU|CU|offset~46_combout\,
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|offset~41_combout\);

-- Location: LCCOMB_X43_Y27_N2
\CPU|CU|offset~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~48_combout\ = (\CPU|CU|offset~22_combout\ & (((!\CPU|CU|IR\(10) & \CPU|CU|IR\(5))))) # (!\CPU|CU|offset~22_combout\ & (\CPU|CU|offset\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~22_combout\,
	datab => \CPU|CU|offset\(5),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(5),
	combout => \CPU|CU|offset~48_combout\);

-- Location: LCCOMB_X34_Y24_N12
\CPU|CU|ctl_wd~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~38_combout\ = (\CPU|CU|ctl_wd~17_combout\ & (!\CPU|CU|ctl_wd~20_combout\ & \CPU|CU|IR\(12))) # (!\CPU|CU|ctl_wd~17_combout\ & (\CPU|CU|ctl_wd~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd~17_combout\,
	datac => \CPU|CU|ctl_wd~20_combout\,
	datad => \CPU|CU|IR\(12),
	combout => \CPU|CU|ctl_wd~38_combout\);

-- Location: LCCOMB_X34_Y24_N30
\CPU|CU|ctl_wd~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~39_combout\ = (\CPU|CU|IR\(10) & (\CPU|CU|ctl_wd~20_combout\ & ((\CPU|CU|ctl_wd~38_combout\)))) # (!\CPU|CU|IR\(10) & ((\CPU|CU|ctl_wd~38_combout\) # ((\CPU|CU|ctl_wd~20_combout\ & \CPU|CU|IR\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(10),
	datab => \CPU|CU|ctl_wd~20_combout\,
	datac => \CPU|CU|IR\(5),
	datad => \CPU|CU|ctl_wd~38_combout\,
	combout => \CPU|CU|ctl_wd~39_combout\);

-- Location: LCCOMB_X40_Y23_N10
\CPU|FNU|R2|data_out[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R2|data_out[0]~feeder_combout\ = \CPU|FNU|func_data[0]~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[0]~7_combout\,
	combout => \CPU|FNU|R2|data_out[0]~feeder_combout\);

-- Location: LCCOMB_X35_Y23_N20
\lcd_out|state.RESET1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state.RESET1~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \lcd_out|state.RESET1~feeder_combout\);

-- Location: LCCOMB_X31_Y23_N14
\lcd_out|CLK_COUNT_400HZ[1]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[1]~22_combout\ = (\lcd_out|CLK_COUNT_400HZ\(1) & (!\lcd_out|CLK_COUNT_400HZ[0]~21\)) # (!\lcd_out|CLK_COUNT_400HZ\(1) & ((\lcd_out|CLK_COUNT_400HZ[0]~21\) # (GND)))
-- \lcd_out|CLK_COUNT_400HZ[1]~23\ = CARRY((!\lcd_out|CLK_COUNT_400HZ[0]~21\) # (!\lcd_out|CLK_COUNT_400HZ\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|CLK_COUNT_400HZ\(1),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[0]~21\,
	combout => \lcd_out|CLK_COUNT_400HZ[1]~22_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[1]~23\);

-- Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: LCCOMB_X31_Y23_N16
\lcd_out|CLK_COUNT_400HZ[2]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[2]~24_combout\ = (\lcd_out|CLK_COUNT_400HZ\(2) & (\lcd_out|CLK_COUNT_400HZ[1]~23\ $ (GND))) # (!\lcd_out|CLK_COUNT_400HZ\(2) & (!\lcd_out|CLK_COUNT_400HZ[1]~23\ & VCC))
-- \lcd_out|CLK_COUNT_400HZ[2]~25\ = CARRY((\lcd_out|CLK_COUNT_400HZ\(2) & !\lcd_out|CLK_COUNT_400HZ[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|CLK_COUNT_400HZ\(2),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[1]~23\,
	combout => \lcd_out|CLK_COUNT_400HZ[2]~24_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[2]~25\);

-- Location: LCFF_X31_Y23_N17
\lcd_out|CLK_COUNT_400HZ[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[2]~24_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(2));

-- Location: LCCOMB_X31_Y23_N20
\lcd_out|CLK_COUNT_400HZ[4]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[4]~29_combout\ = (\lcd_out|CLK_COUNT_400HZ\(4) & (\lcd_out|CLK_COUNT_400HZ[3]~28\ $ (GND))) # (!\lcd_out|CLK_COUNT_400HZ\(4) & (!\lcd_out|CLK_COUNT_400HZ[3]~28\ & VCC))
-- \lcd_out|CLK_COUNT_400HZ[4]~30\ = CARRY((\lcd_out|CLK_COUNT_400HZ\(4) & !\lcd_out|CLK_COUNT_400HZ[3]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|CLK_COUNT_400HZ\(4),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[3]~28\,
	combout => \lcd_out|CLK_COUNT_400HZ[4]~29_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[4]~30\);

-- Location: LCFF_X31_Y23_N21
\lcd_out|CLK_COUNT_400HZ[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[4]~29_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(4));

-- Location: LCCOMB_X32_Y23_N22
\lcd_out|LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|LessThan0~0_combout\ = ((!\lcd_out|CLK_COUNT_400HZ\(2) & (!\lcd_out|CLK_COUNT_400HZ\(4) & !\lcd_out|CLK_COUNT_400HZ\(3)))) # (!\lcd_out|CLK_COUNT_400HZ\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|CLK_COUNT_400HZ\(5),
	datab => \lcd_out|CLK_COUNT_400HZ\(2),
	datac => \lcd_out|CLK_COUNT_400HZ\(4),
	datad => \lcd_out|CLK_COUNT_400HZ\(3),
	combout => \lcd_out|LessThan0~0_combout\);

-- Location: LCCOMB_X32_Y23_N20
\lcd_out|LessThan0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|LessThan0~2_combout\ = (!\lcd_out|CLK_COUNT_400HZ\(11) & (((\lcd_out|LessThan0~1_combout\ & \lcd_out|LessThan0~0_combout\)) # (!\lcd_out|CLK_COUNT_400HZ\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|LessThan0~1_combout\,
	datab => \lcd_out|CLK_COUNT_400HZ\(11),
	datac => \lcd_out|CLK_COUNT_400HZ\(10),
	datad => \lcd_out|LessThan0~0_combout\,
	combout => \lcd_out|LessThan0~2_combout\);

-- Location: LCCOMB_X32_Y23_N18
\lcd_out|CLK_COUNT_400HZ[6]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[6]~26_combout\ = (((!\lcd_out|LessThan0~2_combout\ & !\lcd_out|LessThan0~3_combout\)) # (!\reset~combout\)) # (!\lcd_out|LessThan0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|LessThan0~4_combout\,
	datab => \reset~combout\,
	datac => \lcd_out|LessThan0~2_combout\,
	datad => \lcd_out|LessThan0~3_combout\,
	combout => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\);

-- Location: LCFF_X31_Y23_N15
\lcd_out|CLK_COUNT_400HZ[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[1]~22_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(1));

-- Location: LCCOMB_X31_Y23_N18
\lcd_out|CLK_COUNT_400HZ[3]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[3]~27_combout\ = (\lcd_out|CLK_COUNT_400HZ\(3) & (!\lcd_out|CLK_COUNT_400HZ[2]~25\)) # (!\lcd_out|CLK_COUNT_400HZ\(3) & ((\lcd_out|CLK_COUNT_400HZ[2]~25\) # (GND)))
-- \lcd_out|CLK_COUNT_400HZ[3]~28\ = CARRY((!\lcd_out|CLK_COUNT_400HZ[2]~25\) # (!\lcd_out|CLK_COUNT_400HZ\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|CLK_COUNT_400HZ\(3),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[2]~25\,
	combout => \lcd_out|CLK_COUNT_400HZ[3]~27_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[3]~28\);

-- Location: LCFF_X31_Y23_N19
\lcd_out|CLK_COUNT_400HZ[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[3]~27_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(3));

-- Location: LCCOMB_X31_Y23_N22
\lcd_out|CLK_COUNT_400HZ[5]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[5]~31_combout\ = (\lcd_out|CLK_COUNT_400HZ\(5) & (!\lcd_out|CLK_COUNT_400HZ[4]~30\)) # (!\lcd_out|CLK_COUNT_400HZ\(5) & ((\lcd_out|CLK_COUNT_400HZ[4]~30\) # (GND)))
-- \lcd_out|CLK_COUNT_400HZ[5]~32\ = CARRY((!\lcd_out|CLK_COUNT_400HZ[4]~30\) # (!\lcd_out|CLK_COUNT_400HZ\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|CLK_COUNT_400HZ\(5),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[4]~30\,
	combout => \lcd_out|CLK_COUNT_400HZ[5]~31_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[5]~32\);

-- Location: LCFF_X31_Y23_N23
\lcd_out|CLK_COUNT_400HZ[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[5]~31_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(5));

-- Location: LCCOMB_X31_Y23_N26
\lcd_out|CLK_COUNT_400HZ[7]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[7]~35_combout\ = (\lcd_out|CLK_COUNT_400HZ\(7) & (!\lcd_out|CLK_COUNT_400HZ[6]~34\)) # (!\lcd_out|CLK_COUNT_400HZ\(7) & ((\lcd_out|CLK_COUNT_400HZ[6]~34\) # (GND)))
-- \lcd_out|CLK_COUNT_400HZ[7]~36\ = CARRY((!\lcd_out|CLK_COUNT_400HZ[6]~34\) # (!\lcd_out|CLK_COUNT_400HZ\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|CLK_COUNT_400HZ\(7),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[6]~34\,
	combout => \lcd_out|CLK_COUNT_400HZ[7]~35_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[7]~36\);

-- Location: LCFF_X31_Y23_N27
\lcd_out|CLK_COUNT_400HZ[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[7]~35_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(7));

-- Location: LCCOMB_X31_Y23_N28
\lcd_out|CLK_COUNT_400HZ[8]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[8]~37_combout\ = (\lcd_out|CLK_COUNT_400HZ\(8) & (\lcd_out|CLK_COUNT_400HZ[7]~36\ $ (GND))) # (!\lcd_out|CLK_COUNT_400HZ\(8) & (!\lcd_out|CLK_COUNT_400HZ[7]~36\ & VCC))
-- \lcd_out|CLK_COUNT_400HZ[8]~38\ = CARRY((\lcd_out|CLK_COUNT_400HZ\(8) & !\lcd_out|CLK_COUNT_400HZ[7]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|CLK_COUNT_400HZ\(8),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[7]~36\,
	combout => \lcd_out|CLK_COUNT_400HZ[8]~37_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[8]~38\);

-- Location: LCFF_X31_Y23_N29
\lcd_out|CLK_COUNT_400HZ[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[8]~37_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(8));

-- Location: LCCOMB_X31_Y23_N30
\lcd_out|CLK_COUNT_400HZ[9]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[9]~39_combout\ = (\lcd_out|CLK_COUNT_400HZ\(9) & (!\lcd_out|CLK_COUNT_400HZ[8]~38\)) # (!\lcd_out|CLK_COUNT_400HZ\(9) & ((\lcd_out|CLK_COUNT_400HZ[8]~38\) # (GND)))
-- \lcd_out|CLK_COUNT_400HZ[9]~40\ = CARRY((!\lcd_out|CLK_COUNT_400HZ[8]~38\) # (!\lcd_out|CLK_COUNT_400HZ\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|CLK_COUNT_400HZ\(9),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[8]~38\,
	combout => \lcd_out|CLK_COUNT_400HZ[9]~39_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[9]~40\);

-- Location: LCFF_X31_Y23_N31
\lcd_out|CLK_COUNT_400HZ[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[9]~39_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(9));

-- Location: LCCOMB_X31_Y22_N0
\lcd_out|CLK_COUNT_400HZ[10]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[10]~41_combout\ = (\lcd_out|CLK_COUNT_400HZ\(10) & (\lcd_out|CLK_COUNT_400HZ[9]~40\ $ (GND))) # (!\lcd_out|CLK_COUNT_400HZ\(10) & (!\lcd_out|CLK_COUNT_400HZ[9]~40\ & VCC))
-- \lcd_out|CLK_COUNT_400HZ[10]~42\ = CARRY((\lcd_out|CLK_COUNT_400HZ\(10) & !\lcd_out|CLK_COUNT_400HZ[9]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|CLK_COUNT_400HZ\(10),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[9]~40\,
	combout => \lcd_out|CLK_COUNT_400HZ[10]~41_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[10]~42\);

-- Location: LCFF_X31_Y22_N1
\lcd_out|CLK_COUNT_400HZ[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[10]~41_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(10));

-- Location: LCCOMB_X31_Y22_N2
\lcd_out|CLK_COUNT_400HZ[11]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[11]~43_combout\ = (\lcd_out|CLK_COUNT_400HZ\(11) & (!\lcd_out|CLK_COUNT_400HZ[10]~42\)) # (!\lcd_out|CLK_COUNT_400HZ\(11) & ((\lcd_out|CLK_COUNT_400HZ[10]~42\) # (GND)))
-- \lcd_out|CLK_COUNT_400HZ[11]~44\ = CARRY((!\lcd_out|CLK_COUNT_400HZ[10]~42\) # (!\lcd_out|CLK_COUNT_400HZ\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|CLK_COUNT_400HZ\(11),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[10]~42\,
	combout => \lcd_out|CLK_COUNT_400HZ[11]~43_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[11]~44\);

-- Location: LCFF_X31_Y22_N3
\lcd_out|CLK_COUNT_400HZ[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[11]~43_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(11));

-- Location: LCCOMB_X31_Y22_N4
\lcd_out|CLK_COUNT_400HZ[12]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[12]~45_combout\ = (\lcd_out|CLK_COUNT_400HZ\(12) & (\lcd_out|CLK_COUNT_400HZ[11]~44\ $ (GND))) # (!\lcd_out|CLK_COUNT_400HZ\(12) & (!\lcd_out|CLK_COUNT_400HZ[11]~44\ & VCC))
-- \lcd_out|CLK_COUNT_400HZ[12]~46\ = CARRY((\lcd_out|CLK_COUNT_400HZ\(12) & !\lcd_out|CLK_COUNT_400HZ[11]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|CLK_COUNT_400HZ\(12),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[11]~44\,
	combout => \lcd_out|CLK_COUNT_400HZ[12]~45_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[12]~46\);

-- Location: LCFF_X31_Y22_N5
\lcd_out|CLK_COUNT_400HZ[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[12]~45_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(12));

-- Location: LCCOMB_X31_Y22_N6
\lcd_out|CLK_COUNT_400HZ[13]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_COUNT_400HZ[13]~47_combout\ = (\lcd_out|CLK_COUNT_400HZ\(13) & (!\lcd_out|CLK_COUNT_400HZ[12]~46\)) # (!\lcd_out|CLK_COUNT_400HZ\(13) & ((\lcd_out|CLK_COUNT_400HZ[12]~46\) # (GND)))
-- \lcd_out|CLK_COUNT_400HZ[13]~48\ = CARRY((!\lcd_out|CLK_COUNT_400HZ[12]~46\) # (!\lcd_out|CLK_COUNT_400HZ\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|CLK_COUNT_400HZ\(13),
	datad => VCC,
	cin => \lcd_out|CLK_COUNT_400HZ[12]~46\,
	combout => \lcd_out|CLK_COUNT_400HZ[13]~47_combout\,
	cout => \lcd_out|CLK_COUNT_400HZ[13]~48\);

-- Location: LCFF_X31_Y22_N7
\lcd_out|CLK_COUNT_400HZ[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[13]~47_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(13));

-- Location: LCFF_X31_Y22_N9
\lcd_out|CLK_COUNT_400HZ[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_COUNT_400HZ[14]~49_combout\,
	sclr => \lcd_out|CLK_COUNT_400HZ[6]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_COUNT_400HZ\(14));

-- Location: LCCOMB_X32_Y23_N10
\lcd_out|LessThan0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|LessThan0~3_combout\ = (((!\lcd_out|CLK_COUNT_400HZ\(14)) # (!\lcd_out|CLK_COUNT_400HZ\(12))) # (!\lcd_out|CLK_COUNT_400HZ\(13))) # (!\lcd_out|CLK_COUNT_400HZ\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|CLK_COUNT_400HZ\(15),
	datab => \lcd_out|CLK_COUNT_400HZ\(13),
	datac => \lcd_out|CLK_COUNT_400HZ\(12),
	datad => \lcd_out|CLK_COUNT_400HZ\(14),
	combout => \lcd_out|LessThan0~3_combout\);

-- Location: LCCOMB_X32_Y23_N0
\lcd_out|CLK_400HZ~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|CLK_400HZ~0_combout\ = \lcd_out|CLK_400HZ~regout\ $ ((((!\lcd_out|LessThan0~3_combout\ & !\lcd_out|LessThan0~2_combout\)) # (!\lcd_out|LessThan0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|LessThan0~4_combout\,
	datab => \lcd_out|LessThan0~3_combout\,
	datac => \lcd_out|CLK_400HZ~regout\,
	datad => \lcd_out|LessThan0~2_combout\,
	combout => \lcd_out|CLK_400HZ~0_combout\);

-- Location: LCFF_X32_Y23_N1
\lcd_out|CLK_400HZ\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \lcd_out|CLK_400HZ~0_combout\,
	sclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|CLK_400HZ~regout\);

-- Location: CLKCTRL_G10
\lcd_out|CLK_400HZ~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \lcd_out|CLK_400HZ~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \lcd_out|CLK_400HZ~clkctrl_outclk\);

-- Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_select[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reg_select(0),
	combout => \reg_select~combout\(0));

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G2
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\run~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_run,
	combout => \run~combout\);

-- Location: LCCOMB_X37_Y26_N2
\CPU|CU|current_state.Reset~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|current_state.Reset~0_combout\ = (\run~combout\) # (\CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \run~combout\,
	datac => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|current_state.Reset~0_combout\);

-- Location: LCFF_X37_Y26_N3
\CPU|CU|current_state.Reset\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|current_state.Reset~0_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|current_state.Reset~regout\);

-- Location: LCCOMB_X36_Y28_N16
\CPU|CU|Selector57~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector57~0_combout\ = (\CPU|CU|IR\(8) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(8),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector57~0_combout\);

-- Location: LCCOMB_X36_Y28_N10
\CPU|CU|Selector50~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector50~0_combout\ = (\CPU|CU|IR\(15) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(15),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector50~0_combout\);

-- Location: LCCOMB_X37_Y26_N4
\CPU|CU|Selector139~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector139~0_combout\ = (\CPU|CU|current_state.WB~regout\) # ((\run~combout\ & !\CPU|CU|current_state.Reset~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.WB~regout\,
	datac => \run~combout\,
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector139~0_combout\);

-- Location: LCFF_X37_Y26_N5
\CPU|CU|current_state.Fetch\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector139~0_combout\,
	aclr => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|current_state.Fetch~regout\);

-- Location: LCFF_X38_Y28_N11
\CPU|CU|current_state.Decode\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|CU|current_state.Fetch~regout\,
	aclr => \reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|current_state.Decode~regout\);

-- Location: LCFF_X37_Y28_N7
\CPU|CU|current_state.Execute\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|CU|current_state.Decode~regout\,
	aclr => \reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|current_state.Execute~regout\);

-- Location: LCCOMB_X42_Y24_N28
\CPU|CU|Selector122~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector122~0_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|current_state.Execute~regout\) # ((\CPU|CU|current_state.Decode~regout\ & \CPU|CU|IR\(15))))) # (!\CPU|CU|op.call~regout\ & (((\CPU|CU|current_state.Decode~regout\ & \CPU|CU|IR\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.call~regout\,
	datab => \CPU|CU|current_state.Execute~regout\,
	datac => \CPU|CU|current_state.Decode~regout\,
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|Selector122~0_combout\);

-- Location: LCFF_X42_Y24_N29
\CPU|CU|PCd_EN\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector122~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PCd_EN~regout\);

-- Location: LCCOMB_X36_Y22_N10
\CPU|CU|Selector51~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector51~0_combout\ = (\CPU|CU|IR\(14) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(14),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector51~0_combout\);

-- Location: LCCOMB_X33_Y25_N0
\CPU|CU|SP[0]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[0]~16_combout\ = (\CPU|CU|Add1~1_combout\ & (\CPU|CU|SP\(0) $ (VCC))) # (!\CPU|CU|Add1~1_combout\ & (\CPU|CU|SP\(0) & VCC))
-- \CPU|CU|SP[0]~17\ = CARRY((\CPU|CU|Add1~1_combout\ & \CPU|CU|SP\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add1~1_combout\,
	datab => \CPU|CU|SP\(0),
	datad => VCC,
	combout => \CPU|CU|SP[0]~16_combout\,
	cout => \CPU|CU|SP[0]~17\);

-- Location: LCCOMB_X31_Y25_N0
\~GND\ : cycloneii_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X37_Y26_N30
\CPU|CU|SP[0]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[0]~39_combout\ = (!\CPU|CU|SP[0]~38_combout\ & (!\reset~combout\ & ((\CPU|CU|op.ret~0_combout\) # (!\CPU|CU|current_state.Decode~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP[0]~38_combout\,
	datab => \CPU|CU|current_state.Decode~regout\,
	datac => \reset~combout\,
	datad => \CPU|CU|op.ret~0_combout\,
	combout => \CPU|CU|SP[0]~39_combout\);

-- Location: LCFF_X33_Y25_N1
\CPU|CU|SP[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[0]~16_combout\,
	sdata => \~GND~combout\,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(0));

-- Location: LCCOMB_X33_Y25_N2
\CPU|CU|SP[1]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[1]~18_combout\ = (\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|SP\(1) & (!\CPU|CU|SP[0]~17\)) # (!\CPU|CU|SP\(1) & ((\CPU|CU|SP[0]~17\) # (GND))))) # (!\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|SP\(1) & (\CPU|CU|SP[0]~17\ & VCC)) # 
-- (!\CPU|CU|SP\(1) & (!\CPU|CU|SP[0]~17\))))
-- \CPU|CU|SP[1]~19\ = CARRY((\CPU|CU|current_state.Decode~regout\ & ((!\CPU|CU|SP[0]~17\) # (!\CPU|CU|SP\(1)))) # (!\CPU|CU|current_state.Decode~regout\ & (!\CPU|CU|SP\(1) & !\CPU|CU|SP[0]~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|SP\(1),
	datad => VCC,
	cin => \CPU|CU|SP[0]~17\,
	combout => \CPU|CU|SP[1]~18_combout\,
	cout => \CPU|CU|SP[1]~19\);

-- Location: LCFF_X33_Y25_N3
\CPU|CU|SP[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[1]~18_combout\,
	sdata => VCC,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(1));

-- Location: LCCOMB_X34_Y26_N0
\CPU|CU|Selector105~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector105~0_combout\ = (\CPU|CU|SP_EN~regout\ & ((\CPU|CU|current_state.Execute~regout\) # ((\CPU|CU|current_state.Fetch~regout\) # (\CPU|CU|current_state.Decode~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP_EN~regout\,
	datab => \CPU|CU|current_state.Execute~regout\,
	datac => \CPU|CU|current_state.Fetch~regout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Selector105~0_combout\);

-- Location: LCCOMB_X34_Y26_N10
\CPU|CU|Selector105~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector105~2_combout\ = (\CPU|CU|Selector105~1_combout\) # ((\CPU|CU|Selector105~0_combout\) # ((\CPU|CU|IR\(15) & \CPU|CU|current_state.Decode~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Selector105~1_combout\,
	datab => \CPU|CU|IR\(15),
	datac => \CPU|CU|Selector105~0_combout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Selector105~2_combout\);

-- Location: LCFF_X34_Y26_N11
\CPU|CU|SP_EN\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector105~2_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP_EN~regout\);

-- Location: LCCOMB_X36_Y22_N0
\CPU|CU|Selector56~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector56~0_combout\ = (\CPU|CU|IR\(9) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(9),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector56~0_combout\);

-- Location: LCCOMB_X34_Y27_N26
\CPU|CU|PC[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[2]~2_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~34_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[2]~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC[10]~24_combout\,
	datab => \CPU|CU|PC~34_combout\,
	datad => \data_bus_temp[2]~22_combout\,
	combout => \CPU|CU|PC[2]~2_combout\);

-- Location: LCFF_X32_Y27_N27
\CPU|CU|current_state.WB\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|CU|current_state.Execute~regout\,
	aclr => \reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|current_state.WB~regout\);

-- Location: LCCOMB_X33_Y24_N2
\CPU|CU|Selector63~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector63~0_combout\ = (\CPU|CU|IR\(2) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(2),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector63~0_combout\);

-- Location: LCFF_X33_Y24_N3
\CPU|CU|IR[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector63~0_combout\,
	sdata => \data_bus_temp[2]~22_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(2));

-- Location: LCCOMB_X33_Y24_N8
\CPU|CU|Selector55~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector55~0_combout\ = (\CPU|CU|IR\(10) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector55~0_combout\);

-- Location: LCCOMB_X33_Y25_N4
\CPU|CU|SP[2]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[2]~20_combout\ = ((\CPU|CU|current_state.Decode~regout\ $ (\CPU|CU|SP\(2) $ (\CPU|CU|SP[1]~19\)))) # (GND)
-- \CPU|CU|SP[2]~21\ = CARRY((\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|SP\(2) & !\CPU|CU|SP[1]~19\)) # (!\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|SP\(2)) # (!\CPU|CU|SP[1]~19\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|SP\(2),
	datad => VCC,
	cin => \CPU|CU|SP[1]~19\,
	combout => \CPU|CU|SP[2]~20_combout\,
	cout => \CPU|CU|SP[2]~21\);

-- Location: LCFF_X33_Y25_N5
\CPU|CU|SP[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[2]~20_combout\,
	sdata => VCC,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(2));

-- Location: LCCOMB_X33_Y25_N6
\CPU|CU|SP[3]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[3]~22_combout\ = (\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|SP\(3) & (!\CPU|CU|SP[2]~21\)) # (!\CPU|CU|SP\(3) & ((\CPU|CU|SP[2]~21\) # (GND))))) # (!\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|SP\(3) & (\CPU|CU|SP[2]~21\ & VCC)) # 
-- (!\CPU|CU|SP\(3) & (!\CPU|CU|SP[2]~21\))))
-- \CPU|CU|SP[3]~23\ = CARRY((\CPU|CU|current_state.Decode~regout\ & ((!\CPU|CU|SP[2]~21\) # (!\CPU|CU|SP\(3)))) # (!\CPU|CU|current_state.Decode~regout\ & (!\CPU|CU|SP\(3) & !\CPU|CU|SP[2]~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|SP\(3),
	datad => VCC,
	cin => \CPU|CU|SP[2]~21\,
	combout => \CPU|CU|SP[3]~22_combout\,
	cout => \CPU|CU|SP[3]~23\);

-- Location: LCFF_X33_Y25_N7
\CPU|CU|SP[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[3]~22_combout\,
	sdata => VCC,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(3));

-- Location: LCCOMB_X34_Y24_N16
\CPU|CU|Selector62~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector62~0_combout\ = (\CPU|CU|IR\(3) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(3),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector62~0_combout\);

-- Location: LCFF_X34_Y24_N17
\CPU|CU|IR[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector62~0_combout\,
	sdata => \data_bus_temp[3]~25_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(3));

-- Location: LCCOMB_X35_Y28_N20
\CPU|CU|offset[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset[3]~3_combout\ = (\CPU|CU|offset~45_combout\ & ((\CPU|CU|IR\(3)))) # (!\CPU|CU|offset~45_combout\ & (\CPU|CU|offset~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~23_combout\,
	datab => \CPU|CU|offset~45_combout\,
	datad => \CPU|CU|IR\(3),
	combout => \CPU|CU|offset[3]~3_combout\);

-- Location: LCCOMB_X34_Y28_N30
\CPU|CU|Selector135~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector135~0_combout\ = (\CPU|CU|offset\(3) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(3),
	datac => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector135~0_combout\);

-- Location: LCFF_X35_Y28_N21
\CPU|CU|offset[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|offset[3]~3_combout\,
	sdata => \CPU|CU|Selector135~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(3));

-- Location: LCCOMB_X34_Y28_N28
\CPU|CU|PC~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~35_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(3)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(3),
	datab => \CPU|CU|offset\(3),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|PC~35_combout\);

-- Location: LCCOMB_X35_Y26_N22
\CPU|CU|AR[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[3]~3_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[3]~25_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~35_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ret~regout\,
	datab => \CPU|CU|PC~35_combout\,
	datad => \data_bus_temp[3]~25_combout\,
	combout => \CPU|CU|AR[3]~3_combout\);

-- Location: LCCOMB_X34_Y28_N22
\CPU|CU|Selector118~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector118~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(3)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(3))))) # (!\CPU|CU|current_state.Execute~regout\ & (\CPU|CU|PC\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(3),
	datab => \CPU|CU|offset\(3),
	datac => \CPU|CU|current_state.Execute~regout\,
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|Selector118~0_combout\);

-- Location: LCCOMB_X33_Y26_N16
\CPU|CU|AR[0]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[0]~16_combout\ = (!\reset~combout\ & (!\CPU|CU|current_state.Decode~regout\ & ((!\CPU|CU|current_state.Execute~regout\) # (!\CPU|CU|op.ret~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \CPU|CU|op.ret~regout\,
	datac => \CPU|CU|current_state.Execute~regout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|AR[0]~16_combout\);

-- Location: LCFF_X35_Y26_N23
\CPU|CU|AR[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[3]~3_combout\,
	sdata => \CPU|CU|Selector118~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(3));

-- Location: LCCOMB_X34_Y25_N28
\CPU|address[3]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[3]~33_combout\ = (\CPU|CU|AR_EN~regout\ & (((\CPU|CU|AR\(3))))) # (!\CPU|CU|AR_EN~regout\ & ((\CPU|CU|SP\(3)) # ((!\CPU|CU|SP_EN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|AR_EN~regout\,
	datab => \CPU|CU|SP\(3),
	datac => \CPU|CU|SP_EN~regout\,
	datad => \CPU|CU|AR\(3),
	combout => \CPU|address[3]~33_combout\);

-- Location: LCCOMB_X37_Y28_N26
\CPU|CU|st_op~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|st_op~0_combout\ = (\CPU|CU|Mux1~1_combout\ & (!\CPU|CU|IR\(14) & !\CPU|CU|IR\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Mux1~1_combout\,
	datac => \CPU|CU|IR\(14),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|st_op~0_combout\);

-- Location: LCCOMB_X42_Y24_N26
\CPU|CU|Selector73~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector73~1_combout\ = (\CPU|CU|Selector73~0_combout\ & ((\CPU|CU|current_state.Execute~regout\) # ((\CPU|CU|current_state.Decode~regout\ & \CPU|CU|st_op~0_combout\)))) # (!\CPU|CU|Selector73~0_combout\ & (((\CPU|CU|current_state.Decode~regout\ & 
-- \CPU|CU|st_op~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Selector73~0_combout\,
	datab => \CPU|CU|current_state.Execute~regout\,
	datac => \CPU|CU|current_state.Decode~regout\,
	datad => \CPU|CU|st_op~0_combout\,
	combout => \CPU|CU|Selector73~1_combout\);

-- Location: LCFF_X42_Y24_N27
\CPU|CU|st_op\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector73~1_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|st_op~regout\);

-- Location: LCCOMB_X36_Y22_N24
\CPU|CU|ctl_wd~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~29_combout\ = (\CPU|CU|IR\(8) & (!\CPU|CU|IR\(14) & ((\CPU|CU|IR\(10))))) # (!\CPU|CU|IR\(8) & (\CPU|CU|IR\(9) & (\CPU|CU|IR\(14) $ (\CPU|CU|IR\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(14),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|ctl_wd~29_combout\);

-- Location: LCCOMB_X43_Y27_N30
\CPU|CU|Selector54~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector54~0_combout\ = (\CPU|CU|IR\(11) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(11),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector54~0_combout\);

-- Location: LCCOMB_X33_Y25_N8
\CPU|CU|SP[4]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[4]~24_combout\ = ((\CPU|CU|current_state.Decode~regout\ $ (\CPU|CU|SP\(4) $ (\CPU|CU|SP[3]~23\)))) # (GND)
-- \CPU|CU|SP[4]~25\ = CARRY((\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|SP\(4) & !\CPU|CU|SP[3]~23\)) # (!\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|SP\(4)) # (!\CPU|CU|SP[3]~23\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|SP\(4),
	datad => VCC,
	cin => \CPU|CU|SP[3]~23\,
	combout => \CPU|CU|SP[4]~24_combout\,
	cout => \CPU|CU|SP[4]~25\);

-- Location: LCFF_X33_Y25_N9
\CPU|CU|SP[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[4]~24_combout\,
	sdata => VCC,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(4));

-- Location: LCCOMB_X43_Y27_N8
\CPU|CU|Selector61~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector61~0_combout\ = (\CPU|CU|IR\(4) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(4),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector61~0_combout\);

-- Location: LCFF_X43_Y27_N9
\CPU|CU|IR[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector61~0_combout\,
	sdata => \data_bus_temp[4]~4_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(4));

-- Location: LCCOMB_X43_Y27_N14
\CPU|CU|offset~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~44_combout\ = (\CPU|CU|offset~22_combout\ & (((!\CPU|CU|IR\(10) & \CPU|CU|IR\(4))))) # (!\CPU|CU|offset~22_combout\ & (\CPU|CU|offset\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~22_combout\,
	datab => \CPU|CU|offset\(4),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(4),
	combout => \CPU|CU|offset~44_combout\);

-- Location: LCCOMB_X33_Y28_N24
\CPU|CU|offset[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset[4]~4_combout\ = (\CPU|CU|offset~45_combout\ & (\CPU|CU|IR\(4))) # (!\CPU|CU|offset~45_combout\ & ((\CPU|CU|offset~44_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(4),
	datab => \CPU|CU|offset~45_combout\,
	datad => \CPU|CU|offset~44_combout\,
	combout => \CPU|CU|offset[4]~4_combout\);

-- Location: LCCOMB_X38_Y28_N28
\CPU|CU|Selector134~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector134~0_combout\ = (\CPU|CU|offset\(4) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(4),
	datac => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector134~0_combout\);

-- Location: LCFF_X33_Y28_N25
\CPU|CU|offset[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|offset[4]~4_combout\,
	sdata => \CPU|CU|Selector134~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(4));

-- Location: LCCOMB_X35_Y26_N18
\CPU|CU|PC~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~19_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(4)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(4),
	datab => \CPU|CU|offset\(4),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|PC~19_combout\);

-- Location: LCCOMB_X34_Y27_N16
\CPU|CU|PC[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[4]~4_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~19_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[4]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC[10]~24_combout\,
	datab => \CPU|CU|PC~19_combout\,
	datad => \data_bus_temp[4]~4_combout\,
	combout => \CPU|CU|PC[4]~4_combout\);

-- Location: LCCOMB_X37_Y26_N0
\CPU|CU|op.orx~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.orx~0_combout\ = (!\reset~combout\ & \CPU|CU|current_state.Decode~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|op.orx~0_combout\);

-- Location: LCFF_X37_Y28_N27
\CPU|CU|op.jmp\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|st_op~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.jmp~regout\);

-- Location: LCCOMB_X37_Y28_N28
\CPU|CU|op.bn~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.bn~0_combout\ = (!\CPU|CU|IR\(9) & (\CPU|CU|op.sethi~0_combout\ & (\CPU|CU|IR\(10) & \CPU|CU|IR\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(9),
	datab => \CPU|CU|op.sethi~0_combout\,
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|op.bn~0_combout\);

-- Location: LCFF_X37_Y28_N29
\CPU|CU|op.bn\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.bn~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.bn~regout\);

-- Location: LCCOMB_X37_Y26_N18
\CPU|CU|Selector58~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector58~0_combout\ = (\CPU|CU|IR\(7) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(7),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector58~0_combout\);

-- Location: LCCOMB_X35_Y26_N2
\CPU|CU|PC~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~38_combout\ = (\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(7))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(7),
	datac => \CPU|CU|PC\(7),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|PC~38_combout\);

-- Location: LCCOMB_X34_Y27_N22
\CPU|CU|PC[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[7]~7_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~38_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[7]~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC[10]~24_combout\,
	datab => \CPU|CU|PC~38_combout\,
	datad => \data_bus_temp[7]~13_combout\,
	combout => \CPU|CU|PC[7]~7_combout\);

-- Location: LCCOMB_X33_Y28_N16
\CPU|CU|Add0~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~31_combout\ = (\CPU|CU|PC\(7) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|PC\(7),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~31_combout\);

-- Location: LCCOMB_X37_Y26_N8
\CPU|CU|Selector59~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector59~0_combout\ = (\CPU|CU|IR\(6) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(6),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector59~0_combout\);

-- Location: LCCOMB_X37_Y28_N18
\CPU|CU|op.addi~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.addi~0_combout\ = (\CPU|CU|IR\(9) & (\CPU|CU|op.sethi~0_combout\ & (!\CPU|CU|IR\(10) & \CPU|CU|IR\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(9),
	datab => \CPU|CU|op.sethi~0_combout\,
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|op.addi~0_combout\);

-- Location: LCFF_X37_Y28_N19
\CPU|CU|op.addi\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.addi~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.addi~regout\);

-- Location: LCCOMB_X37_Y28_N0
\CPU|CU|op.sethi~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.sethi~1_combout\ = (\CPU|CU|IR\(9) & (\CPU|CU|op.sethi~0_combout\ & (\CPU|CU|IR\(10) & \CPU|CU|IR\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(9),
	datab => \CPU|CU|op.sethi~0_combout\,
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|op.sethi~1_combout\);

-- Location: LCFF_X37_Y28_N1
\CPU|CU|op.sethi\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.sethi~1_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.sethi~regout\);

-- Location: LCCOMB_X37_Y28_N4
\CPU|CU|const_out~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out~16_combout\ = (!\CPU|CU|op.addi~regout\ & !\CPU|CU|op.sethi~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|op.addi~regout\,
	datad => \CPU|CU|op.sethi~regout\,
	combout => \CPU|CU|const_out~16_combout\);

-- Location: LCCOMB_X33_Y27_N12
\CPU|CU|const_out[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[6]~6_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(6)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(6),
	datac => \CPU|CU|const_out\(6),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[6]~6_combout\);

-- Location: LCCOMB_X32_Y27_N6
\CPU|CU|Selector98~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector98~0_combout\ = (\CPU|CU|const_out\(6) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(6),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector98~0_combout\);

-- Location: LCFF_X33_Y27_N13
\CPU|CU|const_out[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[6]~6_combout\,
	sdata => \CPU|CU|Selector98~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(6));

-- Location: LCCOMB_X36_Y22_N22
\CPU|CU|ctl_wd~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~11_combout\ = ((\CPU|CU|IR\(9) & (!\CPU|CU|IR\(10) & !\CPU|CU|IR\(8)))) # (!\CPU|CU|IR\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(14),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|ctl_wd~11_combout\);

-- Location: LCCOMB_X42_Y24_N16
\CPU|CU|ctl_wd[13]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd[13]~3_combout\ = (\CPU|CU|IR\(15) & (\CPU|CU|ctl_wd\(13))) # (!\CPU|CU|IR\(15) & ((!\CPU|CU|ctl_wd~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|IR\(15),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|CU|ctl_wd~11_combout\,
	combout => \CPU|CU|ctl_wd[13]~3_combout\);

-- Location: LCCOMB_X38_Y28_N8
\CPU|CU|Selector75~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector75~0_combout\ = (\CPU|CU|current_state.Reset~regout\ & \CPU|CU|ctl_wd\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datad => \CPU|CU|ctl_wd\(13),
	combout => \CPU|CU|Selector75~0_combout\);

-- Location: LCFF_X42_Y24_N17
\CPU|CU|ctl_wd[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|ctl_wd[13]~3_combout\,
	sdata => \CPU|CU|Selector75~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(13));

-- Location: LCCOMB_X42_Y24_N10
\CPU|CU|ctl_wd[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd[1]~1_combout\ = (\CPU|CU|IR\(15) & ((\CPU|CU|ctl_wd\(1)))) # (!\CPU|CU|IR\(15) & (\CPU|CU|ctl_wd~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd~13_combout\,
	datac => \CPU|CU|ctl_wd\(1),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|ctl_wd[1]~1_combout\);

-- Location: LCCOMB_X38_Y28_N20
\CPU|CU|Selector87~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector87~0_combout\ = (\CPU|CU|ctl_wd\(1) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(1),
	datac => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector87~0_combout\);

-- Location: LCFF_X42_Y24_N11
\CPU|CU|ctl_wd[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|ctl_wd[1]~1_combout\,
	sdata => \CPU|CU|Selector87~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(1));

-- Location: LCCOMB_X36_Y22_N16
\CPU|CU|ctl_wd~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~12_combout\ = (\CPU|CU|IR\(14) & (\CPU|CU|IR\(9) & ((\CPU|CU|IR\(8)) # (!\CPU|CU|IR\(10))))) # (!\CPU|CU|IR\(14) & ((\CPU|CU|IR\(9)) # ((\CPU|CU|IR\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(14),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|ctl_wd~12_combout\);

-- Location: LCCOMB_X34_Y24_N20
\CPU|CU|ctl_wd~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~14_combout\ = (\CPU|CU|IR\(3) & (((!\CPU|CU|IR\(10) & !\CPU|CU|IR\(14))) # (!\CPU|CU|ctl_wd~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(10),
	datab => \CPU|CU|ctl_wd~12_combout\,
	datac => \CPU|CU|IR\(3),
	datad => \CPU|CU|IR\(14),
	combout => \CPU|CU|ctl_wd~14_combout\);

-- Location: LCCOMB_X42_Y24_N20
\CPU|CU|ctl_wd[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd[2]~0_combout\ = (\CPU|CU|IR\(15) & (\CPU|CU|ctl_wd\(2))) # (!\CPU|CU|IR\(15) & ((\CPU|CU|ctl_wd~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|IR\(15),
	datac => \CPU|CU|ctl_wd\(2),
	datad => \CPU|CU|ctl_wd~14_combout\,
	combout => \CPU|CU|ctl_wd[2]~0_combout\);

-- Location: LCCOMB_X38_Y28_N22
\CPU|CU|Selector86~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector86~0_combout\ = (\CPU|CU|ctl_wd\(2) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(2),
	datac => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector86~0_combout\);

-- Location: LCFF_X42_Y24_N21
\CPU|CU|ctl_wd[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|ctl_wd[2]~0_combout\,
	sdata => \CPU|CU|Selector86~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(2));

-- Location: LCCOMB_X41_Y25_N18
\CPU|FNU|Bbus[12]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[12]~0_combout\ = (\CPU|CU|ctl_wd\(1) & !\CPU|CU|ctl_wd\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|ctl_wd\(1),
	datad => \CPU|CU|ctl_wd\(2),
	combout => \CPU|FNU|Bbus[12]~0_combout\);

-- Location: LCCOMB_X42_Y24_N30
\CPU|CU|ctl_wd[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd[0]~2_combout\ = (\CPU|CU|IR\(15) & ((\CPU|CU|ctl_wd\(0)))) # (!\CPU|CU|IR\(15) & (\CPU|CU|ctl_wd~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd~15_combout\,
	datac => \CPU|CU|ctl_wd\(0),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|ctl_wd[0]~2_combout\);

-- Location: LCCOMB_X38_Y28_N24
\CPU|CU|Selector88~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector88~0_combout\ = (\CPU|CU|current_state.Reset~regout\ & \CPU|CU|ctl_wd\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datac => \CPU|CU|ctl_wd\(0),
	combout => \CPU|CU|Selector88~0_combout\);

-- Location: LCFF_X42_Y24_N31
\CPU|CU|ctl_wd[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|ctl_wd[0]~2_combout\,
	sdata => \CPU|CU|Selector88~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(0));

-- Location: LCCOMB_X41_Y25_N28
\CPU|FNU|Bbus[12]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[12]~3_combout\ = (\CPU|CU|ctl_wd\(2)) # ((\CPU|CU|ctl_wd\(0) & !\CPU|CU|ctl_wd\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(0),
	datac => \CPU|CU|ctl_wd\(1),
	datad => \CPU|CU|ctl_wd\(2),
	combout => \CPU|FNU|Bbus[12]~3_combout\);

-- Location: LCCOMB_X41_Y25_N30
\CPU|FNU|Bbus[12]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[12]~4_combout\ = (\CPU|CU|ctl_wd\(2)) # ((\CPU|CU|ctl_wd\(0) & \CPU|CU|ctl_wd\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(0),
	datac => \CPU|CU|ctl_wd\(1),
	datad => \CPU|CU|ctl_wd\(2),
	combout => \CPU|FNU|Bbus[12]~4_combout\);

-- Location: LCCOMB_X36_Y22_N2
\CPU|CU|ctl_wd~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~16_combout\ = (\CPU|CU|IR\(10) & ((\CPU|CU|IR\(14) & ((!\CPU|CU|IR\(8)) # (!\CPU|CU|IR\(9)))) # (!\CPU|CU|IR\(14) & (!\CPU|CU|IR\(9) & !\CPU|CU|IR\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(14),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|ctl_wd~16_combout\);

-- Location: LCCOMB_X42_Y24_N24
\CPU|CU|ctl_wd[9]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd[9]~6_combout\ = (\CPU|CU|IR\(15) & (\CPU|CU|ctl_wd\(9))) # (!\CPU|CU|IR\(15) & ((\CPU|CU|ctl_wd~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|IR\(15),
	datac => \CPU|CU|ctl_wd\(9),
	datad => \CPU|CU|ctl_wd~16_combout\,
	combout => \CPU|CU|ctl_wd[9]~6_combout\);

-- Location: LCCOMB_X40_Y25_N24
\CPU|CU|Selector79~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector79~0_combout\ = (\CPU|CU|ctl_wd\(9) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(9),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector79~0_combout\);

-- Location: LCFF_X42_Y24_N25
\CPU|CU|ctl_wd[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|ctl_wd[9]~6_combout\,
	sdata => \CPU|CU|Selector79~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(9));

-- Location: LCCOMB_X42_Y24_N2
\CPU|CU|ctl_wd[8]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd[8]~4_combout\ = (\CPU|CU|IR\(15) & ((\CPU|CU|ctl_wd\(8)))) # (!\CPU|CU|IR\(15) & (\CPU|CU|ctl_wd~25_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd~25_combout\,
	datac => \CPU|CU|ctl_wd\(8),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|ctl_wd[8]~4_combout\);

-- Location: LCCOMB_X38_Y28_N18
\CPU|CU|Selector80~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector80~0_combout\ = (\CPU|CU|current_state.Reset~regout\ & \CPU|CU|ctl_wd\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datad => \CPU|CU|ctl_wd\(8),
	combout => \CPU|CU|Selector80~0_combout\);

-- Location: LCFF_X42_Y24_N3
\CPU|CU|ctl_wd[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|ctl_wd[8]~4_combout\,
	sdata => \CPU|CU|Selector80~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(8));

-- Location: LCCOMB_X42_Y24_N4
\CPU|CU|ctl_wd[7]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd[7]~5_combout\ = (\CPU|CU|IR\(15) & ((\CPU|CU|ctl_wd\(7)))) # (!\CPU|CU|IR\(15) & (\CPU|CU|ctl_wd~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd~26_combout\,
	datab => \CPU|CU|IR\(15),
	datac => \CPU|CU|ctl_wd\(7),
	combout => \CPU|CU|ctl_wd[7]~5_combout\);

-- Location: LCCOMB_X38_Y28_N12
\CPU|CU|Selector81~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector81~0_combout\ = (\CPU|CU|current_state.Reset~regout\ & \CPU|CU|ctl_wd\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datad => \CPU|CU|ctl_wd\(7),
	combout => \CPU|CU|Selector81~0_combout\);

-- Location: LCFF_X42_Y24_N5
\CPU|CU|ctl_wd[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|ctl_wd[7]~5_combout\,
	sdata => \CPU|CU|Selector81~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(7));

-- Location: LCCOMB_X41_Y23_N4
\CPU|FNU|Fnc_unit|Mux3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux3~4_combout\ = (\CPU|CU|ctl_wd\(6) & (\CPU|CU|ctl_wd\(9) & (!\CPU|CU|ctl_wd\(8) & !\CPU|CU|ctl_wd\(7)))) # (!\CPU|CU|ctl_wd\(6) & (!\CPU|CU|ctl_wd\(9) & (\CPU|CU|ctl_wd\(8) & \CPU|CU|ctl_wd\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(6),
	datab => \CPU|CU|ctl_wd\(9),
	datac => \CPU|CU|ctl_wd\(8),
	datad => \CPU|CU|ctl_wd\(7),
	combout => \CPU|FNU|Fnc_unit|Mux3~4_combout\);

-- Location: LCCOMB_X37_Y26_N16
\CPU|CU|Selector82~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector82~0_combout\ = (\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|ctl_wd~24_combout\)) # (!\CPU|CU|current_state.Decode~regout\ & (((\CPU|CU|current_state.Reset~regout\ & \CPU|CU|ctl_wd\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd~24_combout\,
	datab => \CPU|CU|current_state.Reset~regout\,
	datac => \CPU|CU|ctl_wd\(6),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Selector82~0_combout\);

-- Location: LCFF_X37_Y26_N17
\CPU|CU|ctl_wd[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector82~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(6));

-- Location: LCCOMB_X43_Y25_N22
\CPU|FNU|Fnc_unit|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux3~2_combout\ = (\CPU|CU|ctl_wd\(8) & ((\CPU|CU|ctl_wd\(7)) # (\CPU|CU|ctl_wd\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(7),
	datac => \CPU|CU|ctl_wd\(6),
	datad => \CPU|CU|ctl_wd\(8),
	combout => \CPU|FNU|Fnc_unit|Mux3~2_combout\);

-- Location: LCCOMB_X41_Y23_N24
\CPU|FNU|Fnc_unit|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux3~0_combout\ = (\CPU|CU|ctl_wd\(9)) # ((!\CPU|CU|ctl_wd\(8) & !\CPU|CU|ctl_wd\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(8),
	datab => \CPU|CU|ctl_wd\(9),
	datad => \CPU|CU|ctl_wd\(7),
	combout => \CPU|FNU|Fnc_unit|Mux3~0_combout\);

-- Location: LCCOMB_X42_Y23_N18
\CPU|FNU|R2|data_out[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R2|data_out[6]~feeder_combout\ = \CPU|FNU|func_data[6]~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[6]~4_combout\,
	combout => \CPU|FNU|R2|data_out[6]~feeder_combout\);

-- Location: LCCOMB_X40_Y28_N26
\CPU|CU|Selector71~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector71~1_combout\ = (\CPU|CU|R_we~regout\) # ((!\CPU|CU|op.hlt~regout\ & \CPU|CU|main~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.hlt~regout\,
	datac => \CPU|CU|main~2_combout\,
	datad => \CPU|CU|R_we~regout\,
	combout => \CPU|CU|Selector71~1_combout\);

-- Location: LCCOMB_X40_Y28_N24
\CPU|CU|ld_op~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ld_op~0_combout\ = (\CPU|CU|Mux1~0_combout\ & (!\CPU|CU|IR\(14) & !\CPU|CU|IR\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Mux1~0_combout\,
	datac => \CPU|CU|IR\(14),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|ld_op~0_combout\);

-- Location: LCFF_X40_Y28_N25
\CPU|CU|op.ld\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|ld_op~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.ld~regout\);

-- Location: LCCOMB_X40_Y28_N0
\CPU|CU|Selector71~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector71~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.ld~regout\) # ((\CPU|CU|R_we~regout\)))) # (!\CPU|CU|current_state.Execute~regout\ & (((\CPU|CU|current_state.Decode~regout\ & \CPU|CU|R_we~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ld~regout\,
	datab => \CPU|CU|current_state.Decode~regout\,
	datac => \CPU|CU|current_state.Execute~regout\,
	datad => \CPU|CU|R_we~regout\,
	combout => \CPU|CU|Selector71~0_combout\);

-- Location: LCCOMB_X40_Y28_N30
\CPU|CU|Selector71~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector71~2_combout\ = (\CPU|CU|Selector71~0_combout\) # ((\CPU|CU|current_state.WB~regout\ & (\CPU|CU|Selector71~1_combout\ & !\CPU|CU|op.ld~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.WB~regout\,
	datab => \CPU|CU|Selector71~1_combout\,
	datac => \CPU|CU|op.ld~regout\,
	datad => \CPU|CU|Selector71~0_combout\,
	combout => \CPU|CU|Selector71~2_combout\);

-- Location: LCFF_X40_Y28_N31
\CPU|CU|R_we\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector71~2_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|R_we~regout\);

-- Location: LCCOMB_X43_Y27_N10
\CPU|CU|ctl_wd~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~32_combout\ = (\CPU|CU|IR\(12) & !\CPU|CU|ctl_wd~29_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(12),
	datad => \CPU|CU|ctl_wd~29_combout\,
	combout => \CPU|CU|ctl_wd~32_combout\);

-- Location: LCCOMB_X35_Y28_N18
\CPU|CU|ctl_wd[11]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd[11]~9_combout\ = (\CPU|CU|IR\(15) & (\CPU|CU|ctl_wd\(11))) # (!\CPU|CU|IR\(15) & ((\CPU|CU|ctl_wd~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(15),
	datac => \CPU|CU|ctl_wd\(11),
	datad => \CPU|CU|ctl_wd~32_combout\,
	combout => \CPU|CU|ctl_wd[11]~9_combout\);

-- Location: LCCOMB_X38_Y28_N16
\CPU|CU|Selector77~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector77~0_combout\ = (\CPU|CU|ctl_wd\(11) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(11),
	datac => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector77~0_combout\);

-- Location: LCFF_X35_Y28_N19
\CPU|CU|ctl_wd[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|ctl_wd[11]~9_combout\,
	sdata => \CPU|CU|Selector77~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(11));

-- Location: LCCOMB_X41_Y28_N24
\CPU|FNU|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Equal0~4_combout\ = (!\CPU|CU|ctl_wd\(12) & (!\CPU|CU|ctl_wd\(10) & (\CPU|CU|R_we~regout\ & \CPU|CU|ctl_wd\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(12),
	datab => \CPU|CU|ctl_wd\(10),
	datac => \CPU|CU|R_we~regout\,
	datad => \CPU|CU|ctl_wd\(11),
	combout => \CPU|FNU|Equal0~4_combout\);

-- Location: LCFF_X42_Y23_N19
\CPU|FNU|R2|data_out[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R2|data_out[6]~feeder_combout\,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(6));

-- Location: LCCOMB_X34_Y24_N28
\CPU|CU|ctl_wd~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~19_combout\ = (\CPU|CU|IR\(15)) # ((!\CPU|CU|IR\(14) & \CPU|CU|ctl_wd~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|IR\(14),
	datac => \CPU|CU|ctl_wd~12_combout\,
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|ctl_wd~19_combout\);

-- Location: LCCOMB_X34_Y24_N2
\CPU|CU|ctl_wd~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~22_combout\ = (\CPU|CU|ctl_wd~18_combout\ & (\CPU|CU|ctl_wd~19_combout\)) # (!\CPU|CU|ctl_wd~18_combout\ & ((\CPU|CU|ctl_wd~19_combout\ & (\CPU|CU|ctl_wd\(3))) # (!\CPU|CU|ctl_wd~19_combout\ & ((\CPU|CU|IR\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd~18_combout\,
	datab => \CPU|CU|ctl_wd~19_combout\,
	datac => \CPU|CU|ctl_wd\(3),
	datad => \CPU|CU|IR\(4),
	combout => \CPU|CU|ctl_wd~22_combout\);

-- Location: LCCOMB_X34_Y24_N0
\CPU|CU|ctl_wd~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~17_combout\ = (\CPU|CU|ctl_wd~12_combout\ & (!\CPU|CU|IR\(15) & ((\CPU|CU|IR\(8)) # (!\CPU|CU|IR\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(8),
	datab => \CPU|CU|IR\(14),
	datac => \CPU|CU|ctl_wd~12_combout\,
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|ctl_wd~17_combout\);

-- Location: LCCOMB_X43_Y27_N4
\CPU|CU|ctl_wd~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~34_combout\ = (\CPU|CU|ctl_wd~22_combout\ & (!\CPU|CU|ctl_wd~17_combout\)) # (!\CPU|CU|ctl_wd~22_combout\ & (\CPU|CU|ctl_wd~17_combout\ & \CPU|CU|IR\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd~22_combout\,
	datac => \CPU|CU|ctl_wd~17_combout\,
	datad => \CPU|CU|IR\(11),
	combout => \CPU|CU|ctl_wd~34_combout\);

-- Location: LCCOMB_X43_Y27_N22
\CPU|CU|ctl_wd~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~35_combout\ = (\CPU|CU|ctl_wd~34_combout\ & (((\CPU|CU|ctl_wd~22_combout\) # (!\CPU|CU|IR\(10))))) # (!\CPU|CU|ctl_wd~34_combout\ & (\CPU|CU|IR\(4) & (!\CPU|CU|IR\(10) & \CPU|CU|ctl_wd~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(4),
	datab => \CPU|CU|ctl_wd~34_combout\,
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|ctl_wd~22_combout\,
	combout => \CPU|CU|ctl_wd~35_combout\);

-- Location: LCCOMB_X43_Y27_N18
\CPU|CU|Selector85~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector85~0_combout\ = (\CPU|CU|current_state.Decode~regout\ & (((\CPU|CU|ctl_wd~35_combout\)))) # (!\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|current_state.Reset~regout\ & (\CPU|CU|ctl_wd\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datab => \CPU|CU|current_state.Decode~regout\,
	datac => \CPU|CU|ctl_wd\(3),
	datad => \CPU|CU|ctl_wd~35_combout\,
	combout => \CPU|CU|Selector85~0_combout\);

-- Location: LCFF_X43_Y27_N19
\CPU|CU|ctl_wd[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector85~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(3));

-- Location: LCCOMB_X34_Y24_N24
\CPU|CU|ctl_wd~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~21_combout\ = (\CPU|CU|ctl_wd~18_combout\ & (((\CPU|CU|ctl_wd~19_combout\)))) # (!\CPU|CU|ctl_wd~18_combout\ & ((\CPU|CU|ctl_wd~19_combout\ & (\CPU|CU|ctl_wd\(5))) # (!\CPU|CU|ctl_wd~19_combout\ & ((\CPU|CU|IR\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd~18_combout\,
	datab => \CPU|CU|ctl_wd\(5),
	datac => \CPU|CU|IR\(6),
	datad => \CPU|CU|ctl_wd~19_combout\,
	combout => \CPU|CU|ctl_wd~21_combout\);

-- Location: LCCOMB_X43_Y27_N28
\CPU|CU|Selector52~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector52~0_combout\ = (\CPU|CU|IR\(13) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(13),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector52~0_combout\);

-- Location: LCCOMB_X34_Y28_N14
\CPU|CU|PC[10]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[10]~24_combout\ = (!\CPU|CU|op.ret~regout\ & ((\CPU|CU|current_state.WB~regout\) # (\CPU|CU|PC[9]~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|current_state.WB~regout\,
	datac => \CPU|CU|op.ret~regout\,
	datad => \CPU|CU|PC[9]~23_combout\,
	combout => \CPU|CU|PC[10]~24_combout\);

-- Location: LCCOMB_X32_Y26_N0
\CPU|CU|PC[13]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[13]~13_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~29_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[13]~43_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC~29_combout\,
	datab => \CPU|CU|PC[10]~24_combout\,
	datad => \data_bus_temp[13]~43_combout\,
	combout => \CPU|CU|PC[13]~13_combout\);

-- Location: LCCOMB_X37_Y28_N22
\CPU|CU|op.bz~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.bz~0_combout\ = (\CPU|CU|IR\(9) & (\CPU|CU|op.sethi~0_combout\ & (\CPU|CU|IR\(10) & !\CPU|CU|IR\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(9),
	datab => \CPU|CU|op.sethi~0_combout\,
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|op.bz~0_combout\);

-- Location: LCFF_X37_Y28_N23
\CPU|CU|op.bz\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.bz~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.bz~regout\);

-- Location: LCCOMB_X37_Y28_N24
\CPU|CU|op.ba~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.ba~0_combout\ = (!\CPU|CU|IR\(9) & (\CPU|CU|op.sethi~0_combout\ & (\CPU|CU|IR\(10) & !\CPU|CU|IR\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(9),
	datab => \CPU|CU|op.sethi~0_combout\,
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|op.ba~0_combout\);

-- Location: LCFF_X37_Y28_N25
\CPU|CU|op.ba\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.ba~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.ba~regout\);

-- Location: LCCOMB_X37_Y28_N20
\CPU|CU|Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~1_combout\ = (!\CPU|CU|op.bz~regout\ & (!\CPU|CU|op.ba~regout\ & !\CPU|CU|op.bn~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|op.bz~regout\,
	datac => \CPU|CU|op.ba~regout\,
	datad => \CPU|CU|op.bn~regout\,
	combout => \CPU|CU|Add0~1_combout\);

-- Location: LCCOMB_X32_Y28_N28
\CPU|CU|Add0~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~55_combout\ = (\CPU|CU|PC\(13) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|PC\(13),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~55_combout\);

-- Location: LCCOMB_X32_Y28_N24
\CPU|CU|Add0~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~51_combout\ = (\CPU|CU|PC\(12) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(12),
	datab => \CPU|CU|Add0~1_combout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~51_combout\);

-- Location: LCCOMB_X32_Y26_N20
\CPU|CU|PC[11]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[11]~11_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~17_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[11]~37_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC~17_combout\,
	datab => \CPU|CU|PC[10]~24_combout\,
	datad => \data_bus_temp[11]~37_combout\,
	combout => \CPU|CU|PC[11]~11_combout\);

-- Location: LCCOMB_X32_Y26_N2
\CPU|CU|PC[10]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[10]~10_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~16_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[10]~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC~16_combout\,
	datab => \CPU|CU|PC[10]~24_combout\,
	datad => \data_bus_temp[10]~34_combout\,
	combout => \CPU|CU|PC[10]~10_combout\);

-- Location: LCCOMB_X36_Y28_N22
\CPU|CU|ctl_wd~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~33_combout\ = (\CPU|CU|IR\(9) & \CPU|CU|IR\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(8),
	combout => \CPU|CU|ctl_wd~33_combout\);

-- Location: LCCOMB_X33_Y24_N6
\CPU|CU|offset~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~47_combout\ = (!\CPU|CU|IR\(15) & (\CPU|CU|IR\(14) & ((\CPU|CU|IR\(10)) # (\CPU|CU|ctl_wd~33_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(15),
	datab => \CPU|CU|IR\(14),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|ctl_wd~33_combout\,
	combout => \CPU|CU|offset~47_combout\);

-- Location: LCCOMB_X32_Y26_N12
\CPU|CU|offset~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~42_combout\ = (\CPU|CU|offset~46_combout\ & ((\CPU|CU|offset~47_combout\) # ((\CPU|CU|IR\(9))))) # (!\CPU|CU|offset~46_combout\ & (!\CPU|CU|offset~47_combout\ & ((\CPU|CU|offset\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~46_combout\,
	datab => \CPU|CU|offset~47_combout\,
	datac => \CPU|CU|IR\(9),
	datad => \CPU|CU|offset\(9),
	combout => \CPU|CU|offset~42_combout\);

-- Location: LCCOMB_X32_Y26_N22
\CPU|CU|offset~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~43_combout\ = (\CPU|CU|offset~47_combout\ & ((\CPU|CU|offset~42_combout\ & ((\CPU|CU|IR\(7)))) # (!\CPU|CU|offset~42_combout\ & (\CPU|CU|IR\(1))))) # (!\CPU|CU|offset~47_combout\ & (((\CPU|CU|offset~42_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(1),
	datab => \CPU|CU|offset~47_combout\,
	datac => \CPU|CU|IR\(7),
	datad => \CPU|CU|offset~42_combout\,
	combout => \CPU|CU|offset~43_combout\);

-- Location: LCCOMB_X32_Y26_N26
\CPU|CU|Selector129~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector129~0_combout\ = (\CPU|CU|current_state.Decode~regout\ & (((\CPU|CU|offset~43_combout\)))) # (!\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|current_state.Reset~regout\ & ((\CPU|CU|offset\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datab => \CPU|CU|offset~43_combout\,
	datac => \CPU|CU|offset\(9),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Selector129~0_combout\);

-- Location: LCFF_X32_Y26_N27
\CPU|CU|offset[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector129~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(9));

-- Location: LCCOMB_X32_Y26_N28
\CPU|CU|PC~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~40_combout\ = (\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(9))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(9),
	datac => \CPU|CU|PC\(9),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|PC~40_combout\);

-- Location: LCCOMB_X32_Y26_N16
\CPU|CU|PC[9]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[9]~9_combout\ = (\CPU|CU|PC[10]~24_combout\ & ((\CPU|CU|PC~40_combout\))) # (!\CPU|CU|PC[10]~24_combout\ & (\data_bus_temp[9]~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[9]~31_combout\,
	datab => \CPU|CU|PC[10]~24_combout\,
	datad => \CPU|CU|PC~40_combout\,
	combout => \CPU|CU|PC[9]~9_combout\);

-- Location: LCCOMB_X36_Y22_N18
\CPU|CU|Selector130~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector130~0_combout\ = (\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|offset~41_combout\)) # (!\CPU|CU|current_state.Decode~regout\ & (((\CPU|CU|offset\(8) & \CPU|CU|current_state.Reset~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~41_combout\,
	datab => \CPU|CU|current_state.Decode~regout\,
	datac => \CPU|CU|offset\(8),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector130~0_combout\);

-- Location: LCFF_X36_Y22_N19
\CPU|CU|offset[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector130~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(8));

-- Location: LCCOMB_X33_Y28_N10
\CPU|CU|Add0~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~34_combout\ = (!\CPU|CU|Add0~1_combout\ & (\CPU|CU|offset\(8) & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|offset\(8),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~34_combout\);

-- Location: LCCOMB_X33_Y29_N14
\CPU|CU|Add0~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~32_combout\ = (\CPU|CU|Add0~30_combout\ & ((\CPU|CU|Add0~31_combout\ & (\CPU|CU|Add0~29\ & VCC)) # (!\CPU|CU|Add0~31_combout\ & (!\CPU|CU|Add0~29\)))) # (!\CPU|CU|Add0~30_combout\ & ((\CPU|CU|Add0~31_combout\ & (!\CPU|CU|Add0~29\)) # 
-- (!\CPU|CU|Add0~31_combout\ & ((\CPU|CU|Add0~29\) # (GND)))))
-- \CPU|CU|Add0~33\ = CARRY((\CPU|CU|Add0~30_combout\ & (!\CPU|CU|Add0~31_combout\ & !\CPU|CU|Add0~29\)) # (!\CPU|CU|Add0~30_combout\ & ((!\CPU|CU|Add0~29\) # (!\CPU|CU|Add0~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~30_combout\,
	datab => \CPU|CU|Add0~31_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~29\,
	combout => \CPU|CU|Add0~32_combout\,
	cout => \CPU|CU|Add0~33\);

-- Location: LCCOMB_X33_Y29_N16
\CPU|CU|Add0~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~36_combout\ = ((\CPU|CU|Add0~35_combout\ $ (\CPU|CU|Add0~34_combout\ $ (!\CPU|CU|Add0~33\)))) # (GND)
-- \CPU|CU|Add0~37\ = CARRY((\CPU|CU|Add0~35_combout\ & ((\CPU|CU|Add0~34_combout\) # (!\CPU|CU|Add0~33\))) # (!\CPU|CU|Add0~35_combout\ & (\CPU|CU|Add0~34_combout\ & !\CPU|CU|Add0~33\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~35_combout\,
	datab => \CPU|CU|Add0~34_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~33\,
	combout => \CPU|CU|Add0~36_combout\,
	cout => \CPU|CU|Add0~37\);

-- Location: LCCOMB_X33_Y29_N18
\CPU|CU|Add0~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~40_combout\ = (\CPU|CU|Add0~38_combout\ & ((\CPU|CU|Add0~39_combout\ & (\CPU|CU|Add0~37\ & VCC)) # (!\CPU|CU|Add0~39_combout\ & (!\CPU|CU|Add0~37\)))) # (!\CPU|CU|Add0~38_combout\ & ((\CPU|CU|Add0~39_combout\ & (!\CPU|CU|Add0~37\)) # 
-- (!\CPU|CU|Add0~39_combout\ & ((\CPU|CU|Add0~37\) # (GND)))))
-- \CPU|CU|Add0~41\ = CARRY((\CPU|CU|Add0~38_combout\ & (!\CPU|CU|Add0~39_combout\ & !\CPU|CU|Add0~37\)) # (!\CPU|CU|Add0~38_combout\ & ((!\CPU|CU|Add0~37\) # (!\CPU|CU|Add0~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~38_combout\,
	datab => \CPU|CU|Add0~39_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~37\,
	combout => \CPU|CU|Add0~40_combout\,
	cout => \CPU|CU|Add0~41\);

-- Location: LCCOMB_X32_Y26_N4
\CPU|CU|PC[9]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[9]~49_combout\ = (!\CPU|CU|current_state.WB~regout\ & (!\CPU|CU|PC[9]~23_combout\ & (\CPU|CU|Add0~40_combout\ & \CPU|CU|current_state.Reset~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.WB~regout\,
	datab => \CPU|CU|PC[9]~23_combout\,
	datac => \CPU|CU|Add0~40_combout\,
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|PC[9]~49_combout\);

-- Location: LCCOMB_X34_Y27_N30
\CPU|CU|PC[9]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[9]~26_combout\ = (!\CPU|CU|current_state.WB~regout\ & ((!\CPU|CU|op.jmp~regout\) # (!\CPU|CU|current_state.Execute~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Execute~regout\,
	datab => \CPU|CU|current_state.WB~regout\,
	datad => \CPU|CU|op.jmp~regout\,
	combout => \CPU|CU|PC[9]~26_combout\);

-- Location: LCCOMB_X32_Y27_N26
\CPU|CU|PC[15]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[15]~27_combout\ = ((\CPU|CU|current_state.WB~regout\) # ((\CPU|CU|current_state.Execute~regout\ & \CPU|CU|op.jmp~regout\))) # (!\CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Execute~regout\,
	datab => \CPU|CU|current_state.Reset~regout\,
	datac => \CPU|CU|current_state.WB~regout\,
	datad => \CPU|CU|op.jmp~regout\,
	combout => \CPU|CU|PC[15]~27_combout\);

-- Location: LCCOMB_X34_Y27_N8
\CPU|CU|PC[15]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[15]~28_combout\ = (!\reset~combout\ & ((\CPU|CU|PC[15]~27_combout\) # ((!\CPU|CU|current_state.WB~regout\ & !\CPU|CU|PC[9]~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => \CPU|CU|current_state.WB~regout\,
	datac => \CPU|CU|PC[15]~27_combout\,
	datad => \CPU|CU|PC[9]~23_combout\,
	combout => \CPU|CU|PC[15]~28_combout\);

-- Location: LCFF_X32_Y26_N17
\CPU|CU|PC[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[9]~9_combout\,
	sdata => \CPU|CU|PC[9]~49_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(9));

-- Location: LCCOMB_X32_Y26_N18
\CPU|CU|Add0~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~39_combout\ = (\CPU|CU|PC\(9) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|PC\(9),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~39_combout\);

-- Location: LCCOMB_X33_Y29_N20
\CPU|CU|Add0~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~44_combout\ = ((\CPU|CU|Add0~42_combout\ $ (\CPU|CU|Add0~43_combout\ $ (!\CPU|CU|Add0~41\)))) # (GND)
-- \CPU|CU|Add0~45\ = CARRY((\CPU|CU|Add0~42_combout\ & ((\CPU|CU|Add0~43_combout\) # (!\CPU|CU|Add0~41\))) # (!\CPU|CU|Add0~42_combout\ & (\CPU|CU|Add0~43_combout\ & !\CPU|CU|Add0~41\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~42_combout\,
	datab => \CPU|CU|Add0~43_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~41\,
	combout => \CPU|CU|Add0~44_combout\,
	cout => \CPU|CU|Add0~45\);

-- Location: LCCOMB_X32_Y26_N14
\CPU|CU|PC[10]~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[10]~50_combout\ = (\CPU|CU|current_state.Reset~regout\ & (\CPU|CU|Add0~44_combout\ & (!\CPU|CU|current_state.WB~regout\ & !\CPU|CU|PC[9]~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datab => \CPU|CU|Add0~44_combout\,
	datac => \CPU|CU|current_state.WB~regout\,
	datad => \CPU|CU|PC[9]~23_combout\,
	combout => \CPU|CU|PC[10]~50_combout\);

-- Location: LCFF_X32_Y26_N3
\CPU|CU|PC[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[10]~10_combout\,
	sdata => \CPU|CU|PC[10]~50_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(10));

-- Location: LCCOMB_X32_Y28_N20
\CPU|CU|Add0~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~43_combout\ = (\CPU|CU|PC\(10) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|PC\(10),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~43_combout\);

-- Location: LCCOMB_X33_Y29_N22
\CPU|CU|Add0~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~48_combout\ = (\CPU|CU|Add0~46_combout\ & ((\CPU|CU|Add0~47_combout\ & (\CPU|CU|Add0~45\ & VCC)) # (!\CPU|CU|Add0~47_combout\ & (!\CPU|CU|Add0~45\)))) # (!\CPU|CU|Add0~46_combout\ & ((\CPU|CU|Add0~47_combout\ & (!\CPU|CU|Add0~45\)) # 
-- (!\CPU|CU|Add0~47_combout\ & ((\CPU|CU|Add0~45\) # (GND)))))
-- \CPU|CU|Add0~49\ = CARRY((\CPU|CU|Add0~46_combout\ & (!\CPU|CU|Add0~47_combout\ & !\CPU|CU|Add0~45\)) # (!\CPU|CU|Add0~46_combout\ & ((!\CPU|CU|Add0~45\) # (!\CPU|CU|Add0~47_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~46_combout\,
	datab => \CPU|CU|Add0~47_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~45\,
	combout => \CPU|CU|Add0~48_combout\,
	cout => \CPU|CU|Add0~49\);

-- Location: LCCOMB_X32_Y26_N8
\CPU|CU|PC[11]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[11]~51_combout\ = (\CPU|CU|current_state.Reset~regout\ & (\CPU|CU|Add0~48_combout\ & (!\CPU|CU|current_state.WB~regout\ & !\CPU|CU|PC[9]~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datab => \CPU|CU|Add0~48_combout\,
	datac => \CPU|CU|current_state.WB~regout\,
	datad => \CPU|CU|PC[9]~23_combout\,
	combout => \CPU|CU|PC[11]~51_combout\);

-- Location: LCFF_X32_Y26_N21
\CPU|CU|PC[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[11]~11_combout\,
	sdata => \CPU|CU|PC[11]~51_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(11));

-- Location: LCCOMB_X32_Y28_N2
\CPU|CU|Add0~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~47_combout\ = (\CPU|CU|PC\(11) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|PC\(11),
	datac => \CPU|CU|current_state.Decode~regout\,
	datad => \CPU|CU|Add0~1_combout\,
	combout => \CPU|CU|Add0~47_combout\);

-- Location: LCCOMB_X34_Y26_N20
\CPU|CU|PC[13]~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[13]~53_combout\ = (!\CPU|CU|PC[9]~23_combout\ & (!\CPU|CU|current_state.WB~regout\ & (\CPU|CU|current_state.Reset~regout\ & \CPU|CU|Add0~56_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC[9]~23_combout\,
	datab => \CPU|CU|current_state.WB~regout\,
	datac => \CPU|CU|current_state.Reset~regout\,
	datad => \CPU|CU|Add0~56_combout\,
	combout => \CPU|CU|PC[13]~53_combout\);

-- Location: LCFF_X32_Y26_N1
\CPU|CU|PC[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[13]~13_combout\,
	sdata => \CPU|CU|PC[13]~53_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(13));

-- Location: LCCOMB_X32_Y28_N12
\CPU|CU|const_out[13]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[13]~13_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(13)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(13),
	datac => \CPU|CU|const_out\(13),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[13]~13_combout\);

-- Location: LCCOMB_X32_Y28_N30
\CPU|CU|Selector91~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector91~0_combout\ = (\CPU|CU|const_out\(13) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(13),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector91~0_combout\);

-- Location: LCFF_X32_Y28_N13
\CPU|CU|const_out[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[13]~13_combout\,
	sdata => \CPU|CU|Selector91~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(13));

-- Location: LCCOMB_X40_Y26_N18
\CPU|FNU|R3|data_out[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R3|data_out[13]~feeder_combout\ = \CPU|FNU|func_data[13]~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[13]~18_combout\,
	combout => \CPU|FNU|R3|data_out[13]~feeder_combout\);

-- Location: LCFF_X40_Y26_N19
\CPU|FNU|R3|data_out[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R3|data_out[13]~feeder_combout\,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(13));

-- Location: LCFF_X41_Y25_N5
\CPU|FNU|R2|data_out[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[13]~18_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(13));

-- Location: LCCOMB_X37_Y26_N20
\CPU|CU|Selector84~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector84~0_combout\ = (\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|ctl_wd~39_combout\)) # (!\CPU|CU|current_state.Decode~regout\ & (((\CPU|CU|current_state.Reset~regout\ & \CPU|CU|ctl_wd\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd~39_combout\,
	datab => \CPU|CU|current_state.Reset~regout\,
	datac => \CPU|CU|ctl_wd\(4),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Selector84~0_combout\);

-- Location: LCFF_X37_Y26_N21
\CPU|CU|ctl_wd[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector84~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(4));

-- Location: LCCOMB_X42_Y27_N10
\CPU|FNU|Mux8~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux8~2_combout\ = (\CPU|CU|ctl_wd\(5)) # ((\CPU|CU|ctl_wd\(3) & \CPU|CU|ctl_wd\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(3),
	datac => \CPU|CU|ctl_wd\(5),
	datad => \CPU|CU|ctl_wd\(4),
	combout => \CPU|FNU|Mux8~2_combout\);

-- Location: LCCOMB_X41_Y28_N6
\CPU|FNU|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Equal0~3_combout\ = (\CPU|CU|ctl_wd\(12) & (\CPU|CU|ctl_wd\(10) & (\CPU|CU|R_we~regout\ & \CPU|CU|ctl_wd\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(12),
	datab => \CPU|CU|ctl_wd\(10),
	datac => \CPU|CU|R_we~regout\,
	datad => \CPU|CU|ctl_wd\(11),
	combout => \CPU|FNU|Equal0~3_combout\);

-- Location: LCFF_X41_Y25_N17
\CPU|FNU|R7|data_out[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[13]~18_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(13));

-- Location: LCCOMB_X41_Y27_N4
\CPU|FNU|R4|data_out[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R4|data_out[13]~feeder_combout\ = \CPU|FNU|func_data[13]~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[13]~18_combout\,
	combout => \CPU|FNU|R4|data_out[13]~feeder_combout\);

-- Location: LCCOMB_X41_Y28_N2
\CPU|FNU|Equal0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Equal0~5_combout\ = (\CPU|CU|ctl_wd\(12) & (!\CPU|CU|ctl_wd\(10) & (\CPU|CU|R_we~regout\ & !\CPU|CU|ctl_wd\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(12),
	datab => \CPU|CU|ctl_wd\(10),
	datac => \CPU|CU|R_we~regout\,
	datad => \CPU|CU|ctl_wd\(11),
	combout => \CPU|FNU|Equal0~5_combout\);

-- Location: LCFF_X41_Y27_N5
\CPU|FNU|R4|data_out[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R4|data_out[13]~feeder_combout\,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(13));

-- Location: LCCOMB_X41_Y27_N24
\CPU|FNU|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux2~0_combout\ = (\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|R5|data_out\(13)) # ((\CPU|CU|ctl_wd\(4))))) # (!\CPU|CU|ctl_wd\(3) & (((\CPU|FNU|R4|data_out\(13) & !\CPU|CU|ctl_wd\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(13),
	datab => \CPU|FNU|R4|data_out\(13),
	datac => \CPU|CU|ctl_wd\(3),
	datad => \CPU|CU|ctl_wd\(4),
	combout => \CPU|FNU|Mux2~0_combout\);

-- Location: LCCOMB_X40_Y24_N8
\CPU|FNU|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux2~1_combout\ = (\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|Mux2~0_combout\ & (\CPU|FNU|R7|data_out\(13))) # (!\CPU|FNU|Mux2~0_combout\ & ((\CPU|FNU|R6|data_out\(13)))))) # (!\CPU|CU|ctl_wd\(4) & (((\CPU|FNU|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(4),
	datab => \CPU|FNU|R7|data_out\(13),
	datac => \CPU|FNU|R6|data_out\(13),
	datad => \CPU|FNU|Mux2~0_combout\,
	combout => \CPU|FNU|Mux2~1_combout\);

-- Location: LCCOMB_X41_Y25_N0
\CPU|FNU|Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux2~2_combout\ = (\CPU|FNU|Mux8~1_combout\ & ((\CPU|FNU|Mux8~2_combout\ & ((\CPU|FNU|Mux2~1_combout\))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(13))))) # (!\CPU|FNU|Mux8~1_combout\ & (((\CPU|FNU|Mux8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(13),
	datab => \CPU|FNU|Mux8~1_combout\,
	datac => \CPU|FNU|Mux8~2_combout\,
	datad => \CPU|FNU|Mux2~1_combout\,
	combout => \CPU|FNU|Mux2~2_combout\);

-- Location: LCCOMB_X40_Y26_N24
\CPU|FNU|Mux2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux2~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux2~2_combout\ & (\CPU|FNU|R3|data_out\(13))) # (!\CPU|FNU|Mux2~2_combout\ & ((\CPU|FNU|R2|data_out\(13)))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~0_combout\,
	datab => \CPU|FNU|R3|data_out\(13),
	datac => \CPU|FNU|R2|data_out\(13),
	datad => \CPU|FNU|Mux2~2_combout\,
	combout => \CPU|FNU|Mux2~combout\);

-- Location: LCCOMB_X41_Y25_N10
\CPU|FNU|Fnc_unit|Add0~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~45_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(13))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[13]~81_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100101101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(13),
	datab => \CPU|CU|ctl_wd\(9),
	datac => \CPU|CU|const_out\(13),
	datad => \CPU|FNU|Bbus[13]~81_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~45_combout\);

-- Location: LCCOMB_X37_Y26_N24
\CPU|CU|Selector126~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector126~0_combout\ = (\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|offset~34_combout\)) # (!\CPU|CU|current_state.Decode~regout\ & (((\CPU|CU|current_state.Reset~regout\ & \CPU|CU|offset\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~34_combout\,
	datab => \CPU|CU|current_state.Reset~regout\,
	datac => \CPU|CU|offset\(12),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Selector126~0_combout\);

-- Location: LCFF_X37_Y26_N25
\CPU|CU|offset[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector126~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(12));

-- Location: LCCOMB_X33_Y27_N4
\CPU|CU|const_out[12]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[12]~12_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(12)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(12),
	datac => \CPU|CU|const_out\(12),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[12]~12_combout\);

-- Location: LCCOMB_X32_Y27_N30
\CPU|CU|Selector92~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector92~0_combout\ = (\CPU|CU|const_out\(12) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(12),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector92~0_combout\);

-- Location: LCFF_X33_Y27_N5
\CPU|CU|const_out[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[12]~12_combout\,
	sdata => \CPU|CU|Selector92~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(12));

-- Location: LCFF_X41_Y28_N15
\CPU|FNU|R3|data_out[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[12]~17_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(12));

-- Location: LCCOMB_X41_Y28_N12
\CPU|FNU|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Equal0~2_combout\ = (!\CPU|CU|ctl_wd\(12) & (\CPU|CU|ctl_wd\(10) & (\CPU|CU|R_we~regout\ & !\CPU|CU|ctl_wd\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(12),
	datab => \CPU|CU|ctl_wd\(10),
	datac => \CPU|CU|R_we~regout\,
	datad => \CPU|CU|ctl_wd\(11),
	combout => \CPU|FNU|Equal0~2_combout\);

-- Location: LCFF_X41_Y28_N17
\CPU|FNU|R1|data_out[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[12]~17_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(12));

-- Location: LCCOMB_X41_Y27_N8
\CPU|FNU|R5|data_out[12]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R5|data_out[12]~feeder_combout\ = \CPU|FNU|func_data[12]~17_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[12]~17_combout\,
	combout => \CPU|FNU|R5|data_out[12]~feeder_combout\);

-- Location: LCCOMB_X41_Y28_N8
\CPU|FNU|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Equal0~0_combout\ = (\CPU|CU|ctl_wd\(12) & (\CPU|CU|ctl_wd\(10) & (\CPU|CU|R_we~regout\ & !\CPU|CU|ctl_wd\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(12),
	datab => \CPU|CU|ctl_wd\(10),
	datac => \CPU|CU|R_we~regout\,
	datad => \CPU|CU|ctl_wd\(11),
	combout => \CPU|FNU|Equal0~0_combout\);

-- Location: LCFF_X41_Y27_N9
\CPU|FNU|R5|data_out[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R5|data_out[12]~feeder_combout\,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(12));

-- Location: LCFF_X40_Y24_N13
\CPU|FNU|R7|data_out[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[12]~17_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(12));

-- Location: LCCOMB_X41_Y28_N4
\CPU|FNU|Equal0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Equal0~6_combout\ = (\CPU|CU|ctl_wd\(12) & (!\CPU|CU|ctl_wd\(10) & (\CPU|CU|R_we~regout\ & \CPU|CU|ctl_wd\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(12),
	datab => \CPU|CU|ctl_wd\(10),
	datac => \CPU|CU|R_we~regout\,
	datad => \CPU|CU|ctl_wd\(11),
	combout => \CPU|FNU|Equal0~6_combout\);

-- Location: LCFF_X40_Y24_N23
\CPU|FNU|R6|data_out[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[12]~17_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(12));

-- Location: LCFF_X42_Y25_N11
\CPU|FNU|R4|data_out[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[12]~17_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(12));

-- Location: LCCOMB_X40_Y24_N28
\CPU|FNU|Bbus[12]~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[12]~72_combout\ = (\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|R6|data_out\(12)) # ((\CPU|CU|ctl_wd\(0))))) # (!\CPU|CU|ctl_wd\(1) & (((!\CPU|CU|ctl_wd\(0) & \CPU|FNU|R4|data_out\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(1),
	datab => \CPU|FNU|R6|data_out\(12),
	datac => \CPU|CU|ctl_wd\(0),
	datad => \CPU|FNU|R4|data_out\(12),
	combout => \CPU|FNU|Bbus[12]~72_combout\);

-- Location: LCCOMB_X40_Y24_N12
\CPU|FNU|Bbus[12]~73\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[12]~73_combout\ = (\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|Bbus[12]~72_combout\ & ((\CPU|FNU|R7|data_out\(12)))) # (!\CPU|FNU|Bbus[12]~72_combout\ & (\CPU|FNU|R5|data_out\(12))))) # (!\CPU|CU|ctl_wd\(0) & (((\CPU|FNU|Bbus[12]~72_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(0),
	datab => \CPU|FNU|R5|data_out\(12),
	datac => \CPU|FNU|R7|data_out\(12),
	datad => \CPU|FNU|Bbus[12]~72_combout\,
	combout => \CPU|FNU|Bbus[12]~73_combout\);

-- Location: LCCOMB_X42_Y25_N4
\CPU|FNU|Bbus[12]~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[12]~74_combout\ = (\CPU|FNU|Bbus[12]~4_combout\ & (((\CPU|FNU|Bbus[12]~73_combout\) # (!\CPU|FNU|Bbus[12]~3_combout\)))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(12) & (\CPU|FNU|Bbus[12]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~4_combout\,
	datab => \CPU|FNU|R1|data_out\(12),
	datac => \CPU|FNU|Bbus[12]~3_combout\,
	datad => \CPU|FNU|Bbus[12]~73_combout\,
	combout => \CPU|FNU|Bbus[12]~74_combout\);

-- Location: LCCOMB_X41_Y28_N14
\CPU|FNU|Bbus[12]~75\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[12]~75_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[12]~74_combout\ & ((\CPU|FNU|R3|data_out\(12)))) # (!\CPU|FNU|Bbus[12]~74_combout\ & (\CPU|FNU|R2|data_out\(12))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[12]~74_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~0_combout\,
	datab => \CPU|FNU|R2|data_out\(12),
	datac => \CPU|FNU|R3|data_out\(12),
	datad => \CPU|FNU|Bbus[12]~74_combout\,
	combout => \CPU|FNU|Bbus[12]~75_combout\);

-- Location: LCCOMB_X42_Y25_N22
\CPU|FNU|Bbus[12]~76\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[12]~76_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(12))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[12]~75_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|const_out\(12),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[12]~75_combout\,
	combout => \CPU|FNU|Bbus[12]~76_combout\);

-- Location: LCCOMB_X36_Y24_N20
\data_bus_temp[12]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[12]~39_combout\ = (\CPU|CU|PC\(12) & (((\CPU|FNU|Bbus[12]~76_combout\) # (!\CPU|CU|st_op~regout\)))) # (!\CPU|CU|PC\(12) & (!\CPU|CU|PCd_EN~regout\ & ((\CPU|FNU|Bbus[12]~76_combout\) # (!\CPU|CU|st_op~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(12),
	datab => \CPU|CU|PCd_EN~regout\,
	datac => \CPU|CU|st_op~regout\,
	datad => \CPU|FNU|Bbus[12]~76_combout\,
	combout => \data_bus_temp[12]~39_combout\);

-- Location: LCCOMB_X43_Y27_N26
\CPU|CU|Selector60~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector60~0_combout\ = (\CPU|CU|IR\(5) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(5),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector60~0_combout\);

-- Location: LCCOMB_X44_Y24_N26
\CPU|FNU|R2|data_out[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R2|data_out[5]~feeder_combout\ = \CPU|FNU|func_data[5]~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[5]~3_combout\,
	combout => \CPU|FNU|R2|data_out[5]~feeder_combout\);

-- Location: LCFF_X44_Y24_N27
\CPU|FNU|R2|data_out[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R2|data_out[5]~feeder_combout\,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(5));

-- Location: LCCOMB_X42_Y28_N8
\CPU|FNU|R1|data_out[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R1|data_out[5]~feeder_combout\ = \CPU|FNU|func_data[5]~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[5]~3_combout\,
	combout => \CPU|FNU|R1|data_out[5]~feeder_combout\);

-- Location: LCFF_X42_Y28_N9
\CPU|FNU|R1|data_out[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R1|data_out[5]~feeder_combout\,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(5));

-- Location: LCFF_X40_Y24_N19
\CPU|FNU|R6|data_out[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|func_data[5]~3_combout\,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(5));

-- Location: LCFF_X41_Y24_N5
\CPU|FNU|R7|data_out[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[5]~3_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(5));

-- Location: LCCOMB_X43_Y24_N8
\CPU|FNU|R5|data_out[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R5|data_out[5]~feeder_combout\ = \CPU|FNU|func_data[5]~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[5]~3_combout\,
	combout => \CPU|FNU|R5|data_out[5]~feeder_combout\);

-- Location: LCFF_X43_Y24_N9
\CPU|FNU|R5|data_out[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R5|data_out[5]~feeder_combout\,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(5));

-- Location: LCCOMB_X43_Y24_N0
\CPU|FNU|Bbus[5]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[5]~24_combout\ = (\CPU|CU|ctl_wd\(0) & (((\CPU|FNU|R5|data_out\(5)) # (\CPU|CU|ctl_wd\(1))))) # (!\CPU|CU|ctl_wd\(0) & (\CPU|FNU|R4|data_out\(5) & ((!\CPU|CU|ctl_wd\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R4|data_out\(5),
	datab => \CPU|FNU|R5|data_out\(5),
	datac => \CPU|CU|ctl_wd\(0),
	datad => \CPU|CU|ctl_wd\(1),
	combout => \CPU|FNU|Bbus[5]~24_combout\);

-- Location: LCCOMB_X41_Y24_N4
\CPU|FNU|Bbus[5]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[5]~25_combout\ = (\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|Bbus[5]~24_combout\ & ((\CPU|FNU|R7|data_out\(5)))) # (!\CPU|FNU|Bbus[5]~24_combout\ & (\CPU|FNU|R6|data_out\(5))))) # (!\CPU|CU|ctl_wd\(1) & (((\CPU|FNU|Bbus[5]~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(1),
	datab => \CPU|FNU|R6|data_out\(5),
	datac => \CPU|FNU|R7|data_out\(5),
	datad => \CPU|FNU|Bbus[5]~24_combout\,
	combout => \CPU|FNU|Bbus[5]~25_combout\);

-- Location: LCCOMB_X42_Y28_N28
\CPU|FNU|Bbus[5]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[5]~26_combout\ = (\CPU|FNU|Bbus[12]~4_combout\ & (((\CPU|FNU|Bbus[5]~25_combout\)) # (!\CPU|FNU|Bbus[12]~3_combout\))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|Bbus[12]~3_combout\ & (\CPU|FNU|R1|data_out\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~4_combout\,
	datab => \CPU|FNU|Bbus[12]~3_combout\,
	datac => \CPU|FNU|R1|data_out\(5),
	datad => \CPU|FNU|Bbus[5]~25_combout\,
	combout => \CPU|FNU|Bbus[5]~26_combout\);

-- Location: LCCOMB_X41_Y28_N0
\CPU|FNU|Bbus[5]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[5]~28_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[5]~26_combout\ & ((\CPU|FNU|R3|data_out\(5)))) # (!\CPU|FNU|Bbus[5]~26_combout\ & (\CPU|FNU|R2|data_out\(5))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[5]~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~0_combout\,
	datab => \CPU|FNU|R2|data_out\(5),
	datac => \CPU|FNU|R3|data_out\(5),
	datad => \CPU|FNU|Bbus[5]~26_combout\,
	combout => \CPU|FNU|Bbus[5]~28_combout\);

-- Location: LCCOMB_X41_Y28_N26
\CPU|FNU|Bbus[5]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[5]~29_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(5))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[5]~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(13),
	datab => \CPU|CU|const_out\(5),
	datad => \CPU|FNU|Bbus[5]~28_combout\,
	combout => \CPU|FNU|Bbus[5]~29_combout\);

-- Location: LCCOMB_X37_Y23_N22
\data_bus_temp[5]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[5]~6_combout\ = (\CPU|CU|PC\(5) & (((\CPU|FNU|Bbus[5]~29_combout\)) # (!\CPU|CU|st_op~regout\))) # (!\CPU|CU|PC\(5) & (!\CPU|CU|PCd_EN~regout\ & ((\CPU|FNU|Bbus[5]~29_combout\) # (!\CPU|CU|st_op~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(5),
	datab => \CPU|CU|st_op~regout\,
	datac => \CPU|CU|PCd_EN~regout\,
	datad => \CPU|FNU|Bbus[5]~29_combout\,
	combout => \data_bus_temp[5]~6_combout\);

-- Location: LCCOMB_X34_Y26_N28
\CPU|CU|AR_EN~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR_EN~0_combout\ = !\CPU|CU|current_state.Execute~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|CU|current_state.Execute~regout\,
	combout => \CPU|CU|AR_EN~0_combout\);

-- Location: LCFF_X34_Y26_N29
\CPU|CU|AR_EN\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR_EN~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR_EN~regout\);

-- Location: LCCOMB_X34_Y27_N12
\CPU|CU|PC[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[6]~6_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~37_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[6]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC[10]~24_combout\,
	datab => \CPU|CU|PC~37_combout\,
	datad => \data_bus_temp[6]~10_combout\,
	combout => \CPU|CU|PC[6]~6_combout\);

-- Location: LCCOMB_X33_Y28_N18
\CPU|CU|Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~22_combout\ = (\CPU|CU|offset\(5) & (!\CPU|CU|Add0~1_combout\ & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(5),
	datac => \CPU|CU|Add0~1_combout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~22_combout\);

-- Location: LCCOMB_X33_Y28_N22
\CPU|CU|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~2_combout\ = (!\CPU|CU|Add0~1_combout\ & (\CPU|CU|offset\(4) & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|offset\(4),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~2_combout\);

-- Location: LCCOMB_X34_Y28_N0
\CPU|CU|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~4_combout\ = (\CPU|CU|offset\(3) & (!\CPU|CU|Add0~1_combout\ & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(3),
	datac => \CPU|CU|Add0~1_combout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~4_combout\);

-- Location: LCCOMB_X33_Y25_N10
\CPU|CU|SP[5]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[5]~26_combout\ = (\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|SP\(5) & (!\CPU|CU|SP[4]~25\)) # (!\CPU|CU|SP\(5) & ((\CPU|CU|SP[4]~25\) # (GND))))) # (!\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|SP\(5) & (\CPU|CU|SP[4]~25\ & VCC)) # 
-- (!\CPU|CU|SP\(5) & (!\CPU|CU|SP[4]~25\))))
-- \CPU|CU|SP[5]~27\ = CARRY((\CPU|CU|current_state.Decode~regout\ & ((!\CPU|CU|SP[4]~25\) # (!\CPU|CU|SP\(5)))) # (!\CPU|CU|current_state.Decode~regout\ & (!\CPU|CU|SP\(5) & !\CPU|CU|SP[4]~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|SP\(5),
	datad => VCC,
	cin => \CPU|CU|SP[4]~25\,
	combout => \CPU|CU|SP[5]~26_combout\,
	cout => \CPU|CU|SP[5]~27\);

-- Location: LCFF_X33_Y25_N11
\CPU|CU|SP[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[5]~26_combout\,
	sdata => VCC,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(5));

-- Location: LCCOMB_X33_Y25_N12
\CPU|CU|SP[6]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[6]~28_combout\ = ((\CPU|CU|current_state.Decode~regout\ $ (\CPU|CU|SP\(6) $ (\CPU|CU|SP[5]~27\)))) # (GND)
-- \CPU|CU|SP[6]~29\ = CARRY((\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|SP\(6) & !\CPU|CU|SP[5]~27\)) # (!\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|SP\(6)) # (!\CPU|CU|SP[5]~27\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|SP\(6),
	datad => VCC,
	cin => \CPU|CU|SP[5]~27\,
	combout => \CPU|CU|SP[6]~28_combout\,
	cout => \CPU|CU|SP[6]~29\);

-- Location: LCFF_X33_Y25_N13
\CPU|CU|SP[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[6]~28_combout\,
	sdata => VCC,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(6));

-- Location: LCCOMB_X33_Y25_N14
\CPU|CU|SP[7]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[7]~30_combout\ = (\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|SP\(7) & (!\CPU|CU|SP[6]~29\)) # (!\CPU|CU|SP\(7) & ((\CPU|CU|SP[6]~29\) # (GND))))) # (!\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|SP\(7) & (\CPU|CU|SP[6]~29\ & VCC)) # 
-- (!\CPU|CU|SP\(7) & (!\CPU|CU|SP[6]~29\))))
-- \CPU|CU|SP[7]~31\ = CARRY((\CPU|CU|current_state.Decode~regout\ & ((!\CPU|CU|SP[6]~29\) # (!\CPU|CU|SP\(7)))) # (!\CPU|CU|current_state.Decode~regout\ & (!\CPU|CU|SP\(7) & !\CPU|CU|SP[6]~29\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|SP\(7),
	datad => VCC,
	cin => \CPU|CU|SP[6]~29\,
	combout => \CPU|CU|SP[7]~30_combout\,
	cout => \CPU|CU|SP[7]~31\);

-- Location: LCFF_X33_Y25_N15
\CPU|CU|SP[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[7]~30_combout\,
	sdata => VCC,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(7));

-- Location: LCCOMB_X35_Y26_N12
\CPU|CU|AR[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[7]~7_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[7]~13_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~38_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ret~regout\,
	datab => \CPU|CU|PC~38_combout\,
	datad => \data_bus_temp[7]~13_combout\,
	combout => \CPU|CU|AR[7]~7_combout\);

-- Location: LCCOMB_X35_Y26_N4
\CPU|CU|Selector114~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector114~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(7))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(7)))))) # (!\CPU|CU|current_state.Execute~regout\ & (((\CPU|CU|PC\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(7),
	datab => \CPU|CU|current_state.Execute~regout\,
	datac => \CPU|CU|PC\(7),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|Selector114~0_combout\);

-- Location: LCFF_X35_Y26_N13
\CPU|CU|AR[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[7]~7_combout\,
	sdata => \CPU|CU|Selector114~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(7));

-- Location: LCCOMB_X36_Y26_N4
\CPU|address[7]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[7]~37_combout\ = (\CPU|CU|AR_EN~regout\ & (((\CPU|CU|AR\(7))))) # (!\CPU|CU|AR_EN~regout\ & (((\CPU|CU|SP\(7))) # (!\CPU|CU|SP_EN~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP_EN~regout\,
	datab => \CPU|CU|AR_EN~regout\,
	datac => \CPU|CU|SP\(7),
	datad => \CPU|CU|AR\(7),
	combout => \CPU|address[7]~37_combout\);

-- Location: LCCOMB_X36_Y26_N12
\CPU|address[7]~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[7]~50_combout\ = (\CPU|CU|ld_op~regout\ & (\CPU|FNU|Mux8~combout\)) # (!\CPU|CU|ld_op~regout\ & ((\CPU|CU|st_op~regout\ & (\CPU|FNU|Mux8~combout\)) # (!\CPU|CU|st_op~regout\ & ((\CPU|address[7]~37_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~combout\,
	datab => \CPU|CU|ld_op~regout\,
	datac => \CPU|address[7]~37_combout\,
	datad => \CPU|CU|st_op~regout\,
	combout => \CPU|address[7]~50_combout\);

-- Location: LCCOMB_X35_Y26_N30
\CPU|CU|AR[8]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[8]~8_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[8]~28_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~39_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ret~regout\,
	datab => \CPU|CU|PC~39_combout\,
	datad => \data_bus_temp[8]~28_combout\,
	combout => \CPU|CU|AR[8]~8_combout\);

-- Location: LCCOMB_X35_Y26_N14
\CPU|CU|Selector113~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector113~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(8))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(8)))))) # (!\CPU|CU|current_state.Execute~regout\ & (((\CPU|CU|PC\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(8),
	datab => \CPU|CU|current_state.Execute~regout\,
	datac => \CPU|CU|PC\(8),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|Selector113~0_combout\);

-- Location: LCFF_X35_Y26_N31
\CPU|CU|AR[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[8]~8_combout\,
	sdata => \CPU|CU|Selector113~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(8));

-- Location: LCCOMB_X33_Y25_N16
\CPU|CU|SP[8]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[8]~32_combout\ = ((\CPU|CU|SP\(8) $ (\CPU|CU|current_state.Decode~regout\ $ (\CPU|CU|SP[7]~31\)))) # (GND)
-- \CPU|CU|SP[8]~33\ = CARRY((\CPU|CU|SP\(8) & ((!\CPU|CU|SP[7]~31\) # (!\CPU|CU|current_state.Decode~regout\))) # (!\CPU|CU|SP\(8) & (!\CPU|CU|current_state.Decode~regout\ & !\CPU|CU|SP[7]~31\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP\(8),
	datab => \CPU|CU|current_state.Decode~regout\,
	datad => VCC,
	cin => \CPU|CU|SP[7]~31\,
	combout => \CPU|CU|SP[8]~32_combout\,
	cout => \CPU|CU|SP[8]~33\);

-- Location: LCFF_X33_Y25_N17
\CPU|CU|SP[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[8]~32_combout\,
	sdata => \~GND~combout\,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(8));

-- Location: LCCOMB_X34_Y26_N2
\CPU|address[8]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[8]~38_combout\ = (\CPU|CU|AR_EN~regout\ & (((\CPU|CU|AR\(8))))) # (!\CPU|CU|AR_EN~regout\ & (((\CPU|CU|SP\(8))) # (!\CPU|CU|SP_EN~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP_EN~regout\,
	datab => \CPU|CU|AR_EN~regout\,
	datac => \CPU|CU|AR\(8),
	datad => \CPU|CU|SP\(8),
	combout => \CPU|address[8]~38_combout\);

-- Location: LCCOMB_X33_Y27_N16
\CPU|CU|const_out[8]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[8]~8_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(8)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(8),
	datac => \CPU|CU|const_out\(8),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[8]~8_combout\);

-- Location: LCCOMB_X32_Y27_N2
\CPU|CU|Selector96~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector96~0_combout\ = (\CPU|CU|const_out\(8) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|const_out\(8),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector96~0_combout\);

-- Location: LCFF_X33_Y27_N17
\CPU|CU|const_out[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[8]~8_combout\,
	sdata => \CPU|CU|Selector96~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(8));

-- Location: LCFF_X38_Y26_N27
\CPU|FNU|R1|data_out[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|func_data[8]~12_combout\,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(8));

-- Location: LCFF_X42_Y26_N31
\CPU|FNU|R7|data_out[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[8]~12_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(8));

-- Location: LCFF_X42_Y28_N17
\CPU|FNU|R5|data_out[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[8]~12_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(8));

-- Location: LCFF_X43_Y26_N21
\CPU|FNU|R4|data_out[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[8]~12_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(8));

-- Location: LCCOMB_X42_Y26_N28
\CPU|FNU|Bbus[8]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[8]~48_combout\ = (\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|R6|data_out\(8)) # ((\CPU|CU|ctl_wd\(0))))) # (!\CPU|CU|ctl_wd\(1) & (((!\CPU|CU|ctl_wd\(0) & \CPU|FNU|R4|data_out\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R6|data_out\(8),
	datab => \CPU|CU|ctl_wd\(1),
	datac => \CPU|CU|ctl_wd\(0),
	datad => \CPU|FNU|R4|data_out\(8),
	combout => \CPU|FNU|Bbus[8]~48_combout\);

-- Location: LCCOMB_X42_Y28_N16
\CPU|FNU|Bbus[8]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[8]~49_combout\ = (\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|Bbus[8]~48_combout\ & (\CPU|FNU|R7|data_out\(8))) # (!\CPU|FNU|Bbus[8]~48_combout\ & ((\CPU|FNU|R5|data_out\(8)))))) # (!\CPU|CU|ctl_wd\(0) & (((\CPU|FNU|Bbus[8]~48_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(0),
	datab => \CPU|FNU|R7|data_out\(8),
	datac => \CPU|FNU|R5|data_out\(8),
	datad => \CPU|FNU|Bbus[8]~48_combout\,
	combout => \CPU|FNU|Bbus[8]~49_combout\);

-- Location: LCCOMB_X42_Y28_N6
\CPU|FNU|Bbus[8]~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[8]~50_combout\ = (\CPU|FNU|Bbus[12]~4_combout\ & (((\CPU|FNU|Bbus[8]~49_combout\) # (!\CPU|FNU|Bbus[12]~3_combout\)))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(8) & ((\CPU|FNU|Bbus[12]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~4_combout\,
	datab => \CPU|FNU|R1|data_out\(8),
	datac => \CPU|FNU|Bbus[8]~49_combout\,
	datad => \CPU|FNU|Bbus[12]~3_combout\,
	combout => \CPU|FNU|Bbus[8]~50_combout\);

-- Location: LCCOMB_X42_Y28_N2
\CPU|FNU|Bbus[8]~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[8]~53_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[8]~50_combout\ & (\CPU|FNU|R3|data_out\(8))) # (!\CPU|FNU|Bbus[8]~50_combout\ & ((\CPU|FNU|R2|data_out\(8)))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[8]~50_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(8),
	datab => \CPU|FNU|R2|data_out\(8),
	datac => \CPU|FNU|Bbus[12]~0_combout\,
	datad => \CPU|FNU|Bbus[8]~50_combout\,
	combout => \CPU|FNU|Bbus[8]~53_combout\);

-- Location: LCCOMB_X42_Y28_N4
\CPU|FNU|Fnc_unit|Add0~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~30_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(8))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[8]~53_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(9),
	datab => \CPU|CU|const_out\(8),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[8]~53_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~30_combout\);

-- Location: LCCOMB_X33_Y27_N14
\CPU|CU|const_out[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[7]~7_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(7)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(7),
	datac => \CPU|CU|const_out\(7),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[7]~7_combout\);

-- Location: LCCOMB_X32_Y27_N16
\CPU|CU|Selector97~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector97~0_combout\ = (\CPU|CU|const_out\(7) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|const_out\(7),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector97~0_combout\);

-- Location: LCFF_X33_Y27_N15
\CPU|CU|const_out[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[7]~7_combout\,
	sdata => \CPU|CU|Selector97~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(7));

-- Location: LCCOMB_X36_Y22_N14
\CPU|CU|ctl_wd~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~27_combout\ = (\CPU|CU|IR\(14)) # ((\CPU|CU|IR\(9)) # ((\CPU|CU|IR\(10)) # (\CPU|CU|IR\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(14),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|ctl_wd~27_combout\);

-- Location: LCCOMB_X42_Y24_N22
\CPU|CU|ctl_wd~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~28_combout\ = (\CPU|CU|ctl_wd~27_combout\) # (!\CPU|CU|IR\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|IR\(7),
	datad => \CPU|CU|ctl_wd~27_combout\,
	combout => \CPU|CU|ctl_wd~28_combout\);

-- Location: LCCOMB_X42_Y24_N6
\CPU|CU|ctl_wd[14]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd[14]~7_combout\ = (\CPU|CU|IR\(15) & (\CPU|CU|ctl_wd\(14))) # (!\CPU|CU|IR\(15) & ((!\CPU|CU|ctl_wd~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|IR\(15),
	datac => \CPU|CU|ctl_wd\(14),
	datad => \CPU|CU|ctl_wd~28_combout\,
	combout => \CPU|CU|ctl_wd[14]~7_combout\);

-- Location: LCCOMB_X38_Y28_N30
\CPU|CU|Selector74~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector74~0_combout\ = (\CPU|CU|current_state.Reset~regout\ & \CPU|CU|ctl_wd\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|current_state.Reset~regout\,
	datad => \CPU|CU|ctl_wd\(14),
	combout => \CPU|CU|Selector74~0_combout\);

-- Location: LCFF_X42_Y24_N7
\CPU|CU|ctl_wd[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|ctl_wd[14]~7_combout\,
	sdata => \CPU|CU|Selector74~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(14));

-- Location: LCCOMB_X37_Y25_N2
\CPU|FNU|R6|data_out[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R6|data_out[7]~feeder_combout\ = \CPU|FNU|func_data[7]~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[7]~6_combout\,
	combout => \CPU|FNU|R6|data_out[7]~feeder_combout\);

-- Location: LCFF_X37_Y25_N3
\CPU|FNU|R6|data_out[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R6|data_out[7]~feeder_combout\,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(7));

-- Location: LCFF_X38_Y24_N17
\CPU|FNU|R7|data_out[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[7]~6_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(7));

-- Location: LCCOMB_X41_Y27_N0
\CPU|FNU|R5|data_out[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R5|data_out[7]~feeder_combout\ = \CPU|FNU|func_data[7]~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[7]~6_combout\,
	combout => \CPU|FNU|R5|data_out[7]~feeder_combout\);

-- Location: LCFF_X41_Y27_N1
\CPU|FNU|R5|data_out[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R5|data_out[7]~feeder_combout\,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(7));

-- Location: LCFF_X38_Y24_N11
\CPU|FNU|R4|data_out[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[7]~6_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(7));

-- Location: LCCOMB_X41_Y27_N10
\CPU|FNU|Mux8~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux8~3_combout\ = (\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|R5|data_out\(7)) # ((\CPU|CU|ctl_wd\(4))))) # (!\CPU|CU|ctl_wd\(3) & (((!\CPU|CU|ctl_wd\(4) & \CPU|FNU|R4|data_out\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(3),
	datab => \CPU|FNU|R5|data_out\(7),
	datac => \CPU|CU|ctl_wd\(4),
	datad => \CPU|FNU|R4|data_out\(7),
	combout => \CPU|FNU|Mux8~3_combout\);

-- Location: LCCOMB_X36_Y25_N30
\CPU|FNU|Mux8~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux8~4_combout\ = (\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|Mux8~3_combout\ & ((\CPU|FNU|R7|data_out\(7)))) # (!\CPU|FNU|Mux8~3_combout\ & (\CPU|FNU|R6|data_out\(7))))) # (!\CPU|CU|ctl_wd\(4) & (((\CPU|FNU|Mux8~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(4),
	datab => \CPU|FNU|R6|data_out\(7),
	datac => \CPU|FNU|R7|data_out\(7),
	datad => \CPU|FNU|Mux8~3_combout\,
	combout => \CPU|FNU|Mux8~4_combout\);

-- Location: LCCOMB_X36_Y25_N24
\CPU|FNU|Mux8~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux8~5_combout\ = (\CPU|FNU|Mux8~2_combout\ & (((\CPU|FNU|Mux8~4_combout\) # (!\CPU|FNU|Mux8~1_combout\)))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(7) & (\CPU|FNU|Mux8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(7),
	datab => \CPU|FNU|Mux8~2_combout\,
	datac => \CPU|FNU|Mux8~1_combout\,
	datad => \CPU|FNU|Mux8~4_combout\,
	combout => \CPU|FNU|Mux8~5_combout\);

-- Location: LCFF_X36_Y25_N23
\CPU|FNU|R2|data_out[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[7]~6_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(7));

-- Location: LCCOMB_X36_Y25_N18
\CPU|FNU|Mux8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux8~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux8~5_combout\ & (\CPU|FNU|R3|data_out\(7))) # (!\CPU|FNU|Mux8~5_combout\ & ((\CPU|FNU|R2|data_out\(7)))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux8~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~0_combout\,
	datab => \CPU|FNU|R3|data_out\(7),
	datac => \CPU|FNU|Mux8~5_combout\,
	datad => \CPU|FNU|R2|data_out\(7),
	combout => \CPU|FNU|Mux8~combout\);

-- Location: LCCOMB_X41_Y23_N2
\CPU|FNU|Fnc_unit|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux3~1_combout\ = (\CPU|CU|ctl_wd\(9) & (((\CPU|CU|ctl_wd\(8)) # (\CPU|CU|ctl_wd\(7))))) # (!\CPU|CU|ctl_wd\(9) & (!\CPU|CU|ctl_wd\(8) & ((\CPU|CU|ctl_wd\(6)) # (!\CPU|CU|ctl_wd\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(6),
	datab => \CPU|CU|ctl_wd\(9),
	datac => \CPU|CU|ctl_wd\(8),
	datad => \CPU|CU|ctl_wd\(7),
	combout => \CPU|FNU|Fnc_unit|Mux3~1_combout\);

-- Location: LCCOMB_X36_Y25_N26
\CPU|FNU|Fnc_unit|F_temp~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|F_temp~1_combout\ = (\CPU|FNU|Mux8~combout\) # ((\CPU|CU|ctl_wd\(13) & ((\CPU|CU|const_out\(7)))) # (!\CPU|CU|ctl_wd\(13) & (\CPU|FNU|Bbus[7]~39_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[7]~39_combout\,
	datab => \CPU|CU|ctl_wd\(13),
	datac => \CPU|CU|const_out\(7),
	datad => \CPU|FNU|Mux8~combout\,
	combout => \CPU|FNU|Fnc_unit|F_temp~1_combout\);

-- Location: LCCOMB_X43_Y25_N26
\CPU|FNU|Fnc_unit|Mux3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux3~3_combout\ = (\CPU|CU|ctl_wd\(7)) # (!\CPU|CU|ctl_wd\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(7),
	datad => \CPU|CU|ctl_wd\(8),
	combout => \CPU|FNU|Fnc_unit|Mux3~3_combout\);

-- Location: LCCOMB_X38_Y24_N4
\CPU|FNU|Bbus[7]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[7]~36_combout\ = (\CPU|CU|ctl_wd\(1) & (((\CPU|CU|ctl_wd\(0))))) # (!\CPU|CU|ctl_wd\(1) & ((\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|R5|data_out\(7)))) # (!\CPU|CU|ctl_wd\(0) & (\CPU|FNU|R4|data_out\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R4|data_out\(7),
	datab => \CPU|CU|ctl_wd\(1),
	datac => \CPU|CU|ctl_wd\(0),
	datad => \CPU|FNU|R5|data_out\(7),
	combout => \CPU|FNU|Bbus[7]~36_combout\);

-- Location: LCCOMB_X38_Y24_N22
\CPU|FNU|Bbus[7]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[7]~37_combout\ = (\CPU|FNU|Bbus[7]~36_combout\ & ((\CPU|FNU|R7|data_out\(7)) # ((!\CPU|CU|ctl_wd\(1))))) # (!\CPU|FNU|Bbus[7]~36_combout\ & (((\CPU|FNU|R6|data_out\(7) & \CPU|CU|ctl_wd\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R7|data_out\(7),
	datab => \CPU|FNU|R6|data_out\(7),
	datac => \CPU|FNU|Bbus[7]~36_combout\,
	datad => \CPU|CU|ctl_wd\(1),
	combout => \CPU|FNU|Bbus[7]~37_combout\);

-- Location: LCCOMB_X36_Y25_N20
\CPU|FNU|Bbus[7]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[7]~38_combout\ = (\CPU|FNU|Bbus[12]~4_combout\ & (((\CPU|FNU|Bbus[7]~37_combout\) # (!\CPU|FNU|Bbus[12]~3_combout\)))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(7) & (\CPU|FNU|Bbus[12]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(7),
	datab => \CPU|FNU|Bbus[12]~4_combout\,
	datac => \CPU|FNU|Bbus[12]~3_combout\,
	datad => \CPU|FNU|Bbus[7]~37_combout\,
	combout => \CPU|FNU|Bbus[7]~38_combout\);

-- Location: LCCOMB_X37_Y25_N16
\CPU|FNU|Bbus[7]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[7]~40_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[7]~38_combout\ & (\CPU|FNU|R3|data_out\(7))) # (!\CPU|FNU|Bbus[7]~38_combout\ & ((\CPU|FNU|R2|data_out\(7)))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[7]~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(7),
	datab => \CPU|FNU|Bbus[12]~0_combout\,
	datac => \CPU|FNU|Bbus[7]~38_combout\,
	datad => \CPU|FNU|R2|data_out\(7),
	combout => \CPU|FNU|Bbus[7]~40_combout\);

-- Location: LCCOMB_X37_Y25_N10
\CPU|FNU|Bbus[7]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[7]~41_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(7))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[7]~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(7),
	datac => \CPU|FNU|Bbus[7]~40_combout\,
	datad => \CPU|CU|ctl_wd\(13),
	combout => \CPU|FNU|Bbus[7]~41_combout\);

-- Location: LCCOMB_X37_Y25_N20
\CPU|FNU|Fnc_unit|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux8~0_combout\ = (\CPU|FNU|Fnc_unit|Mux3~2_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~3_combout\) # ((\CPU|FNU|Mux8~combout\ & \CPU|FNU|Bbus[7]~41_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (!\CPU|FNU|Mux8~combout\ & 
-- (!\CPU|FNU|Fnc_unit|Mux3~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100110100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datab => \CPU|FNU|Mux8~combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datad => \CPU|FNU|Bbus[7]~41_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux8~0_combout\);

-- Location: LCCOMB_X37_Y25_N30
\CPU|FNU|Fnc_unit|Mux8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux8~1_combout\ = (\CPU|FNU|Fnc_unit|Mux3~3_combout\ & ((\CPU|FNU|Fnc_unit|Mux8~0_combout\ & ((\CPU|FNU|Bbus[7]~41_combout\))) # (!\CPU|FNU|Fnc_unit|Mux8~0_combout\ & (\CPU|FNU|Mux9~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datab => \CPU|FNU|Mux9~combout\,
	datac => \CPU|FNU|Fnc_unit|Mux8~0_combout\,
	datad => \CPU|FNU|Bbus[7]~41_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux8~1_combout\);

-- Location: LCCOMB_X36_Y25_N12
\CPU|FNU|Fnc_unit|Mux8~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux8~2_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|F_temp~1_combout\) # ((\CPU|FNU|Fnc_unit|Mux3~1_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (((!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- \CPU|FNU|Fnc_unit|Mux8~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datab => \CPU|FNU|Fnc_unit|F_temp~1_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux8~1_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux8~2_combout\);

-- Location: LCCOMB_X36_Y25_N14
\CPU|FNU|Fnc_unit|Mux8~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux8~3_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux8~2_combout\ & ((\CPU|FNU|Mux8~combout\))) # (!\CPU|FNU|Fnc_unit|Mux8~2_combout\ & (\CPU|FNU|Mux7~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux7~combout\,
	datab => \CPU|FNU|Mux8~combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux8~2_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux8~3_combout\);

-- Location: LCCOMB_X40_Y25_N4
\CPU|FNU|func_data[7]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[7]~5_combout\ = (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Add0~25_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Mux8~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Add0~25_combout\,
	datab => \CPU|CU|ctl_wd\(14),
	datac => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux8~3_combout\,
	combout => \CPU|FNU|func_data[7]~5_combout\);

-- Location: LCCOMB_X37_Y25_N26
\CPU|FNU|func_data[7]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[7]~6_combout\ = (\CPU|FNU|func_data[7]~5_combout\) # ((\data_bus_temp[7]~13_combout\ & \CPU|CU|ctl_wd\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[7]~13_combout\,
	datab => \CPU|CU|ctl_wd\(14),
	datad => \CPU|FNU|func_data[7]~5_combout\,
	combout => \CPU|FNU|func_data[7]~6_combout\);

-- Location: LCCOMB_X37_Y25_N0
\CPU|FNU|R3|data_out[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R3|data_out[7]~feeder_combout\ = \CPU|FNU|func_data[7]~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[7]~6_combout\,
	combout => \CPU|FNU|R3|data_out[7]~feeder_combout\);

-- Location: LCFF_X37_Y25_N1
\CPU|FNU|R3|data_out[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R3|data_out[7]~feeder_combout\,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(7));

-- Location: LCCOMB_X36_Y25_N6
\CPU|FNU|Bbus[7]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[7]~39_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[7]~38_combout\ & (\CPU|FNU|R3|data_out\(7))) # (!\CPU|FNU|Bbus[7]~38_combout\ & ((\CPU|FNU|R2|data_out\(7)))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[7]~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~0_combout\,
	datab => \CPU|FNU|R3|data_out\(7),
	datac => \CPU|FNU|Bbus[7]~38_combout\,
	datad => \CPU|FNU|R2|data_out\(7),
	combout => \CPU|FNU|Bbus[7]~39_combout\);

-- Location: LCCOMB_X36_Y25_N0
\CPU|FNU|Fnc_unit|Add0~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~24_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(7))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[7]~39_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(9),
	datab => \CPU|CU|ctl_wd\(13),
	datac => \CPU|CU|const_out\(7),
	datad => \CPU|FNU|Bbus[7]~39_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~24_combout\);

-- Location: LCCOMB_X41_Y23_N30
\CPU|FNU|Bbus[6]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[6]~35_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[6]~32_combout\ & (\CPU|FNU|R3|data_out\(6))) # (!\CPU|FNU|Bbus[6]~32_combout\ & ((\CPU|FNU|R2|data_out\(6)))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[6]~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(6),
	datab => \CPU|FNU|R2|data_out\(6),
	datac => \CPU|FNU|Bbus[12]~0_combout\,
	datad => \CPU|FNU|Bbus[6]~32_combout\,
	combout => \CPU|FNU|Bbus[6]~35_combout\);

-- Location: LCCOMB_X41_Y23_N8
\CPU|FNU|Fnc_unit|Add0~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~21_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(6))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[6]~35_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001101101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(6),
	datab => \CPU|CU|ctl_wd\(9),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[6]~35_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~21_combout\);

-- Location: LCCOMB_X38_Y25_N14
\CPU|FNU|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux8~0_combout\ = (\CPU|CU|ctl_wd\(4) & !\CPU|CU|ctl_wd\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(4),
	datad => \CPU|CU|ctl_wd\(5),
	combout => \CPU|FNU|Mux8~0_combout\);

-- Location: LCCOMB_X33_Y27_N10
\CPU|CU|const_out[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[3]~3_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(3)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(3),
	datac => \CPU|CU|const_out\(3),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[3]~3_combout\);

-- Location: LCCOMB_X32_Y27_N10
\CPU|CU|Selector101~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector101~0_combout\ = (\CPU|CU|const_out\(3) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|const_out\(3),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector101~0_combout\);

-- Location: LCFF_X33_Y27_N11
\CPU|CU|const_out[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[3]~3_combout\,
	sdata => \CPU|CU|Selector101~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(3));

-- Location: LCFF_X41_Y24_N1
\CPU|FNU|R7|data_out[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[3]~11_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(3));

-- Location: LCFF_X41_Y27_N29
\CPU|FNU|R4|data_out[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[3]~11_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(3));

-- Location: LCCOMB_X41_Y24_N18
\CPU|FNU|Bbus[3]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[3]~7_combout\ = (\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|R5|data_out\(3)) # ((\CPU|CU|ctl_wd\(1))))) # (!\CPU|CU|ctl_wd\(0) & (((!\CPU|CU|ctl_wd\(1) & \CPU|FNU|R4|data_out\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(3),
	datab => \CPU|CU|ctl_wd\(0),
	datac => \CPU|CU|ctl_wd\(1),
	datad => \CPU|FNU|R4|data_out\(3),
	combout => \CPU|FNU|Bbus[3]~7_combout\);

-- Location: LCCOMB_X41_Y24_N0
\CPU|FNU|Bbus[3]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[3]~8_combout\ = (\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|Bbus[3]~7_combout\ & ((\CPU|FNU|R7|data_out\(3)))) # (!\CPU|FNU|Bbus[3]~7_combout\ & (\CPU|FNU|R6|data_out\(3))))) # (!\CPU|CU|ctl_wd\(1) & (((\CPU|FNU|Bbus[3]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R6|data_out\(3),
	datab => \CPU|CU|ctl_wd\(1),
	datac => \CPU|FNU|R7|data_out\(3),
	datad => \CPU|FNU|Bbus[3]~7_combout\,
	combout => \CPU|FNU|Bbus[3]~8_combout\);

-- Location: LCCOMB_X37_Y27_N14
\CPU|FNU|Bbus[3]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[3]~9_combout\ = (\CPU|FNU|Bbus[12]~3_combout\ & ((\CPU|FNU|Bbus[12]~4_combout\ & ((\CPU|FNU|Bbus[3]~8_combout\))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(3))))) # (!\CPU|FNU|Bbus[12]~3_combout\ & 
-- (((\CPU|FNU|Bbus[12]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(3),
	datab => \CPU|FNU|Bbus[12]~3_combout\,
	datac => \CPU|FNU|Bbus[12]~4_combout\,
	datad => \CPU|FNU|Bbus[3]~8_combout\,
	combout => \CPU|FNU|Bbus[3]~9_combout\);

-- Location: LCCOMB_X41_Y28_N20
\CPU|FNU|Bbus[3]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[3]~10_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[3]~9_combout\ & ((\CPU|FNU|R3|data_out\(3)))) # (!\CPU|FNU|Bbus[3]~9_combout\ & (\CPU|FNU|R2|data_out\(3))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[3]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(3),
	datab => \CPU|FNU|R3|data_out\(3),
	datac => \CPU|FNU|Bbus[12]~0_combout\,
	datad => \CPU|FNU|Bbus[3]~9_combout\,
	combout => \CPU|FNU|Bbus[3]~10_combout\);

-- Location: LCCOMB_X40_Y27_N14
\CPU|FNU|Fnc_unit|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~2_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(3))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[3]~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(9),
	datab => \CPU|CU|const_out\(3),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[3]~10_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~2_combout\);

-- Location: LCCOMB_X33_Y27_N22
\CPU|CU|const_out[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[1]~1_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(1)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(1),
	datac => \CPU|CU|const_out\(1),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[1]~1_combout\);

-- Location: LCCOMB_X32_Y27_N14
\CPU|CU|Selector103~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector103~0_combout\ = (\CPU|CU|const_out\(1) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|const_out\(1),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector103~0_combout\);

-- Location: LCFF_X33_Y27_N23
\CPU|CU|const_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[1]~1_combout\,
	sdata => \CPU|CU|Selector103~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(1));

-- Location: LCCOMB_X36_Y22_N30
\CPU|CU|offset~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~26_combout\ = (\CPU|CU|IR\(14) & (\CPU|CU|IR\(10) $ (((\CPU|CU|IR\(9) & \CPU|CU|IR\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(14),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|offset~26_combout\);

-- Location: LCCOMB_X36_Y22_N8
\CPU|CU|offset~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~27_combout\ = ((!\CPU|CU|IR\(10) & ((!\CPU|CU|IR\(8)) # (!\CPU|CU|IR\(9))))) # (!\CPU|CU|IR\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(14),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|offset~27_combout\);

-- Location: LCCOMB_X36_Y22_N28
\CPU|CU|Selector65~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector65~0_combout\ = (\CPU|CU|IR\(0) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(0),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector65~0_combout\);

-- Location: LCFF_X36_Y22_N29
\CPU|CU|IR[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector65~0_combout\,
	sdata => \data_bus_temp[0]~16_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(0));

-- Location: LCCOMB_X36_Y22_N26
\CPU|CU|offset~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~28_combout\ = (\CPU|CU|offset\(0) & ((\CPU|CU|offset~27_combout\) # ((\CPU|CU|offset~26_combout\ & \CPU|CU|IR\(0))))) # (!\CPU|CU|offset\(0) & (\CPU|CU|offset~26_combout\ & ((\CPU|CU|IR\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(0),
	datab => \CPU|CU|offset~26_combout\,
	datac => \CPU|CU|offset~27_combout\,
	datad => \CPU|CU|IR\(0),
	combout => \CPU|CU|offset~28_combout\);

-- Location: LCCOMB_X35_Y28_N8
\CPU|CU|offset[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset[0]~0_combout\ = (\CPU|CU|IR\(15) & ((\CPU|CU|IR\(0)))) # (!\CPU|CU|IR\(15) & (\CPU|CU|offset~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(15),
	datab => \CPU|CU|offset~28_combout\,
	datad => \CPU|CU|IR\(0),
	combout => \CPU|CU|offset[0]~0_combout\);

-- Location: LCCOMB_X38_Y28_N14
\CPU|CU|Selector138~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector138~0_combout\ = (\CPU|CU|offset\(0) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(0),
	datac => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector138~0_combout\);

-- Location: LCFF_X35_Y28_N9
\CPU|CU|offset[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|offset[0]~0_combout\,
	sdata => \CPU|CU|Selector138~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(0));

-- Location: LCCOMB_X33_Y27_N0
\CPU|CU|const_out[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[0]~0_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(0)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(0),
	datac => \CPU|CU|const_out\(0),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[0]~0_combout\);

-- Location: LCCOMB_X32_Y27_N8
\CPU|CU|Selector104~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector104~0_combout\ = (\CPU|CU|const_out\(0) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|const_out\(0),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector104~0_combout\);

-- Location: LCFF_X33_Y27_N1
\CPU|CU|const_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[0]~0_combout\,
	sdata => \CPU|CU|Selector104~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(0));

-- Location: LCFF_X41_Y23_N15
\CPU|FNU|R1|data_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[0]~7_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(0));

-- Location: LCCOMB_X40_Y24_N20
\CPU|FNU|R6|data_out[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R6|data_out[0]~feeder_combout\ = \CPU|FNU|func_data[0]~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[0]~7_combout\,
	combout => \CPU|FNU|R6|data_out[0]~feeder_combout\);

-- Location: LCFF_X40_Y24_N21
\CPU|FNU|R6|data_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R6|data_out[0]~feeder_combout\,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(0));

-- Location: LCCOMB_X40_Y23_N28
\CPU|FNU|R4|data_out[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R4|data_out[0]~feeder_combout\ = \CPU|FNU|func_data[0]~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[0]~7_combout\,
	combout => \CPU|FNU|R4|data_out[0]~feeder_combout\);

-- Location: LCFF_X40_Y23_N29
\CPU|FNU|R4|data_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R4|data_out[0]~feeder_combout\,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(0));

-- Location: LCCOMB_X40_Y23_N0
\CPU|FNU|Mux15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux15~0_combout\ = (\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|R5|data_out\(0)) # ((\CPU|CU|ctl_wd\(4))))) # (!\CPU|CU|ctl_wd\(3) & (((\CPU|FNU|R4|data_out\(0) & !\CPU|CU|ctl_wd\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(0),
	datab => \CPU|FNU|R4|data_out\(0),
	datac => \CPU|CU|ctl_wd\(3),
	datad => \CPU|CU|ctl_wd\(4),
	combout => \CPU|FNU|Mux15~0_combout\);

-- Location: LCCOMB_X40_Y24_N6
\CPU|FNU|Mux15~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux15~1_combout\ = (\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|Mux15~0_combout\ & (\CPU|FNU|R7|data_out\(0))) # (!\CPU|FNU|Mux15~0_combout\ & ((\CPU|FNU|R6|data_out\(0)))))) # (!\CPU|CU|ctl_wd\(4) & (((\CPU|FNU|Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R7|data_out\(0),
	datab => \CPU|FNU|R6|data_out\(0),
	datac => \CPU|CU|ctl_wd\(4),
	datad => \CPU|FNU|Mux15~0_combout\,
	combout => \CPU|FNU|Mux15~1_combout\);

-- Location: LCCOMB_X40_Y23_N26
\CPU|FNU|Mux15~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux15~2_combout\ = (\CPU|FNU|Mux8~2_combout\ & (((\CPU|FNU|Mux15~1_combout\) # (!\CPU|FNU|Mux8~1_combout\)))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(0) & ((\CPU|FNU|Mux8~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~2_combout\,
	datab => \CPU|FNU|R1|data_out\(0),
	datac => \CPU|FNU|Mux15~1_combout\,
	datad => \CPU|FNU|Mux8~1_combout\,
	combout => \CPU|FNU|Mux15~2_combout\);

-- Location: LCCOMB_X40_Y23_N20
\CPU|FNU|Mux15\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux15~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux15~2_combout\ & ((\CPU|FNU|R3|data_out\(0)))) # (!\CPU|FNU|Mux15~2_combout\ & (\CPU|FNU|R2|data_out\(0))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux15~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(0),
	datab => \CPU|FNU|R3|data_out\(0),
	datac => \CPU|FNU|Mux8~0_combout\,
	datad => \CPU|FNU|Mux15~2_combout\,
	combout => \CPU|FNU|Mux15~combout\);

-- Location: LCCOMB_X38_Y27_N4
\CPU|FNU|R2|data_out[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R2|data_out[1]~feeder_combout\ = \CPU|FNU|func_data[1]~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[1]~9_combout\,
	combout => \CPU|FNU|R2|data_out[1]~feeder_combout\);

-- Location: LCFF_X38_Y27_N5
\CPU|FNU|R2|data_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R2|data_out[1]~feeder_combout\,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(1));

-- Location: LCCOMB_X38_Y27_N16
\CPU|FNU|R5|data_out[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R5|data_out[1]~feeder_combout\ = \CPU|FNU|func_data[1]~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[1]~9_combout\,
	combout => \CPU|FNU|R5|data_out[1]~feeder_combout\);

-- Location: LCFF_X38_Y27_N17
\CPU|FNU|R5|data_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R5|data_out[1]~feeder_combout\,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(1));

-- Location: LCCOMB_X42_Y26_N20
\CPU|FNU|R6|data_out[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R6|data_out[1]~feeder_combout\ = \CPU|FNU|func_data[1]~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[1]~9_combout\,
	combout => \CPU|FNU|R6|data_out[1]~feeder_combout\);

-- Location: LCFF_X42_Y26_N21
\CPU|FNU|R6|data_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R6|data_out[1]~feeder_combout\,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(1));

-- Location: LCCOMB_X38_Y27_N6
\CPU|FNU|Mux14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux14~0_combout\ = (\CPU|CU|ctl_wd\(3) & (((\CPU|CU|ctl_wd\(4))))) # (!\CPU|CU|ctl_wd\(3) & ((\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|R6|data_out\(1)))) # (!\CPU|CU|ctl_wd\(4) & (\CPU|FNU|R4|data_out\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R4|data_out\(1),
	datab => \CPU|CU|ctl_wd\(3),
	datac => \CPU|FNU|R6|data_out\(1),
	datad => \CPU|CU|ctl_wd\(4),
	combout => \CPU|FNU|Mux14~0_combout\);

-- Location: LCCOMB_X38_Y27_N8
\CPU|FNU|Mux14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux14~1_combout\ = (\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|Mux14~0_combout\ & (\CPU|FNU|R7|data_out\(1))) # (!\CPU|FNU|Mux14~0_combout\ & ((\CPU|FNU|R5|data_out\(1)))))) # (!\CPU|CU|ctl_wd\(3) & (((\CPU|FNU|Mux14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R7|data_out\(1),
	datab => \CPU|CU|ctl_wd\(3),
	datac => \CPU|FNU|R5|data_out\(1),
	datad => \CPU|FNU|Mux14~0_combout\,
	combout => \CPU|FNU|Mux14~1_combout\);

-- Location: LCCOMB_X38_Y27_N26
\CPU|FNU|Mux14~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux14~2_combout\ = (\CPU|FNU|Mux8~2_combout\ & (((\CPU|FNU|Mux14~1_combout\) # (!\CPU|FNU|Mux8~1_combout\)))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(1) & ((\CPU|FNU|Mux8~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(1),
	datab => \CPU|FNU|Mux14~1_combout\,
	datac => \CPU|FNU|Mux8~2_combout\,
	datad => \CPU|FNU|Mux8~1_combout\,
	combout => \CPU|FNU|Mux14~2_combout\);

-- Location: LCCOMB_X38_Y27_N28
\CPU|FNU|Mux14\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux14~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux14~2_combout\ & ((\CPU|FNU|R3|data_out\(1)))) # (!\CPU|FNU|Mux14~2_combout\ & (\CPU|FNU|R2|data_out\(1))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux14~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~0_combout\,
	datab => \CPU|FNU|R2|data_out\(1),
	datac => \CPU|FNU|R3|data_out\(1),
	datad => \CPU|FNU|Mux14~2_combout\,
	combout => \CPU|FNU|Mux14~combout\);

-- Location: LCCOMB_X40_Y27_N2
\CPU|FNU|Fnc_unit|Add0~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~28_combout\ = (\CPU|CU|ctl_wd\(6) & \CPU|FNU|Mux14~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(6),
	datad => \CPU|FNU|Mux14~combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~28_combout\);

-- Location: LCCOMB_X41_Y23_N26
\CPU|FNU|Fnc_unit|Mux15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux15~0_combout\ = (\CPU|CU|ctl_wd\(8) & (\CPU|CU|ctl_wd\(7))) # (!\CPU|CU|ctl_wd\(8) & ((\CPU|CU|ctl_wd\(7) & ((\CPU|FNU|Fnc_unit|Add0~28_combout\))) # (!\CPU|CU|ctl_wd\(7) & (\CPU|FNU|Mux15~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(8),
	datab => \CPU|CU|ctl_wd\(7),
	datac => \CPU|FNU|Mux15~combout\,
	datad => \CPU|FNU|Fnc_unit|Add0~28_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux15~0_combout\);

-- Location: LCCOMB_X40_Y27_N16
\CPU|FNU|Fnc_unit|Add0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~7_cout\ = CARRY(\CPU|CU|ctl_wd\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(6),
	datad => VCC,
	cout => \CPU|FNU|Fnc_unit|Add0~7_cout\);

-- Location: LCCOMB_X40_Y27_N18
\CPU|FNU|Fnc_unit|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~8_combout\ = (\CPU|FNU|Mux15~combout\ & ((\CPU|FNU|Fnc_unit|Add0~5_combout\ & (\CPU|FNU|Fnc_unit|Add0~7_cout\ & VCC)) # (!\CPU|FNU|Fnc_unit|Add0~5_combout\ & (!\CPU|FNU|Fnc_unit|Add0~7_cout\)))) # (!\CPU|FNU|Mux15~combout\ & 
-- ((\CPU|FNU|Fnc_unit|Add0~5_combout\ & (!\CPU|FNU|Fnc_unit|Add0~7_cout\)) # (!\CPU|FNU|Fnc_unit|Add0~5_combout\ & ((\CPU|FNU|Fnc_unit|Add0~7_cout\) # (GND)))))
-- \CPU|FNU|Fnc_unit|Add0~9\ = CARRY((\CPU|FNU|Mux15~combout\ & (!\CPU|FNU|Fnc_unit|Add0~5_combout\ & !\CPU|FNU|Fnc_unit|Add0~7_cout\)) # (!\CPU|FNU|Mux15~combout\ & ((!\CPU|FNU|Fnc_unit|Add0~7_cout\) # (!\CPU|FNU|Fnc_unit|Add0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux15~combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~5_combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~7_cout\,
	combout => \CPU|FNU|Fnc_unit|Add0~8_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~9\);

-- Location: LCCOMB_X40_Y23_N30
\CPU|FNU|Bbus[0]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[0]~42_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(0))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[0]~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|const_out\(0),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[0]~22_combout\,
	combout => \CPU|FNU|Bbus[0]~42_combout\);

-- Location: LCCOMB_X40_Y23_N18
\CPU|FNU|Fnc_unit|Add0~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~29_combout\ = (\CPU|CU|ctl_wd\(6) & ((\CPU|FNU|Bbus[0]~42_combout\))) # (!\CPU|CU|ctl_wd\(6) & (\CPU|FNU|Fnc_unit|Add0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(6),
	datac => \CPU|FNU|Fnc_unit|Add0~8_combout\,
	datad => \CPU|FNU|Bbus[0]~42_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~29_combout\);

-- Location: LCCOMB_X40_Y23_N4
\CPU|FNU|Fnc_unit|Mux15~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux15~1_combout\ = (\CPU|CU|ctl_wd\(8) & ((\CPU|FNU|Fnc_unit|Mux15~0_combout\ & ((\CPU|FNU|Fnc_unit|Add0~29_combout\))) # (!\CPU|FNU|Fnc_unit|Mux15~0_combout\ & (\CPU|FNU|Fnc_unit|Add0~27_combout\)))) # (!\CPU|CU|ctl_wd\(8) & 
-- (((\CPU|FNU|Fnc_unit|Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Add0~27_combout\,
	datab => \CPU|CU|ctl_wd\(8),
	datac => \CPU|FNU|Fnc_unit|Mux15~0_combout\,
	datad => \CPU|FNU|Fnc_unit|Add0~29_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux15~1_combout\);

-- Location: LCCOMB_X41_Y23_N14
\CPU|FNU|Fnc_unit|Mux3~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux3~5_combout\ = (!\CPU|CU|ctl_wd\(8) & !\CPU|CU|ctl_wd\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(8),
	datad => \CPU|CU|ctl_wd\(7),
	combout => \CPU|FNU|Fnc_unit|Mux3~5_combout\);

-- Location: LCCOMB_X41_Y23_N22
\CPU|FNU|Fnc_unit|Mux15~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux15~3_combout\ = (\CPU|FNU|Fnc_unit|Mux3~5_combout\ & ((\CPU|CU|ctl_wd\(6) & ((\CPU|FNU|Fnc_unit|Add0~8_combout\))) # (!\CPU|CU|ctl_wd\(6) & (\CPU|FNU|Bbus[0]~42_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(6),
	datab => \CPU|FNU|Fnc_unit|Mux3~5_combout\,
	datac => \CPU|FNU|Bbus[0]~42_combout\,
	datad => \CPU|FNU|Fnc_unit|Add0~8_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux15~3_combout\);

-- Location: LCCOMB_X41_Y23_N16
\CPU|FNU|Fnc_unit|Mux15~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux15~4_combout\ = (\CPU|CU|ctl_wd\(9) & ((\CPU|FNU|Fnc_unit|Mux15~2_combout\) # ((\CPU|FNU|Fnc_unit|Mux15~3_combout\)))) # (!\CPU|CU|ctl_wd\(9) & (((\CPU|FNU|Fnc_unit|Mux15~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux15~2_combout\,
	datab => \CPU|CU|ctl_wd\(9),
	datac => \CPU|FNU|Fnc_unit|Mux15~1_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux15~3_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux15~4_combout\);

-- Location: LCCOMB_X41_Y23_N28
\CPU|FNU|func_data[0]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[0]~7_combout\ = (\CPU|CU|ctl_wd\(14) & ((\data_bus_temp[0]~16_combout\))) # (!\CPU|CU|ctl_wd\(14) & (\CPU|FNU|Fnc_unit|Mux15~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datac => \CPU|FNU|Fnc_unit|Mux15~4_combout\,
	datad => \data_bus_temp[0]~16_combout\,
	combout => \CPU|FNU|func_data[0]~7_combout\);

-- Location: LCFF_X41_Y23_N29
\CPU|FNU|R3|data_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|func_data[0]~7_combout\,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(0));

-- Location: LCFF_X41_Y24_N21
\CPU|FNU|R7|data_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[0]~7_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(0));

-- Location: LCCOMB_X41_Y24_N12
\CPU|FNU|Bbus[0]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[0]~19_combout\ = (\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|R5|data_out\(0)) # ((\CPU|CU|ctl_wd\(1))))) # (!\CPU|CU|ctl_wd\(0) & (((\CPU|FNU|R4|data_out\(0) & !\CPU|CU|ctl_wd\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(0),
	datab => \CPU|CU|ctl_wd\(0),
	datac => \CPU|FNU|R4|data_out\(0),
	datad => \CPU|CU|ctl_wd\(1),
	combout => \CPU|FNU|Bbus[0]~19_combout\);

-- Location: LCCOMB_X41_Y24_N20
\CPU|FNU|Bbus[0]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[0]~20_combout\ = (\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|Bbus[0]~19_combout\ & ((\CPU|FNU|R7|data_out\(0)))) # (!\CPU|FNU|Bbus[0]~19_combout\ & (\CPU|FNU|R6|data_out\(0))))) # (!\CPU|CU|ctl_wd\(1) & (((\CPU|FNU|Bbus[0]~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R6|data_out\(0),
	datab => \CPU|CU|ctl_wd\(1),
	datac => \CPU|FNU|R7|data_out\(0),
	datad => \CPU|FNU|Bbus[0]~19_combout\,
	combout => \CPU|FNU|Bbus[0]~20_combout\);

-- Location: LCCOMB_X40_Y23_N2
\CPU|FNU|Bbus[0]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[0]~21_combout\ = (\CPU|FNU|Bbus[12]~4_combout\ & (((\CPU|FNU|Bbus[0]~20_combout\)) # (!\CPU|FNU|Bbus[12]~3_combout\))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|Bbus[12]~3_combout\ & (\CPU|FNU|R1|data_out\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~4_combout\,
	datab => \CPU|FNU|Bbus[12]~3_combout\,
	datac => \CPU|FNU|R1|data_out\(0),
	datad => \CPU|FNU|Bbus[0]~20_combout\,
	combout => \CPU|FNU|Bbus[0]~21_combout\);

-- Location: LCCOMB_X40_Y23_N12
\CPU|FNU|Bbus[0]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[0]~22_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[0]~21_combout\ & ((\CPU|FNU|R3|data_out\(0)))) # (!\CPU|FNU|Bbus[0]~21_combout\ & (\CPU|FNU|R2|data_out\(0))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[0]~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(0),
	datab => \CPU|FNU|R3|data_out\(0),
	datac => \CPU|FNU|Bbus[12]~0_combout\,
	datad => \CPU|FNU|Bbus[0]~21_combout\,
	combout => \CPU|FNU|Bbus[0]~22_combout\);

-- Location: LCCOMB_X40_Y23_N14
\CPU|FNU|Fnc_unit|Add0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~5_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(0))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[0]~22_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(9),
	datab => \CPU|CU|const_out\(0),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[0]~22_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~5_combout\);

-- Location: LCCOMB_X40_Y27_N20
\CPU|FNU|Fnc_unit|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~10_combout\ = ((\CPU|FNU|Mux14~combout\ $ (\CPU|FNU|Fnc_unit|Add0~4_combout\ $ (!\CPU|FNU|Fnc_unit|Add0~9\)))) # (GND)
-- \CPU|FNU|Fnc_unit|Add0~11\ = CARRY((\CPU|FNU|Mux14~combout\ & ((\CPU|FNU|Fnc_unit|Add0~4_combout\) # (!\CPU|FNU|Fnc_unit|Add0~9\))) # (!\CPU|FNU|Mux14~combout\ & (\CPU|FNU|Fnc_unit|Add0~4_combout\ & !\CPU|FNU|Fnc_unit|Add0~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux14~combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~4_combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~9\,
	combout => \CPU|FNU|Fnc_unit|Add0~10_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~11\);

-- Location: LCCOMB_X38_Y27_N14
\CPU|FNU|Bbus[1]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[1]~43_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(1))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[1]~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(13),
	datac => \CPU|CU|const_out\(1),
	datad => \CPU|FNU|Bbus[1]~18_combout\,
	combout => \CPU|FNU|Bbus[1]~43_combout\);

-- Location: LCCOMB_X38_Y27_N0
\CPU|FNU|Fnc_unit|Mux14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux14~0_combout\ = (\CPU|FNU|Fnc_unit|Mux3~3_combout\ & (((\CPU|FNU|Fnc_unit|Mux3~2_combout\) # (\CPU|FNU|Mux15~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & (!\CPU|FNU|Mux14~combout\ & (!\CPU|FNU|Fnc_unit|Mux3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datab => \CPU|FNU|Mux14~combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datad => \CPU|FNU|Mux15~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux14~0_combout\);

-- Location: LCCOMB_X38_Y27_N2
\CPU|FNU|Fnc_unit|Mux14~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux14~1_combout\ = (\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (\CPU|FNU|Bbus[1]~43_combout\ & ((\CPU|FNU|Mux14~combout\) # (\CPU|FNU|Fnc_unit|Mux14~0_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~2_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux14~combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datac => \CPU|FNU|Bbus[1]~43_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux14~0_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux14~1_combout\);

-- Location: LCCOMB_X38_Y27_N12
\CPU|FNU|Fnc_unit|Mux14~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux14~2_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~0_combout\) # ((\CPU|FNU|Mux13~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & 
-- ((\CPU|FNU|Fnc_unit|Mux14~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datac => \CPU|FNU|Mux13~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux14~1_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux14~2_combout\);

-- Location: LCCOMB_X38_Y27_N22
\CPU|FNU|Fnc_unit|Mux14~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux14~3_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Mux14~combout\) # ((\CPU|FNU|Bbus[1]~43_combout\ & !\CPU|FNU|Fnc_unit|Mux14~2_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux14~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux14~combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datac => \CPU|FNU|Bbus[1]~43_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux14~2_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux14~3_combout\);

-- Location: LCCOMB_X41_Y23_N10
\CPU|FNU|func_data[1]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[1]~8_combout\ = (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Add0~10_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Mux14~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datab => \CPU|FNU|Fnc_unit|Add0~10_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux14~3_combout\,
	combout => \CPU|FNU|func_data[1]~8_combout\);

-- Location: LCCOMB_X41_Y27_N20
\CPU|FNU|func_data[1]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[1]~9_combout\ = (\CPU|FNU|func_data[1]~8_combout\) # ((\CPU|CU|ctl_wd\(14) & \data_bus_temp[1]~19_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datac => \CPU|FNU|func_data[1]~8_combout\,
	datad => \data_bus_temp[1]~19_combout\,
	combout => \CPU|FNU|func_data[1]~9_combout\);

-- Location: LCFF_X41_Y28_N27
\CPU|FNU|R3|data_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[1]~9_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(1));

-- Location: LCCOMB_X42_Y26_N2
\CPU|FNU|R7|data_out[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R7|data_out[1]~feeder_combout\ = \CPU|FNU|func_data[1]~9_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[1]~9_combout\,
	combout => \CPU|FNU|R7|data_out[1]~feeder_combout\);

-- Location: LCFF_X42_Y26_N3
\CPU|FNU|R7|data_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R7|data_out[1]~feeder_combout\,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(1));

-- Location: LCFF_X41_Y27_N19
\CPU|FNU|R4|data_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[1]~9_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(1));

-- Location: LCCOMB_X42_Y26_N10
\CPU|FNU|Bbus[1]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[1]~15_combout\ = (\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|R6|data_out\(1)) # ((\CPU|CU|ctl_wd\(0))))) # (!\CPU|CU|ctl_wd\(1) & (((\CPU|FNU|R4|data_out\(1) & !\CPU|CU|ctl_wd\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R6|data_out\(1),
	datab => \CPU|CU|ctl_wd\(1),
	datac => \CPU|FNU|R4|data_out\(1),
	datad => \CPU|CU|ctl_wd\(0),
	combout => \CPU|FNU|Bbus[1]~15_combout\);

-- Location: LCCOMB_X42_Y26_N4
\CPU|FNU|Bbus[1]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[1]~16_combout\ = (\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|Bbus[1]~15_combout\ & (\CPU|FNU|R7|data_out\(1))) # (!\CPU|FNU|Bbus[1]~15_combout\ & ((\CPU|FNU|R5|data_out\(1)))))) # (!\CPU|CU|ctl_wd\(0) & (((\CPU|FNU|Bbus[1]~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(0),
	datab => \CPU|FNU|R7|data_out\(1),
	datac => \CPU|FNU|R5|data_out\(1),
	datad => \CPU|FNU|Bbus[1]~15_combout\,
	combout => \CPU|FNU|Bbus[1]~16_combout\);

-- Location: LCCOMB_X42_Y28_N24
\CPU|FNU|Bbus[1]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[1]~17_combout\ = (\CPU|FNU|Bbus[12]~3_combout\ & ((\CPU|FNU|Bbus[12]~4_combout\ & ((\CPU|FNU|Bbus[1]~16_combout\))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(1))))) # (!\CPU|FNU|Bbus[12]~3_combout\ & 
-- (((\CPU|FNU|Bbus[12]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(1),
	datab => \CPU|FNU|Bbus[12]~3_combout\,
	datac => \CPU|FNU|Bbus[12]~4_combout\,
	datad => \CPU|FNU|Bbus[1]~16_combout\,
	combout => \CPU|FNU|Bbus[1]~17_combout\);

-- Location: LCCOMB_X41_Y28_N22
\CPU|FNU|Bbus[1]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[1]~18_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[1]~17_combout\ & ((\CPU|FNU|R3|data_out\(1)))) # (!\CPU|FNU|Bbus[1]~17_combout\ & (\CPU|FNU|R2|data_out\(1))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[1]~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(1),
	datab => \CPU|FNU|R3|data_out\(1),
	datac => \CPU|FNU|Bbus[12]~0_combout\,
	datad => \CPU|FNU|Bbus[1]~17_combout\,
	combout => \CPU|FNU|Bbus[1]~18_combout\);

-- Location: LCCOMB_X38_Y27_N20
\CPU|FNU|Fnc_unit|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~4_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(1))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[1]~18_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(13),
	datab => \CPU|CU|const_out\(1),
	datac => \CPU|CU|ctl_wd\(9),
	datad => \CPU|FNU|Bbus[1]~18_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~4_combout\);

-- Location: LCCOMB_X40_Y27_N22
\CPU|FNU|Fnc_unit|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~12_combout\ = (\CPU|FNU|Fnc_unit|Add0~3_combout\ & ((\CPU|FNU|Mux13~combout\ & (\CPU|FNU|Fnc_unit|Add0~11\ & VCC)) # (!\CPU|FNU|Mux13~combout\ & (!\CPU|FNU|Fnc_unit|Add0~11\)))) # (!\CPU|FNU|Fnc_unit|Add0~3_combout\ & 
-- ((\CPU|FNU|Mux13~combout\ & (!\CPU|FNU|Fnc_unit|Add0~11\)) # (!\CPU|FNU|Mux13~combout\ & ((\CPU|FNU|Fnc_unit|Add0~11\) # (GND)))))
-- \CPU|FNU|Fnc_unit|Add0~13\ = CARRY((\CPU|FNU|Fnc_unit|Add0~3_combout\ & (!\CPU|FNU|Mux13~combout\ & !\CPU|FNU|Fnc_unit|Add0~11\)) # (!\CPU|FNU|Fnc_unit|Add0~3_combout\ & ((!\CPU|FNU|Fnc_unit|Add0~11\) # (!\CPU|FNU|Mux13~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Add0~3_combout\,
	datab => \CPU|FNU|Mux13~combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~11\,
	combout => \CPU|FNU|Fnc_unit|Add0~12_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~13\);

-- Location: LCCOMB_X36_Y27_N8
\CPU|FNU|Fnc_unit|Mux13~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux13~4_combout\ = (\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Add0~12_combout\))) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Mux13~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux13~3_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datad => \CPU|FNU|Fnc_unit|Add0~12_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux13~4_combout\);

-- Location: LCCOMB_X36_Y27_N2
\CPU|FNU|func_data[2]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[2]~10_combout\ = (\CPU|CU|ctl_wd\(14) & ((\data_bus_temp[2]~22_combout\))) # (!\CPU|CU|ctl_wd\(14) & (\CPU|FNU|Fnc_unit|Mux13~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(14),
	datac => \CPU|FNU|Fnc_unit|Mux13~4_combout\,
	datad => \data_bus_temp[2]~22_combout\,
	combout => \CPU|FNU|func_data[2]~10_combout\);

-- Location: LCFF_X40_Y27_N7
\CPU|FNU|R3|data_out[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[2]~10_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(2));

-- Location: LCFF_X40_Y27_N9
\CPU|FNU|R1|data_out[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[2]~10_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(2));

-- Location: LCCOMB_X36_Y27_N10
\CPU|FNU|R6|data_out[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R6|data_out[2]~feeder_combout\ = \CPU|FNU|func_data[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[2]~10_combout\,
	combout => \CPU|FNU|R6|data_out[2]~feeder_combout\);

-- Location: LCFF_X36_Y27_N11
\CPU|FNU|R6|data_out[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R6|data_out[2]~feeder_combout\,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(2));

-- Location: LCCOMB_X35_Y27_N22
\CPU|FNU|R4|data_out[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R4|data_out[2]~feeder_combout\ = \CPU|FNU|func_data[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[2]~10_combout\,
	combout => \CPU|FNU|R4|data_out[2]~feeder_combout\);

-- Location: LCFF_X35_Y27_N23
\CPU|FNU|R4|data_out[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R4|data_out[2]~feeder_combout\,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(2));

-- Location: LCCOMB_X43_Y24_N28
\CPU|FNU|Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux13~0_combout\ = (\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|R5|data_out\(2)) # ((\CPU|CU|ctl_wd\(4))))) # (!\CPU|CU|ctl_wd\(3) & (((!\CPU|CU|ctl_wd\(4) & \CPU|FNU|R4|data_out\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(2),
	datab => \CPU|CU|ctl_wd\(3),
	datac => \CPU|CU|ctl_wd\(4),
	datad => \CPU|FNU|R4|data_out\(2),
	combout => \CPU|FNU|Mux13~0_combout\);

-- Location: LCCOMB_X35_Y27_N6
\CPU|FNU|Mux13~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux13~1_combout\ = (\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|Mux13~0_combout\ & (\CPU|FNU|R7|data_out\(2))) # (!\CPU|FNU|Mux13~0_combout\ & ((\CPU|FNU|R6|data_out\(2)))))) # (!\CPU|CU|ctl_wd\(4) & (((\CPU|FNU|Mux13~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R7|data_out\(2),
	datab => \CPU|CU|ctl_wd\(4),
	datac => \CPU|FNU|R6|data_out\(2),
	datad => \CPU|FNU|Mux13~0_combout\,
	combout => \CPU|FNU|Mux13~1_combout\);

-- Location: LCCOMB_X35_Y27_N0
\CPU|FNU|Mux13~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux13~2_combout\ = (\CPU|FNU|Mux8~2_combout\ & (((\CPU|FNU|Mux13~1_combout\) # (!\CPU|FNU|Mux8~1_combout\)))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(2) & (\CPU|FNU|Mux8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~2_combout\,
	datab => \CPU|FNU|R1|data_out\(2),
	datac => \CPU|FNU|Mux8~1_combout\,
	datad => \CPU|FNU|Mux13~1_combout\,
	combout => \CPU|FNU|Mux13~2_combout\);

-- Location: LCCOMB_X35_Y27_N10
\CPU|FNU|Mux13\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux13~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux13~2_combout\ & ((\CPU|FNU|R3|data_out\(2)))) # (!\CPU|FNU|Mux13~2_combout\ & (\CPU|FNU|R2|data_out\(2))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux13~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(2),
	datab => \CPU|FNU|R3|data_out\(2),
	datac => \CPU|FNU|Mux8~0_combout\,
	datad => \CPU|FNU|Mux13~2_combout\,
	combout => \CPU|FNU|Mux13~combout\);

-- Location: LCCOMB_X40_Y27_N24
\CPU|FNU|Fnc_unit|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~14_combout\ = ((\CPU|FNU|Mux12~combout\ $ (\CPU|FNU|Fnc_unit|Add0~2_combout\ $ (!\CPU|FNU|Fnc_unit|Add0~13\)))) # (GND)
-- \CPU|FNU|Fnc_unit|Add0~15\ = CARRY((\CPU|FNU|Mux12~combout\ & ((\CPU|FNU|Fnc_unit|Add0~2_combout\) # (!\CPU|FNU|Fnc_unit|Add0~13\))) # (!\CPU|FNU|Mux12~combout\ & (\CPU|FNU|Fnc_unit|Add0~2_combout\ & !\CPU|FNU|Fnc_unit|Add0~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux12~combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~2_combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~13\,
	combout => \CPU|FNU|Fnc_unit|Add0~14_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~15\);

-- Location: LCCOMB_X40_Y27_N26
\CPU|FNU|Fnc_unit|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~16_combout\ = (\CPU|FNU|Fnc_unit|Add0~1_combout\ & ((\CPU|FNU|Mux11~combout\ & (\CPU|FNU|Fnc_unit|Add0~15\ & VCC)) # (!\CPU|FNU|Mux11~combout\ & (!\CPU|FNU|Fnc_unit|Add0~15\)))) # (!\CPU|FNU|Fnc_unit|Add0~1_combout\ & 
-- ((\CPU|FNU|Mux11~combout\ & (!\CPU|FNU|Fnc_unit|Add0~15\)) # (!\CPU|FNU|Mux11~combout\ & ((\CPU|FNU|Fnc_unit|Add0~15\) # (GND)))))
-- \CPU|FNU|Fnc_unit|Add0~17\ = CARRY((\CPU|FNU|Fnc_unit|Add0~1_combout\ & (!\CPU|FNU|Mux11~combout\ & !\CPU|FNU|Fnc_unit|Add0~15\)) # (!\CPU|FNU|Fnc_unit|Add0~1_combout\ & ((!\CPU|FNU|Fnc_unit|Add0~15\) # (!\CPU|FNU|Mux11~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Add0~1_combout\,
	datab => \CPU|FNU|Mux11~combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~15\,
	combout => \CPU|FNU|Fnc_unit|Add0~16_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~17\);

-- Location: LCFF_X40_Y27_N1
\CPU|FNU|R3|data_out[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[4]~1_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(4));

-- Location: LCFF_X40_Y27_N3
\CPU|FNU|R1|data_out[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[4]~1_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(4));

-- Location: LCFF_X41_Y24_N9
\CPU|FNU|R5|data_out[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[4]~1_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(4));

-- Location: LCFF_X40_Y24_N25
\CPU|FNU|R6|data_out[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[4]~1_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(4));

-- Location: LCCOMB_X44_Y24_N20
\CPU|FNU|Bbus[4]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[4]~1_combout\ = (\CPU|CU|ctl_wd\(0) & (((\CPU|CU|ctl_wd\(1))))) # (!\CPU|CU|ctl_wd\(0) & ((\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|R6|data_out\(4)))) # (!\CPU|CU|ctl_wd\(1) & (\CPU|FNU|R4|data_out\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R4|data_out\(4),
	datab => \CPU|CU|ctl_wd\(0),
	datac => \CPU|FNU|R6|data_out\(4),
	datad => \CPU|CU|ctl_wd\(1),
	combout => \CPU|FNU|Bbus[4]~1_combout\);

-- Location: LCCOMB_X41_Y24_N8
\CPU|FNU|Bbus[4]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[4]~2_combout\ = (\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|Bbus[4]~1_combout\ & (\CPU|FNU|R7|data_out\(4))) # (!\CPU|FNU|Bbus[4]~1_combout\ & ((\CPU|FNU|R5|data_out\(4)))))) # (!\CPU|CU|ctl_wd\(0) & (((\CPU|FNU|Bbus[4]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R7|data_out\(4),
	datab => \CPU|CU|ctl_wd\(0),
	datac => \CPU|FNU|R5|data_out\(4),
	datad => \CPU|FNU|Bbus[4]~1_combout\,
	combout => \CPU|FNU|Bbus[4]~2_combout\);

-- Location: LCCOMB_X44_Y24_N30
\CPU|FNU|Bbus[4]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[4]~5_combout\ = (\CPU|FNU|Bbus[12]~4_combout\ & (((\CPU|FNU|Bbus[4]~2_combout\) # (!\CPU|FNU|Bbus[12]~3_combout\)))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(4) & (\CPU|FNU|Bbus[12]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~4_combout\,
	datab => \CPU|FNU|R1|data_out\(4),
	datac => \CPU|FNU|Bbus[12]~3_combout\,
	datad => \CPU|FNU|Bbus[4]~2_combout\,
	combout => \CPU|FNU|Bbus[4]~5_combout\);

-- Location: LCCOMB_X40_Y27_N10
\CPU|FNU|Bbus[4]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[4]~6_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[4]~5_combout\ & (\CPU|FNU|R3|data_out\(4))) # (!\CPU|FNU|Bbus[4]~5_combout\ & ((\CPU|FNU|R2|data_out\(4)))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[4]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~0_combout\,
	datab => \CPU|FNU|R3|data_out\(4),
	datac => \CPU|FNU|R2|data_out\(4),
	datad => \CPU|FNU|Bbus[4]~5_combout\,
	combout => \CPU|FNU|Bbus[4]~6_combout\);

-- Location: LCCOMB_X40_Y27_N0
\CPU|FNU|Bbus[4]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[4]~23_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(4))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[4]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(4),
	datab => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[4]~6_combout\,
	combout => \CPU|FNU|Bbus[4]~23_combout\);

-- Location: LCCOMB_X36_Y27_N26
\CPU|FNU|Fnc_unit|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux11~0_combout\ = (\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (\CPU|FNU|Fnc_unit|Mux3~3_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~2_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~3_combout\ & (\CPU|FNU|Mux12~combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & 
-- ((!\CPU|FNU|Mux11~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datac => \CPU|FNU|Mux12~combout\,
	datad => \CPU|FNU|Mux11~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux11~0_combout\);

-- Location: LCCOMB_X41_Y26_N22
\CPU|FNU|Fnc_unit|Mux11~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux11~1_combout\ = (\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (\CPU|FNU|Bbus[4]~23_combout\ & ((\CPU|FNU|Mux11~combout\) # (\CPU|FNU|Fnc_unit|Mux11~0_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~2_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux11~combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux11~0_combout\,
	datad => \CPU|FNU|Bbus[4]~23_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux11~1_combout\);

-- Location: LCCOMB_X41_Y26_N0
\CPU|FNU|Fnc_unit|Mux11~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux11~2_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Mux10~combout\) # ((\CPU|FNU|Fnc_unit|Mux3~0_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (((!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & 
-- \CPU|FNU|Fnc_unit|Mux11~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux10~combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux11~1_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux11~2_combout\);

-- Location: LCCOMB_X41_Y26_N26
\CPU|FNU|Fnc_unit|Mux11~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux11~3_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Mux11~combout\) # ((\CPU|FNU|Bbus[4]~23_combout\ & !\CPU|FNU|Fnc_unit|Mux11~2_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux11~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux11~combout\,
	datab => \CPU|FNU|Bbus[4]~23_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux11~2_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux11~3_combout\);

-- Location: LCCOMB_X41_Y26_N20
\CPU|FNU|func_data[4]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[4]~0_combout\ = (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Add0~16_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Mux11~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datab => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datac => \CPU|FNU|Fnc_unit|Add0~16_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux11~3_combout\,
	combout => \CPU|FNU|func_data[4]~0_combout\);

-- Location: LCCOMB_X40_Y24_N16
\CPU|FNU|func_data[4]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[4]~1_combout\ = (\CPU|FNU|func_data[4]~0_combout\) # ((\data_bus_temp[4]~4_combout\ & \CPU|CU|ctl_wd\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[4]~4_combout\,
	datac => \CPU|CU|ctl_wd\(14),
	datad => \CPU|FNU|func_data[4]~0_combout\,
	combout => \CPU|FNU|func_data[4]~1_combout\);

-- Location: LCCOMB_X44_Y24_N16
\CPU|FNU|R2|data_out[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R2|data_out[4]~feeder_combout\ = \CPU|FNU|func_data[4]~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[4]~1_combout\,
	combout => \CPU|FNU|R2|data_out[4]~feeder_combout\);

-- Location: LCFF_X44_Y24_N17
\CPU|FNU|R2|data_out[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R2|data_out[4]~feeder_combout\,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(4));

-- Location: LCCOMB_X44_Y24_N18
\CPU|FNU|R4|data_out[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R4|data_out[4]~feeder_combout\ = \CPU|FNU|func_data[4]~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[4]~1_combout\,
	combout => \CPU|FNU|R4|data_out[4]~feeder_combout\);

-- Location: LCFF_X44_Y24_N19
\CPU|FNU|R4|data_out[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R4|data_out[4]~feeder_combout\,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(4));

-- Location: LCCOMB_X44_Y24_N0
\CPU|FNU|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux11~0_combout\ = (\CPU|CU|ctl_wd\(3) & (((\CPU|CU|ctl_wd\(4))))) # (!\CPU|CU|ctl_wd\(3) & ((\CPU|CU|ctl_wd\(4) & (\CPU|FNU|R6|data_out\(4))) # (!\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|R4|data_out\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R6|data_out\(4),
	datab => \CPU|FNU|R4|data_out\(4),
	datac => \CPU|CU|ctl_wd\(3),
	datad => \CPU|CU|ctl_wd\(4),
	combout => \CPU|FNU|Mux11~0_combout\);

-- Location: LCCOMB_X44_Y24_N2
\CPU|FNU|Mux11~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux11~1_combout\ = (\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|Mux11~0_combout\ & (\CPU|FNU|R7|data_out\(4))) # (!\CPU|FNU|Mux11~0_combout\ & ((\CPU|FNU|R5|data_out\(4)))))) # (!\CPU|CU|ctl_wd\(3) & (((\CPU|FNU|Mux11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R7|data_out\(4),
	datab => \CPU|FNU|R5|data_out\(4),
	datac => \CPU|CU|ctl_wd\(3),
	datad => \CPU|FNU|Mux11~0_combout\,
	combout => \CPU|FNU|Mux11~1_combout\);

-- Location: LCCOMB_X44_Y24_N12
\CPU|FNU|Mux11~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux11~2_combout\ = (\CPU|FNU|Mux8~1_combout\ & ((\CPU|FNU|Mux8~2_combout\ & ((\CPU|FNU|Mux11~1_combout\))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(4))))) # (!\CPU|FNU|Mux8~1_combout\ & (((\CPU|FNU|Mux8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(4),
	datab => \CPU|FNU|Mux11~1_combout\,
	datac => \CPU|FNU|Mux8~1_combout\,
	datad => \CPU|FNU|Mux8~2_combout\,
	combout => \CPU|FNU|Mux11~2_combout\);

-- Location: LCCOMB_X44_Y24_N22
\CPU|FNU|Mux11\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux11~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux11~2_combout\ & (\CPU|FNU|R3|data_out\(4))) # (!\CPU|FNU|Mux11~2_combout\ & ((\CPU|FNU|R2|data_out\(4)))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux11~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(4),
	datab => \CPU|FNU|Mux8~0_combout\,
	datac => \CPU|FNU|R2|data_out\(4),
	datad => \CPU|FNU|Mux11~2_combout\,
	combout => \CPU|FNU|Mux11~combout\);

-- Location: LCCOMB_X40_Y27_N28
\CPU|FNU|Fnc_unit|Add0~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~19_combout\ = ((\CPU|FNU|Mux10~combout\ $ (\CPU|FNU|Fnc_unit|Add0~18_combout\ $ (!\CPU|FNU|Fnc_unit|Add0~17\)))) # (GND)
-- \CPU|FNU|Fnc_unit|Add0~20\ = CARRY((\CPU|FNU|Mux10~combout\ & ((\CPU|FNU|Fnc_unit|Add0~18_combout\) # (!\CPU|FNU|Fnc_unit|Add0~17\))) # (!\CPU|FNU|Mux10~combout\ & (\CPU|FNU|Fnc_unit|Add0~18_combout\ & !\CPU|FNU|Fnc_unit|Add0~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux10~combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~18_combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~17\,
	combout => \CPU|FNU|Fnc_unit|Add0~19_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~20\);

-- Location: LCCOMB_X40_Y27_N30
\CPU|FNU|Fnc_unit|Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~22_combout\ = (\CPU|FNU|Mux9~combout\ & ((\CPU|FNU|Fnc_unit|Add0~21_combout\ & (\CPU|FNU|Fnc_unit|Add0~20\ & VCC)) # (!\CPU|FNU|Fnc_unit|Add0~21_combout\ & (!\CPU|FNU|Fnc_unit|Add0~20\)))) # (!\CPU|FNU|Mux9~combout\ & 
-- ((\CPU|FNU|Fnc_unit|Add0~21_combout\ & (!\CPU|FNU|Fnc_unit|Add0~20\)) # (!\CPU|FNU|Fnc_unit|Add0~21_combout\ & ((\CPU|FNU|Fnc_unit|Add0~20\) # (GND)))))
-- \CPU|FNU|Fnc_unit|Add0~23\ = CARRY((\CPU|FNU|Mux9~combout\ & (!\CPU|FNU|Fnc_unit|Add0~21_combout\ & !\CPU|FNU|Fnc_unit|Add0~20\)) # (!\CPU|FNU|Mux9~combout\ & ((!\CPU|FNU|Fnc_unit|Add0~20\) # (!\CPU|FNU|Fnc_unit|Add0~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux9~combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~21_combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~20\,
	combout => \CPU|FNU|Fnc_unit|Add0~22_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~23\);

-- Location: LCCOMB_X40_Y26_N2
\CPU|FNU|Fnc_unit|Add0~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~31_combout\ = (\CPU|FNU|Mux7~combout\ & ((\CPU|FNU|Fnc_unit|Add0~30_combout\ & (\CPU|FNU|Fnc_unit|Add0~26\ & VCC)) # (!\CPU|FNU|Fnc_unit|Add0~30_combout\ & (!\CPU|FNU|Fnc_unit|Add0~26\)))) # (!\CPU|FNU|Mux7~combout\ & 
-- ((\CPU|FNU|Fnc_unit|Add0~30_combout\ & (!\CPU|FNU|Fnc_unit|Add0~26\)) # (!\CPU|FNU|Fnc_unit|Add0~30_combout\ & ((\CPU|FNU|Fnc_unit|Add0~26\) # (GND)))))
-- \CPU|FNU|Fnc_unit|Add0~32\ = CARRY((\CPU|FNU|Mux7~combout\ & (!\CPU|FNU|Fnc_unit|Add0~30_combout\ & !\CPU|FNU|Fnc_unit|Add0~26\)) # (!\CPU|FNU|Mux7~combout\ & ((!\CPU|FNU|Fnc_unit|Add0~26\) # (!\CPU|FNU|Fnc_unit|Add0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux7~combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~30_combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~26\,
	combout => \CPU|FNU|Fnc_unit|Add0~31_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~32\);

-- Location: LCCOMB_X36_Y26_N14
\CPU|FNU|Fnc_unit|Mux7~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux7~9_combout\ = (\CPU|CU|ctl_wd\(8)) # (\CPU|FNU|Mux8~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(8),
	datac => \CPU|FNU|Mux8~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux7~9_combout\);

-- Location: LCCOMB_X42_Y23_N22
\CPU|FNU|Fnc_unit|Mux7~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux7~4_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (((\CPU|FNU|Mux7~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~3_combout\) # (\CPU|FNU|Fnc_unit|Mux3~2_combout\ $ (!\CPU|FNU|Mux7~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datad => \CPU|FNU|Mux7~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux7~4_combout\);

-- Location: LCCOMB_X36_Y26_N20
\CPU|FNU|Fnc_unit|Mux7~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux7~5_combout\ = (\CPU|FNU|Bbus[8]~52_combout\ & (((\CPU|FNU|Fnc_unit|Mux3~0_combout\) # (\CPU|FNU|Fnc_unit|Mux7~4_combout\)))) # (!\CPU|FNU|Bbus[8]~52_combout\ & (\CPU|FNU|Fnc_unit|Mux7~4_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~0_combout\) 
-- # (!\CPU|FNU|Fnc_unit|Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[8]~52_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux7~4_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux7~5_combout\);

-- Location: LCCOMB_X38_Y24_N30
\CPU|FNU|Fnc_unit|Mux5~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux5~9_combout\ = (\CPU|CU|ctl_wd\(8)) # (\CPU|FNU|Mux6~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|ctl_wd\(8),
	datad => \CPU|FNU|Mux6~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux5~9_combout\);

-- Location: LCCOMB_X33_Y24_N28
\CPU|CU|offset~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~46_combout\ = (\CPU|CU|IR\(15)) # ((\CPU|CU|IR\(14) & (\CPU|CU|IR\(10) $ (\CPU|CU|ctl_wd~33_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(15),
	datab => \CPU|CU|IR\(14),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|ctl_wd~33_combout\,
	combout => \CPU|CU|offset~46_combout\);

-- Location: LCCOMB_X33_Y24_N4
\CPU|CU|offset~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~29_combout\ = (\CPU|CU|offset~47_combout\ & ((\CPU|CU|offset~46_combout\) # ((\CPU|CU|IR\(2))))) # (!\CPU|CU|offset~47_combout\ & (!\CPU|CU|offset~46_combout\ & ((\CPU|CU|offset\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~47_combout\,
	datab => \CPU|CU|offset~46_combout\,
	datac => \CPU|CU|IR\(2),
	datad => \CPU|CU|offset\(10),
	combout => \CPU|CU|offset~29_combout\);

-- Location: LCCOMB_X33_Y24_N22
\CPU|CU|offset~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~30_combout\ = (\CPU|CU|offset~29_combout\ & ((\CPU|CU|IR\(7)) # ((!\CPU|CU|offset~46_combout\)))) # (!\CPU|CU|offset~29_combout\ & (((\CPU|CU|IR\(10) & \CPU|CU|offset~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(7),
	datab => \CPU|CU|offset~29_combout\,
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|offset~46_combout\,
	combout => \CPU|CU|offset~30_combout\);

-- Location: LCCOMB_X33_Y24_N30
\CPU|CU|Selector128~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector128~0_combout\ = (\CPU|CU|current_state.Decode~regout\ & (((\CPU|CU|offset~30_combout\)))) # (!\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|current_state.Reset~regout\ & (\CPU|CU|offset\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|current_state.Reset~regout\,
	datac => \CPU|CU|offset\(10),
	datad => \CPU|CU|offset~30_combout\,
	combout => \CPU|CU|Selector128~0_combout\);

-- Location: LCFF_X33_Y24_N31
\CPU|CU|offset[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector128~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(10));

-- Location: LCCOMB_X32_Y28_N16
\CPU|CU|const_out[10]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[10]~10_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(10)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(10),
	datac => \CPU|CU|const_out\(10),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[10]~10_combout\);

-- Location: LCCOMB_X32_Y28_N14
\CPU|CU|Selector94~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector94~0_combout\ = (\CPU|CU|const_out\(10) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|const_out\(10),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector94~0_combout\);

-- Location: LCFF_X32_Y28_N17
\CPU|CU|const_out[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[10]~10_combout\,
	sdata => \CPU|CU|Selector94~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(10));

-- Location: LCFF_X38_Y26_N23
\CPU|FNU|R3|data_out[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[10]~15_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(10));

-- Location: LCFF_X40_Y24_N1
\CPU|FNU|R7|data_out[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[10]~15_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(10));

-- Location: LCFF_X43_Y26_N23
\CPU|FNU|R4|data_out[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[10]~15_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(10));

-- Location: LCCOMB_X40_Y24_N26
\CPU|FNU|R6|data_out[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R6|data_out[10]~feeder_combout\ = \CPU|FNU|func_data[10]~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[10]~15_combout\,
	combout => \CPU|FNU|R6|data_out[10]~feeder_combout\);

-- Location: LCFF_X40_Y24_N27
\CPU|FNU|R6|data_out[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R6|data_out[10]~feeder_combout\,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(10));

-- Location: LCCOMB_X43_Y26_N14
\CPU|FNU|Bbus[10]~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[10]~60_combout\ = (\CPU|CU|ctl_wd\(1) & (((\CPU|CU|ctl_wd\(0)) # (\CPU|FNU|R6|data_out\(10))))) # (!\CPU|CU|ctl_wd\(1) & (\CPU|FNU|R4|data_out\(10) & (!\CPU|CU|ctl_wd\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(1),
	datab => \CPU|FNU|R4|data_out\(10),
	datac => \CPU|CU|ctl_wd\(0),
	datad => \CPU|FNU|R6|data_out\(10),
	combout => \CPU|FNU|Bbus[10]~60_combout\);

-- Location: LCCOMB_X41_Y27_N16
\CPU|FNU|Bbus[10]~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[10]~61_combout\ = (\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|Bbus[10]~60_combout\ & ((\CPU|FNU|R7|data_out\(10)))) # (!\CPU|FNU|Bbus[10]~60_combout\ & (\CPU|FNU|R5|data_out\(10))))) # (!\CPU|CU|ctl_wd\(0) & (((\CPU|FNU|Bbus[10]~60_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(10),
	datab => \CPU|CU|ctl_wd\(0),
	datac => \CPU|FNU|R7|data_out\(10),
	datad => \CPU|FNU|Bbus[10]~60_combout\,
	combout => \CPU|FNU|Bbus[10]~61_combout\);

-- Location: LCCOMB_X38_Y26_N0
\CPU|FNU|Bbus[10]~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[10]~62_combout\ = (\CPU|FNU|Bbus[12]~4_combout\ & (((\CPU|FNU|Bbus[10]~61_combout\) # (!\CPU|FNU|Bbus[12]~3_combout\)))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(10) & ((\CPU|FNU|Bbus[12]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(10),
	datab => \CPU|FNU|Bbus[12]~4_combout\,
	datac => \CPU|FNU|Bbus[10]~61_combout\,
	datad => \CPU|FNU|Bbus[12]~3_combout\,
	combout => \CPU|FNU|Bbus[10]~62_combout\);

-- Location: LCCOMB_X38_Y26_N2
\CPU|FNU|Bbus[10]~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[10]~63_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[10]~62_combout\ & ((\CPU|FNU|R3|data_out\(10)))) # (!\CPU|FNU|Bbus[10]~62_combout\ & (\CPU|FNU|R2|data_out\(10))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[10]~62_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(10),
	datab => \CPU|FNU|R3|data_out\(10),
	datac => \CPU|FNU|Bbus[12]~0_combout\,
	datad => \CPU|FNU|Bbus[10]~62_combout\,
	combout => \CPU|FNU|Bbus[10]~63_combout\);

-- Location: LCCOMB_X38_Y26_N12
\CPU|FNU|Bbus[10]~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[10]~64_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(10))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[10]~63_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(13),
	datac => \CPU|CU|const_out\(10),
	datad => \CPU|FNU|Bbus[10]~63_combout\,
	combout => \CPU|FNU|Bbus[10]~64_combout\);

-- Location: LCCOMB_X37_Y24_N30
\CPU|FNU|Fnc_unit|Mux5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux5~4_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (((\CPU|FNU|Mux5~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~3_combout\) # (\CPU|FNU|Mux5~combout\ $ (!\CPU|FNU|Fnc_unit|Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datac => \CPU|FNU|Mux5~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux5~4_combout\);

-- Location: LCCOMB_X37_Y24_N8
\CPU|FNU|Fnc_unit|Mux5~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux5~5_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (((\CPU|FNU|Bbus[10]~64_combout\) # (\CPU|FNU|Fnc_unit|Mux5~4_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (\CPU|FNU|Fnc_unit|Mux5~4_combout\ & 
-- ((\CPU|FNU|Bbus[10]~64_combout\) # (!\CPU|FNU|Fnc_unit|Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datac => \CPU|FNU|Bbus[10]~64_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux5~4_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux5~5_combout\);

-- Location: LCFF_X42_Y26_N27
\CPU|FNU|R7|data_out[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[11]~16_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(11));

-- Location: LCFF_X43_Y26_N31
\CPU|FNU|R4|data_out[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[11]~16_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(11));

-- Location: LCCOMB_X42_Y26_N6
\CPU|FNU|Bbus[11]~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[11]~66_combout\ = (\CPU|CU|ctl_wd\(1) & (((\CPU|CU|ctl_wd\(0))))) # (!\CPU|CU|ctl_wd\(1) & ((\CPU|CU|ctl_wd\(0) & (\CPU|FNU|R5|data_out\(11))) # (!\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|R4|data_out\(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(11),
	datab => \CPU|FNU|R4|data_out\(11),
	datac => \CPU|CU|ctl_wd\(1),
	datad => \CPU|CU|ctl_wd\(0),
	combout => \CPU|FNU|Bbus[11]~66_combout\);

-- Location: LCCOMB_X42_Y26_N26
\CPU|FNU|Bbus[11]~67\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[11]~67_combout\ = (\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|Bbus[11]~66_combout\ & ((\CPU|FNU|R7|data_out\(11)))) # (!\CPU|FNU|Bbus[11]~66_combout\ & (\CPU|FNU|R6|data_out\(11))))) # (!\CPU|CU|ctl_wd\(1) & (((\CPU|FNU|Bbus[11]~66_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R6|data_out\(11),
	datab => \CPU|CU|ctl_wd\(1),
	datac => \CPU|FNU|R7|data_out\(11),
	datad => \CPU|FNU|Bbus[11]~66_combout\,
	combout => \CPU|FNU|Bbus[11]~67_combout\);

-- Location: LCCOMB_X38_Y26_N8
\CPU|FNU|Bbus[11]~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[11]~68_combout\ = (\CPU|FNU|Bbus[12]~4_combout\ & (((\CPU|FNU|Bbus[11]~67_combout\) # (!\CPU|FNU|Bbus[12]~3_combout\)))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(11) & (\CPU|FNU|Bbus[12]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(11),
	datab => \CPU|FNU|Bbus[12]~4_combout\,
	datac => \CPU|FNU|Bbus[12]~3_combout\,
	datad => \CPU|FNU|Bbus[11]~67_combout\,
	combout => \CPU|FNU|Bbus[11]~68_combout\);

-- Location: LCFF_X43_Y26_N5
\CPU|FNU|R2|data_out[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[11]~16_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(11));

-- Location: LCCOMB_X38_Y26_N28
\CPU|FNU|Bbus[11]~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[11]~71_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[11]~68_combout\ & (\CPU|FNU|R3|data_out\(11))) # (!\CPU|FNU|Bbus[11]~68_combout\ & ((\CPU|FNU|R2|data_out\(11)))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[11]~68_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~0_combout\,
	datab => \CPU|FNU|R3|data_out\(11),
	datac => \CPU|FNU|Bbus[11]~68_combout\,
	datad => \CPU|FNU|R2|data_out\(11),
	combout => \CPU|FNU|Bbus[11]~71_combout\);

-- Location: LCCOMB_X38_Y26_N30
\CPU|FNU|Fnc_unit|Add0~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~39_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(11))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[11]~71_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001101101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(11),
	datab => \CPU|CU|ctl_wd\(9),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[11]~71_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~39_combout\);

-- Location: LCCOMB_X38_Y26_N22
\CPU|FNU|Bbus[10]~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[10]~65_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[10]~62_combout\ & ((\CPU|FNU|R3|data_out\(10)))) # (!\CPU|FNU|Bbus[10]~62_combout\ & (\CPU|FNU|R2|data_out\(10))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[10]~62_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(10),
	datab => \CPU|FNU|Bbus[12]~0_combout\,
	datac => \CPU|FNU|R3|data_out\(10),
	datad => \CPU|FNU|Bbus[10]~62_combout\,
	combout => \CPU|FNU|Bbus[10]~65_combout\);

-- Location: LCCOMB_X38_Y26_N14
\CPU|FNU|Fnc_unit|Add0~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~36_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(10))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[10]~65_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100101101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(13),
	datab => \CPU|CU|ctl_wd\(9),
	datac => \CPU|CU|const_out\(10),
	datad => \CPU|FNU|Bbus[10]~65_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~36_combout\);

-- Location: LCCOMB_X33_Y27_N26
\CPU|CU|const_out[9]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[9]~9_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(9)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(9),
	datac => \CPU|CU|const_out\(9),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[9]~9_combout\);

-- Location: LCCOMB_X32_Y27_N20
\CPU|CU|Selector95~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector95~0_combout\ = (\CPU|CU|const_out\(9) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|const_out\(9),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector95~0_combout\);

-- Location: LCFF_X33_Y27_N27
\CPU|CU|const_out[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[9]~9_combout\,
	sdata => \CPU|CU|Selector95~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(9));

-- Location: LCFF_X37_Y24_N25
\CPU|FNU|R3|data_out[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[9]~14_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(9));

-- Location: LCFF_X38_Y26_N5
\CPU|FNU|R1|data_out[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[9]~14_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(9));

-- Location: LCCOMB_X38_Y24_N28
\CPU|FNU|R7|data_out[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R7|data_out[9]~feeder_combout\ = \CPU|FNU|func_data[9]~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[9]~14_combout\,
	combout => \CPU|FNU|R7|data_out[9]~feeder_combout\);

-- Location: LCFF_X38_Y24_N29
\CPU|FNU|R7|data_out[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R7|data_out[9]~feeder_combout\,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(9));

-- Location: LCFF_X37_Y24_N11
\CPU|FNU|R6|data_out[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[9]~14_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(9));

-- Location: LCCOMB_X38_Y24_N8
\CPU|FNU|R4|data_out[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R4|data_out[9]~feeder_combout\ = \CPU|FNU|func_data[9]~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[9]~14_combout\,
	combout => \CPU|FNU|R4|data_out[9]~feeder_combout\);

-- Location: LCFF_X38_Y24_N9
\CPU|FNU|R4|data_out[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R4|data_out[9]~feeder_combout\,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(9));

-- Location: LCCOMB_X43_Y24_N30
\CPU|FNU|R5|data_out[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R5|data_out[9]~feeder_combout\ = \CPU|FNU|func_data[9]~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[9]~14_combout\,
	combout => \CPU|FNU|R5|data_out[9]~feeder_combout\);

-- Location: LCFF_X43_Y24_N31
\CPU|FNU|R5|data_out[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R5|data_out[9]~feeder_combout\,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(9));

-- Location: LCCOMB_X38_Y24_N24
\CPU|FNU|Bbus[9]~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[9]~54_combout\ = (\CPU|CU|ctl_wd\(1) & (((\CPU|CU|ctl_wd\(0))))) # (!\CPU|CU|ctl_wd\(1) & ((\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|R5|data_out\(9)))) # (!\CPU|CU|ctl_wd\(0) & (\CPU|FNU|R4|data_out\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(1),
	datab => \CPU|FNU|R4|data_out\(9),
	datac => \CPU|CU|ctl_wd\(0),
	datad => \CPU|FNU|R5|data_out\(9),
	combout => \CPU|FNU|Bbus[9]~54_combout\);

-- Location: LCCOMB_X37_Y24_N10
\CPU|FNU|Bbus[9]~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[9]~55_combout\ = (\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|Bbus[9]~54_combout\ & (\CPU|FNU|R7|data_out\(9))) # (!\CPU|FNU|Bbus[9]~54_combout\ & ((\CPU|FNU|R6|data_out\(9)))))) # (!\CPU|CU|ctl_wd\(1) & (((\CPU|FNU|Bbus[9]~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(1),
	datab => \CPU|FNU|R7|data_out\(9),
	datac => \CPU|FNU|R6|data_out\(9),
	datad => \CPU|FNU|Bbus[9]~54_combout\,
	combout => \CPU|FNU|Bbus[9]~55_combout\);

-- Location: LCCOMB_X37_Y24_N12
\CPU|FNU|Bbus[9]~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[9]~56_combout\ = (\CPU|FNU|Bbus[12]~4_combout\ & (((\CPU|FNU|Bbus[9]~55_combout\) # (!\CPU|FNU|Bbus[12]~3_combout\)))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(9) & (\CPU|FNU|Bbus[12]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~4_combout\,
	datab => \CPU|FNU|R1|data_out\(9),
	datac => \CPU|FNU|Bbus[12]~3_combout\,
	datad => \CPU|FNU|Bbus[9]~55_combout\,
	combout => \CPU|FNU|Bbus[9]~56_combout\);

-- Location: LCCOMB_X38_Y24_N18
\CPU|FNU|Bbus[9]~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[9]~57_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[9]~56_combout\ & ((\CPU|FNU|R3|data_out\(9)))) # (!\CPU|FNU|Bbus[9]~56_combout\ & (\CPU|FNU|R2|data_out\(9))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[9]~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(9),
	datab => \CPU|FNU|R3|data_out\(9),
	datac => \CPU|FNU|Bbus[12]~0_combout\,
	datad => \CPU|FNU|Bbus[9]~56_combout\,
	combout => \CPU|FNU|Bbus[9]~57_combout\);

-- Location: LCCOMB_X37_Y24_N14
\CPU|FNU|Fnc_unit|Add0~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~33_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(9))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[9]~57_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(9),
	datab => \CPU|CU|ctl_wd\(13),
	datac => \CPU|CU|const_out\(9),
	datad => \CPU|FNU|Bbus[9]~57_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~33_combout\);

-- Location: LCCOMB_X40_Y26_N4
\CPU|FNU|Fnc_unit|Add0~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~34_combout\ = ((\CPU|FNU|Mux6~combout\ $ (\CPU|FNU|Fnc_unit|Add0~33_combout\ $ (!\CPU|FNU|Fnc_unit|Add0~32\)))) # (GND)
-- \CPU|FNU|Fnc_unit|Add0~35\ = CARRY((\CPU|FNU|Mux6~combout\ & ((\CPU|FNU|Fnc_unit|Add0~33_combout\) # (!\CPU|FNU|Fnc_unit|Add0~32\))) # (!\CPU|FNU|Mux6~combout\ & (\CPU|FNU|Fnc_unit|Add0~33_combout\ & !\CPU|FNU|Fnc_unit|Add0~32\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux6~combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~33_combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~32\,
	combout => \CPU|FNU|Fnc_unit|Add0~34_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~35\);

-- Location: LCCOMB_X40_Y26_N6
\CPU|FNU|Fnc_unit|Add0~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~37_combout\ = (\CPU|FNU|Mux5~combout\ & ((\CPU|FNU|Fnc_unit|Add0~36_combout\ & (\CPU|FNU|Fnc_unit|Add0~35\ & VCC)) # (!\CPU|FNU|Fnc_unit|Add0~36_combout\ & (!\CPU|FNU|Fnc_unit|Add0~35\)))) # (!\CPU|FNU|Mux5~combout\ & 
-- ((\CPU|FNU|Fnc_unit|Add0~36_combout\ & (!\CPU|FNU|Fnc_unit|Add0~35\)) # (!\CPU|FNU|Fnc_unit|Add0~36_combout\ & ((\CPU|FNU|Fnc_unit|Add0~35\) # (GND)))))
-- \CPU|FNU|Fnc_unit|Add0~38\ = CARRY((\CPU|FNU|Mux5~combout\ & (!\CPU|FNU|Fnc_unit|Add0~36_combout\ & !\CPU|FNU|Fnc_unit|Add0~35\)) # (!\CPU|FNU|Mux5~combout\ & ((!\CPU|FNU|Fnc_unit|Add0~35\) # (!\CPU|FNU|Fnc_unit|Add0~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux5~combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~36_combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~35\,
	combout => \CPU|FNU|Fnc_unit|Add0~37_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~38\);

-- Location: LCCOMB_X40_Y26_N8
\CPU|FNU|Fnc_unit|Add0~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~40_combout\ = ((\CPU|FNU|Mux4~combout\ $ (\CPU|FNU|Fnc_unit|Add0~39_combout\ $ (!\CPU|FNU|Fnc_unit|Add0~38\)))) # (GND)
-- \CPU|FNU|Fnc_unit|Add0~41\ = CARRY((\CPU|FNU|Mux4~combout\ & ((\CPU|FNU|Fnc_unit|Add0~39_combout\) # (!\CPU|FNU|Fnc_unit|Add0~38\))) # (!\CPU|FNU|Mux4~combout\ & (\CPU|FNU|Fnc_unit|Add0~39_combout\ & !\CPU|FNU|Fnc_unit|Add0~38\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux4~combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~39_combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~38\,
	combout => \CPU|FNU|Fnc_unit|Add0~40_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~41\);

-- Location: LCCOMB_X42_Y25_N24
\CPU|FNU|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux3~0_combout\ = (\CPU|CU|ctl_wd\(3) & (((\CPU|CU|ctl_wd\(4))))) # (!\CPU|CU|ctl_wd\(3) & ((\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|R6|data_out\(12)))) # (!\CPU|CU|ctl_wd\(4) & (\CPU|FNU|R4|data_out\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R4|data_out\(12),
	datab => \CPU|FNU|R6|data_out\(12),
	datac => \CPU|CU|ctl_wd\(3),
	datad => \CPU|CU|ctl_wd\(4),
	combout => \CPU|FNU|Mux3~0_combout\);

-- Location: LCCOMB_X38_Y25_N0
\CPU|FNU|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux3~1_combout\ = (\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|Mux3~0_combout\ & (\CPU|FNU|R7|data_out\(12))) # (!\CPU|FNU|Mux3~0_combout\ & ((\CPU|FNU|R5|data_out\(12)))))) # (!\CPU|CU|ctl_wd\(3) & (((\CPU|FNU|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R7|data_out\(12),
	datab => \CPU|CU|ctl_wd\(3),
	datac => \CPU|FNU|R5|data_out\(12),
	datad => \CPU|FNU|Mux3~0_combout\,
	combout => \CPU|FNU|Mux3~1_combout\);

-- Location: LCCOMB_X38_Y25_N2
\CPU|FNU|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux3~2_combout\ = (\CPU|FNU|Mux8~2_combout\ & (((\CPU|FNU|Mux3~1_combout\) # (!\CPU|FNU|Mux8~1_combout\)))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(12) & (\CPU|FNU|Mux8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~2_combout\,
	datab => \CPU|FNU|R1|data_out\(12),
	datac => \CPU|FNU|Mux8~1_combout\,
	datad => \CPU|FNU|Mux3~1_combout\,
	combout => \CPU|FNU|Mux3~2_combout\);

-- Location: LCCOMB_X38_Y25_N12
\CPU|FNU|Mux3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux3~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux3~2_combout\ & ((\CPU|FNU|R3|data_out\(12)))) # (!\CPU|FNU|Mux3~2_combout\ & (\CPU|FNU|R2|data_out\(12))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(12),
	datab => \CPU|FNU|Mux8~0_combout\,
	datac => \CPU|FNU|R3|data_out\(12),
	datad => \CPU|FNU|Mux3~2_combout\,
	combout => \CPU|FNU|Mux3~combout\);

-- Location: LCCOMB_X33_Y24_N16
\CPU|CU|offset~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~31_combout\ = (\CPU|CU|offset~47_combout\ & (\CPU|CU|offset~46_combout\)) # (!\CPU|CU|offset~47_combout\ & ((\CPU|CU|offset~46_combout\ & (\CPU|CU|IR\(11))) # (!\CPU|CU|offset~46_combout\ & ((\CPU|CU|offset\(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~47_combout\,
	datab => \CPU|CU|offset~46_combout\,
	datac => \CPU|CU|IR\(11),
	datad => \CPU|CU|offset\(11),
	combout => \CPU|CU|offset~31_combout\);

-- Location: LCCOMB_X33_Y24_N18
\CPU|CU|offset~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~32_combout\ = (\CPU|CU|offset~47_combout\ & ((\CPU|CU|offset~31_combout\ & ((\CPU|CU|IR\(7)))) # (!\CPU|CU|offset~31_combout\ & (\CPU|CU|IR\(3))))) # (!\CPU|CU|offset~47_combout\ & (\CPU|CU|offset~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~47_combout\,
	datab => \CPU|CU|offset~31_combout\,
	datac => \CPU|CU|IR\(3),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|offset~32_combout\);

-- Location: LCCOMB_X33_Y24_N0
\CPU|CU|Selector127~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector127~0_combout\ = (\CPU|CU|current_state.Decode~regout\ & (((\CPU|CU|offset~32_combout\)))) # (!\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|current_state.Reset~regout\ & (\CPU|CU|offset\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|current_state.Reset~regout\,
	datac => \CPU|CU|offset\(11),
	datad => \CPU|CU|offset~32_combout\,
	combout => \CPU|CU|Selector127~0_combout\);

-- Location: LCFF_X33_Y24_N1
\CPU|CU|offset[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector127~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(11));

-- Location: LCCOMB_X32_Y28_N26
\CPU|CU|const_out[11]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[11]~11_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(11)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(11),
	datac => \CPU|CU|const_out\(11),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[11]~11_combout\);

-- Location: LCCOMB_X32_Y28_N4
\CPU|CU|Selector93~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector93~0_combout\ = (\CPU|CU|const_out\(11) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|const_out\(11),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector93~0_combout\);

-- Location: LCFF_X32_Y28_N27
\CPU|CU|const_out[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[11]~11_combout\,
	sdata => \CPU|CU|Selector93~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(11));

-- Location: LCCOMB_X41_Y23_N20
\CPU|FNU|Fnc_unit|F_temp~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|F_temp~4_combout\ = (\CPU|FNU|Mux4~combout\) # ((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(11))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[11]~71_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(13),
	datab => \CPU|FNU|Mux4~combout\,
	datac => \CPU|CU|const_out\(11),
	datad => \CPU|FNU|Bbus[11]~71_combout\,
	combout => \CPU|FNU|Fnc_unit|F_temp~4_combout\);

-- Location: LCCOMB_X38_Y26_N18
\CPU|FNU|Bbus[11]~69\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[11]~69_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[11]~68_combout\ & ((\CPU|FNU|R3|data_out\(11)))) # (!\CPU|FNU|Bbus[11]~68_combout\ & (\CPU|FNU|R2|data_out\(11))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[11]~68_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(11),
	datab => \CPU|FNU|Bbus[12]~0_combout\,
	datac => \CPU|FNU|R3|data_out\(11),
	datad => \CPU|FNU|Bbus[11]~68_combout\,
	combout => \CPU|FNU|Bbus[11]~69_combout\);

-- Location: LCCOMB_X38_Y26_N10
\CPU|FNU|Bbus[11]~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[11]~70_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(11))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[11]~69_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(11),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[11]~69_combout\,
	combout => \CPU|FNU|Bbus[11]~70_combout\);

-- Location: LCCOMB_X36_Y26_N28
\CPU|FNU|Fnc_unit|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux4~0_combout\ = (\CPU|FNU|Fnc_unit|Mux3~3_combout\ & (\CPU|FNU|Fnc_unit|Mux3~2_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (\CPU|FNU|Bbus[11]~70_combout\ & \CPU|FNU|Mux4~combout\)) # 
-- (!\CPU|FNU|Fnc_unit|Mux3~2_combout\ & ((!\CPU|FNU|Mux4~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datac => \CPU|FNU|Bbus[11]~70_combout\,
	datad => \CPU|FNU|Mux4~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux4~0_combout\);

-- Location: LCCOMB_X36_Y26_N22
\CPU|FNU|Fnc_unit|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux4~1_combout\ = (\CPU|FNU|Fnc_unit|Mux3~3_combout\ & ((\CPU|FNU|Fnc_unit|Mux4~0_combout\ & (\CPU|FNU|Bbus[11]~70_combout\)) # (!\CPU|FNU|Fnc_unit|Mux4~0_combout\ & ((\CPU|FNU|Mux5~combout\))))) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datab => \CPU|FNU|Bbus[11]~70_combout\,
	datac => \CPU|FNU|Mux5~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux4~0_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux4~1_combout\);

-- Location: LCCOMB_X36_Y26_N16
\CPU|FNU|Fnc_unit|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux4~2_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (\CPU|FNU|Fnc_unit|Mux3~0_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (\CPU|FNU|Fnc_unit|F_temp~4_combout\)) # 
-- (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|Mux4~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datac => \CPU|FNU|Fnc_unit|F_temp~4_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux4~1_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux4~2_combout\);

-- Location: LCCOMB_X42_Y25_N18
\CPU|FNU|Fnc_unit|Mux4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux4~3_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux4~2_combout\ & (\CPU|FNU|Mux4~combout\)) # (!\CPU|FNU|Fnc_unit|Mux4~2_combout\ & ((\CPU|FNU|Mux3~combout\))))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux4~combout\,
	datab => \CPU|FNU|Mux3~combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux4~2_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux4~3_combout\);

-- Location: LCCOMB_X41_Y26_N14
\CPU|FNU|Fnc_unit|Mux4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux4~4_combout\ = (\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Add0~40_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Mux4~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|FNU|Fnc_unit|Add0~40_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux4~3_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux4~4_combout\);

-- Location: LCCOMB_X41_Y26_N8
\CPU|FNU|func_data[11]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[11]~16_combout\ = (\CPU|CU|ctl_wd\(14) & ((\data_bus_temp[11]~37_combout\))) # (!\CPU|CU|ctl_wd\(14) & (\CPU|FNU|Fnc_unit|Mux4~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datac => \CPU|FNU|Fnc_unit|Mux4~4_combout\,
	datad => \data_bus_temp[11]~37_combout\,
	combout => \CPU|FNU|func_data[11]~16_combout\);

-- Location: LCFF_X38_Y26_N19
\CPU|FNU|R3|data_out[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[11]~16_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(11));

-- Location: LCFF_X38_Y26_N21
\CPU|FNU|R1|data_out[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[11]~16_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(11));

-- Location: LCFF_X42_Y26_N13
\CPU|FNU|R6|data_out[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[11]~16_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(11));

-- Location: LCCOMB_X43_Y26_N18
\CPU|FNU|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux4~0_combout\ = (\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|R5|data_out\(11)) # ((\CPU|CU|ctl_wd\(4))))) # (!\CPU|CU|ctl_wd\(3) & (((\CPU|FNU|R4|data_out\(11) & !\CPU|CU|ctl_wd\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(11),
	datab => \CPU|CU|ctl_wd\(3),
	datac => \CPU|FNU|R4|data_out\(11),
	datad => \CPU|CU|ctl_wd\(4),
	combout => \CPU|FNU|Mux4~0_combout\);

-- Location: LCCOMB_X42_Y26_N12
\CPU|FNU|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux4~1_combout\ = (\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|Mux4~0_combout\ & (\CPU|FNU|R7|data_out\(11))) # (!\CPU|FNU|Mux4~0_combout\ & ((\CPU|FNU|R6|data_out\(11)))))) # (!\CPU|CU|ctl_wd\(4) & (((\CPU|FNU|Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(4),
	datab => \CPU|FNU|R7|data_out\(11),
	datac => \CPU|FNU|R6|data_out\(11),
	datad => \CPU|FNU|Mux4~0_combout\,
	combout => \CPU|FNU|Mux4~1_combout\);

-- Location: LCCOMB_X42_Y26_N22
\CPU|FNU|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux4~2_combout\ = (\CPU|FNU|Mux8~1_combout\ & ((\CPU|FNU|Mux8~2_combout\ & ((\CPU|FNU|Mux4~1_combout\))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(11))))) # (!\CPU|FNU|Mux8~1_combout\ & (((\CPU|FNU|Mux8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~1_combout\,
	datab => \CPU|FNU|R1|data_out\(11),
	datac => \CPU|FNU|Mux8~2_combout\,
	datad => \CPU|FNU|Mux4~1_combout\,
	combout => \CPU|FNU|Mux4~2_combout\);

-- Location: LCCOMB_X42_Y26_N8
\CPU|FNU|Mux4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux4~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux4~2_combout\ & ((\CPU|FNU|R3|data_out\(11)))) # (!\CPU|FNU|Mux4~2_combout\ & (\CPU|FNU|R2|data_out\(11))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(11),
	datab => \CPU|FNU|R3|data_out\(11),
	datac => \CPU|FNU|Mux8~0_combout\,
	datad => \CPU|FNU|Mux4~2_combout\,
	combout => \CPU|FNU|Mux4~combout\);

-- Location: LCCOMB_X37_Y24_N26
\CPU|FNU|Fnc_unit|Mux5~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux5~6_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|Mux5~4_combout\))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (\CPU|FNU|Mux4~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ 
-- & (\CPU|FNU|Fnc_unit|Mux3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datac => \CPU|FNU|Mux4~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux5~4_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux5~6_combout\);

-- Location: LCCOMB_X37_Y24_N28
\CPU|FNU|Fnc_unit|Mux5~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux5~7_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (((\CPU|FNU|Fnc_unit|Mux5~6_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (\CPU|FNU|Fnc_unit|Mux5~5_combout\ & ((\CPU|FNU|Fnc_unit|Mux5~9_combout\) # 
-- (\CPU|FNU|Fnc_unit|Mux5~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux5~9_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux5~5_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux5~6_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux5~7_combout\);

-- Location: LCCOMB_X37_Y24_N22
\CPU|FNU|Fnc_unit|Mux5~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux5~8_combout\ = (\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Add0~37_combout\))) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Mux5~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux5~7_combout\,
	datad => \CPU|FNU|Fnc_unit|Add0~37_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux5~8_combout\);

-- Location: LCCOMB_X40_Y24_N2
\CPU|FNU|func_data[10]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[10]~15_combout\ = (\CPU|CU|ctl_wd\(14) & (\data_bus_temp[10]~34_combout\)) # (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux5~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_bus_temp[10]~34_combout\,
	datac => \CPU|CU|ctl_wd\(14),
	datad => \CPU|FNU|Fnc_unit|Mux5~8_combout\,
	combout => \CPU|FNU|func_data[10]~15_combout\);

-- Location: LCFF_X43_Y26_N13
\CPU|FNU|R2|data_out[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[10]~15_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(10));

-- Location: LCFF_X38_Y26_N17
\CPU|FNU|R1|data_out[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[10]~15_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(10));

-- Location: LCCOMB_X41_Y27_N30
\CPU|FNU|R5|data_out[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R5|data_out[10]~feeder_combout\ = \CPU|FNU|func_data[10]~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[10]~15_combout\,
	combout => \CPU|FNU|R5|data_out[10]~feeder_combout\);

-- Location: LCFF_X41_Y27_N31
\CPU|FNU|R5|data_out[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R5|data_out[10]~feeder_combout\,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(10));

-- Location: LCCOMB_X43_Y26_N24
\CPU|FNU|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux5~0_combout\ = (\CPU|CU|ctl_wd\(3) & (((\CPU|CU|ctl_wd\(4))))) # (!\CPU|CU|ctl_wd\(3) & ((\CPU|CU|ctl_wd\(4) & (\CPU|FNU|R6|data_out\(10))) # (!\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|R4|data_out\(10))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(3),
	datab => \CPU|FNU|R6|data_out\(10),
	datac => \CPU|FNU|R4|data_out\(10),
	datad => \CPU|CU|ctl_wd\(4),
	combout => \CPU|FNU|Mux5~0_combout\);

-- Location: LCCOMB_X40_Y24_N0
\CPU|FNU|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux5~1_combout\ = (\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|Mux5~0_combout\ & ((\CPU|FNU|R7|data_out\(10)))) # (!\CPU|FNU|Mux5~0_combout\ & (\CPU|FNU|R5|data_out\(10))))) # (!\CPU|CU|ctl_wd\(3) & (((\CPU|FNU|Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(3),
	datab => \CPU|FNU|R5|data_out\(10),
	datac => \CPU|FNU|R7|data_out\(10),
	datad => \CPU|FNU|Mux5~0_combout\,
	combout => \CPU|FNU|Mux5~1_combout\);

-- Location: LCCOMB_X37_Y25_N12
\CPU|FNU|Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux5~2_combout\ = (\CPU|FNU|Mux8~1_combout\ & ((\CPU|FNU|Mux8~2_combout\ & ((\CPU|FNU|Mux5~1_combout\))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(10))))) # (!\CPU|FNU|Mux8~1_combout\ & (((\CPU|FNU|Mux8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~1_combout\,
	datab => \CPU|FNU|R1|data_out\(10),
	datac => \CPU|FNU|Mux8~2_combout\,
	datad => \CPU|FNU|Mux5~1_combout\,
	combout => \CPU|FNU|Mux5~2_combout\);

-- Location: LCCOMB_X37_Y25_N14
\CPU|FNU|Mux5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux5~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux5~2_combout\ & (\CPU|FNU|R3|data_out\(10))) # (!\CPU|FNU|Mux5~2_combout\ & ((\CPU|FNU|R2|data_out\(10)))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux5~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(10),
	datab => \CPU|FNU|R2|data_out\(10),
	datac => \CPU|FNU|Mux8~0_combout\,
	datad => \CPU|FNU|Mux5~2_combout\,
	combout => \CPU|FNU|Mux5~combout\);

-- Location: LCCOMB_X37_Y24_N16
\CPU|FNU|Fnc_unit|F_temp~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|F_temp~3_combout\ = (\CPU|FNU|Mux6~combout\) # ((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(9))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[9]~57_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(9),
	datab => \CPU|CU|ctl_wd\(13),
	datac => \CPU|FNU|Mux6~combout\,
	datad => \CPU|FNU|Bbus[9]~57_combout\,
	combout => \CPU|FNU|Fnc_unit|F_temp~3_combout\);

-- Location: LCCOMB_X37_Y24_N24
\CPU|FNU|Bbus[9]~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[9]~58_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[9]~56_combout\ & ((\CPU|FNU|R3|data_out\(9)))) # (!\CPU|FNU|Bbus[9]~56_combout\ & (\CPU|FNU|R2|data_out\(9))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[9]~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~0_combout\,
	datab => \CPU|FNU|R2|data_out\(9),
	datac => \CPU|FNU|R3|data_out\(9),
	datad => \CPU|FNU|Bbus[9]~56_combout\,
	combout => \CPU|FNU|Bbus[9]~58_combout\);

-- Location: LCCOMB_X37_Y24_N18
\CPU|FNU|Bbus[9]~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[9]~59_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(9))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[9]~58_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|const_out\(9),
	datac => \CPU|FNU|Bbus[9]~58_combout\,
	datad => \CPU|CU|ctl_wd\(13),
	combout => \CPU|FNU|Bbus[9]~59_combout\);

-- Location: LCCOMB_X37_Y24_N20
\CPU|FNU|Fnc_unit|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux6~0_combout\ = (\CPU|FNU|Fnc_unit|Mux3~2_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~3_combout\) # ((\CPU|FNU|Mux6~combout\ & \CPU|FNU|Bbus[9]~59_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & 
-- (!\CPU|FNU|Mux6~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100110001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datac => \CPU|FNU|Mux6~combout\,
	datad => \CPU|FNU|Bbus[9]~59_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux6~0_combout\);

-- Location: LCCOMB_X37_Y24_N6
\CPU|FNU|Fnc_unit|Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux6~1_combout\ = (\CPU|FNU|Fnc_unit|Mux3~3_combout\ & ((\CPU|FNU|Fnc_unit|Mux6~0_combout\ & (\CPU|FNU|Bbus[9]~59_combout\)) # (!\CPU|FNU|Fnc_unit|Mux6~0_combout\ & ((\CPU|FNU|Mux7~combout\))))) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datab => \CPU|FNU|Bbus[9]~59_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux6~0_combout\,
	datad => \CPU|FNU|Mux7~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux6~1_combout\);

-- Location: LCCOMB_X37_Y24_N0
\CPU|FNU|Fnc_unit|Mux6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux6~2_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (\CPU|FNU|Fnc_unit|Mux3~0_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (\CPU|FNU|Fnc_unit|F_temp~3_combout\)) # 
-- (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|Mux6~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datac => \CPU|FNU|Fnc_unit|F_temp~3_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux6~1_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux6~2_combout\);

-- Location: LCCOMB_X37_Y24_N2
\CPU|FNU|Fnc_unit|Mux6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux6~3_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux6~2_combout\ & (\CPU|FNU|Mux6~combout\)) # (!\CPU|FNU|Fnc_unit|Mux6~2_combout\ & ((\CPU|FNU|Mux5~combout\))))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux6~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Mux6~combout\,
	datac => \CPU|FNU|Mux5~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux6~2_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux6~3_combout\);

-- Location: LCCOMB_X40_Y25_N30
\CPU|FNU|func_data[9]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[9]~13_combout\ = (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Add0~34_combout\))) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Mux6~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datab => \CPU|CU|ctl_wd\(14),
	datac => \CPU|FNU|Fnc_unit|Mux6~3_combout\,
	datad => \CPU|FNU|Fnc_unit|Add0~34_combout\,
	combout => \CPU|FNU|func_data[9]~13_combout\);

-- Location: LCCOMB_X38_Y24_N12
\CPU|FNU|func_data[9]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[9]~14_combout\ = (\CPU|FNU|func_data[9]~13_combout\) # ((\CPU|CU|ctl_wd\(14) & \data_bus_temp[9]~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datac => \data_bus_temp[9]~31_combout\,
	datad => \CPU|FNU|func_data[9]~13_combout\,
	combout => \CPU|FNU|func_data[9]~14_combout\);

-- Location: LCCOMB_X43_Y24_N24
\CPU|FNU|R2|data_out[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R2|data_out[9]~feeder_combout\ = \CPU|FNU|func_data[9]~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[9]~14_combout\,
	combout => \CPU|FNU|R2|data_out[9]~feeder_combout\);

-- Location: LCFF_X43_Y24_N25
\CPU|FNU|R2|data_out[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R2|data_out[9]~feeder_combout\,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(9));

-- Location: LCCOMB_X43_Y24_N22
\CPU|FNU|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux6~0_combout\ = (\CPU|CU|ctl_wd\(4) & (((\CPU|CU|ctl_wd\(3))))) # (!\CPU|CU|ctl_wd\(4) & ((\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|R5|data_out\(9)))) # (!\CPU|CU|ctl_wd\(3) & (\CPU|FNU|R4|data_out\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R4|data_out\(9),
	datab => \CPU|FNU|R5|data_out\(9),
	datac => \CPU|CU|ctl_wd\(4),
	datad => \CPU|CU|ctl_wd\(3),
	combout => \CPU|FNU|Mux6~0_combout\);

-- Location: LCCOMB_X38_Y24_N6
\CPU|FNU|Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux6~1_combout\ = (\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|Mux6~0_combout\ & (\CPU|FNU|R7|data_out\(9))) # (!\CPU|FNU|Mux6~0_combout\ & ((\CPU|FNU|R6|data_out\(9)))))) # (!\CPU|CU|ctl_wd\(4) & (((\CPU|FNU|Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(4),
	datab => \CPU|FNU|R7|data_out\(9),
	datac => \CPU|FNU|R6|data_out\(9),
	datad => \CPU|FNU|Mux6~0_combout\,
	combout => \CPU|FNU|Mux6~1_combout\);

-- Location: LCCOMB_X38_Y24_N0
\CPU|FNU|Mux6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux6~2_combout\ = (\CPU|FNU|Mux8~1_combout\ & ((\CPU|FNU|Mux8~2_combout\ & ((\CPU|FNU|Mux6~1_combout\))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(9))))) # (!\CPU|FNU|Mux8~1_combout\ & (((\CPU|FNU|Mux8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~1_combout\,
	datab => \CPU|FNU|R1|data_out\(9),
	datac => \CPU|FNU|Mux8~2_combout\,
	datad => \CPU|FNU|Mux6~1_combout\,
	combout => \CPU|FNU|Mux6~2_combout\);

-- Location: LCCOMB_X38_Y24_N26
\CPU|FNU|Mux6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux6~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux6~2_combout\ & (\CPU|FNU|R3|data_out\(9))) # (!\CPU|FNU|Mux6~2_combout\ & ((\CPU|FNU|R2|data_out\(9)))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux6~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(9),
	datab => \CPU|FNU|Mux8~0_combout\,
	datac => \CPU|FNU|R2|data_out\(9),
	datad => \CPU|FNU|Mux6~2_combout\,
	combout => \CPU|FNU|Mux6~combout\);

-- Location: LCCOMB_X36_Y26_N30
\CPU|FNU|Fnc_unit|Mux7~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux7~6_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|Mux7~4_combout\))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (\CPU|FNU|Mux6~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ 
-- & (((\CPU|FNU|Fnc_unit|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Mux6~combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux7~4_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux7~6_combout\);

-- Location: LCCOMB_X36_Y26_N24
\CPU|FNU|Fnc_unit|Mux7~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux7~7_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (((\CPU|FNU|Fnc_unit|Mux7~6_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (\CPU|FNU|Fnc_unit|Mux7~5_combout\ & ((\CPU|FNU|Fnc_unit|Mux7~9_combout\) # 
-- (\CPU|FNU|Fnc_unit|Mux7~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux7~9_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux7~5_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux7~6_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux7~7_combout\);

-- Location: LCCOMB_X40_Y26_N26
\CPU|FNU|Fnc_unit|Mux7~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux7~8_combout\ = (\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Add0~31_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Mux7~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|FNU|Fnc_unit|Add0~31_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux7~7_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux7~8_combout\);

-- Location: LCCOMB_X38_Y26_N26
\CPU|FNU|func_data[8]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[8]~12_combout\ = (\CPU|CU|ctl_wd\(14) & (\data_bus_temp[8]~28_combout\)) # (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux7~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datac => \data_bus_temp[8]~28_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux7~8_combout\,
	combout => \CPU|FNU|func_data[8]~12_combout\);

-- Location: LCFF_X43_Y26_N3
\CPU|FNU|R2|data_out[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[8]~12_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(8));

-- Location: LCFF_X42_Y26_N17
\CPU|FNU|R6|data_out[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[8]~12_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(8));

-- Location: LCCOMB_X43_Y26_N28
\CPU|FNU|Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux7~0_combout\ = (\CPU|CU|ctl_wd\(3) & (((\CPU|CU|ctl_wd\(4))))) # (!\CPU|CU|ctl_wd\(3) & ((\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|R6|data_out\(8)))) # (!\CPU|CU|ctl_wd\(4) & (\CPU|FNU|R4|data_out\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R4|data_out\(8),
	datab => \CPU|FNU|R6|data_out\(8),
	datac => \CPU|CU|ctl_wd\(3),
	datad => \CPU|CU|ctl_wd\(4),
	combout => \CPU|FNU|Mux7~0_combout\);

-- Location: LCCOMB_X42_Y26_N30
\CPU|FNU|Mux7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux7~1_combout\ = (\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|Mux7~0_combout\ & ((\CPU|FNU|R7|data_out\(8)))) # (!\CPU|FNU|Mux7~0_combout\ & (\CPU|FNU|R5|data_out\(8))))) # (!\CPU|CU|ctl_wd\(3) & (((\CPU|FNU|Mux7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(3),
	datab => \CPU|FNU|R5|data_out\(8),
	datac => \CPU|FNU|R7|data_out\(8),
	datad => \CPU|FNU|Mux7~0_combout\,
	combout => \CPU|FNU|Mux7~1_combout\);

-- Location: LCCOMB_X38_Y26_N6
\CPU|FNU|Mux7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux7~2_combout\ = (\CPU|FNU|Mux8~1_combout\ & ((\CPU|FNU|Mux8~2_combout\ & ((\CPU|FNU|Mux7~1_combout\))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(8))))) # (!\CPU|FNU|Mux8~1_combout\ & (((\CPU|FNU|Mux8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~1_combout\,
	datab => \CPU|FNU|R1|data_out\(8),
	datac => \CPU|FNU|Mux7~1_combout\,
	datad => \CPU|FNU|Mux8~2_combout\,
	combout => \CPU|FNU|Mux7~2_combout\);

-- Location: LCCOMB_X42_Y28_N26
\CPU|FNU|Mux7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux7~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux7~2_combout\ & (\CPU|FNU|R3|data_out\(8))) # (!\CPU|FNU|Mux7~2_combout\ & ((\CPU|FNU|R2|data_out\(8)))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux7~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(8),
	datab => \CPU|FNU|R2|data_out\(8),
	datac => \CPU|FNU|Mux8~0_combout\,
	datad => \CPU|FNU|Mux7~2_combout\,
	combout => \CPU|FNU|Mux7~combout\);

-- Location: LCCOMB_X34_Y26_N24
\CPU|address[8]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[8]~51_combout\ = (\CPU|CU|st_op~regout\ & (((\CPU|FNU|Mux7~combout\)))) # (!\CPU|CU|st_op~regout\ & ((\CPU|CU|ld_op~regout\ & ((\CPU|FNU|Mux7~combout\))) # (!\CPU|CU|ld_op~regout\ & (\CPU|address[8]~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|st_op~regout\,
	datab => \CPU|address[8]~38_combout\,
	datac => \CPU|FNU|Mux7~combout\,
	datad => \CPU|CU|ld_op~regout\,
	combout => \CPU|address[8]~51_combout\);

-- Location: LCCOMB_X34_Y26_N8
\CPU|CU|AR[9]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[9]~9_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[9]~31_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~40_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC~40_combout\,
	datab => \CPU|CU|op.ret~regout\,
	datad => \data_bus_temp[9]~31_combout\,
	combout => \CPU|CU|AR[9]~9_combout\);

-- Location: LCCOMB_X32_Y26_N30
\CPU|CU|Selector112~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector112~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(9))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(9)))))) # (!\CPU|CU|current_state.Execute~regout\ & (((\CPU|CU|PC\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Execute~regout\,
	datab => \CPU|CU|offset\(9),
	datac => \CPU|CU|PC\(9),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|Selector112~0_combout\);

-- Location: LCFF_X34_Y26_N9
\CPU|CU|AR[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[9]~9_combout\,
	sdata => \CPU|CU|Selector112~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(9));

-- Location: LCCOMB_X33_Y25_N18
\CPU|CU|SP[9]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|SP[9]~34_combout\ = (\CPU|CU|SP\(9) & ((\CPU|CU|current_state.Decode~regout\ & (!\CPU|CU|SP[8]~33\)) # (!\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|SP[8]~33\ & VCC)))) # (!\CPU|CU|SP\(9) & ((\CPU|CU|current_state.Decode~regout\ & 
-- ((\CPU|CU|SP[8]~33\) # (GND))) # (!\CPU|CU|current_state.Decode~regout\ & (!\CPU|CU|SP[8]~33\))))
-- \CPU|CU|SP[9]~35\ = CARRY((\CPU|CU|SP\(9) & (\CPU|CU|current_state.Decode~regout\ & !\CPU|CU|SP[8]~33\)) # (!\CPU|CU|SP\(9) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|SP[8]~33\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP\(9),
	datab => \CPU|CU|current_state.Decode~regout\,
	datad => VCC,
	cin => \CPU|CU|SP[8]~33\,
	combout => \CPU|CU|SP[9]~34_combout\,
	cout => \CPU|CU|SP[9]~35\);

-- Location: LCFF_X33_Y25_N19
\CPU|CU|SP[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[9]~34_combout\,
	sdata => \~GND~combout\,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(9));

-- Location: LCCOMB_X34_Y26_N4
\CPU|address[9]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[9]~39_combout\ = (\CPU|CU|AR_EN~regout\ & (((\CPU|CU|AR\(9))))) # (!\CPU|CU|AR_EN~regout\ & (((\CPU|CU|SP\(9))) # (!\CPU|CU|SP_EN~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP_EN~regout\,
	datab => \CPU|CU|AR\(9),
	datac => \CPU|CU|SP\(9),
	datad => \CPU|CU|AR_EN~regout\,
	combout => \CPU|address[9]~39_combout\);

-- Location: LCCOMB_X34_Y26_N18
\CPU|address[9]~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[9]~52_combout\ = (\CPU|CU|st_op~regout\ & (((\CPU|FNU|Mux6~combout\)))) # (!\CPU|CU|st_op~regout\ & ((\CPU|CU|ld_op~regout\ & ((\CPU|FNU|Mux6~combout\))) # (!\CPU|CU|ld_op~regout\ & (\CPU|address[9]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|st_op~regout\,
	datab => \CPU|address[9]~39_combout\,
	datac => \CPU|FNU|Mux6~combout\,
	datad => \CPU|CU|ld_op~regout\,
	combout => \CPU|address[9]~52_combout\);

-- Location: LCCOMB_X33_Y26_N0
\CPU|CU|AR[10]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[10]~10_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[10]~34_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC~16_combout\,
	datab => \CPU|CU|op.ret~regout\,
	datad => \data_bus_temp[10]~34_combout\,
	combout => \CPU|CU|AR[10]~10_combout\);

-- Location: LCCOMB_X33_Y26_N14
\CPU|CU|Selector111~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector111~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(10))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(10)))))) # (!\CPU|CU|current_state.Execute~regout\ & (((\CPU|CU|PC\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(10),
	datab => \CPU|CU|PC\(10),
	datac => \CPU|CU|current_state.Execute~regout\,
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|Selector111~0_combout\);

-- Location: LCFF_X33_Y26_N1
\CPU|CU|AR[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[10]~10_combout\,
	sdata => \CPU|CU|Selector111~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(10));

-- Location: LCFF_X33_Y25_N21
\CPU|CU|SP[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|SP[10]~36_combout\,
	sdata => VCC,
	sload => \CPU|CU|ALT_INV_current_state.Reset~regout\,
	ena => \CPU|CU|SP[0]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|SP\(10));

-- Location: LCCOMB_X34_Y25_N24
\CPU|address[10]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[10]~26_combout\ = (\CPU|CU|AR_EN~regout\ & (((\CPU|CU|AR\(10))))) # (!\CPU|CU|AR_EN~regout\ & (((\CPU|CU|SP\(10))) # (!\CPU|CU|SP_EN~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP_EN~regout\,
	datab => \CPU|CU|AR\(10),
	datac => \CPU|CU|SP\(10),
	datad => \CPU|CU|AR_EN~regout\,
	combout => \CPU|address[10]~26_combout\);

-- Location: LCCOMB_X37_Y25_N4
\CPU|address[10]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[10]~40_combout\ = (\CPU|CU|ld_op~regout\ & (((\CPU|FNU|Mux5~combout\)))) # (!\CPU|CU|ld_op~regout\ & ((\CPU|CU|st_op~regout\ & ((\CPU|FNU|Mux5~combout\))) # (!\CPU|CU|st_op~regout\ & (\CPU|address[10]~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ld_op~regout\,
	datab => \CPU|address[10]~26_combout\,
	datac => \CPU|FNU|Mux5~combout\,
	datad => \CPU|CU|st_op~regout\,
	combout => \CPU|address[10]~40_combout\);

-- Location: M4K_X52_Y23
\Ram1|altsyncram_component|auto_generated|ram_block1a0\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "system_ram:Ram1|altsyncram:altsyncram_component|altsyncram_59a1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_width => 11,
	port_b_data_width => 2,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \CPU|CU|ALT_INV_Mem_wr~regout\,
	clk0 => \clk~clkctrl_outclk\,
	portadatain => \Ram1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \Ram1|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Ram1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X37_Y23_N6
\data_bus_temp[0]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[0]~14_combout\ = ((\mem_cs_ram~1_combout\ & (\Ram1|altsyncram_component|auto_generated|q_a\(0))) # (!\mem_cs_ram~1_combout\ & ((\ProgMem|altsyncram_component|auto_generated|q_a\(0))))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_cs_ram~1_combout\,
	datab => \Ram1|altsyncram_component|auto_generated|q_a\(0),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \ProgMem|altsyncram_component|auto_generated|q_a\(0),
	combout => \data_bus_temp[0]~14_combout\);

-- Location: LCCOMB_X37_Y23_N14
\data_bus_temp[0]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[0]~16_combout\ = ((\data_bus_temp[0]~15_combout\ & \data_bus_temp[0]~14_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[0]~15_combout\,
	datac => \data_bus_temp[0]~3_combout\,
	datad => \data_bus_temp[0]~14_combout\,
	combout => \data_bus_temp[0]~16_combout\);

-- Location: LCCOMB_X36_Y26_N2
\CPU|address[11]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[11]~41_combout\ = (\CPU|CU|ld_op~regout\ & (((\CPU|FNU|Mux4~combout\)))) # (!\CPU|CU|ld_op~regout\ & ((\CPU|CU|st_op~regout\ & ((\CPU|FNU|Mux4~combout\))) # (!\CPU|CU|st_op~regout\ & (\CPU|address[11]~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|address[11]~28_combout\,
	datab => \CPU|CU|ld_op~regout\,
	datac => \CPU|CU|st_op~regout\,
	datad => \CPU|FNU|Mux4~combout\,
	combout => \CPU|address[11]~41_combout\);

-- Location: LCCOMB_X37_Y25_N18
\mem_cs_ram~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem_cs_ram~1_combout\ = (\mem_cs_ram~0_combout\ & (\CPU|address[12]~42_combout\ $ (((\CPU|address[10]~40_combout\) # (\CPU|address[11]~41_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|address[12]~42_combout\,
	datab => \mem_cs_ram~0_combout\,
	datac => \CPU|address[10]~40_combout\,
	datad => \CPU|address[11]~41_combout\,
	combout => \mem_cs_ram~1_combout\);

-- Location: LCCOMB_X37_Y23_N26
\data_bus_temp[1]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[1]~17_combout\ = ((\mem_cs_ram~1_combout\ & ((\Ram1|altsyncram_component|auto_generated|q_a\(1)))) # (!\mem_cs_ram~1_combout\ & (\ProgMem|altsyncram_component|auto_generated|q_a\(1)))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ProgMem|altsyncram_component|auto_generated|q_a\(1),
	datab => \Ram1|altsyncram_component|auto_generated|q_a\(1),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[1]~17_combout\);

-- Location: LCCOMB_X37_Y23_N24
\data_bus_temp[1]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[1]~19_combout\ = ((\data_bus_temp[1]~18_combout\ & \data_bus_temp[1]~17_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[1]~18_combout\,
	datac => \data_bus_temp[0]~3_combout\,
	datad => \data_bus_temp[1]~17_combout\,
	combout => \data_bus_temp[1]~19_combout\);

-- Location: LCCOMB_X34_Y28_N8
\CPU|CU|PC[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[1]~1_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~33_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[1]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC~33_combout\,
	datab => \CPU|CU|PC[10]~24_combout\,
	datad => \data_bus_temp[1]~19_combout\,
	combout => \CPU|CU|PC[1]~1_combout\);

-- Location: LCCOMB_X38_Y28_N10
\CPU|CU|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~10_combout\ = (\CPU|CU|current_state.Decode~regout\) # ((!\CPU|CU|Add0~1_combout\ & \CPU|CU|offset\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|current_state.Decode~regout\,
	datad => \CPU|CU|offset\(0),
	combout => \CPU|CU|Add0~10_combout\);

-- Location: LCCOMB_X33_Y29_N2
\CPU|CU|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~14_combout\ = (\CPU|CU|Add0~8_combout\ & ((\CPU|CU|Add0~9_combout\ & (\CPU|CU|Add0~13\ & VCC)) # (!\CPU|CU|Add0~9_combout\ & (!\CPU|CU|Add0~13\)))) # (!\CPU|CU|Add0~8_combout\ & ((\CPU|CU|Add0~9_combout\ & (!\CPU|CU|Add0~13\)) # 
-- (!\CPU|CU|Add0~9_combout\ & ((\CPU|CU|Add0~13\) # (GND)))))
-- \CPU|CU|Add0~15\ = CARRY((\CPU|CU|Add0~8_combout\ & (!\CPU|CU|Add0~9_combout\ & !\CPU|CU|Add0~13\)) # (!\CPU|CU|Add0~8_combout\ & ((!\CPU|CU|Add0~13\) # (!\CPU|CU|Add0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~8_combout\,
	datab => \CPU|CU|Add0~9_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~13\,
	combout => \CPU|CU|Add0~14_combout\,
	cout => \CPU|CU|Add0~15\);

-- Location: LCCOMB_X34_Y28_N16
\CPU|CU|PC[1]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[1]~45_combout\ = (!\CPU|CU|current_state.WB~regout\ & (\CPU|CU|Add0~14_combout\ & (\CPU|CU|current_state.Reset~regout\ & !\CPU|CU|PC[9]~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.WB~regout\,
	datab => \CPU|CU|Add0~14_combout\,
	datac => \CPU|CU|current_state.Reset~regout\,
	datad => \CPU|CU|PC[9]~23_combout\,
	combout => \CPU|CU|PC[1]~45_combout\);

-- Location: LCFF_X34_Y28_N9
\CPU|CU|PC[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[1]~1_combout\,
	sdata => \CPU|CU|PC[1]~45_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(1));

-- Location: LCCOMB_X34_Y28_N6
\CPU|CU|Add0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~9_combout\ = (\CPU|CU|PC\(1) & ((\CPU|CU|current_state.Decode~regout\) # (!\CPU|CU|Add0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|PC\(1),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~9_combout\);

-- Location: LCCOMB_X33_Y29_N4
\CPU|CU|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~16_combout\ = ((\CPU|CU|Add0~7_combout\ $ (\CPU|CU|Add0~6_combout\ $ (!\CPU|CU|Add0~15\)))) # (GND)
-- \CPU|CU|Add0~17\ = CARRY((\CPU|CU|Add0~7_combout\ & ((\CPU|CU|Add0~6_combout\) # (!\CPU|CU|Add0~15\))) # (!\CPU|CU|Add0~7_combout\ & (\CPU|CU|Add0~6_combout\ & !\CPU|CU|Add0~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~7_combout\,
	datab => \CPU|CU|Add0~6_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~15\,
	combout => \CPU|CU|Add0~16_combout\,
	cout => \CPU|CU|Add0~17\);

-- Location: LCCOMB_X33_Y29_N6
\CPU|CU|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~18_combout\ = (\CPU|CU|Add0~5_combout\ & ((\CPU|CU|Add0~4_combout\ & (\CPU|CU|Add0~17\ & VCC)) # (!\CPU|CU|Add0~4_combout\ & (!\CPU|CU|Add0~17\)))) # (!\CPU|CU|Add0~5_combout\ & ((\CPU|CU|Add0~4_combout\ & (!\CPU|CU|Add0~17\)) # 
-- (!\CPU|CU|Add0~4_combout\ & ((\CPU|CU|Add0~17\) # (GND)))))
-- \CPU|CU|Add0~19\ = CARRY((\CPU|CU|Add0~5_combout\ & (!\CPU|CU|Add0~4_combout\ & !\CPU|CU|Add0~17\)) # (!\CPU|CU|Add0~5_combout\ & ((!\CPU|CU|Add0~17\) # (!\CPU|CU|Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~5_combout\,
	datab => \CPU|CU|Add0~4_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~17\,
	combout => \CPU|CU|Add0~18_combout\,
	cout => \CPU|CU|Add0~19\);

-- Location: LCCOMB_X33_Y29_N12
\CPU|CU|Add0~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~28_combout\ = ((\CPU|CU|Add0~27_combout\ $ (\CPU|CU|Add0~26_combout\ $ (!\CPU|CU|Add0~25\)))) # (GND)
-- \CPU|CU|Add0~29\ = CARRY((\CPU|CU|Add0~27_combout\ & ((\CPU|CU|Add0~26_combout\) # (!\CPU|CU|Add0~25\))) # (!\CPU|CU|Add0~27_combout\ & (\CPU|CU|Add0~26_combout\ & !\CPU|CU|Add0~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~27_combout\,
	datab => \CPU|CU|Add0~26_combout\,
	datad => VCC,
	cin => \CPU|CU|Add0~25\,
	combout => \CPU|CU|Add0~28_combout\,
	cout => \CPU|CU|Add0~29\);

-- Location: LCCOMB_X34_Y27_N24
\CPU|CU|PC[6]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[6]~42_combout\ = ((\CPU|CU|current_state.WB~regout\) # ((\CPU|CU|Add0~28_combout\) # (\CPU|CU|PC[9]~23_combout\))) # (!\CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datab => \CPU|CU|current_state.WB~regout\,
	datac => \CPU|CU|Add0~28_combout\,
	datad => \CPU|CU|PC[9]~23_combout\,
	combout => \CPU|CU|PC[6]~42_combout\);

-- Location: LCFF_X34_Y27_N13
\CPU|CU|PC[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[6]~6_combout\,
	sdata => \CPU|CU|PC[6]~42_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(6));

-- Location: LCCOMB_X35_Y26_N6
\CPU|CU|PC~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~37_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(6)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|PC\(6),
	datac => \CPU|CU|offset\(6),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|PC~37_combout\);

-- Location: LCCOMB_X35_Y26_N26
\CPU|CU|AR[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[6]~6_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[6]~10_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~37_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ret~regout\,
	datab => \CPU|CU|PC~37_combout\,
	datad => \data_bus_temp[6]~10_combout\,
	combout => \CPU|CU|AR[6]~6_combout\);

-- Location: LCCOMB_X35_Y26_N24
\CPU|CU|Selector115~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector115~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(6)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(6))))) # (!\CPU|CU|current_state.Execute~regout\ & (\CPU|CU|PC\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(6),
	datab => \CPU|CU|current_state.Execute~regout\,
	datac => \CPU|CU|offset\(6),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|Selector115~0_combout\);

-- Location: LCFF_X35_Y26_N27
\CPU|CU|AR[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[6]~6_combout\,
	sdata => \CPU|CU|Selector115~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(6));

-- Location: LCCOMB_X34_Y26_N16
\CPU|address[6]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[6]~36_combout\ = (\CPU|CU|AR_EN~regout\ & (((\CPU|CU|AR\(6))))) # (!\CPU|CU|AR_EN~regout\ & ((\CPU|CU|SP\(6)) # ((!\CPU|CU|SP_EN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP\(6),
	datab => \CPU|CU|AR_EN~regout\,
	datac => \CPU|CU|AR\(6),
	datad => \CPU|CU|SP_EN~regout\,
	combout => \CPU|address[6]~36_combout\);

-- Location: LCCOMB_X37_Y25_N6
\CPU|address[6]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[6]~49_combout\ = (\CPU|CU|ld_op~regout\ & (((\CPU|FNU|Mux9~combout\)))) # (!\CPU|CU|ld_op~regout\ & ((\CPU|CU|st_op~regout\ & ((\CPU|FNU|Mux9~combout\))) # (!\CPU|CU|st_op~regout\ & (\CPU|address[6]~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ld_op~regout\,
	datab => \CPU|address[6]~36_combout\,
	datac => \CPU|FNU|Mux9~combout\,
	datad => \CPU|CU|st_op~regout\,
	combout => \CPU|address[6]~49_combout\);

-- Location: LCCOMB_X37_Y23_N28
\data_bus_temp[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[5]~5_combout\ = ((\mem_cs_ram~1_combout\ & (\Ram1|altsyncram_component|auto_generated|q_a\(5))) # (!\mem_cs_ram~1_combout\ & ((\ProgMem|altsyncram_component|auto_generated|q_a\(5))))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ram1|altsyncram_component|auto_generated|q_a\(5),
	datab => \ProgMem|altsyncram_component|auto_generated|q_a\(5),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[5]~5_combout\);

-- Location: LCCOMB_X37_Y23_N4
\data_bus_temp[5]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[5]~7_combout\ = ((\data_bus_temp[5]~6_combout\ & \data_bus_temp[5]~5_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[0]~3_combout\,
	datab => \data_bus_temp[5]~6_combout\,
	datad => \data_bus_temp[5]~5_combout\,
	combout => \data_bus_temp[5]~7_combout\);

-- Location: LCFF_X43_Y27_N27
\CPU|CU|IR[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector60~0_combout\,
	sdata => \data_bus_temp[5]~7_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(5));

-- Location: LCCOMB_X33_Y28_N28
\CPU|CU|offset[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset[5]~5_combout\ = (\CPU|CU|offset~45_combout\ & ((\CPU|CU|IR\(5)))) # (!\CPU|CU|offset~45_combout\ & (\CPU|CU|offset~48_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~48_combout\,
	datab => \CPU|CU|IR\(5),
	datad => \CPU|CU|offset~45_combout\,
	combout => \CPU|CU|offset[5]~5_combout\);

-- Location: LCCOMB_X33_Y28_N14
\CPU|CU|Selector133~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector133~0_combout\ = (\CPU|CU|offset\(5) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(5),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector133~0_combout\);

-- Location: LCFF_X33_Y28_N29
\CPU|CU|offset[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|offset[5]~5_combout\,
	sdata => \CPU|CU|Selector133~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(5));

-- Location: LCCOMB_X33_Y27_N2
\CPU|CU|const_out[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[5]~5_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(5)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(5),
	datac => \CPU|CU|const_out\(5),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[5]~5_combout\);

-- Location: LCCOMB_X32_Y27_N28
\CPU|CU|Selector99~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector99~0_combout\ = (\CPU|CU|const_out\(5) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(5),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector99~0_combout\);

-- Location: LCFF_X33_Y27_N3
\CPU|CU|const_out[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[5]~5_combout\,
	sdata => \CPU|CU|Selector99~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(5));

-- Location: LCCOMB_X43_Y24_N18
\CPU|FNU|Bbus[5]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[5]~27_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[5]~26_combout\ & ((\CPU|FNU|R3|data_out\(5)))) # (!\CPU|FNU|Bbus[5]~26_combout\ & (\CPU|FNU|R2|data_out\(5))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[5]~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(5),
	datab => \CPU|FNU|R3|data_out\(5),
	datac => \CPU|FNU|Bbus[12]~0_combout\,
	datad => \CPU|FNU|Bbus[5]~26_combout\,
	combout => \CPU|FNU|Bbus[5]~27_combout\);

-- Location: LCCOMB_X43_Y24_N4
\CPU|FNU|Fnc_unit|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~18_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(5))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[5]~27_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(9),
	datab => \CPU|CU|const_out\(5),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[5]~27_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~18_combout\);

-- Location: LCCOMB_X43_Y25_N2
\CPU|FNU|Fnc_unit|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux10~0_combout\ = (\CPU|FNU|Mux10~combout\ & (\CPU|FNU|Fnc_unit|Mux3~2_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~3_combout\) # (\CPU|FNU|Bbus[5]~29_combout\)))) # (!\CPU|FNU|Mux10~combout\ & (\CPU|FNU|Fnc_unit|Mux3~2_combout\ $ 
-- ((!\CPU|FNU|Fnc_unit|Mux3~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100111000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux10~combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datad => \CPU|FNU|Bbus[5]~29_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux10~0_combout\);

-- Location: LCCOMB_X43_Y25_N20
\CPU|FNU|Fnc_unit|Mux10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux10~1_combout\ = (\CPU|FNU|Fnc_unit|Mux3~3_combout\ & ((\CPU|FNU|Fnc_unit|Mux10~0_combout\ & (\CPU|FNU|Bbus[5]~29_combout\)) # (!\CPU|FNU|Fnc_unit|Mux10~0_combout\ & ((\CPU|FNU|Mux11~combout\))))) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ 
-- & (((\CPU|FNU|Fnc_unit|Mux10~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[5]~29_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datac => \CPU|FNU|Mux11~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux10~0_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux10~1_combout\);

-- Location: LCCOMB_X43_Y24_N14
\CPU|FNU|Fnc_unit|F_temp~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|F_temp~0_combout\ = (\CPU|FNU|Mux10~combout\) # ((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(5))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[5]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux10~combout\,
	datab => \CPU|CU|const_out\(5),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[5]~27_combout\,
	combout => \CPU|FNU|Fnc_unit|F_temp~0_combout\);

-- Location: LCCOMB_X43_Y25_N6
\CPU|FNU|Fnc_unit|Mux10~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux10~2_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~1_combout\) # ((\CPU|FNU|Fnc_unit|F_temp~0_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- (\CPU|FNU|Fnc_unit|Mux10~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux10~1_combout\,
	datad => \CPU|FNU|Fnc_unit|F_temp~0_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux10~2_combout\);

-- Location: LCCOMB_X43_Y25_N0
\CPU|FNU|Fnc_unit|Mux10~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux10~3_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux10~2_combout\ & (\CPU|FNU|Mux10~combout\)) # (!\CPU|FNU|Fnc_unit|Mux10~2_combout\ & ((\CPU|FNU|Mux9~combout\))))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux10~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux10~combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datac => \CPU|FNU|Mux9~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux10~2_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux10~3_combout\);

-- Location: LCCOMB_X41_Y24_N14
\CPU|FNU|func_data[5]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[5]~2_combout\ = (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Add0~19_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Mux10~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~19_combout\,
	datac => \CPU|CU|ctl_wd\(14),
	datad => \CPU|FNU|Fnc_unit|Mux10~3_combout\,
	combout => \CPU|FNU|func_data[5]~2_combout\);

-- Location: LCCOMB_X40_Y24_N18
\CPU|FNU|func_data[5]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[5]~3_combout\ = (\CPU|FNU|func_data[5]~2_combout\) # ((\CPU|CU|ctl_wd\(14) & \data_bus_temp[5]~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datac => \CPU|FNU|func_data[5]~2_combout\,
	datad => \data_bus_temp[5]~7_combout\,
	combout => \CPU|FNU|func_data[5]~3_combout\);

-- Location: LCFF_X41_Y28_N1
\CPU|FNU|R3|data_out[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[5]~3_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(5));

-- Location: LCCOMB_X43_Y24_N10
\CPU|FNU|Mux10~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux10~2_combout\ = (\CPU|FNU|Mux8~1_combout\ & ((\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|Mux10~1_combout\)) # (!\CPU|FNU|Mux8~2_combout\ & ((\CPU|FNU|R1|data_out\(5)))))) # (!\CPU|FNU|Mux8~1_combout\ & (((\CPU|FNU|Mux8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux10~1_combout\,
	datab => \CPU|FNU|R1|data_out\(5),
	datac => \CPU|FNU|Mux8~1_combout\,
	datad => \CPU|FNU|Mux8~2_combout\,
	combout => \CPU|FNU|Mux10~2_combout\);

-- Location: LCCOMB_X43_Y24_N12
\CPU|FNU|Mux10\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux10~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux10~2_combout\ & ((\CPU|FNU|R3|data_out\(5)))) # (!\CPU|FNU|Mux10~2_combout\ & (\CPU|FNU|R2|data_out\(5))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux10~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(5),
	datab => \CPU|FNU|R3|data_out\(5),
	datac => \CPU|FNU|Mux8~0_combout\,
	datad => \CPU|FNU|Mux10~2_combout\,
	combout => \CPU|FNU|Mux10~combout\);

-- Location: LCCOMB_X35_Y25_N20
\CPU|address[5]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[5]~48_combout\ = (\CPU|CU|ld_op~regout\ & (((\CPU|FNU|Mux10~combout\)))) # (!\CPU|CU|ld_op~regout\ & ((\CPU|CU|st_op~regout\ & ((\CPU|FNU|Mux10~combout\))) # (!\CPU|CU|st_op~regout\ & (\CPU|address[5]~35_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|address[5]~35_combout\,
	datab => \CPU|CU|ld_op~regout\,
	datac => \CPU|CU|st_op~regout\,
	datad => \CPU|FNU|Mux10~combout\,
	combout => \CPU|address[5]~48_combout\);

-- Location: LCCOMB_X36_Y24_N2
\data_bus_temp[12]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[12]~38_combout\ = ((\mem_cs_ram~1_combout\ & (\Ram1|altsyncram_component|auto_generated|q_a\(12))) # (!\mem_cs_ram~1_combout\ & ((\ProgMem|altsyncram_component|auto_generated|q_a\(12))))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ram1|altsyncram_component|auto_generated|q_a\(12),
	datab => \ProgMem|altsyncram_component|auto_generated|q_a\(12),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[12]~38_combout\);

-- Location: LCCOMB_X36_Y24_N0
\data_bus_temp[12]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[12]~40_combout\ = ((\data_bus_temp[12]~39_combout\ & \data_bus_temp[12]~38_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_bus_temp[0]~3_combout\,
	datac => \data_bus_temp[12]~39_combout\,
	datad => \data_bus_temp[12]~38_combout\,
	combout => \data_bus_temp[12]~40_combout\);

-- Location: LCCOMB_X42_Y25_N28
\CPU|FNU|Fnc_unit|F_temp~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|F_temp~5_combout\ = (\CPU|FNU|Mux3~combout\) # ((\CPU|CU|ctl_wd\(13) & ((\CPU|CU|const_out\(12)))) # (!\CPU|CU|ctl_wd\(13) & (\CPU|FNU|Bbus[12]~77_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(13),
	datab => \CPU|FNU|Mux3~combout\,
	datac => \CPU|FNU|Bbus[12]~77_combout\,
	datad => \CPU|CU|const_out\(12),
	combout => \CPU|FNU|Fnc_unit|F_temp~5_combout\);

-- Location: LCCOMB_X42_Y25_N30
\CPU|FNU|Fnc_unit|Mux3~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux3~6_combout\ = (\CPU|FNU|Fnc_unit|Mux3~3_combout\ & (\CPU|FNU|Fnc_unit|Mux3~2_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (\CPU|FNU|Mux3~combout\ & \CPU|FNU|Bbus[12]~76_combout\)) # 
-- (!\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (!\CPU|FNU|Mux3~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100110001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datac => \CPU|FNU|Mux3~combout\,
	datad => \CPU|FNU|Bbus[12]~76_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux3~6_combout\);

-- Location: LCCOMB_X42_Y25_N0
\CPU|FNU|Fnc_unit|Mux3~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux3~7_combout\ = (\CPU|FNU|Fnc_unit|Mux3~3_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~6_combout\ & (\CPU|FNU|Bbus[12]~76_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~6_combout\ & ((\CPU|FNU|Mux4~combout\))))) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux3~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datab => \CPU|FNU|Bbus[12]~76_combout\,
	datac => \CPU|FNU|Mux4~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux3~6_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux3~7_combout\);

-- Location: LCCOMB_X42_Y25_N26
\CPU|FNU|Fnc_unit|Mux3~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux3~8_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|F_temp~5_combout\) # ((\CPU|FNU|Fnc_unit|Mux3~1_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (((!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- \CPU|FNU|Fnc_unit|Mux3~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datab => \CPU|FNU|Fnc_unit|F_temp~5_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux3~7_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux3~8_combout\);

-- Location: LCCOMB_X42_Y25_N20
\CPU|FNU|Fnc_unit|Mux3~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux3~9_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~8_combout\ & (\CPU|FNU|Mux3~combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~8_combout\ & ((\CPU|FNU|Mux2~combout\))))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux3~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Mux3~combout\,
	datac => \CPU|FNU|Mux2~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux3~8_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux3~9_combout\);

-- Location: LCCOMB_X40_Y26_N10
\CPU|FNU|Fnc_unit|Add0~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~43_combout\ = (\CPU|FNU|Mux3~combout\ & ((\CPU|FNU|Fnc_unit|Add0~42_combout\ & (\CPU|FNU|Fnc_unit|Add0~41\ & VCC)) # (!\CPU|FNU|Fnc_unit|Add0~42_combout\ & (!\CPU|FNU|Fnc_unit|Add0~41\)))) # (!\CPU|FNU|Mux3~combout\ & 
-- ((\CPU|FNU|Fnc_unit|Add0~42_combout\ & (!\CPU|FNU|Fnc_unit|Add0~41\)) # (!\CPU|FNU|Fnc_unit|Add0~42_combout\ & ((\CPU|FNU|Fnc_unit|Add0~41\) # (GND)))))
-- \CPU|FNU|Fnc_unit|Add0~44\ = CARRY((\CPU|FNU|Mux3~combout\ & (!\CPU|FNU|Fnc_unit|Add0~42_combout\ & !\CPU|FNU|Fnc_unit|Add0~41\)) # (!\CPU|FNU|Mux3~combout\ & ((!\CPU|FNU|Fnc_unit|Add0~41\) # (!\CPU|FNU|Fnc_unit|Add0~42_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux3~combout\,
	datab => \CPU|FNU|Fnc_unit|Add0~42_combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~41\,
	combout => \CPU|FNU|Fnc_unit|Add0~43_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~44\);

-- Location: LCCOMB_X42_Y25_N14
\CPU|FNU|Fnc_unit|Mux3~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux3~10_combout\ = (\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Add0~43_combout\))) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Mux3~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~9_combout\,
	datad => \CPU|FNU|Fnc_unit|Add0~43_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux3~10_combout\);

-- Location: LCCOMB_X41_Y27_N26
\CPU|FNU|func_data[12]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[12]~17_combout\ = (\CPU|CU|ctl_wd\(14) & (\data_bus_temp[12]~40_combout\)) # (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux3~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datac => \data_bus_temp[12]~40_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux3~10_combout\,
	combout => \CPU|FNU|func_data[12]~17_combout\);

-- Location: LCFF_X42_Y25_N9
\CPU|FNU|R2|data_out[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[12]~17_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(12));

-- Location: LCCOMB_X42_Y25_N16
\CPU|FNU|Bbus[12]~77\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[12]~77_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[12]~74_combout\ & ((\CPU|FNU|R3|data_out\(12)))) # (!\CPU|FNU|Bbus[12]~74_combout\ & (\CPU|FNU|R2|data_out\(12))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[12]~74_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~0_combout\,
	datab => \CPU|FNU|R2|data_out\(12),
	datac => \CPU|FNU|R3|data_out\(12),
	datad => \CPU|FNU|Bbus[12]~74_combout\,
	combout => \CPU|FNU|Bbus[12]~77_combout\);

-- Location: LCCOMB_X42_Y25_N2
\CPU|FNU|Fnc_unit|Add0~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~42_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & ((\CPU|CU|const_out\(12)))) # (!\CPU|CU|ctl_wd\(13) & (\CPU|FNU|Bbus[12]~77_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(9),
	datab => \CPU|CU|ctl_wd\(13),
	datac => \CPU|FNU|Bbus[12]~77_combout\,
	datad => \CPU|CU|const_out\(12),
	combout => \CPU|FNU|Fnc_unit|Add0~42_combout\);

-- Location: LCCOMB_X40_Y26_N14
\CPU|FNU|Fnc_unit|Add0~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~49_combout\ = (\CPU|FNU|Fnc_unit|Add0~48_combout\ & ((\CPU|FNU|Mux1~combout\ & (\CPU|FNU|Fnc_unit|Add0~47\ & VCC)) # (!\CPU|FNU|Mux1~combout\ & (!\CPU|FNU|Fnc_unit|Add0~47\)))) # (!\CPU|FNU|Fnc_unit|Add0~48_combout\ & 
-- ((\CPU|FNU|Mux1~combout\ & (!\CPU|FNU|Fnc_unit|Add0~47\)) # (!\CPU|FNU|Mux1~combout\ & ((\CPU|FNU|Fnc_unit|Add0~47\) # (GND)))))
-- \CPU|FNU|Fnc_unit|Add0~50\ = CARRY((\CPU|FNU|Fnc_unit|Add0~48_combout\ & (!\CPU|FNU|Mux1~combout\ & !\CPU|FNU|Fnc_unit|Add0~47\)) # (!\CPU|FNU|Fnc_unit|Add0~48_combout\ & ((!\CPU|FNU|Fnc_unit|Add0~47\) # (!\CPU|FNU|Mux1~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Add0~48_combout\,
	datab => \CPU|FNU|Mux1~combout\,
	datad => VCC,
	cin => \CPU|FNU|Fnc_unit|Add0~47\,
	combout => \CPU|FNU|Fnc_unit|Add0~49_combout\,
	cout => \CPU|FNU|Fnc_unit|Add0~50\);

-- Location: LCFF_X43_Y25_N27
\CPU|FNU|R1|data_out[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[14]~19_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(14));

-- Location: LCFF_X42_Y26_N15
\CPU|FNU|R7|data_out[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[14]~19_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(14));

-- Location: LCCOMB_X41_Y27_N22
\CPU|FNU|R4|data_out[14]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R4|data_out[14]~feeder_combout\ = \CPU|FNU|func_data[14]~19_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[14]~19_combout\,
	combout => \CPU|FNU|R4|data_out[14]~feeder_combout\);

-- Location: LCFF_X41_Y27_N23
\CPU|FNU|R4|data_out[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R4|data_out[14]~feeder_combout\,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(14));

-- Location: LCFF_X42_Y26_N1
\CPU|FNU|R6|data_out[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[14]~19_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(14));

-- Location: LCCOMB_X42_Y26_N0
\CPU|FNU|Bbus[14]~83\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[14]~83_combout\ = (\CPU|CU|ctl_wd\(1) & (((\CPU|FNU|R6|data_out\(14)) # (\CPU|CU|ctl_wd\(0))))) # (!\CPU|CU|ctl_wd\(1) & (\CPU|FNU|R4|data_out\(14) & ((!\CPU|CU|ctl_wd\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(1),
	datab => \CPU|FNU|R4|data_out\(14),
	datac => \CPU|FNU|R6|data_out\(14),
	datad => \CPU|CU|ctl_wd\(0),
	combout => \CPU|FNU|Bbus[14]~83_combout\);

-- Location: LCCOMB_X42_Y26_N14
\CPU|FNU|Bbus[14]~84\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[14]~84_combout\ = (\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|Bbus[14]~83_combout\ & ((\CPU|FNU|R7|data_out\(14)))) # (!\CPU|FNU|Bbus[14]~83_combout\ & (\CPU|FNU|R5|data_out\(14))))) # (!\CPU|CU|ctl_wd\(0) & (((\CPU|FNU|Bbus[14]~83_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(14),
	datab => \CPU|CU|ctl_wd\(0),
	datac => \CPU|FNU|R7|data_out\(14),
	datad => \CPU|FNU|Bbus[14]~83_combout\,
	combout => \CPU|FNU|Bbus[14]~84_combout\);

-- Location: LCCOMB_X42_Y27_N20
\CPU|FNU|Bbus[14]~85\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[14]~85_combout\ = (\CPU|FNU|Bbus[12]~3_combout\ & ((\CPU|FNU|Bbus[12]~4_combout\ & ((\CPU|FNU|Bbus[14]~84_combout\))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(14))))) # (!\CPU|FNU|Bbus[12]~3_combout\ & 
-- (((\CPU|FNU|Bbus[12]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~3_combout\,
	datab => \CPU|FNU|R1|data_out\(14),
	datac => \CPU|FNU|Bbus[12]~4_combout\,
	datad => \CPU|FNU|Bbus[14]~84_combout\,
	combout => \CPU|FNU|Bbus[14]~85_combout\);

-- Location: LCCOMB_X42_Y27_N14
\CPU|FNU|Bbus[14]~88\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[14]~88_combout\ = (\CPU|FNU|Bbus[14]~85_combout\ & ((\CPU|FNU|R3|data_out\(14)) # ((!\CPU|FNU|Bbus[12]~0_combout\)))) # (!\CPU|FNU|Bbus[14]~85_combout\ & (((\CPU|FNU|R2|data_out\(14) & \CPU|FNU|Bbus[12]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(14),
	datab => \CPU|FNU|R2|data_out\(14),
	datac => \CPU|FNU|Bbus[14]~85_combout\,
	datad => \CPU|FNU|Bbus[12]~0_combout\,
	combout => \CPU|FNU|Bbus[14]~88_combout\);

-- Location: LCCOMB_X42_Y27_N2
\CPU|FNU|Fnc_unit|F_temp~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|F_temp~6_combout\ = (\CPU|FNU|Mux1~combout\) # ((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(14))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[14]~88_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(14),
	datab => \CPU|CU|ctl_wd\(13),
	datac => \CPU|FNU|Bbus[14]~88_combout\,
	datad => \CPU|FNU|Mux1~combout\,
	combout => \CPU|FNU|Fnc_unit|F_temp~6_combout\);

-- Location: LCCOMB_X32_Y25_N18
\CPU|CU|offset~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~37_combout\ = (\CPU|CU|offset~47_combout\ & (((\CPU|CU|IR\(6)) # (\CPU|CU|offset~46_combout\)))) # (!\CPU|CU|offset~47_combout\ & (\CPU|CU|offset\(14) & ((!\CPU|CU|offset~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(14),
	datab => \CPU|CU|offset~47_combout\,
	datac => \CPU|CU|IR\(6),
	datad => \CPU|CU|offset~46_combout\,
	combout => \CPU|CU|offset~37_combout\);

-- Location: LCCOMB_X32_Y25_N4
\CPU|CU|offset~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~38_combout\ = (\CPU|CU|offset~46_combout\ & ((\CPU|CU|offset~37_combout\ & ((\CPU|CU|IR\(7)))) # (!\CPU|CU|offset~37_combout\ & (\CPU|CU|IR\(14))))) # (!\CPU|CU|offset~46_combout\ & (\CPU|CU|offset~37_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~46_combout\,
	datab => \CPU|CU|offset~37_combout\,
	datac => \CPU|CU|IR\(14),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|offset~38_combout\);

-- Location: LCCOMB_X32_Y25_N12
\CPU|CU|Selector124~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector124~0_combout\ = (\CPU|CU|current_state.Decode~regout\ & (((\CPU|CU|offset~38_combout\)))) # (!\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|current_state.Reset~regout\ & ((\CPU|CU|offset\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datab => \CPU|CU|offset~38_combout\,
	datac => \CPU|CU|offset\(14),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Selector124~0_combout\);

-- Location: LCFF_X32_Y25_N13
\CPU|CU|offset[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector124~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(14));

-- Location: LCCOMB_X33_Y27_N6
\CPU|CU|const_out[14]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[14]~14_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(14)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(14),
	datac => \CPU|CU|const_out\(14),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[14]~14_combout\);

-- Location: LCCOMB_X32_Y27_N0
\CPU|CU|Selector90~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector90~0_combout\ = (\CPU|CU|const_out\(14) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(14),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector90~0_combout\);

-- Location: LCFF_X33_Y27_N7
\CPU|CU|const_out[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[14]~14_combout\,
	sdata => \CPU|CU|Selector90~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(14));

-- Location: LCFF_X43_Y25_N25
\CPU|FNU|R3|data_out[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[14]~19_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(14));

-- Location: LCCOMB_X43_Y25_N10
\CPU|FNU|Bbus[14]~86\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[14]~86_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[14]~85_combout\ & (\CPU|FNU|R3|data_out\(14))) # (!\CPU|FNU|Bbus[14]~85_combout\ & ((\CPU|FNU|R2|data_out\(14)))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[14]~85_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~0_combout\,
	datab => \CPU|FNU|R3|data_out\(14),
	datac => \CPU|FNU|R2|data_out\(14),
	datad => \CPU|FNU|Bbus[14]~85_combout\,
	combout => \CPU|FNU|Bbus[14]~86_combout\);

-- Location: LCCOMB_X43_Y25_N12
\CPU|FNU|Bbus[14]~87\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[14]~87_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(14))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[14]~86_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|const_out\(14),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[14]~86_combout\,
	combout => \CPU|FNU|Bbus[14]~87_combout\);

-- Location: LCCOMB_X43_Y25_N16
\CPU|FNU|Fnc_unit|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux1~0_combout\ = (\CPU|FNU|Fnc_unit|Mux3~3_combout\ & (\CPU|FNU|Fnc_unit|Mux3~2_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (\CPU|FNU|Mux1~combout\ & \CPU|FNU|Bbus[14]~87_combout\)) # 
-- (!\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (!\CPU|FNU|Mux1~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100110001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datac => \CPU|FNU|Mux1~combout\,
	datad => \CPU|FNU|Bbus[14]~87_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux1~0_combout\);

-- Location: LCCOMB_X43_Y25_N18
\CPU|FNU|Fnc_unit|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux1~1_combout\ = (\CPU|FNU|Fnc_unit|Mux3~3_combout\ & ((\CPU|FNU|Fnc_unit|Mux1~0_combout\ & (\CPU|FNU|Bbus[14]~87_combout\)) # (!\CPU|FNU|Fnc_unit|Mux1~0_combout\ & ((\CPU|FNU|Mux2~combout\))))) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[14]~87_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux1~0_combout\,
	datad => \CPU|FNU|Mux2~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux1~1_combout\);

-- Location: LCCOMB_X42_Y27_N12
\CPU|FNU|Fnc_unit|Mux1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux1~2_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|F_temp~6_combout\) # ((\CPU|FNU|Fnc_unit|Mux3~1_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (((!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- \CPU|FNU|Fnc_unit|Mux1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datab => \CPU|FNU|Fnc_unit|F_temp~6_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux1~1_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux1~2_combout\);

-- Location: LCCOMB_X42_Y27_N30
\CPU|FNU|Fnc_unit|Mux1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux1~3_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Fnc_unit|Mux1~2_combout\ & ((\CPU|FNU|Mux1~combout\))) # (!\CPU|FNU|Fnc_unit|Mux1~2_combout\ & (\CPU|FNU|Mux0~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- (((\CPU|FNU|Fnc_unit|Mux1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux0~combout\,
	datab => \CPU|FNU|Mux1~combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux1~2_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux1~3_combout\);

-- Location: LCCOMB_X40_Y26_N28
\CPU|FNU|Fnc_unit|Mux1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux1~4_combout\ = (\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Add0~49_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Mux1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datac => \CPU|FNU|Fnc_unit|Add0~49_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux1~3_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux1~4_combout\);

-- Location: LCCOMB_X41_Y27_N6
\CPU|FNU|func_data[14]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[14]~19_combout\ = (\CPU|CU|ctl_wd\(14) & (\data_bus_temp[14]~46_combout\)) # (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datac => \data_bus_temp[14]~46_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux1~4_combout\,
	combout => \CPU|FNU|func_data[14]~19_combout\);

-- Location: LCFF_X42_Y27_N19
\CPU|FNU|R2|data_out[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[14]~19_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(14));

-- Location: LCCOMB_X42_Y27_N4
\CPU|FNU|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux1~0_combout\ = (\CPU|CU|ctl_wd\(4) & (((\CPU|CU|ctl_wd\(3)) # (\CPU|FNU|R6|data_out\(14))))) # (!\CPU|CU|ctl_wd\(4) & (\CPU|FNU|R4|data_out\(14) & (!\CPU|CU|ctl_wd\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(4),
	datab => \CPU|FNU|R4|data_out\(14),
	datac => \CPU|CU|ctl_wd\(3),
	datad => \CPU|FNU|R6|data_out\(14),
	combout => \CPU|FNU|Mux1~0_combout\);

-- Location: LCCOMB_X42_Y27_N22
\CPU|FNU|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux1~1_combout\ = (\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|Mux1~0_combout\ & ((\CPU|FNU|R7|data_out\(14)))) # (!\CPU|FNU|Mux1~0_combout\ & (\CPU|FNU|R5|data_out\(14))))) # (!\CPU|CU|ctl_wd\(3) & (((\CPU|FNU|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(14),
	datab => \CPU|CU|ctl_wd\(3),
	datac => \CPU|FNU|Mux1~0_combout\,
	datad => \CPU|FNU|R7|data_out\(14),
	combout => \CPU|FNU|Mux1~1_combout\);

-- Location: LCCOMB_X42_Y27_N24
\CPU|FNU|Mux1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux1~2_combout\ = (\CPU|FNU|Mux8~2_combout\ & (((\CPU|FNU|Mux1~1_combout\) # (!\CPU|FNU|Mux8~1_combout\)))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(14) & (\CPU|FNU|Mux8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~2_combout\,
	datab => \CPU|FNU|R1|data_out\(14),
	datac => \CPU|FNU|Mux8~1_combout\,
	datad => \CPU|FNU|Mux1~1_combout\,
	combout => \CPU|FNU|Mux1~2_combout\);

-- Location: LCCOMB_X42_Y27_N26
\CPU|FNU|Mux1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux1~combout\ = (\CPU|FNU|Mux1~2_combout\ & ((\CPU|FNU|R3|data_out\(14)) # ((!\CPU|FNU|Mux8~0_combout\)))) # (!\CPU|FNU|Mux1~2_combout\ & (((\CPU|FNU|R2|data_out\(14) & \CPU|FNU|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(14),
	datab => \CPU|FNU|R2|data_out\(14),
	datac => \CPU|FNU|Mux1~2_combout\,
	datad => \CPU|FNU|Mux8~0_combout\,
	combout => \CPU|FNU|Mux1~combout\);

-- Location: LCCOMB_X41_Y25_N12
\CPU|FNU|Fnc_unit|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux2~0_combout\ = (\CPU|FNU|Fnc_unit|Mux3~3_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~2_combout\) # ((\CPU|FNU|Mux3~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~3_combout\ & (!\CPU|FNU|Fnc_unit|Mux3~2_combout\ & ((!\CPU|FNU|Mux2~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datac => \CPU|FNU|Mux3~combout\,
	datad => \CPU|FNU|Mux2~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux2~0_combout\);

-- Location: LCCOMB_X41_Y25_N22
\CPU|FNU|Fnc_unit|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux2~1_combout\ = (\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (\CPU|FNU|Bbus[13]~82_combout\ & ((\CPU|FNU|Mux2~combout\) # (\CPU|FNU|Fnc_unit|Mux2~0_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~2_combout\ & (((\CPU|FNU|Fnc_unit|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datab => \CPU|FNU|Mux2~combout\,
	datac => \CPU|FNU|Bbus[13]~82_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux2~0_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux2~1_combout\);

-- Location: LCCOMB_X38_Y23_N8
\CPU|FNU|Fnc_unit|Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux2~2_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & ((\CPU|FNU|Mux1~combout\) # ((\CPU|FNU|Fnc_unit|Mux3~0_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (((!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & 
-- \CPU|FNU|Fnc_unit|Mux2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Mux1~combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux2~1_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux2~2_combout\);

-- Location: LCCOMB_X41_Y26_N18
\CPU|FNU|Fnc_unit|Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux2~3_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Mux2~combout\) # ((\CPU|FNU|Bbus[13]~82_combout\ & !\CPU|FNU|Fnc_unit|Mux2~2_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (((\CPU|FNU|Fnc_unit|Mux2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datab => \CPU|FNU|Mux2~combout\,
	datac => \CPU|FNU|Bbus[13]~82_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux2~2_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux2~3_combout\);

-- Location: LCCOMB_X41_Y26_N12
\CPU|FNU|Fnc_unit|Mux2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux2~4_combout\ = (\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Add0~46_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Mux2~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Add0~46_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux2~3_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux2~4_combout\);

-- Location: LCCOMB_X41_Y27_N12
\CPU|FNU|func_data[13]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[13]~18_combout\ = (\CPU|CU|ctl_wd\(14) & (\data_bus_temp[13]~43_combout\)) # (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datac => \data_bus_temp[13]~43_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux2~4_combout\,
	combout => \CPU|FNU|func_data[13]~18_combout\);

-- Location: LCFF_X40_Y24_N9
\CPU|FNU|R6|data_out[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[13]~18_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(13));

-- Location: LCCOMB_X41_Y27_N2
\CPU|FNU|R5|data_out[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R5|data_out[13]~feeder_combout\ = \CPU|FNU|func_data[13]~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[13]~18_combout\,
	combout => \CPU|FNU|R5|data_out[13]~feeder_combout\);

-- Location: LCFF_X41_Y27_N3
\CPU|FNU|R5|data_out[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R5|data_out[13]~feeder_combout\,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(13));

-- Location: LCCOMB_X41_Y25_N2
\CPU|FNU|Bbus[13]~78\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[13]~78_combout\ = (\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|R5|data_out\(13)) # ((\CPU|CU|ctl_wd\(1))))) # (!\CPU|CU|ctl_wd\(0) & (((!\CPU|CU|ctl_wd\(1) & \CPU|FNU|R4|data_out\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(0),
	datab => \CPU|FNU|R5|data_out\(13),
	datac => \CPU|CU|ctl_wd\(1),
	datad => \CPU|FNU|R4|data_out\(13),
	combout => \CPU|FNU|Bbus[13]~78_combout\);

-- Location: LCCOMB_X41_Y25_N16
\CPU|FNU|Bbus[13]~79\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[13]~79_combout\ = (\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|Bbus[13]~78_combout\ & ((\CPU|FNU|R7|data_out\(13)))) # (!\CPU|FNU|Bbus[13]~78_combout\ & (\CPU|FNU|R6|data_out\(13))))) # (!\CPU|CU|ctl_wd\(1) & (((\CPU|FNU|Bbus[13]~78_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(1),
	datab => \CPU|FNU|R6|data_out\(13),
	datac => \CPU|FNU|R7|data_out\(13),
	datad => \CPU|FNU|Bbus[13]~78_combout\,
	combout => \CPU|FNU|Bbus[13]~79_combout\);

-- Location: LCCOMB_X41_Y25_N20
\CPU|FNU|Bbus[13]~80\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[13]~80_combout\ = (\CPU|FNU|Bbus[12]~4_combout\ & (((\CPU|FNU|Bbus[13]~79_combout\) # (!\CPU|FNU|Bbus[12]~3_combout\)))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(13) & ((\CPU|FNU|Bbus[12]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(13),
	datab => \CPU|FNU|Bbus[12]~4_combout\,
	datac => \CPU|FNU|Bbus[13]~79_combout\,
	datad => \CPU|FNU|Bbus[12]~3_combout\,
	combout => \CPU|FNU|Bbus[13]~80_combout\);

-- Location: LCCOMB_X41_Y25_N6
\CPU|FNU|Bbus[13]~81\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[13]~81_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[13]~80_combout\ & (\CPU|FNU|R3|data_out\(13))) # (!\CPU|FNU|Bbus[13]~80_combout\ & ((\CPU|FNU|R2|data_out\(13)))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[13]~80_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(13),
	datab => \CPU|FNU|Bbus[12]~0_combout\,
	datac => \CPU|FNU|Bbus[13]~80_combout\,
	datad => \CPU|FNU|R2|data_out\(13),
	combout => \CPU|FNU|Bbus[13]~81_combout\);

-- Location: LCCOMB_X41_Y25_N24
\CPU|FNU|Bbus[13]~82\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[13]~82_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(13))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[13]~81_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(13),
	datab => \CPU|CU|const_out\(13),
	datad => \CPU|FNU|Bbus[13]~81_combout\,
	combout => \CPU|FNU|Bbus[13]~82_combout\);

-- Location: LCCOMB_X37_Y29_N2
\data_bus_temp[13]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[13]~42_combout\ = (\CPU|CU|PCd_EN~regout\ & (\CPU|CU|PC\(13) & ((\CPU|FNU|Bbus[13]~82_combout\) # (!\CPU|CU|st_op~regout\)))) # (!\CPU|CU|PCd_EN~regout\ & (((\CPU|FNU|Bbus[13]~82_combout\)) # (!\CPU|CU|st_op~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PCd_EN~regout\,
	datab => \CPU|CU|st_op~regout\,
	datac => \CPU|CU|PC\(13),
	datad => \CPU|FNU|Bbus[13]~82_combout\,
	combout => \data_bus_temp[13]~42_combout\);

-- Location: LCCOMB_X36_Y24_N22
\data_bus_temp[13]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[13]~41_combout\ = ((\mem_cs_ram~1_combout\ & (\Ram1|altsyncram_component|auto_generated|q_a\(13))) # (!\mem_cs_ram~1_combout\ & ((\ProgMem|altsyncram_component|auto_generated|q_a\(13))))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ram1|altsyncram_component|auto_generated|q_a\(13),
	datab => \ProgMem|altsyncram_component|auto_generated|q_a\(13),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[13]~41_combout\);

-- Location: LCCOMB_X36_Y24_N18
\data_bus_temp[13]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[13]~43_combout\ = ((\data_bus_temp[13]~42_combout\ & \data_bus_temp[13]~41_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_bus_temp[0]~3_combout\,
	datac => \data_bus_temp[13]~42_combout\,
	datad => \data_bus_temp[13]~41_combout\,
	combout => \data_bus_temp[13]~43_combout\);

-- Location: LCFF_X43_Y27_N29
\CPU|CU|IR[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector52~0_combout\,
	sdata => \data_bus_temp[13]~43_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(13));

-- Location: LCCOMB_X34_Y24_N26
\CPU|CU|ctl_wd~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~36_combout\ = (\CPU|CU|ctl_wd~17_combout\ & (!\CPU|CU|ctl_wd~21_combout\ & \CPU|CU|IR\(13))) # (!\CPU|CU|ctl_wd~17_combout\ & (\CPU|CU|ctl_wd~21_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd~17_combout\,
	datac => \CPU|CU|ctl_wd~21_combout\,
	datad => \CPU|CU|IR\(13),
	combout => \CPU|CU|ctl_wd~36_combout\);

-- Location: LCCOMB_X37_Y26_N14
\CPU|CU|ctl_wd~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~37_combout\ = (\CPU|CU|IR\(10) & (((\CPU|CU|ctl_wd~36_combout\ & \CPU|CU|ctl_wd~21_combout\)))) # (!\CPU|CU|IR\(10) & ((\CPU|CU|ctl_wd~36_combout\) # ((\CPU|CU|IR\(6) & \CPU|CU|ctl_wd~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(6),
	datab => \CPU|CU|IR\(10),
	datac => \CPU|CU|ctl_wd~36_combout\,
	datad => \CPU|CU|ctl_wd~21_combout\,
	combout => \CPU|CU|ctl_wd~37_combout\);

-- Location: LCCOMB_X37_Y26_N22
\CPU|CU|Selector83~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector83~0_combout\ = (\CPU|CU|current_state.Decode~regout\ & (((\CPU|CU|ctl_wd~37_combout\)))) # (!\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|current_state.Reset~regout\ & (\CPU|CU|ctl_wd\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|current_state.Reset~regout\,
	datac => \CPU|CU|ctl_wd\(5),
	datad => \CPU|CU|ctl_wd~37_combout\,
	combout => \CPU|CU|Selector83~0_combout\);

-- Location: LCFF_X37_Y26_N23
\CPU|CU|ctl_wd[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector83~0_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(5));

-- Location: LCCOMB_X42_Y27_N16
\CPU|FNU|Mux8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux8~1_combout\ = (\CPU|CU|ctl_wd\(5)) # ((\CPU|CU|ctl_wd\(3) & !\CPU|CU|ctl_wd\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(3),
	datac => \CPU|CU|ctl_wd\(5),
	datad => \CPU|CU|ctl_wd\(4),
	combout => \CPU|FNU|Mux8~1_combout\);

-- Location: LCFF_X41_Y24_N7
\CPU|FNU|R5|data_out[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[6]~4_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(6));

-- Location: LCCOMB_X42_Y23_N28
\CPU|FNU|R4|data_out[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R4|data_out[6]~feeder_combout\ = \CPU|FNU|func_data[6]~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[6]~4_combout\,
	combout => \CPU|FNU|R4|data_out[6]~feeder_combout\);

-- Location: LCFF_X42_Y23_N29
\CPU|FNU|R4|data_out[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R4|data_out[6]~feeder_combout\,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(6));

-- Location: LCCOMB_X42_Y23_N12
\CPU|FNU|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux9~0_combout\ = (\CPU|CU|ctl_wd\(3) & (((\CPU|CU|ctl_wd\(4))))) # (!\CPU|CU|ctl_wd\(3) & ((\CPU|CU|ctl_wd\(4) & (\CPU|FNU|R6|data_out\(6))) # (!\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|R4|data_out\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R6|data_out\(6),
	datab => \CPU|CU|ctl_wd\(3),
	datac => \CPU|FNU|R4|data_out\(6),
	datad => \CPU|CU|ctl_wd\(4),
	combout => \CPU|FNU|Mux9~0_combout\);

-- Location: LCCOMB_X42_Y23_N14
\CPU|FNU|Mux9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux9~1_combout\ = (\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|Mux9~0_combout\ & (\CPU|FNU|R7|data_out\(6))) # (!\CPU|FNU|Mux9~0_combout\ & ((\CPU|FNU|R5|data_out\(6)))))) # (!\CPU|CU|ctl_wd\(3) & (((\CPU|FNU|Mux9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R7|data_out\(6),
	datab => \CPU|CU|ctl_wd\(3),
	datac => \CPU|FNU|R5|data_out\(6),
	datad => \CPU|FNU|Mux9~0_combout\,
	combout => \CPU|FNU|Mux9~1_combout\);

-- Location: LCCOMB_X42_Y23_N24
\CPU|FNU|Mux9~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux9~2_combout\ = (\CPU|FNU|Mux8~1_combout\ & ((\CPU|FNU|Mux8~2_combout\ & ((\CPU|FNU|Mux9~1_combout\))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(6))))) # (!\CPU|FNU|Mux8~1_combout\ & (((\CPU|FNU|Mux8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(6),
	datab => \CPU|FNU|Mux8~1_combout\,
	datac => \CPU|FNU|Mux9~1_combout\,
	datad => \CPU|FNU|Mux8~2_combout\,
	combout => \CPU|FNU|Mux9~2_combout\);

-- Location: LCCOMB_X42_Y23_N10
\CPU|FNU|Mux9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux9~combout\ = (\CPU|FNU|Mux9~2_combout\ & ((\CPU|FNU|R3|data_out\(6)) # ((!\CPU|FNU|Mux8~0_combout\)))) # (!\CPU|FNU|Mux9~2_combout\ & (((\CPU|FNU|R2|data_out\(6) & \CPU|FNU|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(6),
	datab => \CPU|FNU|R2|data_out\(6),
	datac => \CPU|FNU|Mux9~2_combout\,
	datad => \CPU|FNU|Mux8~0_combout\,
	combout => \CPU|FNU|Mux9~combout\);

-- Location: LCCOMB_X42_Y23_N2
\CPU|FNU|Fnc_unit|Mux9~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux9~4_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (((\CPU|FNU|Mux9~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~3_combout\) # (\CPU|FNU|Fnc_unit|Mux3~2_combout\ $ (!\CPU|FNU|Mux9~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datad => \CPU|FNU|Mux9~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux9~4_combout\);

-- Location: LCCOMB_X42_Y23_N20
\CPU|FNU|Fnc_unit|Mux9~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux9~5_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Bbus[6]~34_combout\) # ((\CPU|FNU|Fnc_unit|Mux9~4_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (\CPU|FNU|Fnc_unit|Mux9~4_combout\ & ((\CPU|FNU|Bbus[6]~34_combout\) 
-- # (!\CPU|FNU|Fnc_unit|Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datab => \CPU|FNU|Bbus[6]~34_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux9~4_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux9~5_combout\);

-- Location: LCCOMB_X41_Y24_N6
\CPU|FNU|Fnc_unit|Mux9~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux9~9_combout\ = (\CPU|CU|ctl_wd\(8)) # (\CPU|FNU|Mux10~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(8),
	datad => \CPU|FNU|Mux10~combout\,
	combout => \CPU|FNU|Fnc_unit|Mux9~9_combout\);

-- Location: LCCOMB_X36_Y26_N6
\CPU|FNU|Fnc_unit|Mux9~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux9~6_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (((\CPU|FNU|Fnc_unit|Mux9~4_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & 
-- (\CPU|FNU|Mux8~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datac => \CPU|FNU|Mux8~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux9~4_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux9~6_combout\);

-- Location: LCCOMB_X41_Y24_N24
\CPU|FNU|Fnc_unit|Mux9~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux9~7_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (((\CPU|FNU|Fnc_unit|Mux9~6_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (\CPU|FNU|Fnc_unit|Mux9~5_combout\ & ((\CPU|FNU|Fnc_unit|Mux9~9_combout\) # 
-- (\CPU|FNU|Fnc_unit|Mux9~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux9~5_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux9~9_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux9~6_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux9~7_combout\);

-- Location: LCCOMB_X41_Y24_N26
\CPU|FNU|Fnc_unit|Mux9~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux9~8_combout\ = (\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Add0~22_combout\))) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Mux9~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux9~7_combout\,
	datad => \CPU|FNU|Fnc_unit|Add0~22_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux9~8_combout\);

-- Location: LCCOMB_X41_Y24_N28
\CPU|FNU|func_data[6]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[6]~4_combout\ = (\CPU|CU|ctl_wd\(14) & (\data_bus_temp[6]~10_combout\)) # (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux9~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datac => \data_bus_temp[6]~10_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux9~8_combout\,
	combout => \CPU|FNU|func_data[6]~4_combout\);

-- Location: LCFF_X41_Y24_N17
\CPU|FNU|R7|data_out[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[6]~4_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(6));

-- Location: LCCOMB_X42_Y26_N18
\CPU|FNU|Bbus[6]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[6]~30_combout\ = (\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|R6|data_out\(6)) # ((\CPU|CU|ctl_wd\(0))))) # (!\CPU|CU|ctl_wd\(1) & (((\CPU|FNU|R4|data_out\(6) & !\CPU|CU|ctl_wd\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R6|data_out\(6),
	datab => \CPU|FNU|R4|data_out\(6),
	datac => \CPU|CU|ctl_wd\(1),
	datad => \CPU|CU|ctl_wd\(0),
	combout => \CPU|FNU|Bbus[6]~30_combout\);

-- Location: LCCOMB_X41_Y24_N16
\CPU|FNU|Bbus[6]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[6]~31_combout\ = (\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|Bbus[6]~30_combout\ & ((\CPU|FNU|R7|data_out\(6)))) # (!\CPU|FNU|Bbus[6]~30_combout\ & (\CPU|FNU|R5|data_out\(6))))) # (!\CPU|CU|ctl_wd\(0) & (((\CPU|FNU|Bbus[6]~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(6),
	datab => \CPU|CU|ctl_wd\(0),
	datac => \CPU|FNU|R7|data_out\(6),
	datad => \CPU|FNU|Bbus[6]~30_combout\,
	combout => \CPU|FNU|Bbus[6]~31_combout\);

-- Location: LCCOMB_X42_Y23_N4
\CPU|FNU|Bbus[6]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[6]~32_combout\ = (\CPU|FNU|Bbus[12]~3_combout\ & ((\CPU|FNU|Bbus[12]~4_combout\ & ((\CPU|FNU|Bbus[6]~31_combout\))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(6))))) # (!\CPU|FNU|Bbus[12]~3_combout\ & 
-- (((\CPU|FNU|Bbus[12]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(6),
	datab => \CPU|FNU|Bbus[12]~3_combout\,
	datac => \CPU|FNU|Bbus[12]~4_combout\,
	datad => \CPU|FNU|Bbus[6]~31_combout\,
	combout => \CPU|FNU|Bbus[6]~32_combout\);

-- Location: LCCOMB_X42_Y23_N6
\CPU|FNU|Bbus[6]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[6]~33_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[6]~32_combout\ & (\CPU|FNU|R3|data_out\(6))) # (!\CPU|FNU|Bbus[6]~32_combout\ & ((\CPU|FNU|R2|data_out\(6)))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[6]~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(6),
	datab => \CPU|FNU|Bbus[12]~0_combout\,
	datac => \CPU|FNU|Bbus[6]~32_combout\,
	datad => \CPU|FNU|R2|data_out\(6),
	combout => \CPU|FNU|Bbus[6]~33_combout\);

-- Location: LCCOMB_X42_Y23_N8
\CPU|FNU|Bbus[6]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[6]~34_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(6))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[6]~33_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|const_out\(6),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[6]~33_combout\,
	combout => \CPU|FNU|Bbus[6]~34_combout\);

-- Location: LCCOMB_X37_Y23_N2
\data_bus_temp[6]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[6]~9_combout\ = (\CPU|CU|PCd_EN~regout\ & (\CPU|CU|PC\(6) & ((\CPU|FNU|Bbus[6]~34_combout\) # (!\CPU|CU|st_op~regout\)))) # (!\CPU|CU|PCd_EN~regout\ & (((\CPU|FNU|Bbus[6]~34_combout\)) # (!\CPU|CU|st_op~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PCd_EN~regout\,
	datab => \CPU|CU|st_op~regout\,
	datac => \CPU|FNU|Bbus[6]~34_combout\,
	datad => \CPU|CU|PC\(6),
	combout => \data_bus_temp[6]~9_combout\);

-- Location: LCCOMB_X37_Y23_N8
\data_bus_temp[6]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[6]~8_combout\ = ((\mem_cs_ram~1_combout\ & ((\Ram1|altsyncram_component|auto_generated|q_a\(6)))) # (!\mem_cs_ram~1_combout\ & (\ProgMem|altsyncram_component|auto_generated|q_a\(6)))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ProgMem|altsyncram_component|auto_generated|q_a\(6),
	datab => \Ram1|altsyncram_component|auto_generated|q_a\(6),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[6]~8_combout\);

-- Location: LCCOMB_X37_Y23_N10
\data_bus_temp[6]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[6]~10_combout\ = ((\data_bus_temp[6]~9_combout\ & \data_bus_temp[6]~8_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_bus_temp[6]~9_combout\,
	datac => \data_bus_temp[0]~3_combout\,
	datad => \data_bus_temp[6]~8_combout\,
	combout => \data_bus_temp[6]~10_combout\);

-- Location: LCFF_X37_Y26_N9
\CPU|CU|IR[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector59~0_combout\,
	sdata => \data_bus_temp[6]~10_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(6));

-- Location: LCCOMB_X36_Y22_N4
\CPU|CU|offset~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~22_combout\ = (\CPU|CU|IR\(14) & ((\CPU|CU|IR\(10)) # ((\CPU|CU|IR\(9) & \CPU|CU|IR\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(14),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|offset~22_combout\);

-- Location: LCCOMB_X37_Y26_N12
\CPU|CU|offset~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~49_combout\ = (\CPU|CU|offset~22_combout\ & (((!\CPU|CU|IR\(10) & \CPU|CU|IR\(6))))) # (!\CPU|CU|offset~22_combout\ & (\CPU|CU|offset\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(6),
	datab => \CPU|CU|IR\(10),
	datac => \CPU|CU|IR\(6),
	datad => \CPU|CU|offset~22_combout\,
	combout => \CPU|CU|offset~49_combout\);

-- Location: LCCOMB_X35_Y28_N26
\CPU|CU|offset[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset[6]~6_combout\ = (\CPU|CU|offset~45_combout\ & (\CPU|CU|IR\(6))) # (!\CPU|CU|offset~45_combout\ & ((\CPU|CU|offset~49_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(6),
	datab => \CPU|CU|offset~45_combout\,
	datad => \CPU|CU|offset~49_combout\,
	combout => \CPU|CU|offset[6]~6_combout\);

-- Location: LCCOMB_X37_Y26_N10
\CPU|CU|Selector132~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector132~0_combout\ = (\CPU|CU|offset\(6) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|offset\(6),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector132~0_combout\);

-- Location: LCFF_X35_Y28_N27
\CPU|CU|offset[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|offset[6]~6_combout\,
	sdata => \CPU|CU|Selector132~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(6));

-- Location: LCCOMB_X37_Y26_N28
\CPU|CU|Add0~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~26_combout\ = (!\CPU|CU|Add0~1_combout\ & (\CPU|CU|offset\(6) & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~1_combout\,
	datac => \CPU|CU|offset\(6),
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~26_combout\);

-- Location: LCCOMB_X34_Y27_N2
\CPU|CU|PC[7]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[7]~43_combout\ = (\CPU|CU|current_state.Reset~regout\ & (\CPU|CU|Add0~32_combout\ & (!\CPU|CU|current_state.WB~regout\ & !\CPU|CU|PC[9]~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datab => \CPU|CU|Add0~32_combout\,
	datac => \CPU|CU|current_state.WB~regout\,
	datad => \CPU|CU|PC[9]~23_combout\,
	combout => \CPU|CU|PC[7]~43_combout\);

-- Location: LCFF_X34_Y27_N23
\CPU|CU|PC[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[7]~7_combout\,
	sdata => \CPU|CU|PC[7]~43_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(7));

-- Location: LCCOMB_X37_Y25_N8
\data_bus_temp[7]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[7]~12_combout\ = (\CPU|CU|st_op~regout\ & (\CPU|FNU|Bbus[7]~41_combout\ & ((\CPU|CU|PC\(7)) # (!\CPU|CU|PCd_EN~regout\)))) # (!\CPU|CU|st_op~regout\ & (((\CPU|CU|PC\(7))) # (!\CPU|CU|PCd_EN~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|st_op~regout\,
	datab => \CPU|CU|PCd_EN~regout\,
	datac => \CPU|CU|PC\(7),
	datad => \CPU|FNU|Bbus[7]~41_combout\,
	combout => \data_bus_temp[7]~12_combout\);

-- Location: LCCOMB_X37_Y23_N12
\data_bus_temp[7]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[7]~11_combout\ = ((\mem_cs_ram~1_combout\ & (\Ram1|altsyncram_component|auto_generated|q_a\(7))) # (!\mem_cs_ram~1_combout\ & ((\ProgMem|altsyncram_component|auto_generated|q_a\(7))))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ram1|altsyncram_component|auto_generated|q_a\(7),
	datab => \ProgMem|altsyncram_component|auto_generated|q_a\(7),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[7]~11_combout\);

-- Location: LCCOMB_X37_Y23_N0
\data_bus_temp[7]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[7]~13_combout\ = ((\data_bus_temp[7]~12_combout\ & \data_bus_temp[7]~11_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[0]~3_combout\,
	datab => \data_bus_temp[7]~12_combout\,
	datad => \data_bus_temp[7]~11_combout\,
	combout => \data_bus_temp[7]~13_combout\);

-- Location: LCFF_X37_Y26_N19
\CPU|CU|IR[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector58~0_combout\,
	sdata => \data_bus_temp[7]~13_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(7));

-- Location: LCCOMB_X36_Y28_N4
\CPU|CU|Mux1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Mux1~8_combout\ = (\CPU|CU|IR\(8) & (!\CPU|CU|IR\(9) & (!\CPU|CU|IR\(10) & \CPU|CU|IR\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(8),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|Mux1~8_combout\);

-- Location: LCCOMB_X35_Y28_N2
\CPU|CU|op.srlx~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.srlx~0_combout\ = (!\CPU|CU|IR\(14) & (\CPU|CU|Mux1~8_combout\ & !\CPU|CU|IR\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(14),
	datac => \CPU|CU|Mux1~8_combout\,
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|op.srlx~0_combout\);

-- Location: LCFF_X35_Y28_N3
\CPU|CU|op.srlx\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.srlx~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.srlx~regout\);

-- Location: LCCOMB_X36_Y28_N30
\CPU|CU|Mux1~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Mux1~9_combout\ = (\CPU|CU|IR\(8) & (!\CPU|CU|IR\(9) & (!\CPU|CU|IR\(10) & !\CPU|CU|IR\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(8),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|Mux1~9_combout\);

-- Location: LCCOMB_X35_Y28_N4
\CPU|CU|op.sllx~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.sllx~0_combout\ = (!\CPU|CU|IR\(15) & (!\CPU|CU|IR\(14) & \CPU|CU|Mux1~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(15),
	datab => \CPU|CU|IR\(14),
	datad => \CPU|CU|Mux1~9_combout\,
	combout => \CPU|CU|op.sllx~0_combout\);

-- Location: LCFF_X35_Y28_N5
\CPU|CU|op.sllx\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.sllx~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.sllx~regout\);

-- Location: LCCOMB_X36_Y28_N8
\CPU|CU|Mux1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Mux1~6_combout\ = (!\CPU|CU|IR\(8) & (\CPU|CU|IR\(9) & (!\CPU|CU|IR\(10) & \CPU|CU|IR\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(8),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|Mux1~6_combout\);

-- Location: LCCOMB_X36_Y28_N18
\CPU|CU|op.andx~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.andx~0_combout\ = (\CPU|CU|Mux1~6_combout\ & (!\CPU|CU|IR\(14) & !\CPU|CU|IR\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Mux1~6_combout\,
	datac => \CPU|CU|IR\(14),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|op.andx~0_combout\);

-- Location: LCFF_X36_Y28_N19
\CPU|CU|op.andx\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.andx~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.andx~regout\);

-- Location: LCCOMB_X35_Y28_N6
\CPU|CU|main~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|main~1_combout\ = (\CPU|CU|op.notx~regout\) # ((\CPU|CU|op.srlx~regout\) # ((\CPU|CU|op.sllx~regout\) # (\CPU|CU|op.andx~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.notx~regout\,
	datab => \CPU|CU|op.srlx~regout\,
	datac => \CPU|CU|op.sllx~regout\,
	datad => \CPU|CU|op.andx~regout\,
	combout => \CPU|CU|main~1_combout\);

-- Location: LCCOMB_X36_Y28_N26
\CPU|CU|Mux1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Mux1~3_combout\ = (\CPU|CU|IR\(8) & (\CPU|CU|IR\(9) & (!\CPU|CU|IR\(10) & !\CPU|CU|IR\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(8),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|Mux1~3_combout\);

-- Location: LCCOMB_X37_Y28_N14
\CPU|CU|op.addx~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.addx~0_combout\ = (\CPU|CU|Mux1~3_combout\ & (!\CPU|CU|IR\(14) & !\CPU|CU|IR\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Mux1~3_combout\,
	datac => \CPU|CU|IR\(14),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|op.addx~0_combout\);

-- Location: LCFF_X37_Y28_N15
\CPU|CU|op.addx\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.addx~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.addx~regout\);

-- Location: LCCOMB_X36_Y28_N28
\CPU|CU|Mux1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Mux1~4_combout\ = (!\CPU|CU|IR\(8) & (!\CPU|CU|IR\(9) & (\CPU|CU|IR\(10) & \CPU|CU|IR\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(8),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|Mux1~4_combout\);

-- Location: LCCOMB_X37_Y28_N8
\CPU|CU|op.subx~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.subx~0_combout\ = ((\CPU|CU|IR\(14)) # (\CPU|CU|IR\(15))) # (!\CPU|CU|Mux1~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Mux1~4_combout\,
	datac => \CPU|CU|IR\(14),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|op.subx~0_combout\);

-- Location: LCFF_X37_Y28_N9
\CPU|CU|op.subx\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.subx~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.subx~regout\);

-- Location: LCCOMB_X37_Y28_N2
\CPU|CU|main~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|main~0_combout\ = (\CPU|CU|op.addi~regout\) # ((\CPU|CU|op.addx~regout\) # ((\CPU|CU|op.sethi~regout\) # (!\CPU|CU|op.subx~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.addi~regout\,
	datab => \CPU|CU|op.addx~regout\,
	datac => \CPU|CU|op.subx~regout\,
	datad => \CPU|CU|op.sethi~regout\,
	combout => \CPU|CU|main~0_combout\);

-- Location: LCCOMB_X37_Y28_N30
\CPU|CU|main~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|main~2_combout\ = (\CPU|CU|op.orx~regout\) # ((\CPU|CU|main~1_combout\) # (\CPU|CU|main~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.orx~regout\,
	datac => \CPU|CU|main~1_combout\,
	datad => \CPU|CU|main~0_combout\,
	combout => \CPU|CU|main~2_combout\);

-- Location: LCCOMB_X40_Y25_N2
\CPU|FNU|func_data[15]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[15]~20_combout\ = (\CPU|CU|ctl_wd\(14) & (\data_bus_temp[15]~49_combout\)) # (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd\(14),
	datac => \data_bus_temp[15]~49_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux0~6_combout\,
	combout => \CPU|FNU|func_data[15]~20_combout\);

-- Location: LCFF_X40_Y25_N3
\CPU|FNU|R2|data_out[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|func_data[15]~20_combout\,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(15));

-- Location: LCCOMB_X40_Y24_N10
\CPU|FNU|R7|data_out[15]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R7|data_out[15]~feeder_combout\ = \CPU|FNU|func_data[15]~20_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[15]~20_combout\,
	combout => \CPU|FNU|R7|data_out[15]~feeder_combout\);

-- Location: LCFF_X40_Y24_N11
\CPU|FNU|R7|data_out[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R7|data_out[15]~feeder_combout\,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(15));

-- Location: LCFF_X42_Y28_N11
\CPU|FNU|R5|data_out[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[15]~20_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(15));

-- Location: LCFF_X38_Y25_N29
\CPU|FNU|R4|data_out[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[15]~20_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(15));

-- Location: LCCOMB_X38_Y25_N30
\CPU|FNU|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux0~0_combout\ = (\CPU|CU|ctl_wd\(4) & (\CPU|CU|ctl_wd\(3))) # (!\CPU|CU|ctl_wd\(4) & ((\CPU|CU|ctl_wd\(3) & (\CPU|FNU|R5|data_out\(15))) # (!\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|R4|data_out\(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(4),
	datab => \CPU|CU|ctl_wd\(3),
	datac => \CPU|FNU|R5|data_out\(15),
	datad => \CPU|FNU|R4|data_out\(15),
	combout => \CPU|FNU|Mux0~0_combout\);

-- Location: LCCOMB_X38_Y25_N8
\CPU|FNU|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux0~1_combout\ = (\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|Mux0~0_combout\ & ((\CPU|FNU|R7|data_out\(15)))) # (!\CPU|FNU|Mux0~0_combout\ & (\CPU|FNU|R6|data_out\(15))))) # (!\CPU|CU|ctl_wd\(4) & (((\CPU|FNU|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R6|data_out\(15),
	datab => \CPU|FNU|R7|data_out\(15),
	datac => \CPU|CU|ctl_wd\(4),
	datad => \CPU|FNU|Mux0~0_combout\,
	combout => \CPU|FNU|Mux0~1_combout\);

-- Location: LCFF_X42_Y28_N13
\CPU|FNU|R1|data_out[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[15]~20_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(15));

-- Location: LCCOMB_X38_Y25_N26
\CPU|FNU|Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux0~2_combout\ = (\CPU|FNU|Mux8~2_combout\ & (((\CPU|FNU|Mux0~1_combout\)) # (!\CPU|FNU|Mux8~1_combout\))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|Mux8~1_combout\ & ((\CPU|FNU|R1|data_out\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux8~2_combout\,
	datab => \CPU|FNU|Mux8~1_combout\,
	datac => \CPU|FNU|Mux0~1_combout\,
	datad => \CPU|FNU|R1|data_out\(15),
	combout => \CPU|FNU|Mux0~2_combout\);

-- Location: LCCOMB_X38_Y25_N4
\CPU|FNU|Mux0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux0~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux0~2_combout\ & (\CPU|FNU|R3|data_out\(15))) # (!\CPU|FNU|Mux0~2_combout\ & ((\CPU|FNU|R2|data_out\(15)))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(15),
	datab => \CPU|FNU|R2|data_out\(15),
	datac => \CPU|FNU|Mux8~0_combout\,
	datad => \CPU|FNU|Mux0~2_combout\,
	combout => \CPU|FNU|Mux0~combout\);

-- Location: LCCOMB_X42_Y24_N18
\CPU|CU|Selector123~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector123~1_combout\ = (\CPU|CU|Selector123~0_combout\ & ((\CPU|CU|current_state.Decode~regout\ & (!\CPU|CU|IR\(15))) # (!\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|current_state.Reset~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Selector123~0_combout\,
	datab => \CPU|CU|IR\(15),
	datac => \CPU|CU|current_state.Decode~regout\,
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector123~1_combout\);

-- Location: LCFF_X42_Y24_N19
\CPU|CU|offset[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector123~1_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(15));

-- Location: LCCOMB_X33_Y27_N8
\CPU|CU|const_out[15]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[15]~15_combout\ = (\CPU|CU|const_out~16_combout\ & (\CPU|CU|const_out\(15))) # (!\CPU|CU|const_out~16_combout\ & ((\CPU|CU|offset\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|const_out~16_combout\,
	datac => \CPU|CU|const_out\(15),
	datad => \CPU|CU|offset\(15),
	combout => \CPU|CU|const_out[15]~15_combout\);

-- Location: LCCOMB_X32_Y27_N18
\CPU|CU|Selector89~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector89~0_combout\ = (\CPU|CU|const_out\(15) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|const_out\(15),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector89~0_combout\);

-- Location: LCFF_X33_Y27_N9
\CPU|CU|const_out[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[15]~15_combout\,
	sdata => \CPU|CU|Selector89~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(15));

-- Location: LCFF_X41_Y28_N11
\CPU|FNU|R3|data_out[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[15]~20_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(15));

-- Location: LCFF_X38_Y25_N17
\CPU|FNU|R6|data_out[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[15]~20_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(15));

-- Location: LCCOMB_X38_Y25_N22
\CPU|FNU|Bbus[15]~89\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[15]~89_combout\ = (\CPU|CU|ctl_wd\(0) & (((\CPU|CU|ctl_wd\(1)) # (\CPU|FNU|R5|data_out\(15))))) # (!\CPU|CU|ctl_wd\(0) & (\CPU|FNU|R4|data_out\(15) & (!\CPU|CU|ctl_wd\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(0),
	datab => \CPU|FNU|R4|data_out\(15),
	datac => \CPU|CU|ctl_wd\(1),
	datad => \CPU|FNU|R5|data_out\(15),
	combout => \CPU|FNU|Bbus[15]~89_combout\);

-- Location: LCCOMB_X40_Y24_N30
\CPU|FNU|Bbus[15]~90\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[15]~90_combout\ = (\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|Bbus[15]~89_combout\ & ((\CPU|FNU|R7|data_out\(15)))) # (!\CPU|FNU|Bbus[15]~89_combout\ & (\CPU|FNU|R6|data_out\(15))))) # (!\CPU|CU|ctl_wd\(1) & (((\CPU|FNU|Bbus[15]~89_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(1),
	datab => \CPU|FNU|R6|data_out\(15),
	datac => \CPU|FNU|Bbus[15]~89_combout\,
	datad => \CPU|FNU|R7|data_out\(15),
	combout => \CPU|FNU|Bbus[15]~90_combout\);

-- Location: LCCOMB_X42_Y28_N30
\CPU|FNU|Bbus[15]~91\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[15]~91_combout\ = (\CPU|FNU|Bbus[12]~4_combout\ & (((\CPU|FNU|Bbus[15]~90_combout\) # (!\CPU|FNU|Bbus[12]~3_combout\)))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(15) & (\CPU|FNU|Bbus[12]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~4_combout\,
	datab => \CPU|FNU|R1|data_out\(15),
	datac => \CPU|FNU|Bbus[12]~3_combout\,
	datad => \CPU|FNU|Bbus[15]~90_combout\,
	combout => \CPU|FNU|Bbus[15]~91_combout\);

-- Location: LCCOMB_X41_Y28_N10
\CPU|FNU|Bbus[15]~92\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[15]~92_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[15]~91_combout\ & ((\CPU|FNU|R3|data_out\(15)))) # (!\CPU|FNU|Bbus[15]~91_combout\ & (\CPU|FNU|R2|data_out\(15))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[15]~91_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~0_combout\,
	datab => \CPU|FNU|R2|data_out\(15),
	datac => \CPU|FNU|R3|data_out\(15),
	datad => \CPU|FNU|Bbus[15]~91_combout\,
	combout => \CPU|FNU|Bbus[15]~92_combout\);

-- Location: LCCOMB_X41_Y28_N30
\CPU|FNU|Fnc_unit|Add0~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~51_combout\ = \CPU|CU|ctl_wd\(9) $ (((\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(15))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[15]~92_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(9),
	datab => \CPU|CU|const_out\(15),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[15]~92_combout\,
	combout => \CPU|FNU|Fnc_unit|Add0~51_combout\);

-- Location: LCCOMB_X40_Y26_N16
\CPU|FNU|Fnc_unit|Add0~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Add0~52_combout\ = \CPU|FNU|Mux0~combout\ $ (\CPU|FNU|Fnc_unit|Add0~50\ $ (!\CPU|FNU|Fnc_unit|Add0~51_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \CPU|FNU|Mux0~combout\,
	datad => \CPU|FNU|Fnc_unit|Add0~51_combout\,
	cin => \CPU|FNU|Fnc_unit|Add0~50\,
	combout => \CPU|FNU|Fnc_unit|Add0~52_combout\);

-- Location: LCCOMB_X40_Y25_N0
\CPU|FNU|Fnc_unit|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux0~0_combout\ = (\CPU|FNU|Fnc_unit|Mux3~5_combout\ & ((\CPU|CU|ctl_wd\(6) & ((\CPU|FNU|Fnc_unit|Add0~52_combout\))) # (!\CPU|CU|ctl_wd\(6) & (\CPU|FNU|Bbus[15]~93_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[15]~93_combout\,
	datab => \CPU|CU|ctl_wd\(6),
	datac => \CPU|FNU|Fnc_unit|Add0~52_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux3~5_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux0~0_combout\);

-- Location: LCCOMB_X40_Y25_N18
\CPU|FNU|Fnc_unit|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux0~1_combout\ = (\CPU|FNU|Fnc_unit|Mux0~0_combout\) # ((\CPU|FNU|Mux0~combout\ & ((!\CPU|CU|ctl_wd\(6)) # (!\CPU|FNU|Fnc_unit|Mux3~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~5_combout\,
	datab => \CPU|CU|ctl_wd\(6),
	datac => \CPU|FNU|Mux0~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux0~0_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux0~1_combout\);

-- Location: LCCOMB_X40_Y25_N6
\CPU|FNU|Fnc_unit|Mux0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux0~6_combout\ = (\CPU|CU|ctl_wd\(9) & ((\CPU|FNU|Fnc_unit|Mux0~1_combout\))) # (!\CPU|CU|ctl_wd\(9) & (\CPU|FNU|Fnc_unit|Mux0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux0~5_combout\,
	datab => \CPU|CU|ctl_wd\(9),
	datad => \CPU|FNU|Fnc_unit|Mux0~1_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux0~6_combout\);

-- Location: LCCOMB_X40_Y28_N8
\CPU|CU|PSR[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PSR[1]~1_combout\ = (\CPU|CU|main~2_combout\ & ((\CPU|FNU|Fnc_unit|Mux0~6_combout\))) # (!\CPU|CU|main~2_combout\ & (\CPU|CU|PSR\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|main~2_combout\,
	datac => \CPU|CU|PSR\(1),
	datad => \CPU|FNU|Fnc_unit|Mux0~6_combout\,
	combout => \CPU|CU|PSR[1]~1_combout\);

-- Location: LCCOMB_X40_Y28_N14
\CPU|CU|Selector66~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector66~0_combout\ = (\CPU|CU|current_state.Reset~regout\ & \CPU|CU|PSR\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|current_state.Reset~regout\,
	datac => \CPU|CU|PSR\(1),
	combout => \CPU|CU|Selector66~0_combout\);

-- Location: LCFF_X40_Y28_N9
\CPU|CU|PSR[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PSR[1]~1_combout\,
	sdata => \CPU|CU|Selector66~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PSR\(1));

-- Location: LCCOMB_X43_Y27_N12
\CPU|CU|op.nop~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.nop~0_combout\ = (\CPU|CU|op.orx~0_combout\ & (!\CPU|CU|IR\(15) & (\CPU|CU|ctl_wd~29_combout\))) # (!\CPU|CU|op.orx~0_combout\ & (((\CPU|CU|op.nop~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(15),
	datab => \CPU|CU|ctl_wd~29_combout\,
	datac => \CPU|CU|op.nop~regout\,
	datad => \CPU|CU|op.orx~0_combout\,
	combout => \CPU|CU|op.nop~0_combout\);

-- Location: LCFF_X43_Y27_N13
\CPU|CU|op.nop\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.nop~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.nop~regout\);

-- Location: LCCOMB_X40_Y28_N22
\CPU|CU|PC[9]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[9]~20_combout\ = (\CPU|CU|op.hlt~regout\) # ((\CPU|CU|op.nop~regout\) # ((\CPU|CU|op.bn~regout\ & !\CPU|CU|PSR\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.hlt~regout\,
	datab => \CPU|CU|op.bn~regout\,
	datac => \CPU|CU|PSR\(1),
	datad => \CPU|CU|op.nop~regout\,
	combout => \CPU|CU|PC[9]~20_combout\);

-- Location: LCCOMB_X37_Y28_N6
\CPU|CU|PC[9]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[9]~22_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|PC[9]~20_combout\) # ((\CPU|CU|PC[9]~21_combout\ & !\CPU|CU|op.bn~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC[9]~21_combout\,
	datab => \CPU|CU|op.bn~regout\,
	datac => \CPU|CU|current_state.Execute~regout\,
	datad => \CPU|CU|PC[9]~20_combout\,
	combout => \CPU|CU|PC[9]~22_combout\);

-- Location: LCCOMB_X37_Y26_N26
\CPU|CU|PC[9]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[9]~23_combout\ = (\CPU|CU|current_state.Fetch~regout\ & (((!\CPU|CU|current_state.Execute~regout\)) # (!\CPU|CU|op.jmp~regout\))) # (!\CPU|CU|current_state.Fetch~regout\ & (\CPU|CU|PC[9]~22_combout\ & ((!\CPU|CU|current_state.Execute~regout\) # 
-- (!\CPU|CU|op.jmp~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Fetch~regout\,
	datab => \CPU|CU|op.jmp~regout\,
	datac => \CPU|CU|current_state.Execute~regout\,
	datad => \CPU|CU|PC[9]~22_combout\,
	combout => \CPU|CU|PC[9]~23_combout\);

-- Location: LCCOMB_X34_Y27_N20
\CPU|CU|PC[4]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[4]~25_combout\ = (\CPU|CU|Add0~20_combout\) # ((\CPU|CU|current_state.WB~regout\) # ((\CPU|CU|PC[9]~23_combout\) # (!\CPU|CU|current_state.Reset~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|Add0~20_combout\,
	datab => \CPU|CU|current_state.WB~regout\,
	datac => \CPU|CU|current_state.Reset~regout\,
	datad => \CPU|CU|PC[9]~23_combout\,
	combout => \CPU|CU|PC[4]~25_combout\);

-- Location: LCFF_X34_Y27_N17
\CPU|CU|PC[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[4]~4_combout\,
	sdata => \CPU|CU|PC[4]~25_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(4));

-- Location: LCCOMB_X41_Y26_N16
\data_bus_temp[4]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[4]~2_combout\ = (\CPU|CU|st_op~regout\ & (\CPU|FNU|Bbus[4]~23_combout\ & ((\CPU|CU|PC\(4)) # (!\CPU|CU|PCd_EN~regout\)))) # (!\CPU|CU|st_op~regout\ & ((\CPU|CU|PC\(4)) # ((!\CPU|CU|PCd_EN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|st_op~regout\,
	datab => \CPU|CU|PC\(4),
	datac => \CPU|CU|PCd_EN~regout\,
	datad => \CPU|FNU|Bbus[4]~23_combout\,
	combout => \data_bus_temp[4]~2_combout\);

-- Location: LCCOMB_X41_Y26_N30
\data_bus_temp[4]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[4]~1_combout\ = ((\mem_cs_ram~1_combout\ & ((\Ram1|altsyncram_component|auto_generated|q_a\(4)))) # (!\mem_cs_ram~1_combout\ & (\ProgMem|altsyncram_component|auto_generated|q_a\(4)))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ProgMem|altsyncram_component|auto_generated|q_a\(4),
	datab => \Ram1|altsyncram_component|auto_generated|q_a\(4),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[4]~1_combout\);

-- Location: LCCOMB_X41_Y26_N2
\data_bus_temp[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[4]~4_combout\ = ((\data_bus_temp[4]~2_combout\ & \data_bus_temp[4]~1_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_bus_temp[0]~3_combout\,
	datac => \data_bus_temp[4]~2_combout\,
	datad => \data_bus_temp[4]~1_combout\,
	combout => \data_bus_temp[4]~4_combout\);

-- Location: LCCOMB_X35_Y26_N8
\CPU|CU|AR[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[4]~4_combout\ = (\CPU|CU|op.ret~regout\ & (\data_bus_temp[4]~4_combout\)) # (!\CPU|CU|op.ret~regout\ & ((\CPU|CU|PC~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ret~regout\,
	datab => \data_bus_temp[4]~4_combout\,
	datad => \CPU|CU|PC~19_combout\,
	combout => \CPU|CU|AR[4]~4_combout\);

-- Location: LCCOMB_X35_Y26_N20
\CPU|CU|Selector117~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector117~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(4)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(4))))) # (!\CPU|CU|current_state.Execute~regout\ & (\CPU|CU|PC\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(4),
	datab => \CPU|CU|current_state.Execute~regout\,
	datac => \CPU|CU|op.call~regout\,
	datad => \CPU|CU|offset\(4),
	combout => \CPU|CU|Selector117~0_combout\);

-- Location: LCFF_X35_Y26_N9
\CPU|CU|AR[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[4]~4_combout\,
	sdata => \CPU|CU|Selector117~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(4));

-- Location: LCCOMB_X34_Y26_N30
\CPU|address[4]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[4]~34_combout\ = (\CPU|CU|AR_EN~regout\ & (((\CPU|CU|AR\(4))))) # (!\CPU|CU|AR_EN~regout\ & (((\CPU|CU|SP\(4))) # (!\CPU|CU|SP_EN~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP_EN~regout\,
	datab => \CPU|CU|SP\(4),
	datac => \CPU|CU|AR\(4),
	datad => \CPU|CU|AR_EN~regout\,
	combout => \CPU|address[4]~34_combout\);

-- Location: LCCOMB_X34_Y26_N6
\CPU|address[4]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[4]~47_combout\ = (\CPU|CU|st_op~regout\ & (((\CPU|FNU|Mux11~combout\)))) # (!\CPU|CU|st_op~regout\ & ((\CPU|CU|ld_op~regout\ & ((\CPU|FNU|Mux11~combout\))) # (!\CPU|CU|ld_op~regout\ & (\CPU|address[4]~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|st_op~regout\,
	datab => \CPU|address[4]~34_combout\,
	datac => \CPU|FNU|Mux11~combout\,
	datad => \CPU|CU|ld_op~regout\,
	combout => \CPU|address[4]~47_combout\);

-- Location: M4K_X52_Y25
\Ram1|altsyncram_component|auto_generated|ram_block1a10\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "system_ram:Ram1|altsyncram:altsyncram_component|altsyncram_59a1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_width => 11,
	port_b_data_width => 2,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \CPU|CU|ALT_INV_Mem_wr~regout\,
	clk0 => \clk~clkctrl_outclk\,
	portadatain => \Ram1|altsyncram_component|auto_generated|ram_block1a10_PORTADATAIN_bus\,
	portaaddr => \Ram1|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Ram1|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\);

-- Location: LCCOMB_X41_Y26_N28
\data_bus_temp[11]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[11]~35_combout\ = ((\mem_cs_ram~1_combout\ & ((\Ram1|altsyncram_component|auto_generated|q_a\(11)))) # (!\mem_cs_ram~1_combout\ & (\ProgMem|altsyncram_component|auto_generated|q_a\(11)))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ProgMem|altsyncram_component|auto_generated|q_a\(11),
	datab => \Ram1|altsyncram_component|auto_generated|q_a\(11),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[11]~35_combout\);

-- Location: LCCOMB_X41_Y26_N10
\data_bus_temp[11]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[11]~37_combout\ = ((\data_bus_temp[11]~36_combout\ & \data_bus_temp[11]~35_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[11]~36_combout\,
	datab => \data_bus_temp[0]~3_combout\,
	datad => \data_bus_temp[11]~35_combout\,
	combout => \data_bus_temp[11]~37_combout\);

-- Location: LCFF_X43_Y27_N31
\CPU|CU|IR[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector54~0_combout\,
	sdata => \data_bus_temp[11]~37_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(11));

-- Location: LCCOMB_X43_Y27_N0
\CPU|CU|ctl_wd~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd~31_combout\ = (!\CPU|CU|ctl_wd~29_combout\ & \CPU|CU|IR\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|ctl_wd~29_combout\,
	datad => \CPU|CU|IR\(11),
	combout => \CPU|CU|ctl_wd~31_combout\);

-- Location: LCCOMB_X35_Y28_N0
\CPU|CU|ctl_wd[10]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|ctl_wd[10]~10_combout\ = (\CPU|CU|IR\(15) & (\CPU|CU|ctl_wd\(10))) # (!\CPU|CU|IR\(15) & ((\CPU|CU|ctl_wd~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(15),
	datac => \CPU|CU|ctl_wd\(10),
	datad => \CPU|CU|ctl_wd~31_combout\,
	combout => \CPU|CU|ctl_wd[10]~10_combout\);

-- Location: LCCOMB_X38_Y28_N6
\CPU|CU|Selector78~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector78~0_combout\ = (\CPU|CU|current_state.Reset~regout\ & \CPU|CU|ctl_wd\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datac => \CPU|CU|ctl_wd\(10),
	combout => \CPU|CU|Selector78~0_combout\);

-- Location: LCFF_X35_Y28_N1
\CPU|CU|ctl_wd[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|ctl_wd[10]~10_combout\,
	sdata => \CPU|CU|Selector78~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ctl_wd\(10));

-- Location: LCCOMB_X41_Y28_N18
\CPU|FNU|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Equal0~1_combout\ = (!\CPU|CU|ctl_wd\(12) & (\CPU|CU|ctl_wd\(10) & (\CPU|CU|R_we~regout\ & \CPU|CU|ctl_wd\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(12),
	datab => \CPU|CU|ctl_wd\(10),
	datac => \CPU|CU|R_we~regout\,
	datad => \CPU|CU|ctl_wd\(11),
	combout => \CPU|FNU|Equal0~1_combout\);

-- Location: LCFF_X41_Y28_N29
\CPU|FNU|R3|data_out[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[3]~11_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(3));

-- Location: LCCOMB_X40_Y24_N14
\CPU|FNU|R6|data_out[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R6|data_out[3]~feeder_combout\ = \CPU|FNU|func_data[3]~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[3]~11_combout\,
	combout => \CPU|FNU|R6|data_out[3]~feeder_combout\);

-- Location: LCFF_X40_Y24_N15
\CPU|FNU|R6|data_out[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R6|data_out[3]~feeder_combout\,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(3));

-- Location: LCCOMB_X37_Y27_N24
\CPU|FNU|Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux12~0_combout\ = (\CPU|CU|ctl_wd\(4) & (((\CPU|CU|ctl_wd\(3))))) # (!\CPU|CU|ctl_wd\(4) & ((\CPU|CU|ctl_wd\(3) & ((\CPU|FNU|R5|data_out\(3)))) # (!\CPU|CU|ctl_wd\(3) & (\CPU|FNU|R4|data_out\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(4),
	datab => \CPU|FNU|R4|data_out\(3),
	datac => \CPU|CU|ctl_wd\(3),
	datad => \CPU|FNU|R5|data_out\(3),
	combout => \CPU|FNU|Mux12~0_combout\);

-- Location: LCCOMB_X40_Y24_N4
\CPU|FNU|Mux12~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux12~1_combout\ = (\CPU|CU|ctl_wd\(4) & ((\CPU|FNU|Mux12~0_combout\ & (\CPU|FNU|R7|data_out\(3))) # (!\CPU|FNU|Mux12~0_combout\ & ((\CPU|FNU|R6|data_out\(3)))))) # (!\CPU|CU|ctl_wd\(4) & (((\CPU|FNU|Mux12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R7|data_out\(3),
	datab => \CPU|FNU|R6|data_out\(3),
	datac => \CPU|CU|ctl_wd\(4),
	datad => \CPU|FNU|Mux12~0_combout\,
	combout => \CPU|FNU|Mux12~1_combout\);

-- Location: LCCOMB_X36_Y27_N28
\CPU|FNU|Mux12~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux12~2_combout\ = (\CPU|FNU|Mux8~2_combout\ & (((\CPU|FNU|Mux12~1_combout\) # (!\CPU|FNU|Mux8~1_combout\)))) # (!\CPU|FNU|Mux8~2_combout\ & (\CPU|FNU|R1|data_out\(3) & (\CPU|FNU|Mux8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(3),
	datab => \CPU|FNU|Mux8~2_combout\,
	datac => \CPU|FNU|Mux8~1_combout\,
	datad => \CPU|FNU|Mux12~1_combout\,
	combout => \CPU|FNU|Mux12~2_combout\);

-- Location: LCCOMB_X36_Y27_N14
\CPU|FNU|Mux12\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Mux12~combout\ = (\CPU|FNU|Mux8~0_combout\ & ((\CPU|FNU|Mux12~2_combout\ & ((\CPU|FNU|R3|data_out\(3)))) # (!\CPU|FNU|Mux12~2_combout\ & (\CPU|FNU|R2|data_out\(3))))) # (!\CPU|FNU|Mux8~0_combout\ & (((\CPU|FNU|Mux12~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(3),
	datab => \CPU|FNU|R3|data_out\(3),
	datac => \CPU|FNU|Mux8~0_combout\,
	datad => \CPU|FNU|Mux12~2_combout\,
	combout => \CPU|FNU|Mux12~combout\);

-- Location: LCCOMB_X35_Y25_N26
\CPU|address[3]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[3]~46_combout\ = (\CPU|CU|ld_op~regout\ & (((\CPU|FNU|Mux12~combout\)))) # (!\CPU|CU|ld_op~regout\ & ((\CPU|CU|st_op~regout\ & ((\CPU|FNU|Mux12~combout\))) # (!\CPU|CU|st_op~regout\ & (\CPU|address[3]~33_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ld_op~regout\,
	datab => \CPU|address[3]~33_combout\,
	datac => \CPU|CU|st_op~regout\,
	datad => \CPU|FNU|Mux12~combout\,
	combout => \CPU|address[3]~46_combout\);

-- Location: LCCOMB_X36_Y24_N14
\data_bus_temp[10]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[10]~32_combout\ = ((\mem_cs_ram~1_combout\ & ((\Ram1|altsyncram_component|auto_generated|q_a\(10)))) # (!\mem_cs_ram~1_combout\ & (\ProgMem|altsyncram_component|auto_generated|q_a\(10)))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ProgMem|altsyncram_component|auto_generated|q_a\(10),
	datab => \Ram1|altsyncram_component|auto_generated|q_a\(10),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[10]~32_combout\);

-- Location: LCCOMB_X36_Y24_N6
\data_bus_temp[10]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[10]~34_combout\ = ((\data_bus_temp[10]~33_combout\ & \data_bus_temp[10]~32_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[10]~33_combout\,
	datac => \data_bus_temp[10]~32_combout\,
	datad => \data_bus_temp[0]~3_combout\,
	combout => \data_bus_temp[10]~34_combout\);

-- Location: LCFF_X33_Y24_N9
\CPU|CU|IR[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector55~0_combout\,
	sdata => \data_bus_temp[10]~34_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(10));

-- Location: LCCOMB_X33_Y24_N26
\CPU|CU|offset~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~24_combout\ = (\CPU|CU|offset~22_combout\ & (\CPU|CU|IR\(2) & (!\CPU|CU|IR\(10)))) # (!\CPU|CU|offset~22_combout\ & (((\CPU|CU|offset\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~22_combout\,
	datab => \CPU|CU|IR\(2),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|offset\(2),
	combout => \CPU|CU|offset~24_combout\);

-- Location: LCCOMB_X33_Y28_N26
\CPU|CU|offset[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset[2]~2_combout\ = (\CPU|CU|offset~45_combout\ & (\CPU|CU|IR\(2))) # (!\CPU|CU|offset~45_combout\ & ((\CPU|CU|offset~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(2),
	datab => \CPU|CU|offset~24_combout\,
	datad => \CPU|CU|offset~45_combout\,
	combout => \CPU|CU|offset[2]~2_combout\);

-- Location: LCCOMB_X33_Y28_N20
\CPU|CU|Selector136~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector136~0_combout\ = (\CPU|CU|offset\(2) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(2),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector136~0_combout\);

-- Location: LCFF_X33_Y28_N27
\CPU|CU|offset[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|offset[2]~2_combout\,
	sdata => \CPU|CU|Selector136~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(2));

-- Location: LCCOMB_X33_Y28_N2
\CPU|CU|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Add0~6_combout\ = (\CPU|CU|offset\(2) & (!\CPU|CU|Add0~1_combout\ & !\CPU|CU|current_state.Decode~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(2),
	datac => \CPU|CU|Add0~1_combout\,
	datad => \CPU|CU|current_state.Decode~regout\,
	combout => \CPU|CU|Add0~6_combout\);

-- Location: LCCOMB_X34_Y27_N6
\CPU|CU|PC[2]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[2]~46_combout\ = (\CPU|CU|current_state.Reset~regout\ & (!\CPU|CU|current_state.WB~regout\ & (\CPU|CU|Add0~16_combout\ & !\CPU|CU|PC[9]~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datab => \CPU|CU|current_state.WB~regout\,
	datac => \CPU|CU|Add0~16_combout\,
	datad => \CPU|CU|PC[9]~23_combout\,
	combout => \CPU|CU|PC[2]~46_combout\);

-- Location: LCFF_X34_Y27_N27
\CPU|CU|PC[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[2]~2_combout\,
	sdata => \CPU|CU|PC[2]~46_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(2));

-- Location: LCCOMB_X34_Y27_N18
\CPU|CU|PC~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~34_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(2)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|PC\(2),
	datac => \CPU|CU|offset\(2),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|PC~34_combout\);

-- Location: LCCOMB_X35_Y26_N28
\CPU|CU|AR[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[2]~2_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[2]~22_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~34_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ret~regout\,
	datab => \CPU|CU|PC~34_combout\,
	datad => \data_bus_temp[2]~22_combout\,
	combout => \CPU|CU|AR[2]~2_combout\);

-- Location: LCCOMB_X34_Y27_N4
\CPU|CU|Selector119~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector119~0_combout\ = (\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|op.call~regout\ & ((\CPU|CU|offset\(2)))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(2))))) # (!\CPU|CU|current_state.Execute~regout\ & (\CPU|CU|PC\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Execute~regout\,
	datab => \CPU|CU|PC\(2),
	datac => \CPU|CU|offset\(2),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|Selector119~0_combout\);

-- Location: LCFF_X35_Y26_N29
\CPU|CU|AR[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[2]~2_combout\,
	sdata => \CPU|CU|Selector119~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(2));

-- Location: LCCOMB_X34_Y25_N26
\CPU|address[2]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[2]~32_combout\ = (\CPU|CU|AR_EN~regout\ & (((\CPU|CU|AR\(2))))) # (!\CPU|CU|AR_EN~regout\ & (((\CPU|CU|SP\(2))) # (!\CPU|CU|SP_EN~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|SP_EN~regout\,
	datab => \CPU|CU|AR\(2),
	datac => \CPU|CU|SP\(2),
	datad => \CPU|CU|AR_EN~regout\,
	combout => \CPU|address[2]~32_combout\);

-- Location: LCCOMB_X34_Y25_N12
\CPU|address[2]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[2]~45_combout\ = (\CPU|CU|ld_op~regout\ & (\CPU|FNU|Mux13~combout\)) # (!\CPU|CU|ld_op~regout\ & ((\CPU|CU|st_op~regout\ & (\CPU|FNU|Mux13~combout\)) # (!\CPU|CU|st_op~regout\ & ((\CPU|address[2]~32_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux13~combout\,
	datab => \CPU|address[2]~32_combout\,
	datac => \CPU|CU|ld_op~regout\,
	datad => \CPU|CU|st_op~regout\,
	combout => \CPU|address[2]~45_combout\);

-- Location: LCCOMB_X36_Y24_N4
\data_bus_temp[9]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[9]~29_combout\ = ((\mem_cs_ram~1_combout\ & ((\Ram1|altsyncram_component|auto_generated|q_a\(9)))) # (!\mem_cs_ram~1_combout\ & (\ProgMem|altsyncram_component|auto_generated|q_a\(9)))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ProgMem|altsyncram_component|auto_generated|q_a\(9),
	datab => \Ram1|altsyncram_component|auto_generated|q_a\(9),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[9]~29_combout\);

-- Location: LCCOMB_X36_Y24_N12
\data_bus_temp[9]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[9]~31_combout\ = ((\data_bus_temp[9]~30_combout\ & \data_bus_temp[9]~29_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[9]~30_combout\,
	datac => \data_bus_temp[9]~29_combout\,
	datad => \data_bus_temp[0]~3_combout\,
	combout => \data_bus_temp[9]~31_combout\);

-- Location: LCFF_X36_Y22_N1
\CPU|CU|IR[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector56~0_combout\,
	sdata => \data_bus_temp[9]~31_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(9));

-- Location: LCCOMB_X43_Y27_N24
\CPU|CU|offset~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~45_combout\ = (\CPU|CU|IR\(15)) # ((\CPU|CU|offset~22_combout\ & ((!\CPU|CU|IR\(9)) # (!\CPU|CU|IR\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset~22_combout\,
	datab => \CPU|CU|IR\(8),
	datac => \CPU|CU|IR\(9),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|offset~45_combout\);

-- Location: LCCOMB_X34_Y24_N18
\CPU|CU|Selector64~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector64~0_combout\ = (\CPU|CU|IR\(1) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(1),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector64~0_combout\);

-- Location: LCFF_X34_Y24_N19
\CPU|CU|IR[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector64~0_combout\,
	sdata => \data_bus_temp[1]~19_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(1));

-- Location: LCCOMB_X34_Y24_N8
\CPU|CU|offset~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset~25_combout\ = (\CPU|CU|offset~22_combout\ & (!\CPU|CU|IR\(10) & ((\CPU|CU|IR\(1))))) # (!\CPU|CU|offset~22_combout\ & (((\CPU|CU|offset\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(10),
	datab => \CPU|CU|offset\(1),
	datac => \CPU|CU|offset~22_combout\,
	datad => \CPU|CU|IR\(1),
	combout => \CPU|CU|offset~25_combout\);

-- Location: LCCOMB_X35_Y28_N30
\CPU|CU|offset[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|offset[1]~1_combout\ = (\CPU|CU|offset~45_combout\ & (\CPU|CU|IR\(1))) # (!\CPU|CU|offset~45_combout\ & ((\CPU|CU|offset~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(1),
	datab => \CPU|CU|offset~45_combout\,
	datad => \CPU|CU|offset~25_combout\,
	combout => \CPU|CU|offset[1]~1_combout\);

-- Location: LCCOMB_X35_Y28_N24
\CPU|CU|Selector137~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector137~0_combout\ = (\CPU|CU|offset\(1) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(1),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector137~0_combout\);

-- Location: LCFF_X35_Y28_N31
\CPU|CU|offset[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|offset[1]~1_combout\,
	sdata => \CPU|CU|Selector137~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Decode~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|offset\(1));

-- Location: LCCOMB_X34_Y28_N24
\CPU|CU|PC~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~33_combout\ = (\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(1))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|offset\(1),
	datac => \CPU|CU|PC\(1),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|PC~33_combout\);

-- Location: LCCOMB_X35_Y26_N10
\CPU|CU|AR[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|AR[1]~1_combout\ = (\CPU|CU|op.ret~regout\ & ((\data_bus_temp[1]~19_combout\))) # (!\CPU|CU|op.ret~regout\ & (\CPU|CU|PC~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ret~regout\,
	datab => \CPU|CU|PC~33_combout\,
	datad => \data_bus_temp[1]~19_combout\,
	combout => \CPU|CU|AR[1]~1_combout\);

-- Location: LCCOMB_X34_Y28_N26
\CPU|CU|Selector120~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector120~0_combout\ = (\CPU|CU|op.call~regout\ & ((\CPU|CU|current_state.Execute~regout\ & ((\CPU|CU|offset\(1)))) # (!\CPU|CU|current_state.Execute~regout\ & (\CPU|CU|PC\(1))))) # (!\CPU|CU|op.call~regout\ & (\CPU|CU|PC\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.call~regout\,
	datab => \CPU|CU|PC\(1),
	datac => \CPU|CU|current_state.Execute~regout\,
	datad => \CPU|CU|offset\(1),
	combout => \CPU|CU|Selector120~0_combout\);

-- Location: LCFF_X35_Y26_N11
\CPU|CU|AR[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|AR[1]~1_combout\,
	sdata => \CPU|CU|Selector120~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.WB~regout\,
	ena => \CPU|CU|AR[0]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|AR\(1));

-- Location: LCCOMB_X34_Y25_N8
\CPU|address[1]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[1]~31_combout\ = (\CPU|CU|AR_EN~regout\ & (((\CPU|CU|AR\(1))))) # (!\CPU|CU|AR_EN~regout\ & ((\CPU|CU|SP\(1)) # ((!\CPU|CU|SP_EN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|AR_EN~regout\,
	datab => \CPU|CU|SP\(1),
	datac => \CPU|CU|SP_EN~regout\,
	datad => \CPU|CU|AR\(1),
	combout => \CPU|address[1]~31_combout\);

-- Location: LCCOMB_X34_Y25_N18
\CPU|address[1]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[1]~44_combout\ = (\CPU|CU|ld_op~regout\ & (\CPU|FNU|Mux14~combout\)) # (!\CPU|CU|ld_op~regout\ & ((\CPU|CU|st_op~regout\ & (\CPU|FNU|Mux14~combout\)) # (!\CPU|CU|st_op~regout\ & ((\CPU|address[1]~31_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux14~combout\,
	datab => \CPU|CU|ld_op~regout\,
	datac => \CPU|address[1]~31_combout\,
	datad => \CPU|CU|st_op~regout\,
	combout => \CPU|address[1]~44_combout\);

-- Location: M4K_X26_Y25
\Ram1|altsyncram_component|auto_generated|ram_block1a14\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "system_ram:Ram1|altsyncram:altsyncram_component|altsyncram_59a1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 14,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_width => 11,
	port_b_data_width => 2,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \CPU|CU|ALT_INV_Mem_wr~regout\,
	clk0 => \clk~clkctrl_outclk\,
	portadatain => \Ram1|altsyncram_component|auto_generated|ram_block1a14_PORTADATAIN_bus\,
	portaaddr => \Ram1|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Ram1|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\);

-- Location: LCCOMB_X35_Y25_N30
\data_bus_temp[14]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[14]~44_combout\ = ((\mem_cs_ram~1_combout\ & ((\Ram1|altsyncram_component|auto_generated|q_a\(14)))) # (!\mem_cs_ram~1_combout\ & (\ProgMem|altsyncram_component|auto_generated|q_a\(14)))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ProgMem|altsyncram_component|auto_generated|q_a\(14),
	datab => \Ram1|altsyncram_component|auto_generated|q_a\(14),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[14]~44_combout\);

-- Location: LCCOMB_X35_Y25_N8
\data_bus_temp[14]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[14]~46_combout\ = ((\data_bus_temp[14]~45_combout\ & \data_bus_temp[14]~44_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[14]~45_combout\,
	datac => \data_bus_temp[0]~3_combout\,
	datad => \data_bus_temp[14]~44_combout\,
	combout => \data_bus_temp[14]~46_combout\);

-- Location: LCFF_X36_Y22_N11
\CPU|CU|IR[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector51~0_combout\,
	sdata => \data_bus_temp[14]~46_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(14));

-- Location: LCCOMB_X35_Y28_N16
\CPU|CU|op.sethi~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.sethi~0_combout\ = (\CPU|CU|IR\(14) & !\CPU|CU|IR\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|IR\(14),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|op.sethi~0_combout\);

-- Location: LCCOMB_X37_Y28_N16
\CPU|CU|op.ret~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.ret~0_combout\ = (!\CPU|CU|IR\(9) & (\CPU|CU|op.sethi~0_combout\ & (!\CPU|CU|IR\(10) & \CPU|CU|IR\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(9),
	datab => \CPU|CU|op.sethi~0_combout\,
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(8),
	combout => \CPU|CU|op.ret~0_combout\);

-- Location: LCFF_X37_Y28_N17
\CPU|CU|op.ret\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.ret~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.ret~regout\);

-- Location: LCCOMB_X40_Y28_N18
\CPU|CU|Selector68~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector68~0_combout\ = (!\CPU|CU|op.ld~regout\ & (!\CPU|CU|op.ret~regout\ & (\CPU|CU|current_state.Execute~regout\ & !\CPU|CU|Mem_rd~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ld~regout\,
	datab => \CPU|CU|op.ret~regout\,
	datac => \CPU|CU|current_state.Execute~regout\,
	datad => \CPU|CU|Mem_rd~regout\,
	combout => \CPU|CU|Selector68~0_combout\);

-- Location: LCCOMB_X35_Y28_N22
\CPU|CU|Selector68~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector68~1_combout\ = (!\CPU|CU|current_state.Decode~regout\ & !\CPU|CU|Selector68~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|current_state.Decode~regout\,
	datac => \CPU|CU|Selector68~0_combout\,
	combout => \CPU|CU|Selector68~1_combout\);

-- Location: LCFF_X35_Y28_N23
\CPU|CU|Mem_rd\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector68~1_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|Mem_rd~regout\);

-- Location: LCCOMB_X40_Y28_N4
\CPU|CU|Selector70~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector70~0_combout\ = (!\CPU|CU|op.ld~regout\ & (!\CPU|CU|op.ret~regout\ & (\CPU|CU|current_state.Execute~regout\ & !\CPU|CU|Mem_cs~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ld~regout\,
	datab => \CPU|CU|op.ret~regout\,
	datac => \CPU|CU|current_state.Execute~regout\,
	datad => \CPU|CU|Mem_cs~regout\,
	combout => \CPU|CU|Selector70~0_combout\);

-- Location: LCCOMB_X36_Y28_N24
\CPU|CU|Mux1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Mux1~2_combout\ = (!\CPU|CU|IR\(8) & (!\CPU|CU|IR\(9) & (!\CPU|CU|IR\(10) & !\CPU|CU|IR\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|IR\(8),
	datab => \CPU|CU|IR\(9),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(7),
	combout => \CPU|CU|Mux1~2_combout\);

-- Location: LCCOMB_X40_Y28_N6
\CPU|CU|op.st~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.st~0_combout\ = (\CPU|CU|Mux1~2_combout\ & (!\CPU|CU|IR\(14) & !\CPU|CU|IR\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|Mux1~2_combout\,
	datac => \CPU|CU|IR\(14),
	datad => \CPU|CU|IR\(15),
	combout => \CPU|CU|op.st~0_combout\);

-- Location: LCFF_X40_Y28_N7
\CPU|CU|op.st\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.st~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.st~regout\);

-- Location: LCCOMB_X40_Y28_N10
\CPU|CU|Selector70~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector70~1_combout\ = (!\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|op.call~regout\) # ((\CPU|CU|op.st~regout\) # (!\CPU|CU|Selector70~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.call~regout\,
	datab => \CPU|CU|current_state.Decode~regout\,
	datac => \CPU|CU|Selector70~0_combout\,
	datad => \CPU|CU|op.st~regout\,
	combout => \CPU|CU|Selector70~1_combout\);

-- Location: LCFF_X40_Y28_N11
\CPU|CU|Mem_cs\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector70~1_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|Mem_cs~regout\);

-- Location: LCCOMB_X36_Y29_N16
\mem_cs_ram~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \mem_cs_ram~0_combout\ = (\CPU|CU|Mem_rd~regout\ & \CPU|CU|Mem_cs~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|Mem_rd~regout\,
	datad => \CPU|CU|Mem_cs~regout\,
	combout => \mem_cs_ram~0_combout\);

-- Location: LCCOMB_X37_Y25_N28
\data_bus_temp[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[2]~0_combout\ = (\mem_cs_ram~0_combout\ & (((!\CPU|address[10]~40_combout\ & !\CPU|address[11]~41_combout\)) # (!\CPU|address[12]~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|address[12]~42_combout\,
	datab => \mem_cs_ram~0_combout\,
	datac => \CPU|address[10]~40_combout\,
	datad => \CPU|address[11]~41_combout\,
	combout => \data_bus_temp[2]~0_combout\);

-- Location: LCCOMB_X37_Y25_N22
\data_bus_temp[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[0]~3_combout\ = (\CPU|CU|st_op~regout\) # ((\CPU|CU|PCd_EN~regout\) # (\data_bus_temp[2]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|st_op~regout\,
	datab => \CPU|CU|PCd_EN~regout\,
	datad => \data_bus_temp[2]~0_combout\,
	combout => \data_bus_temp[0]~3_combout\);

-- Location: LCCOMB_X37_Y23_N20
\data_bus_temp[15]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[15]~47_combout\ = ((\mem_cs_ram~1_combout\ & ((\Ram1|altsyncram_component|auto_generated|q_a\(15)))) # (!\mem_cs_ram~1_combout\ & (\ProgMem|altsyncram_component|auto_generated|q_a\(15)))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ProgMem|altsyncram_component|auto_generated|q_a\(15),
	datab => \Ram1|altsyncram_component|auto_generated|q_a\(15),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[15]~47_combout\);

-- Location: LCCOMB_X41_Y28_N28
\CPU|FNU|Bbus[15]~93\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[15]~93_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(15))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[15]~92_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(13),
	datab => \CPU|CU|const_out\(15),
	datad => \CPU|FNU|Bbus[15]~92_combout\,
	combout => \CPU|FNU|Bbus[15]~93_combout\);

-- Location: LCCOMB_X37_Y23_N30
\data_bus_temp[15]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[15]~48_combout\ = (\CPU|CU|PC\(15) & (((\CPU|FNU|Bbus[15]~93_combout\)) # (!\CPU|CU|st_op~regout\))) # (!\CPU|CU|PC\(15) & (!\CPU|CU|PCd_EN~regout\ & ((\CPU|FNU|Bbus[15]~93_combout\) # (!\CPU|CU|st_op~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC\(15),
	datab => \CPU|CU|st_op~regout\,
	datac => \CPU|CU|PCd_EN~regout\,
	datad => \CPU|FNU|Bbus[15]~93_combout\,
	combout => \data_bus_temp[15]~48_combout\);

-- Location: LCCOMB_X37_Y23_N18
\data_bus_temp[15]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[15]~49_combout\ = ((\data_bus_temp[15]~47_combout\ & \data_bus_temp[15]~48_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_bus_temp[0]~3_combout\,
	datac => \data_bus_temp[15]~47_combout\,
	datad => \data_bus_temp[15]~48_combout\,
	combout => \data_bus_temp[15]~49_combout\);

-- Location: LCFF_X36_Y28_N11
\CPU|CU|IR[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector50~0_combout\,
	sdata => \data_bus_temp[15]~49_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(15));

-- Location: LCFF_X38_Y28_N1
\CPU|CU|op.call\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|CU|IR\(15),
	sload => VCC,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.call~regout\);

-- Location: LCCOMB_X36_Y26_N8
\CPU|CU|PC~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC~39_combout\ = (\CPU|CU|op.call~regout\ & (\CPU|CU|offset\(8))) # (!\CPU|CU|op.call~regout\ & ((\CPU|CU|PC\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(8),
	datab => \CPU|CU|PC\(8),
	datad => \CPU|CU|op.call~regout\,
	combout => \CPU|CU|PC~39_combout\);

-- Location: LCCOMB_X34_Y28_N4
\CPU|CU|PC[8]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[8]~8_combout\ = (\CPU|CU|PC[10]~24_combout\ & (\CPU|CU|PC~39_combout\)) # (!\CPU|CU|PC[10]~24_combout\ & ((\data_bus_temp[8]~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC[10]~24_combout\,
	datab => \CPU|CU|PC~39_combout\,
	datad => \data_bus_temp[8]~28_combout\,
	combout => \CPU|CU|PC[8]~8_combout\);

-- Location: LCCOMB_X34_Y26_N26
\CPU|CU|PC[8]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[8]~48_combout\ = (!\CPU|CU|PC[9]~23_combout\ & (!\CPU|CU|current_state.WB~regout\ & (\CPU|CU|current_state.Reset~regout\ & \CPU|CU|Add0~36_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PC[9]~23_combout\,
	datab => \CPU|CU|current_state.WB~regout\,
	datac => \CPU|CU|current_state.Reset~regout\,
	datad => \CPU|CU|Add0~36_combout\,
	combout => \CPU|CU|PC[8]~48_combout\);

-- Location: LCFF_X34_Y28_N5
\CPU|CU|PC[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[8]~8_combout\,
	sdata => \CPU|CU|PC[8]~48_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(8));

-- Location: LCFF_X38_Y26_N25
\CPU|FNU|R3|data_out[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[8]~12_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R3|data_out\(8));

-- Location: LCCOMB_X42_Y28_N0
\CPU|FNU|Bbus[8]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[8]~51_combout\ = (\CPU|FNU|Bbus[8]~50_combout\ & (((\CPU|FNU|R3|data_out\(8)) # (!\CPU|FNU|Bbus[12]~0_combout\)))) # (!\CPU|FNU|Bbus[8]~50_combout\ & (\CPU|FNU|R2|data_out\(8) & ((\CPU|FNU|Bbus[12]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[8]~50_combout\,
	datab => \CPU|FNU|R2|data_out\(8),
	datac => \CPU|FNU|R3|data_out\(8),
	datad => \CPU|FNU|Bbus[12]~0_combout\,
	combout => \CPU|FNU|Bbus[8]~51_combout\);

-- Location: LCCOMB_X42_Y28_N20
\CPU|FNU|Bbus[8]~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[8]~52_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(8))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[8]~51_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(13),
	datab => \CPU|CU|const_out\(8),
	datad => \CPU|FNU|Bbus[8]~51_combout\,
	combout => \CPU|FNU|Bbus[8]~52_combout\);

-- Location: LCCOMB_X36_Y26_N0
\data_bus_temp[8]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[8]~27_combout\ = (\CPU|CU|st_op~regout\ & (\CPU|FNU|Bbus[8]~52_combout\ & ((\CPU|CU|PC\(8)) # (!\CPU|CU|PCd_EN~regout\)))) # (!\CPU|CU|st_op~regout\ & ((\CPU|CU|PC\(8)) # ((!\CPU|CU|PCd_EN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|st_op~regout\,
	datab => \CPU|CU|PC\(8),
	datac => \CPU|FNU|Bbus[8]~52_combout\,
	datad => \CPU|CU|PCd_EN~regout\,
	combout => \data_bus_temp[8]~27_combout\);

-- Location: LCCOMB_X36_Y24_N26
\data_bus_temp[8]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[8]~26_combout\ = ((\mem_cs_ram~1_combout\ & (\Ram1|altsyncram_component|auto_generated|q_a\(8))) # (!\mem_cs_ram~1_combout\ & ((\ProgMem|altsyncram_component|auto_generated|q_a\(8))))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ram1|altsyncram_component|auto_generated|q_a\(8),
	datab => \ProgMem|altsyncram_component|auto_generated|q_a\(8),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[8]~26_combout\);

-- Location: LCCOMB_X36_Y26_N26
\data_bus_temp[8]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[8]~28_combout\ = ((\data_bus_temp[8]~27_combout\ & \data_bus_temp[8]~26_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_bus_temp[8]~27_combout\,
	datac => \data_bus_temp[8]~26_combout\,
	datad => \data_bus_temp[0]~3_combout\,
	combout => \data_bus_temp[8]~28_combout\);

-- Location: LCFF_X36_Y28_N17
\CPU|CU|IR[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector57~0_combout\,
	sdata => \data_bus_temp[8]~28_combout\,
	sload => \CPU|CU|current_state.Fetch~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|IR\(8));

-- Location: LCCOMB_X40_Y28_N16
\CPU|CU|op.hlt~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|op.hlt~0_combout\ = (\CPU|CU|op.sethi~0_combout\ & (!\CPU|CU|IR\(8) & (!\CPU|CU|IR\(10) & !\CPU|CU|IR\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.sethi~0_combout\,
	datab => \CPU|CU|IR\(8),
	datac => \CPU|CU|IR\(10),
	datad => \CPU|CU|IR\(9),
	combout => \CPU|CU|op.hlt~0_combout\);

-- Location: LCFF_X40_Y28_N17
\CPU|CU|op.hlt\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|op.hlt~0_combout\,
	ena => \CPU|CU|op.orx~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|op.hlt~regout\);

-- Location: LCCOMB_X40_Y28_N2
\CPU|CU|Selector72~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector72~0_combout\ = (\CPU|CU|op.ld~regout\) # ((\CPU|CU|ld_op~regout\ & ((\CPU|CU|op.hlt~regout\) # (\CPU|CU|op.nop~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|op.ld~regout\,
	datab => \CPU|CU|ld_op~regout\,
	datac => \CPU|CU|op.hlt~regout\,
	datad => \CPU|CU|op.nop~regout\,
	combout => \CPU|CU|Selector72~0_combout\);

-- Location: LCCOMB_X40_Y28_N28
\CPU|CU|Selector72~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector72~1_combout\ = (\CPU|CU|current_state.Decode~regout\ & ((\CPU|CU|ld_op~0_combout\) # ((\CPU|CU|Selector72~0_combout\ & \CPU|CU|current_state.Execute~regout\)))) # (!\CPU|CU|current_state.Decode~regout\ & (\CPU|CU|Selector72~0_combout\ & 
-- (\CPU|CU|current_state.Execute~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Decode~regout\,
	datab => \CPU|CU|Selector72~0_combout\,
	datac => \CPU|CU|current_state.Execute~regout\,
	datad => \CPU|CU|ld_op~0_combout\,
	combout => \CPU|CU|Selector72~1_combout\);

-- Location: LCFF_X40_Y28_N29
\CPU|CU|ld_op\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|Selector72~1_combout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|ld_op~regout\);

-- Location: LCCOMB_X34_Y25_N16
\CPU|address[0]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[0]~43_combout\ = (\CPU|CU|ld_op~regout\ & (((\CPU|FNU|Mux15~combout\)))) # (!\CPU|CU|ld_op~regout\ & ((\CPU|CU|st_op~regout\ & ((\CPU|FNU|Mux15~combout\))) # (!\CPU|CU|st_op~regout\ & (\CPU|address[0]~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|address[0]~30_combout\,
	datab => \CPU|CU|ld_op~regout\,
	datac => \CPU|FNU|Mux15~combout\,
	datad => \CPU|CU|st_op~regout\,
	combout => \CPU|address[0]~43_combout\);

-- Location: M4K_X26_Y24
\Ram1|altsyncram_component|auto_generated|ram_block1a2\ : cycloneii_ram_block
-- pragma translate_off
GENERIC MAP (
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "system_ram:Ram1|altsyncram:altsyncram_component|altsyncram_59a1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clear => "none",
	port_a_byte_enable_clock => "none",
	port_a_data_in_clear => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 16,
	port_a_write_enable_clear => "none",
	port_b_address_width => 11,
	port_b_data_width => 2,
	ram_block_type => "M4K",
	safe_write => "err_on_2clk")
-- pragma translate_on
PORT MAP (
	portawe => \CPU|CU|ALT_INV_Mem_wr~regout\,
	clk0 => \clk~clkctrl_outclk\,
	portadatain => \Ram1|altsyncram_component|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \Ram1|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Ram1|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y24_N28
\data_bus_temp[2]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[2]~20_combout\ = ((\mem_cs_ram~1_combout\ & ((\Ram1|altsyncram_component|auto_generated|q_a\(2)))) # (!\mem_cs_ram~1_combout\ & (\ProgMem|altsyncram_component|auto_generated|q_a\(2)))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ProgMem|altsyncram_component|auto_generated|q_a\(2),
	datab => \Ram1|altsyncram_component|auto_generated|q_a\(2),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[2]~20_combout\);

-- Location: LCCOMB_X33_Y27_N20
\CPU|CU|const_out[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|const_out[2]~2_combout\ = (\CPU|CU|const_out~16_combout\ & ((\CPU|CU|const_out\(2)))) # (!\CPU|CU|const_out~16_combout\ & (\CPU|CU|offset\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|offset\(2),
	datac => \CPU|CU|const_out\(2),
	datad => \CPU|CU|const_out~16_combout\,
	combout => \CPU|CU|const_out[2]~2_combout\);

-- Location: LCCOMB_X32_Y27_N4
\CPU|CU|Selector102~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|Selector102~0_combout\ = (\CPU|CU|const_out\(2) & \CPU|CU|current_state.Reset~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|CU|const_out\(2),
	datad => \CPU|CU|current_state.Reset~regout\,
	combout => \CPU|CU|Selector102~0_combout\);

-- Location: LCFF_X33_Y27_N21
\CPU|CU|const_out[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|const_out[2]~2_combout\,
	sdata => \CPU|CU|Selector102~0_combout\,
	sload => \CPU|CU|ALT_INV_current_state.Execute~regout\,
	ena => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|const_out\(2));

-- Location: LCCOMB_X35_Y27_N12
\CPU|FNU|R2|data_out[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R2|data_out[2]~feeder_combout\ = \CPU|FNU|func_data[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[2]~10_combout\,
	combout => \CPU|FNU|R2|data_out[2]~feeder_combout\);

-- Location: LCFF_X35_Y27_N13
\CPU|FNU|R2|data_out[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R2|data_out[2]~feeder_combout\,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(2));

-- Location: LCCOMB_X36_Y27_N16
\CPU|FNU|R7|data_out[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R7|data_out[2]~feeder_combout\ = \CPU|FNU|func_data[2]~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[2]~10_combout\,
	combout => \CPU|FNU|R7|data_out[2]~feeder_combout\);

-- Location: LCFF_X36_Y27_N17
\CPU|FNU|R7|data_out[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R7|data_out[2]~feeder_combout\,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(2));

-- Location: LCCOMB_X35_Y27_N14
\CPU|FNU|Bbus[2]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[2]~11_combout\ = (\CPU|CU|ctl_wd\(0) & ((\CPU|FNU|R5|data_out\(2)) # ((\CPU|CU|ctl_wd\(1))))) # (!\CPU|CU|ctl_wd\(0) & (((\CPU|FNU|R4|data_out\(2) & !\CPU|CU|ctl_wd\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(2),
	datab => \CPU|FNU|R4|data_out\(2),
	datac => \CPU|CU|ctl_wd\(0),
	datad => \CPU|CU|ctl_wd\(1),
	combout => \CPU|FNU|Bbus[2]~11_combout\);

-- Location: LCCOMB_X36_Y27_N24
\CPU|FNU|Bbus[2]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[2]~12_combout\ = (\CPU|CU|ctl_wd\(1) & ((\CPU|FNU|Bbus[2]~11_combout\ & ((\CPU|FNU|R7|data_out\(2)))) # (!\CPU|FNU|Bbus[2]~11_combout\ & (\CPU|FNU|R6|data_out\(2))))) # (!\CPU|CU|ctl_wd\(1) & (((\CPU|FNU|Bbus[2]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R6|data_out\(2),
	datab => \CPU|FNU|R7|data_out\(2),
	datac => \CPU|CU|ctl_wd\(1),
	datad => \CPU|FNU|Bbus[2]~11_combout\,
	combout => \CPU|FNU|Bbus[2]~12_combout\);

-- Location: LCCOMB_X35_Y27_N8
\CPU|FNU|Bbus[2]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[2]~13_combout\ = (\CPU|FNU|Bbus[12]~3_combout\ & ((\CPU|FNU|Bbus[12]~4_combout\ & ((\CPU|FNU|Bbus[2]~12_combout\))) # (!\CPU|FNU|Bbus[12]~4_combout\ & (\CPU|FNU|R1|data_out\(2))))) # (!\CPU|FNU|Bbus[12]~3_combout\ & 
-- (((\CPU|FNU|Bbus[12]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~3_combout\,
	datab => \CPU|FNU|R1|data_out\(2),
	datac => \CPU|FNU|Bbus[12]~4_combout\,
	datad => \CPU|FNU|Bbus[2]~12_combout\,
	combout => \CPU|FNU|Bbus[2]~13_combout\);

-- Location: LCCOMB_X40_Y27_N6
\CPU|FNU|Bbus[2]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[2]~44_combout\ = (\CPU|FNU|Bbus[12]~0_combout\ & ((\CPU|FNU|Bbus[2]~13_combout\ & ((\CPU|FNU|R3|data_out\(2)))) # (!\CPU|FNU|Bbus[2]~13_combout\ & (\CPU|FNU|R2|data_out\(2))))) # (!\CPU|FNU|Bbus[12]~0_combout\ & 
-- (((\CPU|FNU|Bbus[2]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Bbus[12]~0_combout\,
	datab => \CPU|FNU|R2|data_out\(2),
	datac => \CPU|FNU|R3|data_out\(2),
	datad => \CPU|FNU|Bbus[2]~13_combout\,
	combout => \CPU|FNU|Bbus[2]~44_combout\);

-- Location: LCCOMB_X36_Y27_N20
\CPU|FNU|Bbus[2]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[2]~45_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(2))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[2]~44_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(13),
	datac => \CPU|CU|const_out\(2),
	datad => \CPU|FNU|Bbus[2]~44_combout\,
	combout => \CPU|FNU|Bbus[2]~45_combout\);

-- Location: LCCOMB_X36_Y27_N22
\data_bus_temp[2]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[2]~21_combout\ = (\CPU|CU|PCd_EN~regout\ & (\CPU|CU|PC\(2) & ((\CPU|FNU|Bbus[2]~45_combout\) # (!\CPU|CU|st_op~regout\)))) # (!\CPU|CU|PCd_EN~regout\ & (((\CPU|FNU|Bbus[2]~45_combout\)) # (!\CPU|CU|st_op~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|PCd_EN~regout\,
	datab => \CPU|CU|st_op~regout\,
	datac => \CPU|FNU|Bbus[2]~45_combout\,
	datad => \CPU|CU|PC\(2),
	combout => \data_bus_temp[2]~21_combout\);

-- Location: LCCOMB_X36_Y24_N8
\data_bus_temp[2]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[2]~22_combout\ = ((\data_bus_temp[2]~20_combout\ & \data_bus_temp[2]~21_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_bus_temp[2]~20_combout\,
	datac => \data_bus_temp[2]~21_combout\,
	datad => \data_bus_temp[0]~3_combout\,
	combout => \data_bus_temp[2]~22_combout\);

-- Location: LCCOMB_X36_Y24_N30
\data_bus_temp[3]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[3]~23_combout\ = ((\mem_cs_ram~1_combout\ & ((\Ram1|altsyncram_component|auto_generated|q_a\(3)))) # (!\mem_cs_ram~1_combout\ & (\ProgMem|altsyncram_component|auto_generated|q_a\(3)))) # (!\data_bus_temp[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ProgMem|altsyncram_component|auto_generated|q_a\(3),
	datab => \Ram1|altsyncram_component|auto_generated|q_a\(3),
	datac => \data_bus_temp[2]~0_combout\,
	datad => \mem_cs_ram~1_combout\,
	combout => \data_bus_temp[3]~23_combout\);

-- Location: LCCOMB_X37_Y27_N30
\CPU|FNU|R2|data_out[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R2|data_out[3]~feeder_combout\ = \CPU|FNU|func_data[3]~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[3]~11_combout\,
	combout => \CPU|FNU|R2|data_out[3]~feeder_combout\);

-- Location: LCFF_X37_Y27_N31
\CPU|FNU|R2|data_out[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R2|data_out[3]~feeder_combout\,
	ena => \CPU|FNU|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R2|data_out\(3));

-- Location: LCCOMB_X37_Y27_N2
\CPU|FNU|Bbus[3]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[3]~46_combout\ = (\CPU|FNU|Bbus[3]~9_combout\ & ((\CPU|FNU|R3|data_out\(3)) # ((!\CPU|FNU|Bbus[12]~0_combout\)))) # (!\CPU|FNU|Bbus[3]~9_combout\ & (((\CPU|FNU|R2|data_out\(3) & \CPU|FNU|Bbus[12]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(3),
	datab => \CPU|FNU|R2|data_out\(3),
	datac => \CPU|FNU|Bbus[3]~9_combout\,
	datad => \CPU|FNU|Bbus[12]~0_combout\,
	combout => \CPU|FNU|Bbus[3]~46_combout\);

-- Location: LCCOMB_X37_Y27_N28
\CPU|FNU|Bbus[3]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Bbus[3]~47_combout\ = (\CPU|CU|ctl_wd\(13) & (\CPU|CU|const_out\(3))) # (!\CPU|CU|ctl_wd\(13) & ((\CPU|FNU|Bbus[3]~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|const_out\(3),
	datac => \CPU|CU|ctl_wd\(13),
	datad => \CPU|FNU|Bbus[3]~46_combout\,
	combout => \CPU|FNU|Bbus[3]~47_combout\);

-- Location: LCCOMB_X34_Y28_N10
\CPU|CU|PC[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[3]~3_combout\ = (\CPU|CU|PC[10]~24_combout\ & ((\CPU|CU|PC~35_combout\))) # (!\CPU|CU|PC[10]~24_combout\ & (\data_bus_temp[3]~25_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_bus_temp[3]~25_combout\,
	datab => \CPU|CU|PC[10]~24_combout\,
	datad => \CPU|CU|PC~35_combout\,
	combout => \CPU|CU|PC[3]~3_combout\);

-- Location: LCCOMB_X34_Y28_N2
\CPU|CU|PC[3]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|CU|PC[3]~47_combout\ = (\CPU|CU|current_state.Reset~regout\ & (!\CPU|CU|current_state.WB~regout\ & (\CPU|CU|Add0~18_combout\ & !\CPU|CU|PC[9]~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|current_state.Reset~regout\,
	datab => \CPU|CU|current_state.WB~regout\,
	datac => \CPU|CU|Add0~18_combout\,
	datad => \CPU|CU|PC[9]~23_combout\,
	combout => \CPU|CU|PC[3]~47_combout\);

-- Location: LCFF_X34_Y28_N11
\CPU|CU|PC[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|CU|PC[3]~3_combout\,
	sdata => \CPU|CU|PC[3]~47_combout\,
	sload => \CPU|CU|PC[9]~26_combout\,
	ena => \CPU|CU|PC[15]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|CU|PC\(3));

-- Location: LCCOMB_X36_Y24_N24
\data_bus_temp[3]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[3]~24_combout\ = (\CPU|CU|st_op~regout\ & (\CPU|FNU|Bbus[3]~47_combout\ & ((\CPU|CU|PC\(3)) # (!\CPU|CU|PCd_EN~regout\)))) # (!\CPU|CU|st_op~regout\ & (((\CPU|CU|PC\(3)) # (!\CPU|CU|PCd_EN~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|st_op~regout\,
	datab => \CPU|FNU|Bbus[3]~47_combout\,
	datac => \CPU|CU|PC\(3),
	datad => \CPU|CU|PCd_EN~regout\,
	combout => \data_bus_temp[3]~24_combout\);

-- Location: LCCOMB_X36_Y24_N10
\data_bus_temp[3]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \data_bus_temp[3]~25_combout\ = ((\data_bus_temp[3]~23_combout\ & \data_bus_temp[3]~24_combout\)) # (!\data_bus_temp[0]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_bus_temp[3]~23_combout\,
	datac => \data_bus_temp[3]~24_combout\,
	datad => \data_bus_temp[0]~3_combout\,
	combout => \data_bus_temp[3]~25_combout\);

-- Location: LCCOMB_X34_Y25_N22
\CPU|FNU|Fnc_unit|Mux12~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux12~9_combout\ = (\CPU|FNU|Mux13~combout\) # (\CPU|CU|ctl_wd\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|FNU|Mux13~combout\,
	datad => \CPU|CU|ctl_wd\(8),
	combout => \CPU|FNU|Fnc_unit|Mux12~9_combout\);

-- Location: LCCOMB_X36_Y27_N12
\CPU|FNU|Fnc_unit|Mux12~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux12~4_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (((\CPU|FNU|Mux12~combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Fnc_unit|Mux3~3_combout\) # (\CPU|FNU|Fnc_unit|Mux3~2_combout\ $ (!\CPU|FNU|Mux12~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datac => \CPU|FNU|Mux12~combout\,
	datad => \CPU|FNU|Fnc_unit|Mux3~3_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux12~4_combout\);

-- Location: LCCOMB_X37_Y27_N22
\CPU|FNU|Fnc_unit|Mux12~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux12~5_combout\ = (\CPU|FNU|Fnc_unit|Mux3~0_combout\ & ((\CPU|FNU|Bbus[3]~47_combout\) # ((\CPU|FNU|Fnc_unit|Mux12~4_combout\)))) # (!\CPU|FNU|Fnc_unit|Mux3~0_combout\ & (\CPU|FNU|Fnc_unit|Mux12~4_combout\ & 
-- ((\CPU|FNU|Bbus[3]~47_combout\) # (!\CPU|FNU|Fnc_unit|Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~0_combout\,
	datab => \CPU|FNU|Bbus[3]~47_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux3~2_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux12~4_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux12~5_combout\);

-- Location: LCCOMB_X37_Y27_N8
\CPU|FNU|Fnc_unit|Mux12~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux12~7_combout\ = (\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (\CPU|FNU|Fnc_unit|Mux12~6_combout\)) # (!\CPU|FNU|Fnc_unit|Mux3~1_combout\ & (\CPU|FNU|Fnc_unit|Mux12~5_combout\ & ((\CPU|FNU|Fnc_unit|Mux12~6_combout\) # 
-- (\CPU|FNU|Fnc_unit|Mux12~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux12~6_combout\,
	datab => \CPU|FNU|Fnc_unit|Mux3~1_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux12~9_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux12~5_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux12~7_combout\);

-- Location: LCCOMB_X37_Y27_N26
\CPU|FNU|Fnc_unit|Mux12~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|Fnc_unit|Mux12~8_combout\ = (\CPU|FNU|Fnc_unit|Mux3~4_combout\ & ((\CPU|FNU|Fnc_unit|Add0~14_combout\))) # (!\CPU|FNU|Fnc_unit|Mux3~4_combout\ & (\CPU|FNU|Fnc_unit|Mux12~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Fnc_unit|Mux3~4_combout\,
	datac => \CPU|FNU|Fnc_unit|Mux12~7_combout\,
	datad => \CPU|FNU|Fnc_unit|Add0~14_combout\,
	combout => \CPU|FNU|Fnc_unit|Mux12~8_combout\);

-- Location: LCCOMB_X41_Y27_N14
\CPU|FNU|func_data[3]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|func_data[3]~11_combout\ = (\CPU|CU|ctl_wd\(14) & (\data_bus_temp[3]~25_combout\)) # (!\CPU|CU|ctl_wd\(14) & ((\CPU|FNU|Fnc_unit|Mux12~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|CU|ctl_wd\(14),
	datac => \data_bus_temp[3]~25_combout\,
	datad => \CPU|FNU|Fnc_unit|Mux12~8_combout\,
	combout => \CPU|FNU|func_data[3]~11_combout\);

-- Location: LCFF_X41_Y24_N23
\CPU|FNU|R5|data_out[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[3]~11_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(3));

-- Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_select[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reg_select(2),
	combout => \reg_select~combout\(2));

-- Location: LCCOMB_X37_Y27_N16
\CPU|FNU|R1|data_out[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R1|data_out[3]~feeder_combout\ = \CPU|FNU|func_data[3]~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[3]~11_combout\,
	combout => \CPU|FNU|R1|data_out[3]~feeder_combout\);

-- Location: LCFF_X37_Y27_N17
\CPU|FNU|R1|data_out[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R1|data_out[3]~feeder_combout\,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(3));

-- Location: LCCOMB_X37_Y27_N10
\DisplayReg[3]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[3]~35_combout\ = (\reg_select~combout\(1) & ((\reg_select~combout\(2)) # ((\CPU|FNU|R3|data_out\(3))))) # (!\reg_select~combout\(1) & (!\reg_select~combout\(2) & (\CPU|FNU|R1|data_out\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R1|data_out\(3),
	datad => \CPU|FNU|R3|data_out\(3),
	combout => \DisplayReg[3]~35_combout\);

-- Location: LCCOMB_X37_Y27_N20
\DisplayReg[3]~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[3]~36_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[3]~35_combout\ & ((\CPU|FNU|R7|data_out\(3)))) # (!\DisplayReg[3]~35_combout\ & (\CPU|FNU|R5|data_out\(3))))) # (!\reg_select~combout\(2) & (((\DisplayReg[3]~35_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \CPU|FNU|R5|data_out\(3),
	datac => \CPU|FNU|R7|data_out\(3),
	datad => \DisplayReg[3]~35_combout\,
	combout => \DisplayReg[3]~36_combout\);

-- Location: LCCOMB_X35_Y25_N28
\Equal12~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal12~6_combout\ = (!\CPU|address[2]~45_combout\ & (!\CPU|address[1]~44_combout\ & (\CPU|address[11]~41_combout\ & !\CPU|address[0]~43_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|address[2]~45_combout\,
	datab => \CPU|address[1]~44_combout\,
	datac => \CPU|address[11]~41_combout\,
	datad => \CPU|address[0]~43_combout\,
	combout => \Equal12~6_combout\);

-- Location: LCCOMB_X34_Y25_N14
\CPU|address[12]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address[12]~42_combout\ = (\CPU|CU|ld_op~regout\ & (((\CPU|FNU|Mux3~combout\)))) # (!\CPU|CU|ld_op~regout\ & ((\CPU|CU|st_op~regout\ & ((\CPU|FNU|Mux3~combout\))) # (!\CPU|CU|st_op~regout\ & (\CPU|address[12]~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|address[12]~29_combout\,
	datab => \CPU|CU|ld_op~regout\,
	datac => \CPU|CU|st_op~regout\,
	datad => \CPU|FNU|Mux3~combout\,
	combout => \CPU|address[12]~42_combout\);

-- Location: LCCOMB_X37_Y25_N24
\CPU|address~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|address~27_combout\ = (\CPU|CU|ld_op~regout\) # (\CPU|CU|st_op~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CPU|CU|ld_op~regout\,
	datad => \CPU|CU|st_op~regout\,
	combout => \CPU|address~27_combout\);

-- Location: LCCOMB_X43_Y25_N8
\Equal12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal12~0_combout\ = (!\CPU|FNU|Mux1~combout\ & (\CPU|address~27_combout\ & (!\CPU|FNU|Mux2~combout\ & !\CPU|FNU|Mux0~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|Mux1~combout\,
	datab => \CPU|address~27_combout\,
	datac => \CPU|FNU|Mux2~combout\,
	datad => \CPU|FNU|Mux0~combout\,
	combout => \Equal12~0_combout\);

-- Location: LCCOMB_X34_Y25_N20
\Equal12~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal12~5_combout\ = (!\CPU|address[10]~40_combout\ & (!\CPU|address[12]~42_combout\ & ((\Equal12~4_combout\) # (\Equal12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal12~4_combout\,
	datab => \CPU|address[10]~40_combout\,
	datac => \CPU|address[12]~42_combout\,
	datad => \Equal12~0_combout\,
	combout => \Equal12~5_combout\);

-- Location: LCCOMB_X35_Y25_N18
\Equal12~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal12~8_combout\ = (!\CPU|address[7]~50_combout\ & (!\CPU|address[9]~52_combout\ & !\CPU|address[8]~51_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CPU|address[7]~50_combout\,
	datac => \CPU|address[9]~52_combout\,
	datad => \CPU|address[8]~51_combout\,
	combout => \Equal12~8_combout\);

-- Location: LCCOMB_X35_Y25_N4
\Equal12~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Equal12~9_combout\ = (\Equal12~7_combout\ & (\Equal12~6_combout\ & (\Equal12~5_combout\ & \Equal12~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal12~7_combout\,
	datab => \Equal12~6_combout\,
	datac => \Equal12~5_combout\,
	datad => \Equal12~8_combout\,
	combout => \Equal12~9_combout\);

-- Location: LCFF_X36_Y24_N11
\display_buf[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \data_bus_temp[3]~25_combout\,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(3));

-- Location: LCCOMB_X37_Y27_N0
\DisplayReg[3]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[3]~37_combout\ = (\reg_select~combout\(1) & (\reg_select~combout\(2))) # (!\reg_select~combout\(1) & ((\reg_select~combout\(2) & ((\CPU|FNU|R4|data_out\(3)))) # (!\reg_select~combout\(2) & (display_buf(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \reg_select~combout\(2),
	datac => display_buf(3),
	datad => \CPU|FNU|R4|data_out\(3),
	combout => \DisplayReg[3]~37_combout\);

-- Location: LCCOMB_X37_Y27_N18
\DisplayReg[3]~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[3]~38_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[3]~37_combout\ & ((\CPU|FNU|R6|data_out\(3)))) # (!\DisplayReg[3]~37_combout\ & (\CPU|FNU|R2|data_out\(3))))) # (!\reg_select~combout\(1) & (((\DisplayReg[3]~37_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R2|data_out\(3),
	datac => \CPU|FNU|R6|data_out\(3),
	datad => \DisplayReg[3]~37_combout\,
	combout => \DisplayReg[3]~38_combout\);

-- Location: LCCOMB_X37_Y27_N12
\DisplayReg[3]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[3]~39_combout\ = (\reg_select~combout\(0) & (\DisplayReg[3]~36_combout\)) # (!\reg_select~combout\(0) & ((\DisplayReg[3]~38_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg_select~combout\(0),
	datac => \DisplayReg[3]~36_combout\,
	datad => \DisplayReg[3]~38_combout\,
	combout => \DisplayReg[3]~39_combout\);

-- Location: LCFF_X36_Y24_N9
\display_buf[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \data_bus_temp[2]~22_combout\,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(2));

-- Location: LCCOMB_X35_Y27_N16
\DisplayReg[2]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[2]~32_combout\ = (\reg_select~combout\(1) & (\reg_select~combout\(2))) # (!\reg_select~combout\(1) & ((\reg_select~combout\(2) & ((\CPU|FNU|R4|data_out\(2)))) # (!\reg_select~combout\(2) & (display_buf(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \reg_select~combout\(2),
	datac => display_buf(2),
	datad => \CPU|FNU|R4|data_out\(2),
	combout => \DisplayReg[2]~32_combout\);

-- Location: LCCOMB_X35_Y27_N26
\DisplayReg[2]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[2]~33_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[2]~32_combout\ & (\CPU|FNU|R6|data_out\(2))) # (!\DisplayReg[2]~32_combout\ & ((\CPU|FNU|R2|data_out\(2)))))) # (!\reg_select~combout\(1) & (((\DisplayReg[2]~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R6|data_out\(2),
	datac => \DisplayReg[2]~32_combout\,
	datad => \CPU|FNU|R2|data_out\(2),
	combout => \DisplayReg[2]~33_combout\);

-- Location: LCFF_X43_Y24_N21
\CPU|FNU|R5|data_out[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[2]~10_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(2));

-- Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reg_select[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reg_select(1),
	combout => \reg_select~combout\(1));

-- Location: LCCOMB_X40_Y27_N8
\DisplayReg[2]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[2]~30_combout\ = (\reg_select~combout\(2) & (\reg_select~combout\(1))) # (!\reg_select~combout\(2) & ((\reg_select~combout\(1) & ((\CPU|FNU|R3|data_out\(2)))) # (!\reg_select~combout\(1) & (\CPU|FNU|R1|data_out\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \reg_select~combout\(1),
	datac => \CPU|FNU|R1|data_out\(2),
	datad => \CPU|FNU|R3|data_out\(2),
	combout => \DisplayReg[2]~30_combout\);

-- Location: LCCOMB_X35_Y27_N2
\DisplayReg[2]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[2]~31_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[2]~30_combout\ & (\CPU|FNU|R7|data_out\(2))) # (!\DisplayReg[2]~30_combout\ & ((\CPU|FNU|R5|data_out\(2)))))) # (!\reg_select~combout\(2) & (((\DisplayReg[2]~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R7|data_out\(2),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R5|data_out\(2),
	datad => \DisplayReg[2]~30_combout\,
	combout => \DisplayReg[2]~31_combout\);

-- Location: LCCOMB_X35_Y27_N4
\DisplayReg[2]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[2]~34_combout\ = (\reg_select~combout\(0) & ((\DisplayReg[2]~31_combout\))) # (!\reg_select~combout\(0) & (\DisplayReg[2]~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(0),
	datab => \DisplayReg[2]~33_combout\,
	datad => \DisplayReg[2]~31_combout\,
	combout => \DisplayReg[2]~34_combout\);

-- Location: LCFF_X37_Y23_N15
\display_buf[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \data_bus_temp[0]~16_combout\,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(0));

-- Location: LCCOMB_X40_Y23_N6
\DisplayReg[0]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[0]~22_combout\ = (\reg_select~combout\(2) & ((\CPU|FNU|R4|data_out\(0)) # ((\reg_select~combout\(1))))) # (!\reg_select~combout\(2) & (((!\reg_select~combout\(1) & display_buf(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \CPU|FNU|R4|data_out\(0),
	datac => \reg_select~combout\(1),
	datad => display_buf(0),
	combout => \DisplayReg[0]~22_combout\);

-- Location: LCCOMB_X40_Y23_N24
\DisplayReg[0]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[0]~23_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[0]~22_combout\ & ((\CPU|FNU|R6|data_out\(0)))) # (!\DisplayReg[0]~22_combout\ & (\CPU|FNU|R2|data_out\(0))))) # (!\reg_select~combout\(1) & (((\DisplayReg[0]~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(0),
	datab => \reg_select~combout\(1),
	datac => \CPU|FNU|R6|data_out\(0),
	datad => \DisplayReg[0]~22_combout\,
	combout => \DisplayReg[0]~23_combout\);

-- Location: LCCOMB_X41_Y23_N0
\DisplayReg[0]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[0]~20_combout\ = (\reg_select~combout\(1) & ((\reg_select~combout\(2)) # ((\CPU|FNU|R3|data_out\(0))))) # (!\reg_select~combout\(1) & (!\reg_select~combout\(2) & (\CPU|FNU|R1|data_out\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R1|data_out\(0),
	datad => \CPU|FNU|R3|data_out\(0),
	combout => \DisplayReg[0]~20_combout\);

-- Location: LCFF_X41_Y24_N3
\CPU|FNU|R5|data_out[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[0]~7_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(0));

-- Location: LCCOMB_X40_Y23_N8
\DisplayReg[0]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[0]~21_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[0]~20_combout\ & ((\CPU|FNU|R7|data_out\(0)))) # (!\DisplayReg[0]~20_combout\ & (\CPU|FNU|R5|data_out\(0))))) # (!\reg_select~combout\(2) & (\DisplayReg[0]~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \DisplayReg[0]~20_combout\,
	datac => \CPU|FNU|R5|data_out\(0),
	datad => \CPU|FNU|R7|data_out\(0),
	combout => \DisplayReg[0]~21_combout\);

-- Location: LCCOMB_X35_Y27_N24
\DisplayReg[0]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[0]~24_combout\ = (\reg_select~combout\(0) & ((\DisplayReg[0]~21_combout\))) # (!\reg_select~combout\(0) & (\DisplayReg[0]~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(0),
	datac => \DisplayReg[0]~23_combout\,
	datad => \DisplayReg[0]~21_combout\,
	combout => \DisplayReg[0]~24_combout\);

-- Location: LCCOMB_X35_Y24_N30
\lcd_out|Mux27~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Mux27~0_combout\ = \DisplayReg[0]~24_combout\ $ (((\DisplayReg[3]~39_combout\ & ((\DisplayReg[1]~29_combout\) # (\DisplayReg[2]~34_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[1]~29_combout\,
	datab => \DisplayReg[3]~39_combout\,
	datac => \DisplayReg[2]~34_combout\,
	datad => \DisplayReg[0]~24_combout\,
	combout => \lcd_out|Mux27~0_combout\);

-- Location: LCFF_X34_Y23_N17
\lcd_out|state.HOLD\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	sdata => \lcd_out|state.TOGGLE_E~regout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.HOLD~regout\);

-- Location: LCCOMB_X32_Y23_N14
\lcd_out|WideOr0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|WideOr0~0_combout\ = (!\lcd_out|state.TOGGLE_E~regout\ & !\lcd_out|state.HOLD~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lcd_out|state.TOGGLE_E~regout\,
	datad => \lcd_out|state.HOLD~regout\,
	combout => \lcd_out|WideOr0~0_combout\);

-- Location: LCFF_X32_Y23_N15
\lcd_out|state.TOGGLE_E\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|WideOr0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.TOGGLE_E~regout\);

-- Location: LCCOMB_X33_Y23_N26
\lcd_out|state~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~45_combout\ = (\lcd_out|next_command.DISPLAY_ON~regout\ & \lcd_out|state.HOLD~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|next_command.DISPLAY_ON~regout\,
	datac => \lcd_out|state.HOLD~regout\,
	combout => \lcd_out|state~45_combout\);

-- Location: LCFF_X33_Y23_N27
\lcd_out|state.DISPLAY_ON\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~45_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.DISPLAY_ON~regout\);

-- Location: LCCOMB_X33_Y23_N12
\lcd_out|Selector14~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector14~0_combout\ = (\lcd_out|state.DISPLAY_ON~regout\) # ((\lcd_out|next_command.MODE_SET~regout\ & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datab => \lcd_out|state.TOGGLE_E~regout\,
	datac => \lcd_out|next_command.MODE_SET~regout\,
	datad => \lcd_out|state.DISPLAY_ON~regout\,
	combout => \lcd_out|Selector14~0_combout\);

-- Location: LCFF_X33_Y23_N13
\lcd_out|next_command.MODE_SET\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector14~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.MODE_SET~regout\);

-- Location: LCCOMB_X33_Y23_N28
\lcd_out|state~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~43_combout\ = (\lcd_out|state.HOLD~regout\ & \lcd_out|next_command.MODE_SET~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lcd_out|state.HOLD~regout\,
	datad => \lcd_out|next_command.MODE_SET~regout\,
	combout => \lcd_out|state~43_combout\);

-- Location: LCFF_X33_Y23_N29
\lcd_out|state.MODE_SET\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~43_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.MODE_SET~regout\);

-- Location: LCCOMB_X32_Y23_N4
\lcd_out|Selector15~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector15~0_combout\ = (\lcd_out|state.RETURN_HOME~regout\) # ((\lcd_out|state.MODE_SET~regout\) # ((!\lcd_out|WideOr0~0_combout\ & \lcd_out|next_command.WRITE_CHAR1~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.RETURN_HOME~regout\,
	datab => \lcd_out|WideOr0~0_combout\,
	datac => \lcd_out|next_command.WRITE_CHAR1~regout\,
	datad => \lcd_out|state.MODE_SET~regout\,
	combout => \lcd_out|Selector15~0_combout\);

-- Location: LCFF_X32_Y23_N5
\lcd_out|next_command.WRITE_CHAR1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector15~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.WRITE_CHAR1~regout\);

-- Location: LCCOMB_X32_Y23_N30
\lcd_out|state~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~40_combout\ = (\lcd_out|state.HOLD~regout\ & \lcd_out|next_command.WRITE_CHAR1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|state.HOLD~regout\,
	datac => \lcd_out|next_command.WRITE_CHAR1~regout\,
	combout => \lcd_out|state~40_combout\);

-- Location: LCFF_X32_Y23_N31
\lcd_out|state.WRITE_CHAR1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~40_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.WRITE_CHAR1~regout\);

-- Location: LCCOMB_X32_Y23_N2
\lcd_out|Selector16~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector16~0_combout\ = (\lcd_out|state.WRITE_CHAR1~regout\) # ((\lcd_out|next_command.WRITE_CHAR2~regout\ & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datab => \lcd_out|state.TOGGLE_E~regout\,
	datac => \lcd_out|next_command.WRITE_CHAR2~regout\,
	datad => \lcd_out|state.WRITE_CHAR1~regout\,
	combout => \lcd_out|Selector16~0_combout\);

-- Location: LCFF_X32_Y23_N3
\lcd_out|next_command.WRITE_CHAR2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector16~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.WRITE_CHAR2~regout\);

-- Location: LCCOMB_X32_Y23_N24
\lcd_out|state~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~41_combout\ = (\lcd_out|state.HOLD~regout\ & \lcd_out|next_command.WRITE_CHAR2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|state.HOLD~regout\,
	datad => \lcd_out|next_command.WRITE_CHAR2~regout\,
	combout => \lcd_out|state~41_combout\);

-- Location: LCFF_X32_Y23_N25
\lcd_out|state.WRITE_CHAR2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~41_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.WRITE_CHAR2~regout\);

-- Location: LCCOMB_X33_Y23_N10
\lcd_out|Selector17~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector17~0_combout\ = (\lcd_out|state.WRITE_CHAR2~regout\) # ((\lcd_out|next_command.WRITE_CHAR3~regout\ & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datab => \lcd_out|state.WRITE_CHAR2~regout\,
	datac => \lcd_out|next_command.WRITE_CHAR3~regout\,
	datad => \lcd_out|state.TOGGLE_E~regout\,
	combout => \lcd_out|Selector17~0_combout\);

-- Location: LCFF_X33_Y23_N11
\lcd_out|next_command.WRITE_CHAR3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector17~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.WRITE_CHAR3~regout\);

-- Location: LCCOMB_X36_Y23_N24
\lcd_out|state~36\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~36_combout\ = (\lcd_out|state.HOLD~regout\ & \lcd_out|next_command.WRITE_CHAR3~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lcd_out|state.HOLD~regout\,
	datad => \lcd_out|next_command.WRITE_CHAR3~regout\,
	combout => \lcd_out|state~36_combout\);

-- Location: LCFF_X36_Y23_N25
\lcd_out|state.WRITE_CHAR3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~36_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.WRITE_CHAR3~regout\);

-- Location: LCCOMB_X36_Y23_N26
\lcd_out|Selector18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector18~0_combout\ = (\lcd_out|state.WRITE_CHAR3~regout\) # ((\lcd_out|next_command.WRITE_CHAR4~regout\ & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datab => \lcd_out|state.WRITE_CHAR3~regout\,
	datac => \lcd_out|next_command.WRITE_CHAR4~regout\,
	datad => \lcd_out|state.TOGGLE_E~regout\,
	combout => \lcd_out|Selector18~0_combout\);

-- Location: LCFF_X36_Y23_N27
\lcd_out|next_command.WRITE_CHAR4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector18~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.WRITE_CHAR4~regout\);

-- Location: LCCOMB_X36_Y23_N28
\lcd_out|state~38\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~38_combout\ = (\lcd_out|state.HOLD~regout\ & \lcd_out|next_command.WRITE_CHAR4~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lcd_out|state.HOLD~regout\,
	datad => \lcd_out|next_command.WRITE_CHAR4~regout\,
	combout => \lcd_out|state~38_combout\);

-- Location: LCFF_X36_Y23_N29
\lcd_out|state.WRITE_CHAR4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~38_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.WRITE_CHAR4~regout\);

-- Location: LCCOMB_X36_Y23_N4
\lcd_out|Selector19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector19~0_combout\ = (\lcd_out|state.WRITE_CHAR4~regout\) # ((\lcd_out|next_command.WRITE_CHAR5~regout\ & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datab => \lcd_out|state.WRITE_CHAR4~regout\,
	datac => \lcd_out|next_command.WRITE_CHAR5~regout\,
	datad => \lcd_out|state.TOGGLE_E~regout\,
	combout => \lcd_out|Selector19~0_combout\);

-- Location: LCFF_X36_Y23_N5
\lcd_out|next_command.WRITE_CHAR5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector19~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.WRITE_CHAR5~regout\);

-- Location: LCCOMB_X36_Y23_N22
\lcd_out|state~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~39_combout\ = (\lcd_out|state.HOLD~regout\ & \lcd_out|next_command.WRITE_CHAR5~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lcd_out|state.HOLD~regout\,
	datad => \lcd_out|next_command.WRITE_CHAR5~regout\,
	combout => \lcd_out|state~39_combout\);

-- Location: LCFF_X36_Y23_N23
\lcd_out|state.WRITE_CHAR5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~39_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.WRITE_CHAR5~regout\);

-- Location: LCCOMB_X36_Y23_N16
\lcd_out|Selector20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector20~0_combout\ = (\lcd_out|state.WRITE_CHAR5~regout\) # ((\lcd_out|next_command.WRITE_CHAR6~regout\ & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datab => \lcd_out|state.TOGGLE_E~regout\,
	datac => \lcd_out|next_command.WRITE_CHAR6~regout\,
	datad => \lcd_out|state.WRITE_CHAR5~regout\,
	combout => \lcd_out|Selector20~0_combout\);

-- Location: LCFF_X36_Y23_N17
\lcd_out|next_command.WRITE_CHAR6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector20~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.WRITE_CHAR6~regout\);

-- Location: LCCOMB_X36_Y23_N18
\lcd_out|state~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~37_combout\ = (\lcd_out|state.HOLD~regout\ & \lcd_out|next_command.WRITE_CHAR6~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datac => \lcd_out|next_command.WRITE_CHAR6~regout\,
	combout => \lcd_out|state~37_combout\);

-- Location: LCFF_X36_Y23_N19
\lcd_out|state.WRITE_CHAR6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~37_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.WRITE_CHAR6~regout\);

-- Location: LCFF_X41_Y23_N19
\CPU|FNU|R1|data_out[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[6]~4_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(6));

-- Location: LCCOMB_X41_Y23_N18
\DisplayReg[6]~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[6]~10_combout\ = (\reg_select~combout\(2) & (((\reg_select~combout\(1))))) # (!\reg_select~combout\(2) & ((\reg_select~combout\(1) & (\CPU|FNU|R3|data_out\(6))) # (!\reg_select~combout\(1) & ((\CPU|FNU|R1|data_out\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R3|data_out\(6),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R1|data_out\(6),
	datad => \reg_select~combout\(1),
	combout => \DisplayReg[6]~10_combout\);

-- Location: LCCOMB_X42_Y23_N16
\DisplayReg[6]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[6]~11_combout\ = (\DisplayReg[6]~10_combout\ & (((\CPU|FNU|R7|data_out\(6)) # (!\reg_select~combout\(2))))) # (!\DisplayReg[6]~10_combout\ & (\CPU|FNU|R5|data_out\(6) & ((\reg_select~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(6),
	datab => \DisplayReg[6]~10_combout\,
	datac => \CPU|FNU|R7|data_out\(6),
	datad => \reg_select~combout\(2),
	combout => \DisplayReg[6]~11_combout\);

-- Location: LCFF_X42_Y26_N25
\CPU|FNU|R6|data_out[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[6]~4_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R6|data_out\(6));

-- Location: LCFF_X37_Y23_N11
\display_buf[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \data_bus_temp[6]~10_combout\,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(6));

-- Location: LCCOMB_X42_Y23_N30
\DisplayReg[6]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[6]~12_combout\ = (\reg_select~combout\(1) & (((\reg_select~combout\(2))))) # (!\reg_select~combout\(1) & ((\reg_select~combout\(2) & (\CPU|FNU|R4|data_out\(6))) # (!\reg_select~combout\(2) & ((display_buf(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R4|data_out\(6),
	datac => \reg_select~combout\(2),
	datad => display_buf(6),
	combout => \DisplayReg[6]~12_combout\);

-- Location: LCCOMB_X42_Y23_N0
\DisplayReg[6]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[6]~13_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[6]~12_combout\ & ((\CPU|FNU|R6|data_out\(6)))) # (!\DisplayReg[6]~12_combout\ & (\CPU|FNU|R2|data_out\(6))))) # (!\reg_select~combout\(1) & (((\DisplayReg[6]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R2|data_out\(6),
	datac => \CPU|FNU|R6|data_out\(6),
	datad => \DisplayReg[6]~12_combout\,
	combout => \DisplayReg[6]~13_combout\);

-- Location: LCCOMB_X42_Y23_N26
\DisplayReg[6]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[6]~14_combout\ = (\reg_select~combout\(0) & (\DisplayReg[6]~11_combout\)) # (!\reg_select~combout\(0) & ((\DisplayReg[6]~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg_select~combout\(0),
	datac => \DisplayReg[6]~11_combout\,
	datad => \DisplayReg[6]~13_combout\,
	combout => \DisplayReg[6]~14_combout\);

-- Location: LCCOMB_X44_Y24_N4
\CPU|FNU|R4|data_out[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R4|data_out[5]~feeder_combout\ = \CPU|FNU|func_data[5]~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[5]~3_combout\,
	combout => \CPU|FNU|R4|data_out[5]~feeder_combout\);

-- Location: LCFF_X44_Y24_N5
\CPU|FNU|R4|data_out[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R4|data_out[5]~feeder_combout\,
	ena => \CPU|FNU|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R4|data_out\(5));

-- Location: LCFF_X37_Y23_N1
\display_buf[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \data_bus_temp[5]~7_combout\,
	sload => VCC,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(5));

-- Location: LCCOMB_X44_Y24_N6
\DisplayReg[5]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[5]~7_combout\ = (\reg_select~combout\(1) & (((\reg_select~combout\(2))))) # (!\reg_select~combout\(1) & ((\reg_select~combout\(2) & (\CPU|FNU|R4|data_out\(5))) # (!\reg_select~combout\(2) & ((display_buf(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R4|data_out\(5),
	datac => display_buf(5),
	datad => \reg_select~combout\(2),
	combout => \DisplayReg[5]~7_combout\);

-- Location: LCCOMB_X44_Y24_N8
\DisplayReg[5]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[5]~8_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[5]~7_combout\ & ((\CPU|FNU|R6|data_out\(5)))) # (!\DisplayReg[5]~7_combout\ & (\CPU|FNU|R2|data_out\(5))))) # (!\reg_select~combout\(1) & (((\DisplayReg[5]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R2|data_out\(5),
	datac => \CPU|FNU|R6|data_out\(5),
	datad => \DisplayReg[5]~7_combout\,
	combout => \DisplayReg[5]~8_combout\);

-- Location: LCCOMB_X42_Y28_N18
\DisplayReg[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[5]~5_combout\ = (\reg_select~combout\(1) & ((\reg_select~combout\(2)) # ((\CPU|FNU|R3|data_out\(5))))) # (!\reg_select~combout\(1) & (!\reg_select~combout\(2) & ((\CPU|FNU|R1|data_out\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R3|data_out\(5),
	datad => \CPU|FNU|R1|data_out\(5),
	combout => \DisplayReg[5]~5_combout\);

-- Location: LCCOMB_X43_Y24_N26
\DisplayReg[5]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[5]~6_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[5]~5_combout\ & ((\CPU|FNU|R7|data_out\(5)))) # (!\DisplayReg[5]~5_combout\ & (\CPU|FNU|R5|data_out\(5))))) # (!\reg_select~combout\(2) & (((\DisplayReg[5]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \CPU|FNU|R5|data_out\(5),
	datac => \CPU|FNU|R7|data_out\(5),
	datad => \DisplayReg[5]~5_combout\,
	combout => \DisplayReg[5]~6_combout\);

-- Location: LCCOMB_X44_Y24_N10
\DisplayReg[5]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[5]~9_combout\ = (\reg_select~combout\(0) & ((\DisplayReg[5]~6_combout\))) # (!\reg_select~combout\(0) & (\DisplayReg[5]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(0),
	datac => \DisplayReg[5]~8_combout\,
	datad => \DisplayReg[5]~6_combout\,
	combout => \DisplayReg[5]~9_combout\);

-- Location: LCFF_X41_Y26_N25
\display_buf[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \data_bus_temp[4]~4_combout\,
	sload => VCC,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(4));

-- Location: LCCOMB_X44_Y24_N28
\DisplayReg[4]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[4]~2_combout\ = (\reg_select~combout\(2) & ((\CPU|FNU|R4|data_out\(4)) # ((\reg_select~combout\(1))))) # (!\reg_select~combout\(2) & (((!\reg_select~combout\(1) & display_buf(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \CPU|FNU|R4|data_out\(4),
	datac => \reg_select~combout\(1),
	datad => display_buf(4),
	combout => \DisplayReg[4]~2_combout\);

-- Location: LCCOMB_X44_Y24_N14
\DisplayReg[4]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[4]~3_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[4]~2_combout\ & (\CPU|FNU|R6|data_out\(4))) # (!\DisplayReg[4]~2_combout\ & ((\CPU|FNU|R2|data_out\(4)))))) # (!\reg_select~combout\(1) & (((\DisplayReg[4]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R6|data_out\(4),
	datac => \CPU|FNU|R2|data_out\(4),
	datad => \DisplayReg[4]~2_combout\,
	combout => \DisplayReg[4]~3_combout\);

-- Location: LCFF_X41_Y24_N11
\CPU|FNU|R7|data_out[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[4]~1_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R7|data_out\(4));

-- Location: LCCOMB_X40_Y27_N4
\DisplayReg[4]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[4]~0_combout\ = (\reg_select~combout\(2) & (((\reg_select~combout\(1))))) # (!\reg_select~combout\(2) & ((\reg_select~combout\(1) & ((\CPU|FNU|R3|data_out\(4)))) # (!\reg_select~combout\(1) & (\CPU|FNU|R1|data_out\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \CPU|FNU|R1|data_out\(4),
	datac => \reg_select~combout\(1),
	datad => \CPU|FNU|R3|data_out\(4),
	combout => \DisplayReg[4]~0_combout\);

-- Location: LCCOMB_X41_Y24_N10
\DisplayReg[4]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[4]~1_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[4]~0_combout\ & ((\CPU|FNU|R7|data_out\(4)))) # (!\DisplayReg[4]~0_combout\ & (\CPU|FNU|R5|data_out\(4))))) # (!\reg_select~combout\(2) & (((\DisplayReg[4]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \CPU|FNU|R5|data_out\(4),
	datac => \CPU|FNU|R7|data_out\(4),
	datad => \DisplayReg[4]~0_combout\,
	combout => \DisplayReg[4]~1_combout\);

-- Location: LCCOMB_X44_Y24_N24
\DisplayReg[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[4]~4_combout\ = (\reg_select~combout\(0) & ((\DisplayReg[4]~1_combout\))) # (!\reg_select~combout\(0) & (\DisplayReg[4]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(0),
	datac => \DisplayReg[4]~3_combout\,
	datad => \DisplayReg[4]~1_combout\,
	combout => \DisplayReg[4]~4_combout\);

-- Location: LCCOMB_X35_Y24_N12
\lcd_out|Mux20~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Mux20~0_combout\ = \DisplayReg[4]~4_combout\ $ (((\DisplayReg[7]~19_combout\ & ((\DisplayReg[6]~14_combout\) # (\DisplayReg[5]~9_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[7]~19_combout\,
	datab => \DisplayReg[6]~14_combout\,
	datac => \DisplayReg[5]~9_combout\,
	datad => \DisplayReg[4]~4_combout\,
	combout => \lcd_out|Mux20~0_combout\);

-- Location: LCCOMB_X35_Y24_N16
\lcd_out|Selector9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector9~0_combout\ = (\lcd_out|state.WRITE_CHAR5~regout\ & ((\lcd_out|Mux20~0_combout\) # ((\lcd_out|Mux27~0_combout\ & \lcd_out|state.WRITE_CHAR6~regout\)))) # (!\lcd_out|state.WRITE_CHAR5~regout\ & (\lcd_out|Mux27~0_combout\ & 
-- (\lcd_out|state.WRITE_CHAR6~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.WRITE_CHAR5~regout\,
	datab => \lcd_out|Mux27~0_combout\,
	datac => \lcd_out|state.WRITE_CHAR6~regout\,
	datad => \lcd_out|Mux20~0_combout\,
	combout => \lcd_out|Selector9~0_combout\);

-- Location: LCCOMB_X38_Y26_N4
\DisplayReg[9]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[9]~45_combout\ = (\reg_select~combout\(2) & (\reg_select~combout\(1))) # (!\reg_select~combout\(2) & ((\reg_select~combout\(1) & ((\CPU|FNU|R3|data_out\(9)))) # (!\reg_select~combout\(1) & (\CPU|FNU|R1|data_out\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \reg_select~combout\(1),
	datac => \CPU|FNU|R1|data_out\(9),
	datad => \CPU|FNU|R3|data_out\(9),
	combout => \DisplayReg[9]~45_combout\);

-- Location: LCCOMB_X38_Y24_N14
\DisplayReg[9]~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[9]~46_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[9]~45_combout\ & (\CPU|FNU|R7|data_out\(9))) # (!\DisplayReg[9]~45_combout\ & ((\CPU|FNU|R5|data_out\(9)))))) # (!\reg_select~combout\(2) & (((\DisplayReg[9]~45_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \CPU|FNU|R7|data_out\(9),
	datac => \DisplayReg[9]~45_combout\,
	datad => \CPU|FNU|R5|data_out\(9),
	combout => \DisplayReg[9]~46_combout\);

-- Location: LCFF_X36_Y24_N13
\display_buf[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \data_bus_temp[9]~31_combout\,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(9));

-- Location: LCCOMB_X38_Y24_N2
\DisplayReg[9]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[9]~47_combout\ = (\reg_select~combout\(1) & (\reg_select~combout\(2))) # (!\reg_select~combout\(1) & ((\reg_select~combout\(2) & (\CPU|FNU|R4|data_out\(9))) # (!\reg_select~combout\(2) & ((display_buf(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R4|data_out\(9),
	datad => display_buf(9),
	combout => \DisplayReg[9]~47_combout\);

-- Location: LCCOMB_X43_Y24_N2
\DisplayReg[9]~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[9]~48_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[9]~47_combout\ & (\CPU|FNU|R6|data_out\(9))) # (!\DisplayReg[9]~47_combout\ & ((\CPU|FNU|R2|data_out\(9)))))) # (!\reg_select~combout\(1) & (((\DisplayReg[9]~47_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R6|data_out\(9),
	datac => \CPU|FNU|R2|data_out\(9),
	datad => \DisplayReg[9]~47_combout\,
	combout => \DisplayReg[9]~48_combout\);

-- Location: LCCOMB_X38_Y24_N20
\DisplayReg[9]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[9]~49_combout\ = (\reg_select~combout\(0) & (\DisplayReg[9]~46_combout\)) # (!\reg_select~combout\(0) & ((\DisplayReg[9]~48_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg_select~combout\(0),
	datac => \DisplayReg[9]~46_combout\,
	datad => \DisplayReg[9]~48_combout\,
	combout => \DisplayReg[9]~49_combout\);

-- Location: LCCOMB_X38_Y26_N24
\DisplayReg[8]~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[8]~40_combout\ = (\reg_select~combout\(2) & (\reg_select~combout\(1))) # (!\reg_select~combout\(2) & ((\reg_select~combout\(1) & (\CPU|FNU|R3|data_out\(8))) # (!\reg_select~combout\(1) & ((\CPU|FNU|R1|data_out\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \reg_select~combout\(1),
	datac => \CPU|FNU|R3|data_out\(8),
	datad => \CPU|FNU|R1|data_out\(8),
	combout => \DisplayReg[8]~40_combout\);

-- Location: LCCOMB_X43_Y26_N16
\DisplayReg[8]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[8]~41_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[8]~40_combout\ & (\CPU|FNU|R7|data_out\(8))) # (!\DisplayReg[8]~40_combout\ & ((\CPU|FNU|R5|data_out\(8)))))) # (!\reg_select~combout\(2) & (((\DisplayReg[8]~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R7|data_out\(8),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R5|data_out\(8),
	datad => \DisplayReg[8]~40_combout\,
	combout => \DisplayReg[8]~41_combout\);

-- Location: LCFF_X36_Y26_N9
\display_buf[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \data_bus_temp[8]~28_combout\,
	sload => VCC,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(8));

-- Location: LCCOMB_X43_Y26_N6
\DisplayReg[8]~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[8]~42_combout\ = (\reg_select~combout\(1) & (\reg_select~combout\(2))) # (!\reg_select~combout\(1) & ((\reg_select~combout\(2) & (\CPU|FNU|R4|data_out\(8))) # (!\reg_select~combout\(2) & ((display_buf(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R4|data_out\(8),
	datad => display_buf(8),
	combout => \DisplayReg[8]~42_combout\);

-- Location: LCCOMB_X43_Y26_N2
\DisplayReg[8]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[8]~43_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[8]~42_combout\ & (\CPU|FNU|R6|data_out\(8))) # (!\DisplayReg[8]~42_combout\ & ((\CPU|FNU|R2|data_out\(8)))))) # (!\reg_select~combout\(1) & (((\DisplayReg[8]~42_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R6|data_out\(8),
	datac => \CPU|FNU|R2|data_out\(8),
	datad => \DisplayReg[8]~42_combout\,
	combout => \DisplayReg[8]~43_combout\);

-- Location: LCCOMB_X43_Y26_N0
\DisplayReg[8]~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[8]~44_combout\ = (\reg_select~combout\(0) & (\DisplayReg[8]~41_combout\)) # (!\reg_select~combout\(0) & ((\DisplayReg[8]~43_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(0),
	datac => \DisplayReg[8]~41_combout\,
	datad => \DisplayReg[8]~43_combout\,
	combout => \DisplayReg[8]~44_combout\);

-- Location: LCCOMB_X43_Y26_N26
\DisplayReg[10]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[10]~51_combout\ = (\DisplayReg[10]~50_combout\ & (((\CPU|FNU|R7|data_out\(10))) # (!\reg_select~combout\(2)))) # (!\DisplayReg[10]~50_combout\ & (\reg_select~combout\(2) & ((\CPU|FNU|R5|data_out\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[10]~50_combout\,
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R7|data_out\(10),
	datad => \CPU|FNU|R5|data_out\(10),
	combout => \DisplayReg[10]~51_combout\);

-- Location: LCFF_X36_Y24_N7
\display_buf[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \data_bus_temp[10]~34_combout\,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(10));

-- Location: LCCOMB_X43_Y26_N22
\DisplayReg[10]~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[10]~52_combout\ = (\reg_select~combout\(1) & (\reg_select~combout\(2))) # (!\reg_select~combout\(1) & ((\reg_select~combout\(2) & (\CPU|FNU|R4|data_out\(10))) # (!\reg_select~combout\(2) & ((display_buf(10))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R4|data_out\(10),
	datad => display_buf(10),
	combout => \DisplayReg[10]~52_combout\);

-- Location: LCCOMB_X43_Y26_N12
\DisplayReg[10]~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[10]~53_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[10]~52_combout\ & (\CPU|FNU|R6|data_out\(10))) # (!\DisplayReg[10]~52_combout\ & ((\CPU|FNU|R2|data_out\(10)))))) # (!\reg_select~combout\(1) & (((\DisplayReg[10]~52_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R6|data_out\(10),
	datac => \CPU|FNU|R2|data_out\(10),
	datad => \DisplayReg[10]~52_combout\,
	combout => \DisplayReg[10]~53_combout\);

-- Location: LCCOMB_X43_Y26_N8
\DisplayReg[10]~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[10]~54_combout\ = (\reg_select~combout\(0) & (\DisplayReg[10]~51_combout\)) # (!\reg_select~combout\(0) & ((\DisplayReg[10]~53_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(0),
	datab => \DisplayReg[10]~51_combout\,
	datad => \DisplayReg[10]~53_combout\,
	combout => \DisplayReg[10]~54_combout\);

-- Location: LCCOMB_X35_Y24_N4
\lcd_out|Mux13~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Mux13~0_combout\ = \DisplayReg[8]~44_combout\ $ (((\DisplayReg[11]~59_combout\ & ((\DisplayReg[9]~49_combout\) # (\DisplayReg[10]~54_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[11]~59_combout\,
	datab => \DisplayReg[9]~49_combout\,
	datac => \DisplayReg[8]~44_combout\,
	datad => \DisplayReg[10]~54_combout\,
	combout => \lcd_out|Mux13~0_combout\);

-- Location: LCFF_X37_Y23_N19
\display_buf[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \data_bus_temp[15]~49_combout\,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(15));

-- Location: LCCOMB_X38_Y25_N6
\DisplayReg[15]~77\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[15]~77_combout\ = (\reg_select~combout\(1) & (((\reg_select~combout\(2))))) # (!\reg_select~combout\(1) & ((\reg_select~combout\(2) & (\CPU|FNU|R4|data_out\(15))) # (!\reg_select~combout\(2) & ((display_buf(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R4|data_out\(15),
	datac => \reg_select~combout\(2),
	datad => display_buf(15),
	combout => \DisplayReg[15]~77_combout\);

-- Location: LCCOMB_X38_Y25_N18
\DisplayReg[15]~78\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[15]~78_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[15]~77_combout\ & ((\CPU|FNU|R6|data_out\(15)))) # (!\DisplayReg[15]~77_combout\ & (\CPU|FNU|R2|data_out\(15))))) # (!\reg_select~combout\(1) & (((\DisplayReg[15]~77_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R2|data_out\(15),
	datab => \reg_select~combout\(1),
	datac => \CPU|FNU|R6|data_out\(15),
	datad => \DisplayReg[15]~77_combout\,
	combout => \DisplayReg[15]~78_combout\);

-- Location: LCCOMB_X42_Y28_N12
\DisplayReg[15]~75\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[15]~75_combout\ = (\reg_select~combout\(1) & ((\reg_select~combout\(2)) # ((\CPU|FNU|R3|data_out\(15))))) # (!\reg_select~combout\(1) & (!\reg_select~combout\(2) & (\CPU|FNU|R1|data_out\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R1|data_out\(15),
	datad => \CPU|FNU|R3|data_out\(15),
	combout => \DisplayReg[15]~75_combout\);

-- Location: LCCOMB_X42_Y28_N14
\DisplayReg[15]~76\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[15]~76_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[15]~75_combout\ & ((\CPU|FNU|R7|data_out\(15)))) # (!\DisplayReg[15]~75_combout\ & (\CPU|FNU|R5|data_out\(15))))) # (!\reg_select~combout\(2) & (((\DisplayReg[15]~75_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(15),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R7|data_out\(15),
	datad => \DisplayReg[15]~75_combout\,
	combout => \DisplayReg[15]~76_combout\);

-- Location: LCCOMB_X38_Y25_N20
\DisplayReg[15]~79\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[15]~79_combout\ = (\reg_select~combout\(0) & ((\DisplayReg[15]~76_combout\))) # (!\reg_select~combout\(0) & (\DisplayReg[15]~78_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DisplayReg[15]~78_combout\,
	datac => \reg_select~combout\(0),
	datad => \DisplayReg[15]~76_combout\,
	combout => \DisplayReg[15]~79_combout\);

-- Location: LCCOMB_X43_Y25_N4
\DisplayReg[14]~70\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[14]~70_combout\ = (\reg_select~combout\(2) & (((\reg_select~combout\(1))))) # (!\reg_select~combout\(2) & ((\reg_select~combout\(1) & ((\CPU|FNU|R3|data_out\(14)))) # (!\reg_select~combout\(1) & (\CPU|FNU|R1|data_out\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \CPU|FNU|R1|data_out\(14),
	datac => \reg_select~combout\(1),
	datad => \CPU|FNU|R3|data_out\(14),
	combout => \DisplayReg[14]~70_combout\);

-- Location: LCFF_X42_Y27_N1
\CPU|FNU|R5|data_out[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[14]~19_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R5|data_out\(14));

-- Location: LCCOMB_X42_Y27_N0
\DisplayReg[14]~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[14]~71_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[14]~70_combout\ & ((\CPU|FNU|R7|data_out\(14)))) # (!\DisplayReg[14]~70_combout\ & (\CPU|FNU|R5|data_out\(14))))) # (!\reg_select~combout\(2) & (\DisplayReg[14]~70_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \DisplayReg[14]~70_combout\,
	datac => \CPU|FNU|R5|data_out\(14),
	datad => \CPU|FNU|R7|data_out\(14),
	combout => \DisplayReg[14]~71_combout\);

-- Location: LCCOMB_X35_Y25_N10
\display_buf[14]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \display_buf[14]~feeder_combout\ = \data_bus_temp[14]~46_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \data_bus_temp[14]~46_combout\,
	combout => \display_buf[14]~feeder_combout\);

-- Location: LCFF_X35_Y25_N11
\display_buf[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display_buf[14]~feeder_combout\,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(14));

-- Location: LCCOMB_X42_Y27_N28
\DisplayReg[14]~72\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[14]~72_combout\ = (\reg_select~combout\(2) & ((\CPU|FNU|R4|data_out\(14)) # ((\reg_select~combout\(1))))) # (!\reg_select~combout\(2) & (((!\reg_select~combout\(1) & display_buf(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \CPU|FNU|R4|data_out\(14),
	datac => \reg_select~combout\(1),
	datad => display_buf(14),
	combout => \DisplayReg[14]~72_combout\);

-- Location: LCCOMB_X42_Y27_N18
\DisplayReg[14]~73\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[14]~73_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[14]~72_combout\ & (\CPU|FNU|R6|data_out\(14))) # (!\DisplayReg[14]~72_combout\ & ((\CPU|FNU|R2|data_out\(14)))))) # (!\reg_select~combout\(1) & (((\DisplayReg[14]~72_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R6|data_out\(14),
	datac => \CPU|FNU|R2|data_out\(14),
	datad => \DisplayReg[14]~72_combout\,
	combout => \DisplayReg[14]~73_combout\);

-- Location: LCCOMB_X42_Y27_N6
\DisplayReg[14]~74\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[14]~74_combout\ = (\reg_select~combout\(0) & (\DisplayReg[14]~71_combout\)) # (!\reg_select~combout\(0) & ((\DisplayReg[14]~73_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DisplayReg[14]~71_combout\,
	datac => \reg_select~combout\(0),
	datad => \DisplayReg[14]~73_combout\,
	combout => \DisplayReg[14]~74_combout\);

-- Location: LCFF_X36_Y24_N19
\display_buf[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \data_bus_temp[13]~43_combout\,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(13));

-- Location: LCCOMB_X41_Y25_N14
\DisplayReg[13]~67\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[13]~67_combout\ = (\reg_select~combout\(1) & (\reg_select~combout\(2))) # (!\reg_select~combout\(1) & ((\reg_select~combout\(2) & ((\CPU|FNU|R4|data_out\(13)))) # (!\reg_select~combout\(2) & (display_buf(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \reg_select~combout\(2),
	datac => display_buf(13),
	datad => \CPU|FNU|R4|data_out\(13),
	combout => \DisplayReg[13]~67_combout\);

-- Location: LCCOMB_X41_Y25_N4
\DisplayReg[13]~68\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[13]~68_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[13]~67_combout\ & ((\CPU|FNU|R6|data_out\(13)))) # (!\DisplayReg[13]~67_combout\ & (\CPU|FNU|R2|data_out\(13))))) # (!\reg_select~combout\(1) & (\DisplayReg[13]~67_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \DisplayReg[13]~67_combout\,
	datac => \CPU|FNU|R2|data_out\(13),
	datad => \CPU|FNU|R6|data_out\(13),
	combout => \DisplayReg[13]~68_combout\);

-- Location: LCCOMB_X40_Y26_N20
\CPU|FNU|R1|data_out[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \CPU|FNU|R1|data_out[13]~feeder_combout\ = \CPU|FNU|func_data[13]~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \CPU|FNU|func_data[13]~18_combout\,
	combout => \CPU|FNU|R1|data_out[13]~feeder_combout\);

-- Location: LCFF_X40_Y26_N21
\CPU|FNU|R1|data_out[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CPU|FNU|R1|data_out[13]~feeder_combout\,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(13));

-- Location: LCCOMB_X40_Y26_N30
\DisplayReg[13]~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[13]~65_combout\ = (\reg_select~combout\(2) & (\reg_select~combout\(1))) # (!\reg_select~combout\(2) & ((\reg_select~combout\(1) & ((\CPU|FNU|R3|data_out\(13)))) # (!\reg_select~combout\(1) & (\CPU|FNU|R1|data_out\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \reg_select~combout\(1),
	datac => \CPU|FNU|R1|data_out\(13),
	datad => \CPU|FNU|R3|data_out\(13),
	combout => \DisplayReg[13]~65_combout\);

-- Location: LCCOMB_X41_Y25_N26
\DisplayReg[13]~66\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[13]~66_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[13]~65_combout\ & ((\CPU|FNU|R7|data_out\(13)))) # (!\DisplayReg[13]~65_combout\ & (\CPU|FNU|R5|data_out\(13))))) # (!\reg_select~combout\(2) & (((\DisplayReg[13]~65_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \CPU|FNU|R5|data_out\(13),
	datac => \DisplayReg[13]~65_combout\,
	datad => \CPU|FNU|R7|data_out\(13),
	combout => \DisplayReg[13]~66_combout\);

-- Location: LCCOMB_X41_Y25_N8
\DisplayReg[13]~69\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[13]~69_combout\ = (\reg_select~combout\(0) & ((\DisplayReg[13]~66_combout\))) # (!\reg_select~combout\(0) & (\DisplayReg[13]~68_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(0),
	datac => \DisplayReg[13]~68_combout\,
	datad => \DisplayReg[13]~66_combout\,
	combout => \DisplayReg[13]~69_combout\);

-- Location: LCCOMB_X35_Y24_N6
\lcd_out|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Mux6~0_combout\ = \DisplayReg[12]~64_combout\ $ (((\DisplayReg[15]~79_combout\ & ((\DisplayReg[14]~74_combout\) # (\DisplayReg[13]~69_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[12]~64_combout\,
	datab => \DisplayReg[15]~79_combout\,
	datac => \DisplayReg[14]~74_combout\,
	datad => \DisplayReg[13]~69_combout\,
	combout => \lcd_out|Mux6~0_combout\);

-- Location: LCCOMB_X35_Y24_N0
\lcd_out|Selector9~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector9~2_combout\ = (\lcd_out|state.WRITE_CHAR4~regout\ & ((\lcd_out|Mux13~0_combout\) # ((\lcd_out|state.WRITE_CHAR3~regout\ & \lcd_out|Mux6~0_combout\)))) # (!\lcd_out|state.WRITE_CHAR4~regout\ & (\lcd_out|state.WRITE_CHAR3~regout\ & 
-- ((\lcd_out|Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.WRITE_CHAR4~regout\,
	datab => \lcd_out|state.WRITE_CHAR3~regout\,
	datac => \lcd_out|Mux13~0_combout\,
	datad => \lcd_out|Mux6~0_combout\,
	combout => \lcd_out|Selector9~2_combout\);

-- Location: LCCOMB_X35_Y24_N8
\lcd_out|Selector9~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector9~3_combout\ = (\lcd_out|Selector9~1_combout\) # ((\lcd_out|Selector9~0_combout\) # (\lcd_out|Selector9~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|Selector9~1_combout\,
	datac => \lcd_out|Selector9~0_combout\,
	datad => \lcd_out|Selector9~2_combout\,
	combout => \lcd_out|Selector9~3_combout\);

-- Location: LCFF_X35_Y24_N9
\lcd_out|DATA_BUS_VALUE[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector9~3_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|DATA_BUS_VALUE\(0));

-- Location: LCCOMB_X35_Y24_N2
\lcd_out|Mux19~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Mux19~0_combout\ = (\DisplayReg[7]~19_combout\ & ((\DisplayReg[5]~9_combout\ & ((\DisplayReg[4]~4_combout\))) # (!\DisplayReg[5]~9_combout\ & (\DisplayReg[6]~14_combout\ & !\DisplayReg[4]~4_combout\)))) # (!\DisplayReg[7]~19_combout\ & 
-- (((\DisplayReg[5]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[7]~19_combout\,
	datab => \DisplayReg[6]~14_combout\,
	datac => \DisplayReg[5]~9_combout\,
	datad => \DisplayReg[4]~4_combout\,
	combout => \lcd_out|Mux19~0_combout\);

-- Location: LCCOMB_X35_Y24_N28
\lcd_out|Mux26~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Mux26~0_combout\ = (\DisplayReg[1]~29_combout\ & (((\DisplayReg[0]~24_combout\)) # (!\DisplayReg[3]~39_combout\))) # (!\DisplayReg[1]~29_combout\ & (\DisplayReg[3]~39_combout\ & (\DisplayReg[2]~34_combout\ & !\DisplayReg[0]~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[1]~29_combout\,
	datab => \DisplayReg[3]~39_combout\,
	datac => \DisplayReg[2]~34_combout\,
	datad => \DisplayReg[0]~24_combout\,
	combout => \lcd_out|Mux26~0_combout\);

-- Location: LCCOMB_X35_Y24_N14
\lcd_out|Selector8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector8~0_combout\ = (\lcd_out|state.WRITE_CHAR6~regout\ & ((\lcd_out|Mux26~0_combout\) # ((\lcd_out|Mux19~0_combout\ & \lcd_out|state.WRITE_CHAR5~regout\)))) # (!\lcd_out|state.WRITE_CHAR6~regout\ & (\lcd_out|Mux19~0_combout\ & 
-- (\lcd_out|state.WRITE_CHAR5~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.WRITE_CHAR6~regout\,
	datab => \lcd_out|Mux19~0_combout\,
	datac => \lcd_out|state.WRITE_CHAR5~regout\,
	datad => \lcd_out|Mux26~0_combout\,
	combout => \lcd_out|Selector8~0_combout\);

-- Location: LCCOMB_X35_Y24_N24
\lcd_out|Mux12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Mux12~0_combout\ = (\DisplayReg[11]~59_combout\ & ((\DisplayReg[9]~49_combout\ & (\DisplayReg[8]~44_combout\)) # (!\DisplayReg[9]~49_combout\ & (!\DisplayReg[8]~44_combout\ & \DisplayReg[10]~54_combout\)))) # (!\DisplayReg[11]~59_combout\ & 
-- (\DisplayReg[9]~49_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[11]~59_combout\,
	datab => \DisplayReg[9]~49_combout\,
	datac => \DisplayReg[8]~44_combout\,
	datad => \DisplayReg[10]~54_combout\,
	combout => \lcd_out|Mux12~0_combout\);

-- Location: LCCOMB_X35_Y24_N26
\lcd_out|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Mux5~0_combout\ = (\DisplayReg[12]~64_combout\ & (((\DisplayReg[13]~69_combout\)))) # (!\DisplayReg[12]~64_combout\ & ((\DisplayReg[15]~79_combout\ & (\DisplayReg[14]~74_combout\ & !\DisplayReg[13]~69_combout\)) # (!\DisplayReg[15]~79_combout\ & 
-- ((\DisplayReg[13]~69_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[12]~64_combout\,
	datab => \DisplayReg[15]~79_combout\,
	datac => \DisplayReg[14]~74_combout\,
	datad => \DisplayReg[13]~69_combout\,
	combout => \lcd_out|Mux5~0_combout\);

-- Location: LCCOMB_X35_Y24_N20
\lcd_out|Selector8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector8~1_combout\ = (\lcd_out|state.WRITE_CHAR4~regout\ & ((\lcd_out|Mux12~0_combout\) # ((\lcd_out|state.WRITE_CHAR3~regout\ & \lcd_out|Mux5~0_combout\)))) # (!\lcd_out|state.WRITE_CHAR4~regout\ & (\lcd_out|state.WRITE_CHAR3~regout\ & 
-- ((\lcd_out|Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.WRITE_CHAR4~regout\,
	datab => \lcd_out|state.WRITE_CHAR3~regout\,
	datac => \lcd_out|Mux12~0_combout\,
	datad => \lcd_out|Mux5~0_combout\,
	combout => \lcd_out|Selector8~1_combout\);

-- Location: LCCOMB_X33_Y23_N0
\lcd_out|Selector8~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector8~2_combout\ = (\lcd_out|state.MODE_SET~regout\) # ((\lcd_out|DATA_BUS_VALUE\(1) & ((\lcd_out|state.TOGGLE_E~regout\) # (\lcd_out|state.HOLD~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.TOGGLE_E~regout\,
	datab => \lcd_out|state.MODE_SET~regout\,
	datac => \lcd_out|state.HOLD~regout\,
	datad => \lcd_out|DATA_BUS_VALUE\(1),
	combout => \lcd_out|Selector8~2_combout\);

-- Location: LCCOMB_X35_Y24_N18
\lcd_out|Selector8~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector8~3_combout\ = ((\lcd_out|Selector8~0_combout\) # ((\lcd_out|Selector8~1_combout\) # (\lcd_out|Selector8~2_combout\))) # (!\lcd_out|Selector1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|Selector1~0_combout\,
	datab => \lcd_out|Selector8~0_combout\,
	datac => \lcd_out|Selector8~1_combout\,
	datad => \lcd_out|Selector8~2_combout\,
	combout => \lcd_out|Selector8~3_combout\);

-- Location: LCFF_X35_Y24_N19
\lcd_out|DATA_BUS_VALUE[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector8~3_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|DATA_BUS_VALUE\(1));

-- Location: LCCOMB_X41_Y28_N16
\DisplayReg[12]~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[12]~60_combout\ = (\reg_select~combout\(2) & (((\reg_select~combout\(1))))) # (!\reg_select~combout\(2) & ((\reg_select~combout\(1) & (\CPU|FNU|R3|data_out\(12))) # (!\reg_select~combout\(1) & ((\CPU|FNU|R1|data_out\(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \CPU|FNU|R3|data_out\(12),
	datac => \CPU|FNU|R1|data_out\(12),
	datad => \reg_select~combout\(1),
	combout => \DisplayReg[12]~60_combout\);

-- Location: LCCOMB_X38_Y25_N24
\DisplayReg[12]~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[12]~61_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[12]~60_combout\ & ((\CPU|FNU|R7|data_out\(12)))) # (!\DisplayReg[12]~60_combout\ & (\CPU|FNU|R5|data_out\(12))))) # (!\reg_select~combout\(2) & (((\DisplayReg[12]~60_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(12),
	datab => \reg_select~combout\(2),
	datac => \DisplayReg[12]~60_combout\,
	datad => \CPU|FNU|R7|data_out\(12),
	combout => \DisplayReg[12]~61_combout\);

-- Location: LCFF_X36_Y24_N1
\display_buf[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \data_bus_temp[12]~40_combout\,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(12));

-- Location: LCCOMB_X42_Y25_N12
\DisplayReg[12]~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[12]~62_combout\ = (\reg_select~combout\(2) & ((\CPU|FNU|R4|data_out\(12)) # ((\reg_select~combout\(1))))) # (!\reg_select~combout\(2) & (((display_buf(12) & !\reg_select~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R4|data_out\(12),
	datab => \reg_select~combout\(2),
	datac => display_buf(12),
	datad => \reg_select~combout\(1),
	combout => \DisplayReg[12]~62_combout\);

-- Location: LCCOMB_X42_Y25_N6
\DisplayReg[12]~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[12]~63_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[12]~62_combout\ & ((\CPU|FNU|R6|data_out\(12)))) # (!\DisplayReg[12]~62_combout\ & (\CPU|FNU|R2|data_out\(12))))) # (!\reg_select~combout\(1) & (((\DisplayReg[12]~62_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R2|data_out\(12),
	datac => \CPU|FNU|R6|data_out\(12),
	datad => \DisplayReg[12]~62_combout\,
	combout => \DisplayReg[12]~63_combout\);

-- Location: LCCOMB_X38_Y25_N10
\DisplayReg[12]~64\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[12]~64_combout\ = (\reg_select~combout\(0) & (\DisplayReg[12]~61_combout\)) # (!\reg_select~combout\(0) & ((\DisplayReg[12]~63_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg_select~combout\(0),
	datac => \DisplayReg[12]~61_combout\,
	datad => \DisplayReg[12]~63_combout\,
	combout => \DisplayReg[12]~64_combout\);

-- Location: LCCOMB_X34_Y23_N14
\lcd_out|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Mux4~0_combout\ = (\DisplayReg[14]~74_combout\ & ((\DisplayReg[13]~69_combout\) # ((\DisplayReg[12]~64_combout\) # (!\DisplayReg[15]~79_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[13]~69_combout\,
	datab => \DisplayReg[12]~64_combout\,
	datac => \DisplayReg[15]~79_combout\,
	datad => \DisplayReg[14]~74_combout\,
	combout => \lcd_out|Mux4~0_combout\);

-- Location: LCCOMB_X34_Y23_N28
\lcd_out|Mux11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Mux11~0_combout\ = (\DisplayReg[10]~54_combout\ & (((\DisplayReg[8]~44_combout\) # (\DisplayReg[9]~49_combout\)) # (!\DisplayReg[11]~59_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[11]~59_combout\,
	datab => \DisplayReg[10]~54_combout\,
	datac => \DisplayReg[8]~44_combout\,
	datad => \DisplayReg[9]~49_combout\,
	combout => \lcd_out|Mux11~0_combout\);

-- Location: LCCOMB_X34_Y23_N24
\lcd_out|Selector7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector7~1_combout\ = (\lcd_out|state.WRITE_CHAR3~regout\ & ((\lcd_out|Mux4~0_combout\) # ((\lcd_out|state.WRITE_CHAR4~regout\ & \lcd_out|Mux11~0_combout\)))) # (!\lcd_out|state.WRITE_CHAR3~regout\ & (\lcd_out|state.WRITE_CHAR4~regout\ & 
-- ((\lcd_out|Mux11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.WRITE_CHAR3~regout\,
	datab => \lcd_out|state.WRITE_CHAR4~regout\,
	datac => \lcd_out|Mux4~0_combout\,
	datad => \lcd_out|Mux11~0_combout\,
	combout => \lcd_out|Selector7~1_combout\);

-- Location: LCCOMB_X34_Y23_N8
\lcd_out|Mux25~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Mux25~0_combout\ = (\DisplayReg[2]~34_combout\ & ((\DisplayReg[1]~29_combout\) # ((\DisplayReg[0]~24_combout\) # (!\DisplayReg[3]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[1]~29_combout\,
	datab => \DisplayReg[3]~39_combout\,
	datac => \DisplayReg[2]~34_combout\,
	datad => \DisplayReg[0]~24_combout\,
	combout => \lcd_out|Mux25~0_combout\);

-- Location: LCCOMB_X35_Y24_N22
\lcd_out|Mux18~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Mux18~0_combout\ = (\DisplayReg[6]~14_combout\ & (((\DisplayReg[5]~9_combout\) # (\DisplayReg[4]~4_combout\)) # (!\DisplayReg[7]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[7]~19_combout\,
	datab => \DisplayReg[6]~14_combout\,
	datac => \DisplayReg[5]~9_combout\,
	datad => \DisplayReg[4]~4_combout\,
	combout => \lcd_out|Mux18~0_combout\);

-- Location: LCCOMB_X34_Y23_N10
\lcd_out|Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector7~0_combout\ = (\lcd_out|state.WRITE_CHAR6~regout\ & ((\lcd_out|Mux25~0_combout\) # ((\lcd_out|state.WRITE_CHAR5~regout\ & \lcd_out|Mux18~0_combout\)))) # (!\lcd_out|state.WRITE_CHAR6~regout\ & (\lcd_out|state.WRITE_CHAR5~regout\ & 
-- ((\lcd_out|Mux18~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.WRITE_CHAR6~regout\,
	datab => \lcd_out|state.WRITE_CHAR5~regout\,
	datac => \lcd_out|Mux25~0_combout\,
	datad => \lcd_out|Mux18~0_combout\,
	combout => \lcd_out|Selector7~0_combout\);

-- Location: LCCOMB_X34_Y23_N18
\lcd_out|Selector7~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector7~3_combout\ = (\lcd_out|Selector7~2_combout\) # ((\lcd_out|state.MODE_SET~regout\) # ((\lcd_out|Selector7~1_combout\) # (\lcd_out|Selector7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|Selector7~2_combout\,
	datab => \lcd_out|state.MODE_SET~regout\,
	datac => \lcd_out|Selector7~1_combout\,
	datad => \lcd_out|Selector7~0_combout\,
	combout => \lcd_out|Selector7~3_combout\);

-- Location: LCFF_X34_Y23_N19
\lcd_out|DATA_BUS_VALUE[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector7~3_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|DATA_BUS_VALUE\(2));

-- Location: LCCOMB_X34_Y23_N26
\lcd_out|Selector6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector6~4_combout\ = (\DisplayReg[11]~59_combout\ & (\lcd_out|state.WRITE_CHAR4~regout\ & (!\DisplayReg[10]~54_combout\ & !\DisplayReg[9]~49_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[11]~59_combout\,
	datab => \lcd_out|state.WRITE_CHAR4~regout\,
	datac => \DisplayReg[10]~54_combout\,
	datad => \DisplayReg[9]~49_combout\,
	combout => \lcd_out|Selector6~4_combout\);

-- Location: LCCOMB_X35_Y23_N22
\lcd_out|Selector23~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector23~0_combout\ = (\lcd_out|state.RESET2~regout\) # ((\lcd_out|next_command.RESET3~regout\ & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.RESET2~regout\,
	datab => \lcd_out|state.HOLD~regout\,
	datac => \lcd_out|next_command.RESET3~regout\,
	datad => \lcd_out|state.TOGGLE_E~regout\,
	combout => \lcd_out|Selector23~0_combout\);

-- Location: LCFF_X35_Y23_N23
\lcd_out|next_command.RESET3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector23~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.RESET3~regout\);

-- Location: LCCOMB_X35_Y23_N12
\lcd_out|state~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~49_combout\ = (\lcd_out|state.HOLD~regout\ & \lcd_out|next_command.RESET3~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|state.HOLD~regout\,
	datad => \lcd_out|next_command.RESET3~regout\,
	combout => \lcd_out|state~49_combout\);

-- Location: LCFF_X35_Y23_N13
\lcd_out|state.RESET3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~49_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.RESET3~regout\);

-- Location: LCCOMB_X35_Y23_N4
\lcd_out|Selector22~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector22~0_combout\ = (\lcd_out|state.RESET1~regout\ & ((\lcd_out|next_command.RESET2~regout\) # ((!\lcd_out|state.HOLD~regout\ & !\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.RESET1~regout\,
	datab => \lcd_out|state.HOLD~regout\,
	datac => \lcd_out|next_command.RESET2~regout\,
	datad => \lcd_out|state.TOGGLE_E~regout\,
	combout => \lcd_out|Selector22~0_combout\);

-- Location: LCFF_X35_Y23_N5
\lcd_out|next_command.RESET2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector22~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.RESET2~regout\);

-- Location: LCCOMB_X35_Y23_N24
\lcd_out|state~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~48_combout\ = (\lcd_out|state.HOLD~regout\ & !\lcd_out|next_command.RESET2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datac => \lcd_out|next_command.RESET2~regout\,
	combout => \lcd_out|state~48_combout\);

-- Location: LCFF_X35_Y23_N25
\lcd_out|state.RESET2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~48_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.RESET2~regout\);

-- Location: LCCOMB_X35_Y23_N10
\lcd_out|Selector12~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector12~0_combout\ = (\lcd_out|state.RESET3~regout\) # ((\lcd_out|next_command.FUNC_SET~regout\ & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.RESET3~regout\,
	datab => \lcd_out|state.HOLD~regout\,
	datac => \lcd_out|next_command.FUNC_SET~regout\,
	datad => \lcd_out|state.TOGGLE_E~regout\,
	combout => \lcd_out|Selector12~0_combout\);

-- Location: LCFF_X35_Y23_N11
\lcd_out|next_command.FUNC_SET\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector12~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.FUNC_SET~regout\);

-- Location: LCCOMB_X35_Y23_N6
\lcd_out|state~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~47_combout\ = (\lcd_out|state.HOLD~regout\ & \lcd_out|next_command.FUNC_SET~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lcd_out|state.HOLD~regout\,
	datad => \lcd_out|next_command.FUNC_SET~regout\,
	combout => \lcd_out|state~47_combout\);

-- Location: LCFF_X35_Y23_N7
\lcd_out|state.FUNC_SET\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~47_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.FUNC_SET~regout\);

-- Location: LCCOMB_X35_Y23_N18
\lcd_out|Selector6~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector6~6_combout\ = (\lcd_out|state.RESET1~regout\ & (!\lcd_out|state.RESET2~regout\ & (!\lcd_out|state.WRITE_CHAR2~regout\ & !\lcd_out|state.FUNC_SET~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.RESET1~regout\,
	datab => \lcd_out|state.RESET2~regout\,
	datac => \lcd_out|state.WRITE_CHAR2~regout\,
	datad => \lcd_out|state.FUNC_SET~regout\,
	combout => \lcd_out|Selector6~6_combout\);

-- Location: LCCOMB_X34_Y23_N22
\lcd_out|Selector6~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector6~7_combout\ = (!\lcd_out|state.RESET3~regout\ & \lcd_out|Selector6~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lcd_out|state.RESET3~regout\,
	datad => \lcd_out|Selector6~6_combout\,
	combout => \lcd_out|Selector6~7_combout\);

-- Location: LCFF_X37_Y23_N25
\display_buf[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \data_bus_temp[1]~19_combout\,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(1));

-- Location: LCCOMB_X38_Y27_N30
\DisplayReg[1]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[1]~27_combout\ = (\reg_select~combout\(2) & ((\reg_select~combout\(1)) # ((\CPU|FNU|R4|data_out\(1))))) # (!\reg_select~combout\(2) & (!\reg_select~combout\(1) & ((display_buf(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \reg_select~combout\(1),
	datac => \CPU|FNU|R4|data_out\(1),
	datad => display_buf(1),
	combout => \DisplayReg[1]~27_combout\);

-- Location: LCCOMB_X38_Y27_N24
\DisplayReg[1]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[1]~28_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[1]~27_combout\ & ((\CPU|FNU|R6|data_out\(1)))) # (!\DisplayReg[1]~27_combout\ & (\CPU|FNU|R2|data_out\(1))))) # (!\reg_select~combout\(1) & (((\DisplayReg[1]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R2|data_out\(1),
	datac => \CPU|FNU|R6|data_out\(1),
	datad => \DisplayReg[1]~27_combout\,
	combout => \DisplayReg[1]~28_combout\);

-- Location: LCFF_X42_Y28_N21
\CPU|FNU|R1|data_out[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CPU|FNU|func_data[1]~9_combout\,
	sload => VCC,
	ena => \CPU|FNU|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CPU|FNU|R1|data_out\(1));

-- Location: LCCOMB_X42_Y28_N22
\DisplayReg[1]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[1]~25_combout\ = (\reg_select~combout\(1) & ((\reg_select~combout\(2)) # ((\CPU|FNU|R3|data_out\(1))))) # (!\reg_select~combout\(1) & (!\reg_select~combout\(2) & (\CPU|FNU|R1|data_out\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R1|data_out\(1),
	datad => \CPU|FNU|R3|data_out\(1),
	combout => \DisplayReg[1]~25_combout\);

-- Location: LCCOMB_X38_Y27_N18
\DisplayReg[1]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[1]~26_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[1]~25_combout\ & (\CPU|FNU|R7|data_out\(1))) # (!\DisplayReg[1]~25_combout\ & ((\CPU|FNU|R5|data_out\(1)))))) # (!\reg_select~combout\(2) & (((\DisplayReg[1]~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R7|data_out\(1),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R5|data_out\(1),
	datad => \DisplayReg[1]~25_combout\,
	combout => \DisplayReg[1]~26_combout\);

-- Location: LCCOMB_X38_Y27_N10
\DisplayReg[1]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[1]~29_combout\ = (\reg_select~combout\(0) & ((\DisplayReg[1]~26_combout\))) # (!\reg_select~combout\(0) & (\DisplayReg[1]~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg_select~combout\(0),
	datac => \DisplayReg[1]~28_combout\,
	datad => \DisplayReg[1]~26_combout\,
	combout => \DisplayReg[1]~29_combout\);

-- Location: LCCOMB_X34_Y23_N2
\lcd_out|Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector6~0_combout\ = (\lcd_out|state.WRITE_CHAR6~regout\ & (!\DisplayReg[2]~34_combout\ & (\DisplayReg[3]~39_combout\ & !\DisplayReg[1]~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.WRITE_CHAR6~regout\,
	datab => \DisplayReg[2]~34_combout\,
	datac => \DisplayReg[3]~39_combout\,
	datad => \DisplayReg[1]~29_combout\,
	combout => \lcd_out|Selector6~0_combout\);

-- Location: LCCOMB_X34_Y23_N4
\lcd_out|Selector6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector6~1_combout\ = (\lcd_out|state.DISPLAY_ON~regout\) # ((!\lcd_out|DATA_BUS_VALUE\(3) & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|DATA_BUS_VALUE\(3),
	datab => \lcd_out|state.HOLD~regout\,
	datac => \lcd_out|state.TOGGLE_E~regout\,
	datad => \lcd_out|state.DISPLAY_ON~regout\,
	combout => \lcd_out|Selector6~1_combout\);

-- Location: LCCOMB_X34_Y23_N6
\lcd_out|Selector6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector6~2_combout\ = (\DisplayReg[7]~19_combout\ & (!\DisplayReg[6]~14_combout\ & (!\DisplayReg[5]~9_combout\ & \lcd_out|state.WRITE_CHAR5~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[7]~19_combout\,
	datab => \DisplayReg[6]~14_combout\,
	datac => \DisplayReg[5]~9_combout\,
	datad => \lcd_out|state.WRITE_CHAR5~regout\,
	combout => \lcd_out|Selector6~2_combout\);

-- Location: LCCOMB_X34_Y23_N0
\lcd_out|Selector6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector6~3_combout\ = (\lcd_out|state.DISPLAY_OFF~regout\) # ((\lcd_out|Selector6~0_combout\) # ((\lcd_out|Selector6~1_combout\) # (\lcd_out|Selector6~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.DISPLAY_OFF~regout\,
	datab => \lcd_out|Selector6~0_combout\,
	datac => \lcd_out|Selector6~1_combout\,
	datad => \lcd_out|Selector6~2_combout\,
	combout => \lcd_out|Selector6~3_combout\);

-- Location: LCCOMB_X34_Y23_N20
\lcd_out|Selector6~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector6~8_combout\ = (!\lcd_out|Selector6~5_combout\ & (!\lcd_out|Selector6~4_combout\ & (\lcd_out|Selector6~7_combout\ & !\lcd_out|Selector6~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|Selector6~5_combout\,
	datab => \lcd_out|Selector6~4_combout\,
	datac => \lcd_out|Selector6~7_combout\,
	datad => \lcd_out|Selector6~3_combout\,
	combout => \lcd_out|Selector6~8_combout\);

-- Location: LCFF_X34_Y23_N21
\lcd_out|DATA_BUS_VALUE[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector6~8_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|DATA_BUS_VALUE\(3));

-- Location: LCCOMB_X35_Y23_N14
\lcd_out|Selector5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector5~2_combout\ = (\lcd_out|state.WRITE_CHAR1~regout\) # ((!\lcd_out|DATA_BUS_VALUE\(4) & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datab => \lcd_out|DATA_BUS_VALUE\(4),
	datac => \lcd_out|state.WRITE_CHAR1~regout\,
	datad => \lcd_out|state.TOGGLE_E~regout\,
	combout => \lcd_out|Selector5~2_combout\);

-- Location: LCCOMB_X35_Y23_N28
\lcd_out|Selector4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector4~3_combout\ = (\lcd_out|state.WRITE_CHAR3~regout\ & (((!\DisplayReg[13]~69_combout\ & !\DisplayReg[14]~74_combout\)) # (!\DisplayReg[15]~79_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[15]~79_combout\,
	datab => \lcd_out|state.WRITE_CHAR3~regout\,
	datac => \DisplayReg[13]~69_combout\,
	datad => \DisplayReg[14]~74_combout\,
	combout => \lcd_out|Selector4~3_combout\);

-- Location: LCCOMB_X36_Y25_N2
\DisplayReg[7]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[7]~15_combout\ = (\reg_select~combout\(2) & (((\reg_select~combout\(1))))) # (!\reg_select~combout\(2) & ((\reg_select~combout\(1) & ((\CPU|FNU|R3|data_out\(7)))) # (!\reg_select~combout\(1) & (\CPU|FNU|R1|data_out\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R1|data_out\(7),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R3|data_out\(7),
	datad => \reg_select~combout\(1),
	combout => \DisplayReg[7]~15_combout\);

-- Location: LCCOMB_X36_Y25_N28
\DisplayReg[7]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[7]~16_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[7]~15_combout\ & ((\CPU|FNU|R7|data_out\(7)))) # (!\DisplayReg[7]~15_combout\ & (\CPU|FNU|R5|data_out\(7))))) # (!\reg_select~combout\(2) & (((\DisplayReg[7]~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \CPU|FNU|R5|data_out\(7),
	datac => \CPU|FNU|R7|data_out\(7),
	datad => \DisplayReg[7]~15_combout\,
	combout => \DisplayReg[7]~16_combout\);

-- Location: LCCOMB_X36_Y25_N8
\DisplayReg[7]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[7]~17_combout\ = (\reg_select~combout\(2) & (((\reg_select~combout\(1)) # (\CPU|FNU|R4|data_out\(7))))) # (!\reg_select~combout\(2) & (display_buf(7) & (!\reg_select~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => display_buf(7),
	datab => \reg_select~combout\(2),
	datac => \reg_select~combout\(1),
	datad => \CPU|FNU|R4|data_out\(7),
	combout => \DisplayReg[7]~17_combout\);

-- Location: LCCOMB_X36_Y25_N10
\DisplayReg[7]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[7]~18_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[7]~17_combout\ & (\CPU|FNU|R6|data_out\(7))) # (!\DisplayReg[7]~17_combout\ & ((\CPU|FNU|R2|data_out\(7)))))) # (!\reg_select~combout\(1) & (((\DisplayReg[7]~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \CPU|FNU|R6|data_out\(7),
	datac => \DisplayReg[7]~17_combout\,
	datad => \CPU|FNU|R2|data_out\(7),
	combout => \DisplayReg[7]~18_combout\);

-- Location: LCCOMB_X36_Y25_N4
\DisplayReg[7]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[7]~19_combout\ = (\reg_select~combout\(0) & (\DisplayReg[7]~16_combout\)) # (!\reg_select~combout\(0) & ((\DisplayReg[7]~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(0),
	datab => \DisplayReg[7]~16_combout\,
	datad => \DisplayReg[7]~18_combout\,
	combout => \DisplayReg[7]~19_combout\);

-- Location: LCCOMB_X36_Y23_N12
\lcd_out|Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector4~1_combout\ = (\lcd_out|state.WRITE_CHAR5~regout\ & (((!\DisplayReg[6]~14_combout\ & !\DisplayReg[5]~9_combout\)) # (!\DisplayReg[7]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[6]~14_combout\,
	datab => \DisplayReg[7]~19_combout\,
	datac => \DisplayReg[5]~9_combout\,
	datad => \lcd_out|state.WRITE_CHAR5~regout\,
	combout => \lcd_out|Selector4~1_combout\);

-- Location: LCCOMB_X41_Y26_N4
\display_buf[11]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \display_buf[11]~feeder_combout\ = \data_bus_temp[11]~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_bus_temp[11]~37_combout\,
	combout => \display_buf[11]~feeder_combout\);

-- Location: LCFF_X41_Y26_N5
\display_buf[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \display_buf[11]~feeder_combout\,
	ena => \Equal12~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => display_buf(11));

-- Location: LCCOMB_X43_Y26_N30
\DisplayReg[11]~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[11]~57_combout\ = (\reg_select~combout\(1) & (\reg_select~combout\(2))) # (!\reg_select~combout\(1) & ((\reg_select~combout\(2) & (\CPU|FNU|R4|data_out\(11))) # (!\reg_select~combout\(2) & ((display_buf(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(1),
	datab => \reg_select~combout\(2),
	datac => \CPU|FNU|R4|data_out\(11),
	datad => display_buf(11),
	combout => \DisplayReg[11]~57_combout\);

-- Location: LCCOMB_X43_Y26_N4
\DisplayReg[11]~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[11]~58_combout\ = (\reg_select~combout\(1) & ((\DisplayReg[11]~57_combout\ & (\CPU|FNU|R6|data_out\(11))) # (!\DisplayReg[11]~57_combout\ & ((\CPU|FNU|R2|data_out\(11)))))) # (!\reg_select~combout\(1) & (((\DisplayReg[11]~57_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R6|data_out\(11),
	datab => \reg_select~combout\(1),
	datac => \CPU|FNU|R2|data_out\(11),
	datad => \DisplayReg[11]~57_combout\,
	combout => \DisplayReg[11]~58_combout\);

-- Location: LCCOMB_X38_Y26_N20
\DisplayReg[11]~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[11]~55_combout\ = (\reg_select~combout\(2) & (\reg_select~combout\(1))) # (!\reg_select~combout\(2) & ((\reg_select~combout\(1) & ((\CPU|FNU|R3|data_out\(11)))) # (!\reg_select~combout\(1) & (\CPU|FNU|R1|data_out\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(2),
	datab => \reg_select~combout\(1),
	datac => \CPU|FNU|R1|data_out\(11),
	datad => \CPU|FNU|R3|data_out\(11),
	combout => \DisplayReg[11]~55_combout\);

-- Location: LCCOMB_X43_Y26_N10
\DisplayReg[11]~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[11]~56_combout\ = (\reg_select~combout\(2) & ((\DisplayReg[11]~55_combout\ & ((\CPU|FNU|R7|data_out\(11)))) # (!\DisplayReg[11]~55_combout\ & (\CPU|FNU|R5|data_out\(11))))) # (!\reg_select~combout\(2) & (((\DisplayReg[11]~55_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CPU|FNU|R5|data_out\(11),
	datab => \reg_select~combout\(2),
	datac => \DisplayReg[11]~55_combout\,
	datad => \CPU|FNU|R7|data_out\(11),
	combout => \DisplayReg[11]~56_combout\);

-- Location: LCCOMB_X43_Y26_N20
\DisplayReg[11]~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \DisplayReg[11]~59_combout\ = (\reg_select~combout\(0) & ((\DisplayReg[11]~56_combout\))) # (!\reg_select~combout\(0) & (\DisplayReg[11]~58_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_select~combout\(0),
	datab => \DisplayReg[11]~58_combout\,
	datad => \DisplayReg[11]~56_combout\,
	combout => \DisplayReg[11]~59_combout\);

-- Location: LCCOMB_X35_Y23_N26
\lcd_out|Selector4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector4~2_combout\ = (\lcd_out|state.WRITE_CHAR4~regout\ & (((!\DisplayReg[10]~54_combout\ & !\DisplayReg[9]~49_combout\)) # (!\DisplayReg[11]~59_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.WRITE_CHAR4~regout\,
	datab => \DisplayReg[11]~59_combout\,
	datac => \DisplayReg[10]~54_combout\,
	datad => \DisplayReg[9]~49_combout\,
	combout => \lcd_out|Selector4~2_combout\);

-- Location: LCCOMB_X35_Y23_N30
\lcd_out|Selector4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector4~4_combout\ = (!\lcd_out|Selector4~0_combout\ & (!\lcd_out|Selector4~3_combout\ & (!\lcd_out|Selector4~1_combout\ & !\lcd_out|Selector4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|Selector4~0_combout\,
	datab => \lcd_out|Selector4~3_combout\,
	datac => \lcd_out|Selector4~1_combout\,
	datad => \lcd_out|Selector4~2_combout\,
	combout => \lcd_out|Selector4~4_combout\);

-- Location: LCCOMB_X35_Y23_N0
\lcd_out|Selector5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector5~3_combout\ = (!\lcd_out|state.RESET3~regout\ & (\lcd_out|Selector6~6_combout\ & (!\lcd_out|Selector5~2_combout\ & \lcd_out|Selector4~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.RESET3~regout\,
	datab => \lcd_out|Selector6~6_combout\,
	datac => \lcd_out|Selector5~2_combout\,
	datad => \lcd_out|Selector4~4_combout\,
	combout => \lcd_out|Selector5~3_combout\);

-- Location: LCFF_X35_Y23_N1
\lcd_out|DATA_BUS_VALUE[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector5~3_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|DATA_BUS_VALUE\(4));

-- Location: LCCOMB_X34_Y23_N30
\lcd_out|Selector4~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector4~5_combout\ = (\lcd_out|Selector6~7_combout\ & (\lcd_out|Selector4~4_combout\ & ((\lcd_out|WideOr0~0_combout\) # (\lcd_out|DATA_BUS_VALUE\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|WideOr0~0_combout\,
	datab => \lcd_out|Selector6~7_combout\,
	datac => \lcd_out|DATA_BUS_VALUE\(5),
	datad => \lcd_out|Selector4~4_combout\,
	combout => \lcd_out|Selector4~5_combout\);

-- Location: LCFF_X34_Y23_N31
\lcd_out|DATA_BUS_VALUE[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector4~5_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|DATA_BUS_VALUE\(5));

-- Location: LCCOMB_X36_Y23_N2
\lcd_out|Selector3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector3~3_combout\ = (\DisplayReg[11]~59_combout\ & (\lcd_out|state.WRITE_CHAR4~regout\ & ((\DisplayReg[10]~54_combout\) # (\DisplayReg[9]~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[11]~59_combout\,
	datab => \lcd_out|state.WRITE_CHAR4~regout\,
	datac => \DisplayReg[10]~54_combout\,
	datad => \DisplayReg[9]~49_combout\,
	combout => \lcd_out|Selector3~3_combout\);

-- Location: LCCOMB_X36_Y23_N30
\lcd_out|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector3~0_combout\ = (\lcd_out|state.WRITE_CHAR5~regout\ & (\DisplayReg[7]~19_combout\ & ((\DisplayReg[5]~9_combout\) # (\DisplayReg[6]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[5]~9_combout\,
	datab => \lcd_out|state.WRITE_CHAR5~regout\,
	datac => \DisplayReg[7]~19_combout\,
	datad => \DisplayReg[6]~14_combout\,
	combout => \lcd_out|Selector3~0_combout\);

-- Location: LCCOMB_X36_Y23_N8
\lcd_out|Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector3~1_combout\ = (\DisplayReg[3]~39_combout\ & (\lcd_out|state.WRITE_CHAR6~regout\ & ((\DisplayReg[2]~34_combout\) # (\DisplayReg[1]~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DisplayReg[3]~39_combout\,
	datab => \DisplayReg[2]~34_combout\,
	datac => \DisplayReg[1]~29_combout\,
	datad => \lcd_out|state.WRITE_CHAR6~regout\,
	combout => \lcd_out|Selector3~1_combout\);

-- Location: LCCOMB_X32_Y23_N26
\lcd_out|Selector3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector3~2_combout\ = (\lcd_out|state.WRITE_CHAR1~regout\) # ((\lcd_out|Selector3~1_combout\) # ((\lcd_out|DATA_BUS_VALUE\(6) & !\lcd_out|WideOr0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|DATA_BUS_VALUE\(6),
	datab => \lcd_out|state.WRITE_CHAR1~regout\,
	datac => \lcd_out|WideOr0~0_combout\,
	datad => \lcd_out|Selector3~1_combout\,
	combout => \lcd_out|Selector3~2_combout\);

-- Location: LCCOMB_X36_Y23_N14
\lcd_out|Selector3~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector3~5_combout\ = (\lcd_out|Selector3~4_combout\) # ((\lcd_out|Selector3~3_combout\) # ((\lcd_out|Selector3~0_combout\) # (\lcd_out|Selector3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|Selector3~4_combout\,
	datab => \lcd_out|Selector3~3_combout\,
	datac => \lcd_out|Selector3~0_combout\,
	datad => \lcd_out|Selector3~2_combout\,
	combout => \lcd_out|Selector3~5_combout\);

-- Location: LCFF_X36_Y23_N15
\lcd_out|DATA_BUS_VALUE[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector3~5_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|DATA_BUS_VALUE\(6));

-- Location: LCCOMB_X36_Y23_N6
\lcd_out|Selector21~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector21~0_combout\ = (\lcd_out|state.WRITE_CHAR6~regout\) # ((\lcd_out|next_command.RETURN_HOME~regout\ & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datab => \lcd_out|state.WRITE_CHAR6~regout\,
	datac => \lcd_out|next_command.RETURN_HOME~regout\,
	datad => \lcd_out|state.TOGGLE_E~regout\,
	combout => \lcd_out|Selector21~0_combout\);

-- Location: LCFF_X36_Y23_N7
\lcd_out|next_command.RETURN_HOME\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector21~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|next_command.RETURN_HOME~regout\);

-- Location: LCCOMB_X36_Y23_N10
\lcd_out|state~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|state~42_combout\ = (\lcd_out|state.HOLD~regout\ & \lcd_out|next_command.RETURN_HOME~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lcd_out|state.HOLD~regout\,
	datad => \lcd_out|next_command.RETURN_HOME~regout\,
	combout => \lcd_out|state~42_combout\);

-- Location: LCFF_X36_Y23_N11
\lcd_out|state.RETURN_HOME\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|state~42_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|state.RETURN_HOME~regout\);

-- Location: LCCOMB_X36_Y23_N0
\lcd_out|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector2~0_combout\ = (\lcd_out|state.RETURN_HOME~regout\) # ((\lcd_out|DATA_BUS_VALUE\(7) & ((\lcd_out|state.HOLD~regout\) # (\lcd_out|state.TOGGLE_E~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datab => \lcd_out|state.TOGGLE_E~regout\,
	datac => \lcd_out|DATA_BUS_VALUE\(7),
	datad => \lcd_out|state.RETURN_HOME~regout\,
	combout => \lcd_out|Selector2~0_combout\);

-- Location: LCFF_X36_Y23_N1
\lcd_out|DATA_BUS_VALUE[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector2~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|DATA_BUS_VALUE\(7));

-- Location: LCCOMB_X32_Y23_N28
\lcd_out|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector1~0_combout\ = (!\lcd_out|state.WRITE_CHAR2~regout\ & !\lcd_out|state.WRITE_CHAR1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lcd_out|state.WRITE_CHAR2~regout\,
	datad => \lcd_out|state.WRITE_CHAR1~regout\,
	combout => \lcd_out|Selector1~0_combout\);

-- Location: LCCOMB_X32_Y23_N6
\lcd_out|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector1~1_combout\ = (\lcd_out|state.WRITE_CHAR4~regout\) # ((\lcd_out|state.WRITE_CHAR6~regout\) # ((\lcd_out|state.WRITE_CHAR5~regout\) # (!\lcd_out|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.WRITE_CHAR4~regout\,
	datab => \lcd_out|state.WRITE_CHAR6~regout\,
	datac => \lcd_out|state.WRITE_CHAR5~regout\,
	datad => \lcd_out|Selector1~0_combout\,
	combout => \lcd_out|Selector1~1_combout\);

-- Location: LCCOMB_X32_Y23_N8
\lcd_out|Selector1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|Selector1~2_combout\ = (\lcd_out|state.WRITE_CHAR3~regout\) # ((\lcd_out|Selector1~1_combout\) # ((!\lcd_out|WideOr0~0_combout\ & \lcd_out|LCD_RS~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.WRITE_CHAR3~regout\,
	datab => \lcd_out|WideOr0~0_combout\,
	datac => \lcd_out|LCD_RS~regout\,
	datad => \lcd_out|Selector1~1_combout\,
	combout => \lcd_out|Selector1~2_combout\);

-- Location: LCFF_X32_Y23_N9
\lcd_out|LCD_RS\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|Selector1~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|LCD_RS~regout\);

-- Location: LCCOMB_X33_Y23_N16
\lcd_out|LCD_E~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \lcd_out|LCD_E~0_combout\ = (\lcd_out|state.HOLD~regout\ & (\lcd_out|LCD_E~regout\)) # (!\lcd_out|state.HOLD~regout\ & ((\lcd_out|state.TOGGLE_E~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lcd_out|state.HOLD~regout\,
	datac => \lcd_out|LCD_E~regout\,
	datad => \lcd_out|state.TOGGLE_E~regout\,
	combout => \lcd_out|LCD_E~0_combout\);

-- Location: LCFF_X33_Y23_N17
\lcd_out|LCD_E\ : cycloneii_lcell_ff
PORT MAP (
	clk => \lcd_out|CLK_400HZ~clkctrl_outclk\,
	datain => \lcd_out|LCD_E~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \lcd_out|LCD_E~regout\);

-- Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lcd_out|DATA_BUS_VALUE\(0),
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => lcd_data(0));

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lcd_out|DATA_BUS_VALUE\(1),
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => lcd_data(1));

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lcd_out|DATA_BUS_VALUE\(2),
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => lcd_data(2));

-- Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lcd_out|ALT_INV_DATA_BUS_VALUE\(3),
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => lcd_data(3));

-- Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lcd_out|ALT_INV_DATA_BUS_VALUE\(4),
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => lcd_data(4));

-- Location: PIN_J3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lcd_out|ALT_INV_DATA_BUS_VALUE\(5),
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => lcd_data(5));

-- Location: PIN_H4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lcd_out|DATA_BUS_VALUE\(6),
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => lcd_data(6));

-- Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\lcd_data[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "bidir",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lcd_out|DATA_BUS_VALUE\(7),
	oe => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	padio => lcd_data(7));

-- Location: PIN_K1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_RS~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lcd_out|LCD_RS~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_RS);

-- Location: PIN_K3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_E~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \lcd_out|ALT_INV_LCD_E~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_E);

-- Location: PIN_L4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_ON~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_ON);

-- Location: PIN_K4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\LCD_RW~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_LCD_RW);

-- Location: PIN_AD12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\RESET_LED~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_RESET_LED);

-- Location: PIN_AE12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\SEC_LED~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_SEC_LED);
END structure;


