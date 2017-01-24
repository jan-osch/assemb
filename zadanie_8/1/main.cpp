#include <bitset>

#include <iostream>
#include <math.h>
#include <stdio.h>

using namespace std;

extern unsigned int rotate(unsigned int x, int n = 1);   // _Z6rotateji
extern unsigned char rotate(unsigned char x, int n = 1); //_Z6rotatehi

void printBin(unsigned int n) { cout << bitset<32>(n) << endl; }

int main() {
  int x = 14;
  printBin((unsigned int)x);

  printf("rotated by 5: ");
  printBin(rotate((unsigned int)x, 5));

  printf("rotated by 6: ");
  printBin(rotate((unsigned int)x, 6));

  int c = 12;
  printBin((unsigned char)c);
  printf("rotated by 2: ");
  printBin(rotate((unsigned char)c, 2));

  printf("rotated by 1: ");
  printBin(rotate((unsigned char)c, 1));

  return 0;
}
