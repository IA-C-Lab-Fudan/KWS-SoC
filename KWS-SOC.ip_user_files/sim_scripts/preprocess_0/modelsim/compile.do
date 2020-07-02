vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xbip_utils_v3_0_10
vlib modelsim_lib/msim/axi_utils_v2_0_6
vlib modelsim_lib/msim/xbip_pipe_v3_0_6
vlib modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_4
vlib modelsim_lib/msim/xbip_dsp48_addsub_v3_0_6
vlib modelsim_lib/msim/xbip_dsp48_multadd_v3_0_6
vlib modelsim_lib/msim/xbip_bram18k_v3_0_6
vlib modelsim_lib/msim/mult_gen_v12_0_16
vlib modelsim_lib/msim/floating_point_v7_1_9
vlib modelsim_lib/msim/xil_defaultlib

vmap xbip_utils_v3_0_10 modelsim_lib/msim/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 modelsim_lib/msim/axi_utils_v2_0_6
vmap xbip_pipe_v3_0_6 modelsim_lib/msim/xbip_pipe_v3_0_6
vmap xbip_dsp48_wrapper_v3_0_4 modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_6 modelsim_lib/msim/xbip_dsp48_addsub_v3_0_6
vmap xbip_dsp48_multadd_v3_0_6 modelsim_lib/msim/xbip_dsp48_multadd_v3_0_6
vmap xbip_bram18k_v3_0_6 modelsim_lib/msim/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 modelsim_lib/msim/mult_gen_v12_0_16
vmap floating_point_v7_1_9 modelsim_lib/msim/floating_point_v7_1_9
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xbip_utils_v3_0_10 -64 -93 \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -64 -93 \
"../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -64 -93 \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 -93 \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -64 -93 \
"../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6 -64 -93 \
"../../../ipstatic/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -64 -93 \
"../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -64 -93 \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_9 -64 -93 \
"../../../ipstatic/hdl/floating_point_v7_1_rfs.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../ipstatic/hdl/verilog/calc_stft.v" \
"../../../ipstatic/hdl/verilog/calc_stft_fft_inpibs.v" \
"../../../ipstatic/hdl/verilog/calc_stft_fft_inpjbC.v" \
"../../../ipstatic/hdl/verilog/calc_stft_frames.v" \
"../../../ipstatic/hdl/verilog/calc_stft_indices_0.v" \
"../../../ipstatic/hdl/verilog/fbank.v" \
"../../../ipstatic/hdl/verilog/fbank_band_mapper.v" \
"../../../ipstatic/hdl/verilog/fbank_weights.v" \
"../../../ipstatic/hdl/verilog/kfft.v" \
"../../../ipstatic/hdl/verilog/mfcc_dct.v" \
"../../../ipstatic/hdl/verilog/mfcc_log.v" \
"../../../ipstatic/hdl/verilog/preprocess_am_addKfY.v" \
"../../../ipstatic/hdl/verilog/preprocess_cosineXh4.v" \
"../../../ipstatic/hdl/verilog/preprocess_dcmp_6Hfu.v" \
"../../../ipstatic/hdl/verilog/preprocess_dct_oubll.v" \
"../../../ipstatic/hdl/verilog/preprocess_dct_oubnm.v" \
"../../../ipstatic/hdl/verilog/preprocess_dlog_6IfE.v" \
"../../../ipstatic/hdl/verilog/preprocess_fadd_3yd2.v" \
"../../../ipstatic/hdl/verilog/preprocess_faddfsbkb.v" \
"../../../ipstatic/hdl/verilog/preprocess_faddfscud.v" \
"../../../ipstatic/hdl/verilog/preprocess_fbank_bhl.v" \
"../../../ipstatic/hdl/verilog/preprocess_fmul_3eOg.v" \
"../../../ipstatic/hdl/verilog/preprocess_fpext_Gfk.v" \
"../../../ipstatic/hdl/verilog/preprocess_fptrunFfa.v" \
"../../../ipstatic/hdl/verilog/preprocess_fsqrt_Ee0.v" \
"../../../ipstatic/hdl/verilog/preprocess_fsub_3dEe.v" \
"../../../ipstatic/hdl/verilog/preprocess_mul_muDeQ.v" \
"../../../ipstatic/hdl/verilog/preprocess_mul_muhbi.v" \
"../../../ipstatic/hdl/verilog/preprocess_mul_muJfO.v" \
"../../../ipstatic/hdl/verilog/preprocess_mux_20CeG.v" \
"../../../ipstatic/hdl/verilog/preprocess_mux_41g8j.v" \
"../../../ipstatic/hdl/verilog/preprocess_mux_41zec.v" \
"../../../ipstatic/hdl/verilog/preprocess_mux_43fYi.v" \
"../../../ipstatic/hdl/verilog/preprocess_mux_81Aem.v" \
"../../../ipstatic/hdl/verilog/preprocess_signalLf8.v" \
"../../../ipstatic/hdl/verilog/preprocess_spectrThq.v" \
"../../../ipstatic/hdl/verilog/preprocess_spectrUhA.v" \
"../../../ipstatic/hdl/verilog/preprocess_urem_1Bew.v" \
"../../../ipstatic/hdl/verilog/regslice_core.v" \
"../../../ipstatic/hdl/verilog/preprocess.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../ipstatic/hdl/ip/preprocess_ap_dcmp_0_no_dsp_64.vhd" \
"../../../ipstatic/hdl/ip/preprocess_ap_dlog_29_full_dsp_64.vhd" \
"../../../ipstatic/hdl/ip/preprocess_ap_faddfsub_3_full_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/preprocess_ap_faddfsub_3_no_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/preprocess_ap_fadd_3_full_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/preprocess_ap_fmul_2_max_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/preprocess_ap_fpext_0_no_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/preprocess_ap_fptrunc_0_no_dsp_64.vhd" \
"../../../ipstatic/hdl/ip/preprocess_ap_fsqrt_10_no_dsp_32.vhd" \
"../../../ipstatic/hdl/ip/preprocess_ap_fsub_3_full_dsp_32.vhd" \
"../../../../KWS-SOC.srcs/sources_1/ip/preprocess_0/sim/preprocess_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

