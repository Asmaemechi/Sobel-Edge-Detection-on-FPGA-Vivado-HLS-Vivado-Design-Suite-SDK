#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "xaxidma.h"
#include "xsobel.h"
#include "ff.h"
#include "xil_cache.h"
#include "xtime_l.h"
#include "sleep.h"
#include "xscugic.h"
#define SIZE       225
#define IMG_SIZE   (SIZE * SIZE)
#define INPUT_FILE  "input.gre"
#define OUTPUT_FILE "output.gre"

// Instances
XAxiDma AxiDma;
XSobel SBL;
XSobel_Config SBL_Config = {0, XPAR_SOBEL_0_S_AXI_CONTROL_BUS_BASEADDR};
XScuGic ScuGic;





volatile static int runXArray = 0;
volatile static int resultXArray = 0;
// Aligned buffers
unsigned char input[IMG_SIZE]  __attribute__((aligned(32)));
unsigned char output[IMG_SIZE] __attribute__((aligned(32)));

// === DMA Initialization ===
int init_dma(XAxiDma *axiDmaPtr){
    XAxiDma_Config *CfgPtr;
    int status;
    // Get pointer to DMA configuration
    CfgPtr = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
    if(!CfgPtr){
       print("Error looking for AXI DMA config\n\r");
       return XST_FAILURE;
    }
    // Initialize the DMA handle
    status = XAxiDma_CfgInitialize(axiDmaPtr,CfgPtr);
    if(status != XST_SUCCESS){
       print("Error initializing DMA\n\r");
       return XST_FAILURE;
    }
    XAxiDma_IntrDisable(axiDmaPtr, XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DEVICE_TO_DMA);
       XAxiDma_IntrDisable(axiDmaPtr, XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DMA_TO_DEVICE);

       return XST_SUCCESS;
 }
int XArray_init(XSobel *XArraysumPtr)
{
	XSobel_Config *cfgPtr;
	int status;
	cfgPtr = XSobel_LookupConfig(XPAR_SOBEL_0_DEVICE_ID);
	if (!cfgPtr)
	{
		print("ERROR: Lookup of accelerator configuration failed.\n\r");
		return XST_FAILURE;
	}
	status = XSobel_CfgInitialize(XArraysumPtr, cfgPtr);
	if (status != XST_SUCCESS)
	{
		print("ERROR: Could not initialize accelerator.\n\r");
		return XST_FAILURE;
	}
	return status;
}
void XArray_isr(void *InstancePtr)
{
    XSobel *pAccelerator = (XSobel *)InstancePtr;

    // Clear and disable interrupts
    XSobel_InterruptClear(pAccelerator, 1);
    XSobel_InterruptDisable(pAccelerator, 0xFFFFFFFF);
    XSobel_InterruptGlobalDisable(pAccelerator);

    resultXArray = 1;

    // Re-enable for next usage
    XSobel_InterruptEnable(pAccelerator, 1);
    XSobel_InterruptGlobalEnable(pAccelerator);
}
int setup_interrupt()
{
	//This functions sets up the interrupt on the ARM
	int result;
	XScuGic_Config *pCfg = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
	if (pCfg == NULL)
	{
		print("Interrupt Configuration Lookup Failed\n\r");
		return XST_FAILURE;
	}
	result = XScuGic_CfgInitialize(&ScuGic,pCfg,pCfg->CpuBaseAddress);
	if(result != XST_SUCCESS)
	{
		return result;
	}
	// self-test
	result = XScuGic_SelfTest(&ScuGic);
	if(result != XST_SUCCESS)
	{
		return result;
	}
	// Initialize the exception handler
	Xil_ExceptionInit();

	// Register the exception handler
	print("Register the exception handler\n\r");
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler,&ScuGic);

	//Enable the exception handler
	Xil_ExceptionEnable();

	// Connect the Adder ISR to the exception table
	print("Connect the Adder ISR to the Exception handler table\n\r");
	result = XScuGic_Connect(&ScuGic, XPAR_FABRIC_SOBEL_0_INTERRUPT_INTR, (Xil_InterruptHandler)XArray_isr, &SBL);
	if(result != XST_SUCCESS)
	{
		return result;
	}
	print("Enable the Adder ISR\n\r");
	XScuGic_Enable(&ScuGic, XPAR_FABRIC_SOBEL_0_INTERRUPT_INTR);
	return XST_SUCCESS;
}

// === Sobel Hardware Processing ===

// === Main ===
int main() {
    FIL  fout;
    UINT  writtenBytes = 0;
    FRESULT res;
    FIL fin;
     UINT readBytes = 0;
     int status=0;
     FATFS fs;
    init_platform();
    xil_printf("======= Sobel HW Application Start =======\n\r");

    xil_printf("[FS] Mounting SD card...\n\r");
    if (f_mount(&fs, "0:/", 0) != FR_OK) {
        xil_printf("[FS] Cannot mount SD card\n\r");
        return XST_FAILURE;
    }

    if (init_dma(&AxiDma) != XST_SUCCESS) {
        xil_printf("[ERR] DMA init failed\n\r");
        return XST_FAILURE;
    }
	status = XArray_init(&SBL);
	if(status != XST_SUCCESS) {print("HLS peripheral setup failed\n\r");exit(-1);}else {print("- XArray_init Initialized successfully-\n\r"); }




    //Setup the interrupt
    		status = setup_interrupt();
    		if(status != XST_SUCCESS) {print("Interrupt setup failed\n\r");exit(-1);}else {print("- Interrupt setup Initialized successfully-\n\r"); }

    		//ENable Interrupts
    		XSobel_InterruptEnable(&SBL,1);
    		XSobel_InterruptGlobalEnable(&SBL);



    		    xil_printf("[FS] Opening \"%s\"...\n\r", INPUT_FILE);
    		    res = f_open(&fin, INPUT_FILE, FA_READ);
    		    if (res != FR_OK) {
    		        xil_printf("[FS] f_open error = %d\n\r", res);
    		        return XST_FAILURE;
    		    }

    		    xil_printf("[FS] Reading image (%d bytes)...\n\r", IMG_SIZE);
    		    res = f_read(&fin, input, IMG_SIZE, &readBytes);
    		    f_close(&fin);
    		    xil_printf("[FS] Read %u bytes\n\r", readBytes);
    		    if (res != FR_OK || readBytes != IMG_SIZE) {
    		        xil_printf("[FS] Read failed (res=%d)\n\r", res);
    		        return XST_FAILURE;}
    		     for (int i=0;i<100;i++){
    		    		  	      printf("input[%d} =%d\n",i, input[i]);
    		    		  	      }

    		         XSobel_Start(&SBL);
    		         Xil_DCacheFlushRange((u32)input, IMG_SIZE*sizeof(unsigned char));

    		  	    // DMA enough data to push out first result data set completely
    		  	    //int XAxiDma_SimpleTransfer(XAxiDma *InstancePtr, u32 BuffAddr, u32 Length, int Direction)
    		  	    status = XAxiDma_SimpleTransfer(&AxiDma, (u32)input, IMG_SIZE * sizeof(unsigned char), XAXIDMA_DMA_TO_DEVICE);
    		  	    //printf("XAxiDma_SimpleTransfer axiDma_0 status = %d \n\r",status);

    		  	    Xil_DCacheInvalidateRange((u32)output, IMG_SIZE * sizeof(unsigned char));
    		  	  // Invalidate output buffer

    		  	    // Setup DMA from PL to PS memory using AXI DMA's 'simple' transfer mode
    		  	      status = XAxiDma_SimpleTransfer(&AxiDma, (u32)output, IMG_SIZE * sizeof(unsigned char), XAXIDMA_DEVICE_TO_DMA);
    		  	      // Data cache must be invalidated for 'result' buffer after DMA
    		  	      int i=0;
    		  	      for (i=0;i<100;i++){
    		  	      printf("output[%d} =%d\n",i, output[i]);
    		  	      }
    		  	    //  while(!XSobel_IsReady(&SBL));




    		  	    while(XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE));
    		  	    while(XAxiDma_Busy(&AxiDma,XAXIDMA_DEVICE_TO_DMA));
    		  	    while (!resultXArray);
    		  	    xil_printf("[SOBEL] Processing complete\n\r");

    		  	    // Invalidate output buffer
    		  	   // xil_printf("[CACHE] Invalidate output buffer\n\r");
    		  	 //   Xil_DCacheInvalidateRange((u32)output, IMG_SIZE);
    		  	     // Save output
    		  	     xil_printf("[FS] Writing \"%s\"...\n\r", OUTPUT_FILE);
    		  	     res = f_open(&fout, OUTPUT_FILE, FA_CREATE_ALWAYS | FA_WRITE);
    		  	     if (res != FR_OK) {
    		  	         xil_printf("[FS] f_open output error = %d\n\r", res);
    		  	         return XST_FAILURE;
    		  	     }

    		  	     res = f_write(&fout, output, IMG_SIZE, &writtenBytes);
    		  	     f_close(&fout);
    		  	     xil_printf("[FS] Written %u bytes\n\r", writtenBytes);
    		  	     if (res != FR_OK || writtenBytes != IMG_SIZE) {
    		  	         xil_printf("[FS] Write failed (res=%d)\n\r", res);
    		  	         return XST_FAILURE;
    		  	     }


    xil_printf("======= Application complete =======\n\r");




    	    status = XSobel_IsIdle(&SBL);
    	    printf("XArraysum_IsIdle status = %d \n\r",status);

    		status = XSobel_IsDone(&SBL);
    		printf("XArraysum_IsDone status = %d \n\r",status);

    		status = XSobel_IsReady(&SBL);
    		printf("XArraysum_IsReady status = %d \n\r",status);
    cleanup_platform();
    return 0;
}
