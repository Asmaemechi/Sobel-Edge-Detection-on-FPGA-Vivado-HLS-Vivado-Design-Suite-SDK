# Sobel-Edge-Detection-on-FPGA-Vivado-HLS-Vivado-Design-Suite-SDK


## 📌 **Overview**

This project implements a **Sobel-based edge detection algorithm** on a **Xilinx Zynq-7000 FPGA** (ZC702 board).
The goal is to accelerate image processing using hardware parallelism through **Vivado HLS** and integrate the generated IP into a complete HW/SW system using **Vivado Design Suite** and **Xilinx SDK**.

The hardware accelerator receives a grayscale image via **AXI4-Stream**, applies Sobel filtering to extract edges, and sends back the processed result through DMA.

---

# 🔍 **Table of Contents**

* [Project Objectives](#-project-objectives)
* [System Architecture](#-system-architecture)
* [Hardware Platform](#-hardware-platform)
* [Software Tools](#-software-tools)
* [HLS Implementation](#️-hls-implementation)
* [Hardware Block Design](#-hardware-block-design)
* [Software Integration (SDK)](#-software-integration-sdk)
* [Performance Results](#-performance-results)
* [Repository Structure](#-repository-structure)
* [How to Run the Project](#-how-to-run-the-project)

---

# 🎯 **Project Objectives**

The purpose of this work is to:

✔ Implement an optimized **hardware accelerator** for Sobel edge detection
✔ Process images **in real time** using FPGA parallel computing
✔ Compare **optimized vs non-optimized** HLS implementations
✔ Integrate the IP into a Zynq SoC using **AXI DMA + AXI-Stream**
✔ Develop a full HW/SW application using **Xilinx SDK**

---

# 🧩 **System Architecture**

The global system is composed of:

### **1️⃣ Vivado HLS: Sobel IP**

* Reads pixel stream (AXI4-Stream)
* Uses window-based convolution (3×3)
* Computes gradients Gx and Gy
* Outputs edge-detected image

### **2️⃣ Vivado Block Design**

* Zynq Processing System (PS)
* AXI DMA (MM2S/S2MM)
* Sobel HLS IP
* AXI Interconnects

### **3️⃣ Processing System (SDK Application)**

* Loads input image from SD card
* Configures DMA + Sobel IP
* Sends ≫ receives image frames via DMA
* Stores output image on SD card

A simplified diagram is shown below:

```
+-----------+      AXI4-Lite      +--------------------+
|   PS      |--------------------->| Sobel HLS (IP Core)|
| ARM A9    |                      +--------------------+
|           |<------AXI DMA------->| AXI4-Stream        |
+-----------+                      +--------------------+
```

---

# 🖥 **Hardware Platform**

### **Target Board**

* **Xilinx Zynq-7000 ZC702**
* FPGA: **XC7Z020**
* Dual-core ARM Cortex-A9
* 1 GB DDR3
* 128 MB QSPI Flash
* DSP slices: **220**
* BRAM: **560 KB**

---

# 🛠 **Software Tools**

| Tool                    | Usage                                                 |
| ----------------------- | ----------------------------------------------------- |
| **Vivado HLS**          | Implement Sobel algorithm, optimizations, generate IP |
| **Vivado Design Suite** | Create block design, integrate IP, generate bitstream |
| **Xilinx SDK**          | Develop C application to control DMA + Sobel IP       |

A full comparison (HLS vs System Generator) is available in the article. 

---

# ⚙️️ **HLS Implementation**

The heart of the project is the Sobel function implemented in C/C++ with AXI interfaces.

### **Interfaces**

```cpp
#pragma HLS INTERFACE axis      port=in_stream
#pragma HLS INTERFACE axis      port=out_stream
#pragma HLS INTERFACE s_axilite port=return bundle=CTRL_BUS
```

### **Optimizations**

The optimized version includes:

```cpp
#pragma HLS PIPELINE II=1
#pragma HLS ARRAY_PARTITION variable=line_buffer complete dim=1
#pragma HLS ARRAY_PARTITION variable=window complete dim=0
```

Benefits:

* 1 pixel processed per clock cycle
* fully parallel window operations
* large latency reduction

---

# 🧱 **Hardware Block Design**

The Vivado block design includes:

✔ Zynq7 Processing System
✔ Sobel HLS IP
✔ AXI DMA (MM2S/S2MM channels)
✔ AXI Interconnect
✔ Clocking + Reset blocks

Connections:

* DMA MM2S → Sobel input AXI-Stream
* Sobel output → DMA S2MM
* Zynq GP0 → Sobel AXI-Lite (control)

---

# 🧑‍💻 **Software Integration (SDK)**

The SDK application handles:

1. SD card mounting
2. Reading `input.grey` (1024×1024)
3. Cache operations
4. DMA → Sobel → DMA transfer
5. Writing `output.grey`
6. Displaying IP status (Idle, Done)

Pseudo-code:

```c
mount_sdcard();

init_dma();
init_sobel_ip();

read_image("input.grey", input_buffer);

dma_send(input_buffer);
dma_receive(output_buffer);

write_image("output.grey", output_buffer);
```

---

# 📈 **Performance Results**

### **Clock Frequency**

| Version       | Clock Period (ns) | Frequency (MHz) |
| ------------- | ----------------- | --------------- |
| Optimized     | 8.97 ns           | **111.5 MHz**   |
| Non optimized | 8.10 ns           | **123.4 MHz**   |

### **Observations**

* Optimized design uses more logic resources
* But achieves **1 pixel/cycle throughput**
* Significantly lower overall latency

---

# 📂 **Repository Structure**

```
📁 Projet_sobel_lena/
│
├── hls_lena/
│   ├── sobel.cpp
│   ├── sobel.h
│    ├── main.cpp
│    ├── hls2
│        └── solution1/
│       
│
├── lena_vivado/
│   ├── block_design/
│   ├── bitstream/
│   └── ip_repo/
│
```

---

# ▶️ **How to Run the Project**

### **1. Generate the HLS IP**


### **2. Import into Vivado Design Suite**

* Open `vivado/` project
* Regenerate bitstream
* Export hardware (`Export → Export Hardware Including Bitstream`)
* Launch SDK

### **3. Build + Run in SDK**

* Import the SDK workspace
* Build the application
* Copy `input.grey` to the SD card
* Run on hardware

### **4. Get the result**

The output image is saved as:

```
output.grey
```

You can visualize it using Python, MATLAB, or OpenCV.

---





