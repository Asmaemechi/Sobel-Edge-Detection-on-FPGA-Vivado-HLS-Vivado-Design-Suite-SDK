#include <iostream>
#include <fstream>
#include <cstdint>
#include <stdio.h>
#include "sobel.h"
#include <hls_stream.h>

#define WIDTH  225
#define HEIGHT 225
#define SIZE   (WIDTH * HEIGHT)

int main() {
    std::ifstream fin("lena.grey", std::ios::binary);
    std::ofstream fout("output.grey", std::ios::binary);

    if (!fin || !fout) {
        std::cerr << "Erreur : impossible d’ouvrir les fichiers.\n";
        return 1;
    }

    uint8_t input_data[SIZE];
    fin.read((char*)input_data, SIZE);
    fin.close();

    hls::stream<axis_t> in_stream;
    hls::stream<axis_t> out_stream;

    // Remplir le flux d'entrée
    for (int i = 0; i < SIZE; i++) {
        axis_t pixel;
        pixel.data = input_data[i];
        pixel.keep = -1;  // tous les octets sont valides
        pixel.last = (i == SIZE - 1);
        in_stream.write(pixel);
    }

    // Appel du filtre Sobel
    sobel(in_stream, out_stream);

    // Lire le flux de sortie et écrire dans le fichier
    for (int i = 0; i < SIZE; i++) {
        axis_t pixel_out = out_stream.read();
        //printf("pixel_out=%d\n",pixel_out);
        fout.write((char*)&pixel_out.data, 1);
    }

    fout.close();

    std::cout << "Filtre Sobel terminé. Résultat écrit dans output.grey\n";
    return 0;
}
