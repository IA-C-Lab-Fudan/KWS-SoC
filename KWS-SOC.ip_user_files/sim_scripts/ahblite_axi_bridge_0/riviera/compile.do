vlib work
vlib riviera

vlib riviera/ahblite_axi_bridge_v3_0_15
vlib riviera/xil_defaultlib

vmap ahblite_axi_bridge_v3_0_15 riviera/ahblite_axi_bridge_v3_0_15
vmap xil_defaultlib riviera/xil_defaultlib

vcom -work ahblite_axi_bridge_v3_0_15 -93 \
"../../../ipstatic/hdl/ahblite_axi_bridge_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../KWS-SOC.srcs/sources_1/ip/ahblite_axi_bridge_0/sim/ahblite_axi_bridge_0.vhd" \


