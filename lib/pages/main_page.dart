import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: AppBar(title: Text("meu app"),),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text("campo 1", style: TextStyle(fontSize: 20,),),
          ]
        ),
      ),),
    );
  }
}
