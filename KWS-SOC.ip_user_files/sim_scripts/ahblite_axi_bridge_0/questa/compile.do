vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/ahblite_axi_bridge_v3_0_15
vlib questa_lib/msim/xil_defaultlib

vmap ahblite_axi_bridge_v3_0_15 questa_lib/msim/ahblite_axi_bridge_v3_0_15
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work ahblite_axi_bridge_v3_0_15 -64 -93 \
"../../../ipstatic/hdl/ahblite_axi_bridge_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../KWS-SOC.srcs/sources_1/ip/ahblite_axi_bridge_0/sim/ahblite_axi_bridge_0.vhd" \


