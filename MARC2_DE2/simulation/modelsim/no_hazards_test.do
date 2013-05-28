onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_chip/LCD_RS
add wave -noupdate /cpu_chip/LCD_E
add wave -noupdate /cpu_chip/LCD_ON
add wave -noupdate /cpu_chip/LCD_RW
add wave -noupdate /cpu_chip/RESET_LED
add wave -noupdate /cpu_chip/SEC_LED
add wave -noupdate -radix hexadecimal /cpu_chip/lcd_data
add wave -noupdate /cpu_chip/reg_select
add wave -noupdate /cpu_chip/clk
add wave -noupdate /cpu_chip/reset
add wave -noupdate /cpu_chip/run
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/PC
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/SP
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/IR
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/AR
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/offset
add wave -noupdate -radix hexadecimal /cpu_chip/ProgMem/address
add wave -noupdate -radix hexadecimal /cpu_chip/ProgMem/q
add wave -noupdate -radix hexadecimal /cpu_chip/Addr_bus
add wave -noupdate -radix hexadecimal /cpu_chip/Data_bus
add wave -noupdate -radix hexadecimal /cpu_chip/data_bus_temp
add wave -noupdate -radix hexadecimal /cpu_chip/data_out1
add wave -noupdate -radix hexadecimal /cpu_chip/data_out2
add wave -noupdate -radix hexadecimal /cpu_chip/dummy
add wave -noupdate /cpu_chip/CPU/CU/current_state
add wave -noupdate /cpu_chip/CPU/CU/op
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/const
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CNTLWD
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/cu_addr
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/fnu_addr
add wave -noupdate /cpu_chip/CPU/CU/PSR
add wave -noupdate /cpu_chip/CPU/CU/ld_op
add wave -noupdate /cpu_chip/CPU/CU/st_op
add wave -noupdate /cpu_chip/CPU/CU/AR_EN
add wave -noupdate /cpu_chip/CPU/CU/SP_EN
add wave -noupdate /cpu_chip/CPU/CU/PCd_EN
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/CU_addr_bus
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/CU_data_bus
add wave -noupdate -radix hexadecimal /cpu_chip/Ram1/address
add wave -noupdate -radix hexadecimal /cpu_chip/Ram1/data
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/FNU/Abus
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/FNU/Bbus
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/FNU/btemp
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/FNU/func_out
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/FNU/func_data
add wave -noupdate /cpu_chip/CPU/zero
add wave -noupdate /cpu_chip/CPU/neg
add wave -noupdate /cpu_chip/CPU/RW
add wave -noupdate /cpu_chip/CPU/LD
add wave -noupdate /cpu_chip/CPU/ST
add wave -noupdate /cpu_chip/mem_rd
add wave -noupdate /cpu_chip/mem_wr
add wave -noupdate /cpu_chip/mem_cs
add wave -noupdate /cpu_chip/mem_cs_ram
add wave -noupdate /cpu_chip/mem_cs_rom
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/R1out
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/R2out
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/R3out
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/R4out
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/R5out
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/R6out
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/R7out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1856672 ps} 0}
configure wave -namecolwidth 210
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1769656 ps} {1888952 ps}
