onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L ahblite_axi_bridge_v3_0_15 -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.ahblite_axi_bridge_0

do {wave.do}

view wave
view structure
view signals

do {ahblite_axi_bridge_0.udo}

run -all

quit -force
