import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../service/gerar_numero_aleatorio_service.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var numeroGerado = 0;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
         title: Text("Comparador de preço Gasolina X Alcool", style: GoogleFonts.abel(color: Colors.white, fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.account_box),
        onPressed: () {
          setState(() {
            numeroGerado = 
                GerarNumeroAleatorioService.gerarNumeroAleatorio();
          });
        },
      ),
      body: Container(
        color: Colors.blue,// fundo
        //margin: EdgeInsets.fromLTRB(9, 10, 9, 10), é o padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,// separador
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // separador tbm

          children: [

               Text("numero aleatorio",
                 style: GoogleFonts.adventPro(fontSize: 50,
                     color: Colors.white,
                     backgroundColor: Colors.black),
               ),
             Text(numeroGerado.toString(),
              style: GoogleFonts.adventPro(fontSize: 40),
            ),

            Row(children: [
              Text("teste"),
              Text("teste"),
              Text("teste"),
            ],
            ),
          ],
        ),
      ),
    );
  }
}