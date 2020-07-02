onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xpm -L axi_bram_ctrl_v4_1_2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.axi_bram_ctrl_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {axi_bram_ctrl_0.udo}

run -all

quit -force
