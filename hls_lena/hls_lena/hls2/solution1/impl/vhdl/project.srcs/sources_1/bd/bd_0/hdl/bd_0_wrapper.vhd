--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Fri May 31 10:18:25 2019
--Host        : DESKTOP-C2MIG7A running 64-bit major release  (build 9200)
--Command     : generate_target bd_0_wrapper.bd
--Design      : bd_0_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_wrapper is
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
end bd_0_wrapper;

architecture STRUCTURE of bd_0_wrapper is
  component bd_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    input_r_tvalid : in STD_LOGIC;
    input_r_tready : out STD_LOGIC;
    input_r_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    input_r_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_r_tkeep : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_r_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    output_r_tvalid : out STD_LOGIC;
    output_r_tready : in STD_LOGIC;
    output_r_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    output_r_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_r_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_r_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_AXILiteS_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_AXILiteS_awvalid : in STD_LOGIC;
    s_axi_AXILiteS_awready : out STD_LOGIC;
    s_axi_AXILiteS_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_AXILiteS_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_AXILiteS_wvalid : in STD_LOGIC;
    s_axi_AXILiteS_wready : out STD_LOGIC;
    s_axi_AXILiteS_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_AXILiteS_bvalid : out STD_LOGIC;
    s_axi_AXILiteS_bready : in STD_LOGIC;
    s_axi_AXILiteS_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_AXILiteS_arvalid : in STD_LOGIC;
    s_axi_AXILiteS_arready : out STD_LOGIC;
    s_axi_AXILiteS_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_AXILiteS_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_AXILiteS_rvalid : out STD_LOGIC;
    s_axi_AXILiteS_rready : in STD_LOGIC
  );
  end component bd_0;
begin
bd_0_i: component bd_0
     port map (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      input_r_tdata(7 downto 0) => input_r_tdata(7 downto 0),
      input_r_tkeep(0) => input_r_tkeep(0),
      input_r_tlast(0) => input_r_tlast(0),
      input_r_tready => input_r_tready,
      input_r_tstrb(0) => input_r_tstrb(0),
      input_r_tvalid => input_r_tvalid,
      interrupt => interrupt,
      output_r_tdata(7 downto 0) => output_r_tdata(7 downto 0),
      output_r_tkeep(0) => output_r_tkeep(0),
      output_r_tlast(0) => output_r_tlast(0),
      output_r_tready => output_r_tready,
      output_r_tstrb(0) => output_r_tstrb(0),
      output_r_tvalid => output_r_tvalid,
      s_axi_AXILiteS_araddr(3 downto 0) => s_axi_AXILiteS_araddr(3 downto 0),
      s_axi_AXILiteS_arready => s_axi_AXILiteS_arready,
      s_axi_AXILiteS_arvalid => s_axi_AXILiteS_arvalid,
      s_axi_AXILiteS_awaddr(3 downto 0) => s_axi_AXILiteS_awaddr(3 downto 0),
      s_axi_AXILiteS_awready => s_axi_AXILiteS_awready,
      s_axi_AXILiteS_awvalid => s_axi_AXILiteS_awvalid,
      s_axi_AXILiteS_bready => s_axi_AXILiteS_bready,
      s_axi_AXILiteS_bresp(1 downto 0) => s_axi_AXILiteS_bresp(1 downto 0),
      s_axi_AXILiteS_bvalid => s_axi_AXILiteS_bvalid,
      s_axi_AXILiteS_rdata(31 downto 0) => s_axi_AXILiteS_rdata(31 downto 0),
      s_axi_AXILiteS_rready => s_axi_AXILiteS_rready,
      s_axi_AXILiteS_rresp(1 downto 0) => s_axi_AXILiteS_rresp(1 downto 0),
      s_axi_AXILiteS_rvalid => s_axi_AXILiteS_rvalid,
      s_axi_AXILiteS_wdata(31 downto 0) => s_axi_AXILiteS_wdata(31 downto 0),
      s_axi_AXILiteS_wready => s_axi_AXILiteS_wready,
      s_axi_AXILiteS_wstrb(3 downto 0) => s_axi_AXILiteS_wstrb(3 downto 0),
      s_axi_AXILiteS_wvalid => s_axi_AXILiteS_wvalid
    );
end STRUCTURE;
