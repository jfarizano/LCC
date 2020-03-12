#include <stdio.h>

unsigned char rgb_to_gray1(unsigned rgb);
unsigned char rgb_to_gray2(unsigned rgb);
unsigned char ycbcr_to_gray(unsigned ycbcr);

int main() {
  unsigned R = 0x1C, G = 0xFE, B = 0xAD;
  unsigned RGB = R + (G << 8) + (B << 16);

  printf("En RGB: 0x%X\n", RGB);
  printf("En escala de grises (mismo peso para cada canal): 0x%X\n", rgb_to_gray1(RGB));
  printf("En escala de grises (pesos apropiados): 0x%X\n", rgb_to_gray2(RGB));

  unsigned Y = 0x1C, CB = 0xFE, CR = 0xAD;
  unsigned YCBCR = Y + (CB << 8) + (CR << 16);

  printf("En YCbCr: 0x%X\n", YCBCR);
  printf("En escala de grises: 0x%X\n", ycbcr_to_gray(YCBCR));

  return 0;
}