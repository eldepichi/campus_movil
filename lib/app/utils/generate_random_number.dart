import 'dart:math';

int getNumRamdom() {
  int max = 6;
  int numero = ((Random().nextInt(max) + 1) > 6) ? 6 : Random().nextInt(max) + 1;
  return numero;
}
