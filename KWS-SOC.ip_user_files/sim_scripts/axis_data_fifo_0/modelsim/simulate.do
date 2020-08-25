onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xpm -L axis_infrastructure_v1_1_0 -L axis_data_fifo_v2_0_2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.axis_data_fifo_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {axis_data_fifo_0.udo}

run -all

quit -force
