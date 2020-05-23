-makelib xcelium_lib/xpm -sv \
  "E:/vivado/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/vivado/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "E:/vivado/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xbip_utils_v3_0_10 \
  "../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_utils_v2_0_6 \
  "../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_pipe_v3_0_6 \
  "../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_wrapper_v3_0_4 \
  "../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_addsub_v3_0_6 \
  "../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_multadd_v3_0_6 \
  "../../../ipstatic/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_bram18k_v3_0_6 \
  "../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/mult_gen_v12_0_16 \
  "../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/floating_point_v7_1_9 \
  "../../../ipstatic/hdl/floating_point_v7_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../ipstatic/hdl/verilog/data_broadcaster.v" \
  "../../../ipstatic/hdl/verilog/datastream_out_12u_s.v" \
  "../../../ipstatic/hdl/verilog/dw_layer1.v" \
  "../../../ipstatic/hdl/verilog/dw_layer1_x_5.v" \
  "../../../ipstatic/hdl/verilog/dw_layer1_y_5.v" \
  "../../../ipstatic/hdl/verilog/dw_layer2.v" \
  "../../../ipstatic/hdl/verilog/dw_layer2_y_6_0.v" \
  "../../../ipstatic/hdl/verilog/fc_64u_12u_1u_s.v" \
  "../../../ipstatic/hdl/verilog/fc_64u_12u_1u_s_y_4.v" \
  "../../../ipstatic/hdl/verilog/fc_relu6.v" \
  "../../../ipstatic/hdl/verilog/fc_relu6_x.v" \
  "../../../ipstatic/hdl/verilog/fc_relu6_y.v" \
  "../../../ipstatic/hdl/verilog/fifo_w32_d12_A.v" \
  "../../../ipstatic/hdl/verilog/fifo_w32_d40_A.v" \
  "../../../ipstatic/hdl/verilog/fifo_w32_d64_A.v" \
  "../../../ipstatic/hdl/verilog/fifo_w32_d414_A.v" \
  "../../../ipstatic/hdl/verilog/fifo_w32_d500_A.v" \
  "../../../ipstatic/hdl/verilog/fifo_w32_d16512_A.v" \
  "../../../ipstatic/hdl/verilog/fifo_w32_d19872_A.v" \
  "../../../ipstatic/hdl/verilog/grucell.v" \
  "../../../ipstatic/hdl/verilog/grucell_state.v" \
  "../../../ipstatic/hdl/verilog/grucell_state_1_0.v" \
  "../../../ipstatic/hdl/verilog/grucell_zz.v" \
  "../../../ipstatic/hdl/verilog/kws_bn_bias1.v" \
  "../../../ipstatic/hdl/verilog/kws_dw_weight1.v" \
  "../../../ipstatic/hdl/verilog/kws_dw_weight2_0.v" \
  "../../../ipstatic/hdl/verilog/kws_fadd_32ns_32nbkb.v" \
  "../../../ipstatic/hdl/verilog/kws_fadd_32ns_32ndEe.v" \
  "../../../ipstatic/hdl/verilog/kws_faddfsub_32nsfYi.v" \
  "../../../ipstatic/hdl/verilog/kws_fc_weights1.v" \
  "../../../ipstatic/hdl/verilog/kws_fc_weights2.v" \
  "../../../ipstatic/hdl/verilog/kws_fcmp_32ns_32neOg.v" \
  "../../../ipstatic/hdl/verilog/kws_fmul_32ns_32ncud.v" \
  "../../../ipstatic/hdl/verilog/kws_mux_432_32_1_1.v" \
  "../../../ipstatic/hdl/verilog/kws_pw_weight2_0.v" \
  "../../../ipstatic/hdl/verilog/kws_weights_hw.v" \
  "../../../ipstatic/hdl/verilog/kws_weights_ru_0.v" \
  "../../../ipstatic/hdl/verilog/kws_weights_rw.v" \
  "../../../ipstatic/hdl/verilog/mysigmoid.v" \
  "../../../ipstatic/hdl/verilog/mytanh.v" \
  "../../../ipstatic/hdl/verilog/pw_layer1.v" \
  "../../../ipstatic/hdl/verilog/pw_layer1_x_11_0.v" \
  "../../../ipstatic/hdl/verilog/pw_layer1_y_9_0.v" \
  "../../../ipstatic/hdl/verilog/pw_layer2.v" \
  "../../../ipstatic/hdl/verilog/pw_layer2_x_0.v" \
  "../../../ipstatic/hdl/verilog/regslice_core.v" \
  "../../../ipstatic/hdl/verilog/weight_loader.v" \
  "../../../ipstatic/hdl/verilog/kws.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../ipstatic/hdl/ip/kws_ap_faddfsub_2_full_dsp_32.vhd" \
  "../../../ipstatic/hdl/ip/kws_ap_fadd_2_full_dsp_32.vhd" \
  "../../../ipstatic/hdl/ip/kws_ap_fadd_2_no_dsp_32.vhd" \
  "../../../ipstatic/hdl/ip/kws_ap_fcmp_0_no_dsp_32.vhd" \
  "../../../ipstatic/hdl/ip/kws_ap_fmul_2_max_dsp_32.vhd" \
  "../../../../wujiankws.srcs/sources_1/ip/kws_0/sim/kws_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

