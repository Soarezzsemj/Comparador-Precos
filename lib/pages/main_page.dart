import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double precoGasolina = 0.0;
  double precoAlcool = 0.0;
  double resultado = 0.0;
  @override
  Widget build(BuildContext context) {
    // O Scaffold deve ser o widget raiz aqui, não dentro de um Column
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool X Gasolina",style: TextStyle(color: Colors.white), ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          // O Column aqui dentro permite ter vários elementos (TextField e Container)
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: SizedBox(
                  width: 160,
                  child: TextField(
                    onChanged: (valueGas) {
                      setState(() {
                        precoGasolina = double.tryParse(valueGas) ?? 0.0;
                      });
                    },
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: "Gasolina",
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.price_change, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                child: SizedBox(
                  width: 160,
                  child: TextField(
                    onChanged: (valueEthanol) {
                      setState(() {
                        precoAlcool = double.tryParse(valueEthanol) ?? 0.0;
                      });
                    },
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: "Álcool",
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.price_change, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
                SizedBox(
                  height: 40,
                  width: 120,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if(precoGasolina > 0){
                        resultado = precoAlcool / precoGasolina;
                      } else {
                        resultado = 0.0;
                      }

                      debugPrint(resultado.toString());
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5),
                      ),
                    ),
                  ),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height:20),
              Text(
                resultado == 0.0 ? "Digite os valores para calcular" : ( resultado < 0.7 ? "Abasteça com Álcool": "Abasteça com Gasolina"),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}