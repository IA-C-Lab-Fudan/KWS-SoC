onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib kws_0_opt

do {wave.do}

view wave
view structure
view signals

do {kws_0.udo}

run -all

quit -force
