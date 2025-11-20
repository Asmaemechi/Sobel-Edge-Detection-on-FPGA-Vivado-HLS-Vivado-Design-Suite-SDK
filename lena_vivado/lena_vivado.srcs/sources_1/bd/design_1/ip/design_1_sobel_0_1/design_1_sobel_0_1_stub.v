// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat May 31 10:40:34 2025
// Host        : DESKTOP-C2MIG7A running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/FLASHCOPIE/Desktop/Projet_sobel_lena/lena_vivado/lena_vivado.srcs/sources_1/bd/design_1/ip/design_1_sobel_0_1/design_1_sobel_0_1_stub.v
// Design      : design_1_sobel_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "sobel,Vivado 2018.3" *)
module design_1_sobel_0_1(ap_clk, ap_rst_n, input_r_TDATA, 
  input_r_TVALID, input_r_TREADY, input_r_TKEEP, input_r_TSTRB, input_r_TLAST, 
  output_r_TDATA, output_r_TVALID, output_r_TREADY, output_r_TKEEP, output_r_TSTRB, 
  output_r_TLAST, s_axi_AXILiteS_AWVALID, s_axi_AXILiteS_AWREADY, s_axi_AXILiteS_AWADDR, 
  s_axi_AXILiteS_WVALID, s_axi_AXILiteS_WREADY, s_axi_AXILiteS_WDATA, 
  s_axi_AXILiteS_WSTRB, s_axi_AXILiteS_ARVALID, s_axi_AXILiteS_ARREADY, 
  s_axi_AXILiteS_ARADDR, s_axi_AXILiteS_RVALID, s_axi_AXILiteS_RREADY, 
  s_axi_AXILiteS_RDATA, s_axi_AXILiteS_RRESP, s_axi_AXILiteS_BVALID, 
  s_axi_AXILiteS_BREADY, s_axi_AXILiteS_BRESP, interrupt)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,input_r_TDATA[7:0],input_r_TVALID,input_r_TREADY,input_r_TKEEP[0:0],input_r_TSTRB[0:0],input_r_TLAST[0:0],output_r_TDATA[7:0],output_r_TVALID,output_r_TREADY,output_r_TKEEP[0:0],output_r_TSTRB[0:0],output_r_TLAST[0:0],s_axi_AXILiteS_AWVALID,s_axi_AXILiteS_AWREADY,s_axi_AXILiteS_AWADDR[3:0],s_axi_AXILiteS_WVALID,s_axi_AXILiteS_WREADY,s_axi_AXILiteS_WDATA[31:0],s_axi_AXILiteS_WSTRB[3:0],s_axi_AXILiteS_ARVALID,s_axi_AXILiteS_ARREADY,s_axi_AXILiteS_ARADDR[3:0],s_axi_AXILiteS_RVALID,s_axi_AXILiteS_RREADY,s_axi_AXILiteS_RDATA[31:0],s_axi_AXILiteS_RRESP[1:0],s_axi_AXILiteS_BVALID,s_axi_AXILiteS_BREADY,s_axi_AXILiteS_BRESP[1:0],interrupt" */;
  input ap_clk;
  input ap_rst_n;
  input [7:0]input_r_TDATA;
  input input_r_TVALID;
  output input_r_TREADY;
  input [0:0]input_r_TKEEP;
  input [0:0]input_r_TSTRB;
  input [0:0]input_r_TLAST;
  output [7:0]output_r_TDATA;
  output output_r_TVALID;
  input output_r_TREADY;
  output [0:0]output_r_TKEEP;
  output [0:0]output_r_TSTRB;
  output [0:0]output_r_TLAST;
  input s_axi_AXILiteS_AWVALID;
  output s_axi_AXILiteS_AWREADY;
  input [3:0]s_axi_AXILiteS_AWADDR;
  input s_axi_AXILiteS_WVALID;
  output s_axi_AXILiteS_WREADY;
  input [31:0]s_axi_AXILiteS_WDATA;
  input [3:0]s_axi_AXILiteS_WSTRB;
  input s_axi_AXILiteS_ARVALID;
  output s_axi_AXILiteS_ARREADY;
  input [3:0]s_axi_AXILiteS_ARADDR;
  output s_axi_AXILiteS_RVALID;
  input s_axi_AXILiteS_RREADY;
  output [31:0]s_axi_AXILiteS_RDATA;
  output [1:0]s_axi_AXILiteS_RRESP;
  output s_axi_AXILiteS_BVALID;
  input s_axi_AXILiteS_BREADY;
  output [1:0]s_axi_AXILiteS_BRESP;
  output interrupt;
endmodule
