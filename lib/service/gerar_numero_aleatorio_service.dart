import 'dart:math';

class GerarNumeroAleatorioService {
  static int gerarNumeroAleatorio(){

    Random numeroAleatorio = Random();

    return numeroAleatorio.nextInt(1000);
  }
}