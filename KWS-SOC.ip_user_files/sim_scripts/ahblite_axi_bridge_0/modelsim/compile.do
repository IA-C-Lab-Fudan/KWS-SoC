vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/ahblite_axi_bridge_v3_0_15
vlib modelsim_lib/msim/xil_defaultlib

vmap ahblite_axi_bridge_v3_0_15 modelsim_lib/msim/ahblite_axi_bridge_v3_0_15
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work ahblite_axi_bridge_v3_0_15 -64 -93 \
"../../../ipstatic/hdl/ahblite_axi_bridge_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../KWS-SOC.srcs/sources_1/ip/ahblite_axi_bridge_0/sim/ahblite_axi_bridge_0.vhd" \


