#ifndef SOBEL_H
#define SOBEL_H

#include <ap_axi_sdata.h>
#include <hls_stream.h>
#include <ap_int.h>
#include <stdint.h>

#define IMG_WIDTH  225
#define IMG_HEIGHT 225

typedef ap_axiu<8, 0, 0, 0> axis_t;

void sobel(
    hls::stream<axis_t> &input,
    hls::stream<axis_t> &output
);

#endif
