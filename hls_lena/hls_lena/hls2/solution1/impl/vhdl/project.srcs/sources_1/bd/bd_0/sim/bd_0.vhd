--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Fri May 31 10:18:25 2019
--Host        : DESKTOP-C2MIG7A running 64-bit major release  (build 9200)
--Command     : generate_target bd_0.bd
--Design      : bd_0
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    input_r_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    input_r_tkeep : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_r_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_r_tready : out STD_LOGIC;
    input_r_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_r_tvalid : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    output_r_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    output_r_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_r_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_r_tready : in STD_LOGIC;
    output_r_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_r_tvalid : out STD_LOGIC;
    s_axi_AXILiteS_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_AXILiteS_arready : out STD_LOGIC;
    s_axi_AXILiteS_arvalid : in STD_LOGIC;
    s_axi_AXILiteS_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_AXILiteS_awready : out STD_LOGIC;
    s_axi_AXILiteS_awvalid : in STD_LOGIC;
    s_axi_AXILiteS_bready : in STD_LOGIC;
    s_axi_AXILiteS_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_AXILiteS_bvalid : out STD_LOGIC;
    s_axi_AXILiteS_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_AXILiteS_rready : in STD_LOGIC;
    s_axi_AXILiteS_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_AXILiteS_rvalid : out STD_LOGIC;
    s_axi_AXILiteS_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_AXILiteS_wready : out STD_LOGIC;
    s_axi_AXILiteS_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_AXILiteS_wvalid : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of bd_0 : entity is "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of bd_0 : entity is "bd_0.hwdef";
end bd_0;

architecture STRUCTURE of bd_0 is
  component bd_0_hls_inst_0 is
  port (
    s_axi_AXILiteS_AWADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_AXILiteS_AWVALID : in STD_LOGIC;
    s_axi_AXILiteS_AWREADY : out STD_LOGIC;
    s_axi_AXILiteS_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_AXILiteS_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_AXILiteS_WVALID : in STD_LOGIC;
    s_axi_AXILiteS_WREADY : out STD_LOGIC;
    s_axi_AXILiteS_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_AXILiteS_BVALID : out STD_LOGIC;
    s_axi_AXILiteS_BREADY : in STD_LOGIC;
    s_axi_AXILiteS_ARADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_AXILiteS_ARVALID : in STD_LOGIC;
    s_axi_AXILiteS_ARREADY : out STD_LOGIC;
    s_axi_AXILiteS_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_AXILiteS_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_AXILiteS_RVALID : out STD_LOGIC;
    s_axi_AXILiteS_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    input_r_TVALID : in STD_LOGIC;
    input_r_TREADY : out STD_LOGIC;
    input_r_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    input_r_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_r_TKEEP : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_r_TSTRB : in STD_LOGIC_VECTOR ( 0 to 0 );
    output_r_TVALID : out STD_LOGIC;
    output_r_TREADY : in STD_LOGIC;
    output_r_TDATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    output_r_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_r_TKEEP : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_r_TSTRB : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component bd_0_hls_inst_0;
  signal ap_clk_0_1 : STD_LOGIC;
  signal ap_rst_n_0_1 : STD_LOGIC;
  signal hls_inst_interrupt : STD_LOGIC;
  signal hls_inst_output_r_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_output_r_TKEEP : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_output_r_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_output_r_TREADY : STD_LOGIC;
  signal hls_inst_output_r_TSTRB : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_output_r_TVALID : STD_LOGIC;
  signal input_r_0_1_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal input_r_0_1_TKEEP : STD_LOGIC_VECTOR ( 0 to 0 );
  signal input_r_0_1_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal input_r_0_1_TREADY : STD_LOGIC;
  signal input_r_0_1_TSTRB : STD_LOGIC_VECTOR ( 0 to 0 );
  signal input_r_0_1_TVALID : STD_LOGIC;
  signal s_axi_AXILiteS_0_1_ARADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_axi_AXILiteS_0_1_ARREADY : STD_LOGIC;
  signal s_axi_AXILiteS_0_1_ARVALID : STD_LOGIC;
  signal s_axi_AXILiteS_0_1_AWADDR : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_axi_AXILiteS_0_1_AWREADY : STD_LOGIC;
  signal s_axi_AXILiteS_0_1_AWVALID : STD_LOGIC;
  signal s_axi_AXILiteS_0_1_BREADY : STD_LOGIC;
  signal s_axi_AXILiteS_0_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axi_AXILiteS_0_1_BVALID : STD_LOGIC;
  signal s_axi_AXILiteS_0_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axi_AXILiteS_0_1_RREADY : STD_LOGIC;
  signal s_axi_AXILiteS_0_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axi_AXILiteS_0_1_RVALID : STD_LOGIC;
  signal s_axi_AXILiteS_0_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axi_AXILiteS_0_1_WREADY : STD_LOGIC;
  signal s_axi_AXILiteS_0_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_axi_AXILiteS_0_1_WVALID : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF input_r:output_r:s_axi_AXILiteS, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of input_r_tready : signal is "xilinx.com:interface:axis:1.0 input_r ";
  attribute X_INTERFACE_INFO of input_r_tvalid : signal is "xilinx.com:interface:axis:1.0 input_r ";
  attribute X_INTERFACE_INFO of interrupt : signal is "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT INTERRUPT";
  attribute X_INTERFACE_PARAMETER of interrupt : signal is "XIL_INTERFACENAME INTR.INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH";
  attribute X_INTERFACE_INFO of output_r_tready : signal is "xilinx.com:interface:axis:1.0 output_r ";
  attribute X_INTERFACE_INFO of output_r_tvalid : signal is "xilinx.com:interface:axis:1.0 output_r ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_arready : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_arvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_awready : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_awvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_bready : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_bvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_rready : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_rvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_wready : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_wvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of input_r_tdata : signal is "xilinx.com:interface:axis:1.0 input_r ";
  attribute X_INTERFACE_PARAMETER of input_r_tdata : signal is "XIL_INTERFACENAME input_r, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}, PHASE 0.000, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of input_r_tkeep : signal is "xilinx.com:interface:axis:1.0 input_r ";
  attribute X_INTERFACE_INFO of input_r_tlast : signal is "xilinx.com:interface:axis:1.0 input_r ";
  attribute X_INTERFACE_INFO of input_r_tstrb : signal is "xilinx.com:interface:axis:1.0 input_r ";
  attribute X_INTERFACE_INFO of output_r_tdata : signal is "xilinx.com:interface:axis:1.0 output_r ";
  attribute X_INTERFACE_PARAMETER of output_r_tdata : signal is "XIL_INTERFACENAME output_r, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 8}, PHASE 0.000, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of output_r_tkeep : signal is "xilinx.com:interface:axis:1.0 output_r ";
  attribute X_INTERFACE_INFO of output_r_tlast : signal is "xilinx.com:interface:axis:1.0 output_r ";
  attribute X_INTERFACE_INFO of output_r_tstrb : signal is "xilinx.com:interface:axis:1.0 output_r ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_araddr : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_PARAMETER of s_axi_AXILiteS_araddr : signal is "XIL_INTERFACENAME s_axi_AXILiteS, ADDR_WIDTH 12, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_awaddr : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_bresp : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_rdata : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_rresp : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_wdata : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
  attribute X_INTERFACE_INFO of s_axi_AXILiteS_wstrb : signal is "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ";
begin
  ap_clk_0_1 <= ap_clk;
  ap_rst_n_0_1 <= ap_rst_n;
  hls_inst_output_r_TREADY <= output_r_tready;
  input_r_0_1_TDATA(7 downto 0) <= input_r_tdata(7 downto 0);
  input_r_0_1_TKEEP(0) <= input_r_tkeep(0);
  input_r_0_1_TLAST(0) <= input_r_tlast(0);
  input_r_0_1_TSTRB(0) <= input_r_tstrb(0);
  input_r_0_1_TVALID <= input_r_tvalid;
  input_r_tready <= input_r_0_1_TREADY;
  interrupt <= hls_inst_interrupt;
  output_r_tdata(7 downto 0) <= hls_inst_output_r_TDATA(7 downto 0);
  output_r_tkeep(0) <= hls_inst_output_r_TKEEP(0);
  output_r_tlast(0) <= hls_inst_output_r_TLAST(0);
  output_r_tstrb(0) <= hls_inst_output_r_TSTRB(0);
  output_r_tvalid <= hls_inst_output_r_TVALID;
  s_axi_AXILiteS_0_1_ARADDR(3 downto 0) <= s_axi_AXILiteS_araddr(3 downto 0);
  s_axi_AXILiteS_0_1_ARVALID <= s_axi_AXILiteS_arvalid;
  s_axi_AXILiteS_0_1_AWADDR(3 downto 0) <= s_axi_AXILiteS_awaddr(3 downto 0);
  s_axi_AXILiteS_0_1_AWVALID <= s_axi_AXILiteS_awvalid;
  s_axi_AXILiteS_0_1_BREADY <= s_axi_AXILiteS_bready;
  s_axi_AXILiteS_0_1_RREADY <= s_axi_AXILiteS_rready;
  s_axi_AXILiteS_0_1_WDATA(31 downto 0) <= s_axi_AXILiteS_wdata(31 downto 0);
  s_axi_AXILiteS_0_1_WSTRB(3 downto 0) <= s_axi_AXILiteS_wstrb(3 downto 0);
  s_axi_AXILiteS_0_1_WVALID <= s_axi_AXILiteS_wvalid;
  s_axi_AXILiteS_arready <= s_axi_AXILiteS_0_1_ARREADY;
  s_axi_AXILiteS_awready <= s_axi_AXILiteS_0_1_AWREADY;
  s_axi_AXILiteS_bresp(1 downto 0) <= s_axi_AXILiteS_0_1_BRESP(1 downto 0);
  s_axi_AXILiteS_bvalid <= s_axi_AXILiteS_0_1_BVALID;
  s_axi_AXILiteS_rdata(31 downto 0) <= s_axi_AXILiteS_0_1_RDATA(31 downto 0);
  s_axi_AXILiteS_rresp(1 downto 0) <= s_axi_AXILiteS_0_1_RRESP(1 downto 0);
  s_axi_AXILiteS_rvalid <= s_axi_AXILiteS_0_1_RVALID;
  s_axi_AXILiteS_wready <= s_axi_AXILiteS_0_1_WREADY;
hls_inst: component bd_0_hls_inst_0
     port map (
      ap_clk => ap_clk_0_1,
      ap_rst_n => ap_rst_n_0_1,
      input_r_TDATA(7 downto 0) => input_r_0_1_TDATA(7 downto 0),
      input_r_TKEEP(0) => input_r_0_1_TKEEP(0),
      input_r_TLAST(0) => input_r_0_1_TLAST(0),
      input_r_TREADY => input_r_0_1_TREADY,
      input_r_TSTRB(0) => input_r_0_1_TSTRB(0),
      input_r_TVALID => input_r_0_1_TVALID,
      interrupt => hls_inst_interrupt,
      output_r_TDATA(7 downto 0) => hls_inst_output_r_TDATA(7 downto 0),
      output_r_TKEEP(0) => hls_inst_output_r_TKEEP(0),
      output_r_TLAST(0) => hls_inst_output_r_TLAST(0),
      output_r_TREADY => hls_inst_output_r_TREADY,
      output_r_TSTRB(0) => hls_inst_output_r_TSTRB(0),
      output_r_TVALID => hls_inst_output_r_TVALID,
      s_axi_AXILiteS_ARADDR(3 downto 0) => s_axi_AXILiteS_0_1_ARADDR(3 downto 0),
      s_axi_AXILiteS_ARREADY => s_axi_AXILiteS_0_1_ARREADY,
      s_axi_AXILiteS_ARVALID => s_axi_AXILiteS_0_1_ARVALID,
      s_axi_AXILiteS_AWADDR(3 downto 0) => s_axi_AXILiteS_0_1_AWADDR(3 downto 0),
      s_axi_AXILiteS_AWREADY => s_axi_AXILiteS_0_1_AWREADY,
      s_axi_AXILiteS_AWVALID => s_axi_AXILiteS_0_1_AWVALID,
      s_axi_AXILiteS_BREADY => s_axi_AXILiteS_0_1_BREADY,
      s_axi_AXILiteS_BRESP(1 downto 0) => s_axi_AXILiteS_0_1_BRESP(1 downto 0),
      s_axi_AXILiteS_BVALID => s_axi_AXILiteS_0_1_BVALID,
      s_axi_AXILiteS_RDATA(31 downto 0) => s_axi_AXILiteS_0_1_RDATA(31 downto 0),
      s_axi_AXILiteS_RREADY => s_axi_AXILiteS_0_1_RREADY,
      s_axi_AXILiteS_RRESP(1 downto 0) => s_axi_AXILiteS_0_1_RRESP(1 downto 0),
      s_axi_AXILiteS_RVALID => s_axi_AXILiteS_0_1_RVALID,
      s_axi_AXILiteS_WDATA(31 downto 0) => s_axi_AXILiteS_0_1_WDATA(31 downto 0),
      s_axi_AXILiteS_WREADY => s_axi_AXILiteS_0_1_WREADY,
      s_axi_AXILiteS_WSTRB(3 downto 0) => s_axi_AXILiteS_0_1_WSTRB(3 downto 0),
      s_axi_AXILiteS_WVALID => s_axi_AXILiteS_0_1_WVALID
    );
end STRUCTURE;
