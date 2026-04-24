import 'package:flutter/material.dart';

class MainPageee extends StatefulWidget {
  const MainPageee({super.key});

  @override
  State<MainPageee> createState() => _MainPageeeState();
}

class _MainPageeeState extends State<MainPageee> {
  double precoGasolina = 0.0;
  double precoAlcool = 0.0;
  double resultado = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Adicionei uma cor de fundo bem suave para contrastar com os campos
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Álcool X Gasolina",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true, // Centraliza o título no topo
        elevation: 0,
      ),
      body: SafeArea(
        // 2. SingleChildScrollView evita aquele erro de "tela cortada" quando o teclado sobe
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0), // Dá um respiro nas laterais
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // 3. Stretch faz os botões e campos ocuparem a largura disponível respeitando o padding
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 4. Um ícone no topo para preencher o espaço e deixar mais bonito
              const Icon(
                  Icons.local_gas_station,
                  size: 120,
                  color: Colors.blueAccent
              ),
              const SizedBox(height: 40),

              TextField(
                // 5. Força o teclado do celular a abrir já nos números
                keyboardType: TextInputType.number,
                onChanged: (valueGas) {
                  setState(() {
                    precoGasolina = double.tryParse(valueGas) ?? 0.0;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina",
                  prefixIcon: const Icon(Icons.local_gas_station, color: Colors.blueAccent),
                  // 6. OutlineInputBorder cria aquela borda arredondada moderna ao redor de todo o campo
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                keyboardType: TextInputType.number,
                onChanged: (valueEthanol) {
                  setState(() {
                    precoAlcool = double.tryParse(valueEthanol) ?? 0.0;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Preço do Álcool",
                  prefixIcon: const Icon(Icons.eco, color: Colors.green),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              SizedBox(
                height: 55, // Aumentei um pouco a altura do botão para ficar mais fácil de clicar
                child: ElevatedButton( // 7. Troquei TextButton por ElevatedButton para dar destaque
                  onPressed: () {
                    setState(() {
                      // A LÓGICA CONTINUA EXATAMENTE IGUAL
                      if (precoGasolina > 0) {
                        resultado = precoAlcool / precoGasolina;
                      } else {
                        resultado = 0.0;
                      }
                      debugPrint(resultado.toString());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              Text(
                // O TERNÁRIO CONTINUA O MESMO
                resultado == 0.0
                    ? "Digite os valores para calcular"
                    : (resultado < 0.7 ? "Abasteça com Álcool" : "Abasteça com Gasolina"),
                textAlign: TextAlign.center, // Centraliza o texto do resultado
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  // Um detalhe extra: a cor do texto muda dependendo do resultado!
                  color: resultado == 0.0
                      ? Colors.black87
                      : (resultado < 0.7 ? Colors.green : Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}