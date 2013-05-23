onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_chip/clk
add wave -noupdate /cpu_chip/system_clock
add wave -noupdate /cpu_chip/reset
add wave -noupdate /cpu_chip/run
add wave -noupdate -radix hexadecimal /cpu_chip/Addr_bus
add wave -noupdate -radix hexadecimal /cpu_chip/data_bus_temp
add wave -noupdate -radix hexadecimal /cpu_chip/data_out1
add wave -noupdate -radix hexadecimal /cpu_chip/data_out2
add wave -noupdate -radix hexadecimal /cpu_chip/mem_rd
add wave -noupdate -radix hexadecimal /cpu_chip/mem_wr
add wave -noupdate -radix hexadecimal /cpu_chip/mem_cs
add wave -noupdate -radix hexadecimal /cpu_chip/mem_cs_ram
add wave -noupdate -radix hexadecimal /cpu_chip/mem_cs_rom
add wave -noupdate -radix hexadecimal /cpu_chip/R1out
add wave -noupdate -radix hexadecimal /cpu_chip/R2out
add wave -noupdate -radix hexadecimal /cpu_chip/R3out
add wave -noupdate -radix ascii /cpu_chip/R4out
add wave -noupdate -radix hexadecimal /cpu_chip/R5out
add wave -noupdate -radix hexadecimal /cpu_chip/R6out
add wave -noupdate -radix hexadecimal /cpu_chip/R7out
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/Mem_rd
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/Mem_wr
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/Mem_cs
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/R_we
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/ld_op
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/st_op
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/ctl_wd
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/CU_addr_bus
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/CU_data_bus
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/current_state
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/op
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/PC
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/SP
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/IR
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/AR
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/AR_EN
add wave -noupdate /cpu_chip/CPU/CU/SP_EN
add wave -noupdate /cpu_chip/CPU/CU/PCd_EN
add wave -noupdate -radix hexadecimal /cpu_chip/CPU/CU/offset
add wave -noupdate -radix binary /cpu_chip/CPU/CU/PSR
add wave -noupdate /cpu_chip/CPU/FNU/Z
add wave -noupdate /cpu_chip/CPU/FNU/N
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5933 ps} 0}
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
WaveRestoreZoom {1914 ps} {2847 ps}
