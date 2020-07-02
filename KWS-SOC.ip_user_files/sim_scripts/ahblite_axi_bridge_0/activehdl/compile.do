vlib work
vlib activehdl

vlib activehdl/ahblite_axi_bridge_v3_0_15
vlib activehdl/xil_defaultlib

vmap ahblite_axi_bridge_v3_0_15 activehdl/ahblite_axi_bridge_v3_0_15
vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work ahblite_axi_bridge_v3_0_15 -93 \
"../../../ipstatic/hdl/ahblite_axi_bridge_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../KWS-SOC.srcs/sources_1/ip/ahblite_axi_bridge_0/sim/ahblite_axi_bridge_0.vhd" \


