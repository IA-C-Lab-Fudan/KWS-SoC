// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:hls:kws:1.0
// IP Revision: 2006301106

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
kws_0 your_instance_name (
  .ap_clk(ap_clk),                        // input wire ap_clk
  .ap_rst_n(ap_rst_n),                    // input wire ap_rst_n
  .data_in_TVALID(data_in_TVALID),        // input wire data_in_TVALID
  .data_in_TREADY(data_in_TREADY),        // output wire data_in_TREADY
  .data_in_TDATA(data_in_TDATA),          // input wire [31 : 0] data_in_TDATA
  .data_in_TLAST(data_in_TLAST),          // input wire [0 : 0] data_in_TLAST
  .weight_in_TVALID(weight_in_TVALID),    // input wire weight_in_TVALID
  .weight_in_TREADY(weight_in_TREADY),    // output wire weight_in_TREADY
  .weight_in_TDATA(weight_in_TDATA),      // input wire [31 : 0] weight_in_TDATA
  .weight_in_TLAST(weight_in_TLAST),      // input wire [0 : 0] weight_in_TLAST
  .control_in_TVALID(control_in_TVALID),  // input wire control_in_TVALID
  .control_in_TREADY(control_in_TREADY),  // output wire control_in_TREADY
  .control_in_TDATA(control_in_TDATA),    // input wire [31 : 0] control_in_TDATA
  .control_in_TLAST(control_in_TLAST),    // input wire [0 : 0] control_in_TLAST
  .keep_in_TVALID(keep_in_TVALID),        // input wire keep_in_TVALID
  .keep_in_TREADY(keep_in_TREADY),        // output wire keep_in_TREADY
  .keep_in_TDATA(keep_in_TDATA),          // input wire [31 : 0] keep_in_TDATA
  .keep_in_TLAST(keep_in_TLAST),          // input wire [0 : 0] keep_in_TLAST
  .data_out_TVALID(data_out_TVALID),      // output wire data_out_TVALID
  .data_out_TREADY(data_out_TREADY),      // input wire data_out_TREADY
  .data_out_TDATA(data_out_TDATA),        // output wire [31 : 0] data_out_TDATA
  .data_out_TLAST(data_out_TLAST)        // output wire [0 : 0] data_out_TLAST
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file kws_0.v when simulating
// the core, kws_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

