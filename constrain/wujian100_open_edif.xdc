create_clock -period 50.000 -name EHS -waveform {0.000 25.000} [get_ports PIN_EHS]
create_clock -period 1000.000 -name JTAG_CLK -waveform {0.000 500.000} [get_ports PAD_JTAG_TCLK]

set_clock_groups -name clkgroup_1 -asynchronous -group [get_clocks {EHS JTAG_CLK}]

set_false_path -through [get_ports PIN_EHS]

#set_clock_groups -name {Inferred_clkgroup_0} -asynchronous -group [get_clocks {wujian100_open_top|PAD_JTAG_TCLK}]

set_property ASYNC_REG true [get_cells x_aou_top/x_rtc0_sec_top/x_rtc_pdu_top/x_rtc_clr_sync/pclk_load_sync2_reg]
set_property ASYNC_REG true [get_cells x_aou_top/x_rtc0_sec_top/x_rtc_pdu_top/x_rtc_clr_sync/rtc_load_sync2_reg]
set_property ASYNC_REG true [get_cells x_aou_top/x_rtc0_sec_top/x_rtc_pdu_top/x_rtc_clr_sync/pclk_load_sync1_reg]
set_property ASYNC_REG true [get_cells x_aou_top/x_rtc0_sec_top/x_rtc_pdu_top/x_rtc_clr_sync/rtc_load_sync1_reg]
set_property ASYNC_REG true [get_cells x_cpu_top/CPU/x_cr_had_top/A15d/A74/A10b_reg]
set_property ASYNC_REG true [get_cells x_cpu_top/CPU/x_cr_had_top/A15d/A74/A18597_reg]
set_property ASYNC_REG true [get_cells x_cpu_top/CPU/x_cr_had_top/A15d/A1862d/A10b_reg]
set_property ASYNC_REG true [get_cells x_cpu_top/CPU/x_cr_had_top/A15d/A1862d/A18597_reg]
set_property ASYNC_REG true [get_cells x_cpu_top/CPU/x_cr_had_top/A15d/A75/A10b_reg]
set_property ASYNC_REG true [get_cells x_cpu_top/CPU/x_cr_had_top/A15d/A75/A18597_reg]

#Constraints which are not forward annotated in XDC and intentionally commented out (unused and unsupported constraints)

#User specified region constraints



