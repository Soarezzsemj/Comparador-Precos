import 'package:comparador_gasolina_alcool/pages/Pagina1Page.dart';
import 'package:comparador_gasolina_alcool/pages/Pagina2Page.dart';
import 'package:comparador_gasolina_alcool/pages/dados_cadastrais.dart';
import 'package:flutter/material.dart';

import 'main_page2.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("app", style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue,),
        drawer: Drawer(child:
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50 ,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DadosCadastraisPage(
                      texto: "Meus dados",
                      dados: ["nome", "idade"],
                    )));

                  },
                    child: Container(
                        padding:  EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: Text("dados cadastrais", style: TextStyle(fontSize: 20),)),
                ),
                Divider(),
                SizedBox(
                  height: 24 ,
                ),
                InkWell(
                  onTap: () {

                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainPageee(
                    )));
                  },
                  child: Container(
                      padding:  EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text("Calculo Gasolina", style: TextStyle(fontSize: 20),)),
                ),
                Divider(),
                SizedBox(
                  height: 24 ,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      padding:  EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text("dados3", style: TextStyle(fontSize: 20),)),
                ),
                Divider(),
              ],
            ),
          ),),
        body: PageView(
          scrollDirection: Axis.vertical,
          children: [
          Pagina1page(),
          Pagina2page(),
        ],),
      ),
    );
  }
}
