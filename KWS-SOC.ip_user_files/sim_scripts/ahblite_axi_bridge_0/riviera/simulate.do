onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ahblite_axi_bridge_0 -L ahblite_axi_bridge_v3_0_15 -L xil_defaultlib -L secureip -O5 xil_defaultlib.ahblite_axi_bridge_0

do {wave.do}

view wave
view structure

do {ahblite_axi_bridge_0.udo}

run -all

endsim

quit -force
