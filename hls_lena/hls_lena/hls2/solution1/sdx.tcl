# ==============================================================
# File generated on Fri May 31 10:17:11 +0200 2019
# Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
# SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
# IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
# ==============================================================
add_files -tb ../../main.cpp -cflags { -Wno-unknown-pragmas}
add_files -tb ../../lena.grey -cflags { -Wno-unknown-pragmas}
add_files sobel.h
add_files sobel.cpp
set_part xc7z020clg484-1
create_clock -name default -period 10
set_clock_uncertainty 1.25 default
config_export -format=ip_catalog
config_export -rtl=vhdl
set_directive_interface sobel 
