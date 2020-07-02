vlib work
vlib riviera

vlib riviera/xbip_utils_v3_0_10
vlib riviera/axi_utils_v2_0_6
vlib riviera/xbip_pipe_v3_0_6
vlib riviera/xbip_dsp48_wrapper_v3_0_4
vlib riviera/xbip_dsp48_addsub_v3_0_6
vlib riviera/xbip_dsp48_multadd_v3_0_6
vlib riviera/xbip_bram18k_v3_0_6
vlib riviera/mult_gen_v12_0_16
vlib riviera/floating_point_v7_1_9
vlib riviera/xil_defaultlib

vmap xbip_utils_v3_0_10 riviera/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 riviera/axi_utils_v2_0_6
vmap xbip_pipe_v3_0_6 riviera/xbip_pipe_v3_0_6
vmap xbip_dsp48_wrapper_v3_0_4 riviera/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_6 riviera/xbip_dsp48_addsub_v3_0_6
vmap xbip_dsp48_multadd_v3_0_6 riviera/xbip_dsp48_multadd_v3_0_6
vmap xbip_bram18k_v3_0_6 riviera/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 riviera/mult_gen_v12_0_16
vmap floating_point_v7_1_9 riviera/floating_point_v7_1_9
vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xbip_utils_v3_0_10 -93 \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -93 \
"../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93 \
"../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6 -93 \
"../../../ipstatic/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_9 -93 \
"../../../ipstatic/hdl/floating_point_v7_1_rfs.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../ipstatic/hdl/verilog/data_broadcaster.v" \
"../../../ipstatic/hdl/verilog/datastream_out_12u_s.v" \
"../../../ipstatic/hdl/verilog/dw_layer1.v" \
"../../../ipstatic/hdl/verilog/dw_layer1_x_4.v" \
"../../../ipstatic/hdl/verilog/dw_layer1_y_3.v" \
"../../../ipstatic/hdl/verilog/fc_64u_12u_1u_s.v" \
"../../../ipstatic/hdl/verilog/fc_64u_12u_1u_s_y_2.v" \
"../../../ipstatic/hdl/verilog/fc_relu6.v" \
"../../../ipstatic/hdl/verilog/fifo_w16_d10_A.v" \
"../../../ipstatic/hdl/verilog/fifo_w16_d12_A.v" \
"../../../ipstatic/hdl/verilog/fifo_w16_d64_A.v" \
"../../../ipstatic/hdl/verilog/fifo_w16_d100_A.v" \
"../../../ipstatic/hdl/verilog/grucell.v" \
"../../../ipstatic/hdl/verilog/grucell_state_1.v" \
"../../../ipstatic/hdl/verilog/grucell_x_1.v" \
"../../../ipstatic/hdl/verilog/grucell_zz.v" \
"../../../ipstatic/hdl/verilog/kws_bias_r.v" \
"../../../ipstatic/hdl/verilog/kws_fc_weights2.v" \
"../../../ipstatic/hdl/verilog/kws_hadd_16ns_16ncud.v" \
"../../../ipstatic/hdl/verilog/kws_hadd_16ns_16nfYi.v" \
"../../../ipstatic/hdl/verilog/kws_hcmp_16ns_16neOg.v" \
"../../../ipstatic/hdl/verilog/kws_hmul_16ns_16ndEe.v" \
"../../../ipstatic/hdl/verilog/kws_hptosp_16ns_3hbi.v" \
"../../../ipstatic/hdl/verilog/kws_hsub_16ns_16ng8j.v" \
"../../../ipstatic/hdl/verilog/kws_pw_weight1.v" \
"../../../ipstatic/hdl/verilog/kws_sptohp_32ns_1bkb.v" \
"../../../ipstatic/hdl/verilog/kws_weights_ru.v" \
"../../../ipstatic/hdl/verilog/kws_weights_rw.v" \
"../../../ipstatic/hdl/verilog/mysigmoid.v" \
"../../../ipstatic/hdl/verilog/mytanh.v" \
"../../../ipstatic/hdl/verilog/pw_layer1.v" \
"../../../ipstatic/hdl/verilog/pw_layer1_x.v" \
"../../../ipstatic/hdl/verilog/pw_layer1_y.v" \
"../../../ipstatic/hdl/verilog/regslice_core.v" \
"../../../ipstatic/hdl/verilog/weight_loader.v" \
"../../../ipstatic/hdl/verilog/kws.v" \

vcom -work xil_defaultlib -93 \
"../../../ipstatic/hdl/ip/kws_ap_hadd_2_no_dsp_16.vhd" \
"../../../ipstatic/hdl/ip/kws_ap_hadd_3_full_dsp_16.vhd" \
"../../../ipstatic/hdl/ip/kws_ap_hcmp_0_no_dsp_16.vhd" \
"../../../ipstatic/hdl/ip/kws_ap_hmul_2_max_dsp_16.vhd" \
"../../../ipstatic/hdl/ip/kws_ap_hptosp_0_no_dsp_16.vhd" \
"../../../ipstatic/hdl/ip/kws_ap_hsub_3_full_dsp_16.vhd" \
"../../../ipstatic/hdl/ip/kws_ap_sptohp_0_no_dsp_32.vhd" \
"../../../../KWS-SOC.srcs/sources_1/ip/kws_0/sim/kws_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

