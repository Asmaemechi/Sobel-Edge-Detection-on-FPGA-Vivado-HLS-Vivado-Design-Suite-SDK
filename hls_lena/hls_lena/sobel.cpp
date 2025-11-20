#include "sobel.h"
//#include <hls_video.h>
#include <math.h>

void sobel(hls::stream<axis_t> &input, hls::stream<axis_t> &output) {
#pragma HLS INTERFACE axis port=input
#pragma HLS INTERFACE axis port=output
//#pragma HLS INTERFACE ap_ctrl_none port=return

    uint8_t line_buffer[3][IMG_WIDTH];
//#pragma HLS ARRAY_PARTITION variable=line_buffer complete dim=1

    uint8_t window[3][3];
//#pragma HLS ARRAY_PARTITION variable=window complete dim=0

    int row = 0, col = 0;

    for (int i = 0; i < IMG_HEIGHT * IMG_WIDTH; i++) {
#pragma HLS PIPELINE II=1
        axis_t pixel_in = input.read();
        uint8_t new_pixel = pixel_in.data;

        // Mettre à jour le buffer de ligne
        line_buffer[0][col] = line_buffer[1][col];
        line_buffer[1][col] = line_buffer[2][col];
        line_buffer[2][col] = new_pixel;

        if (row >= 2 && col >= 2) {
            // Remplir la fenêtre 3x3
            for (int dy = 0; dy < 3; dy++) {
                for (int dx = 0; dx < 3; dx++) {
                    window[dy][dx] = line_buffer[dy][col - 2 + dx];
                }
            }

            // Filtres Sobel
            int gx = -window[0][0] + window[0][2]
                   -2*window[1][0] + 2*window[1][2]
                   -window[2][0] + window[2][2];

            int gy = -window[0][0] - 2*window[0][1] - window[0][2]
                     + window[2][0] + 2*window[2][1] + window[2][2];

            int mag = (int)(sqrtf((float)(gx * gx + gy * gy)));
            if (mag > 255) mag = 255;

            axis_t pixel_out;
            pixel_out.data = (uint8_t)mag;
            pixel_out.last = (i == IMG_WIDTH * IMG_HEIGHT - 1);
            output.write(pixel_out);
        } else {
            axis_t pixel_out;
            pixel_out.data = 0;
            pixel_out.last = (i == IMG_WIDTH * IMG_HEIGHT - 1);
            output.write(pixel_out);
        }

        // Mise à jour des coordonnées
        col++;
        if (col == IMG_WIDTH) {
            col = 0;
            row++;
        }
    }
}

