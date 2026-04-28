import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 1. Criando o controlador do PageView
  final PageController _pageController = PageController();

  // É uma boa prática limpar o controlador da memória quando a tela for fechada
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Lógica do botão
  void _irParaProximaPagina() {
    // O hasClients garante que o PageView já foi construído na tela antes de tentar animar
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 100), // Tempo da animação
        curve: Curves.easeInOut, // Efeito suave de transição
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // 2. Vinculando o controlador ao PageView
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            color: Colors.blue[100],
            child: const Center(
              child: Text('Etapa 1: Dados Pessoais', style: TextStyle(fontSize: 24)),
            ),
          ),
          Container(
            color: Colors.green[100],
            child: const Center(
              child: Text('Etapa 2: Endereço', style: TextStyle(fontSize: 24)),
            ),
          ),
          Container(
            color: Colors.orange[100],
            child: const Center(
              child: Text('Etapa 3: Confirmação', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
      // 3. Adicionando o botão flutuante com a seta
      floatingActionButton: FloatingActionButton(
        onPressed: _irParaProximaPagina,
        backgroundColor: Colors.blue, // Cor do botão
        child: const Icon(
          Icons.arrow_forward, // Ícone de seta
          color: Colors.white,
        ),
      ),
    );
  }
}