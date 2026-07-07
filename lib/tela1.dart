import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Define o fundo branco limpo
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Empurra o conteúdo principal levemente para baixo, dando respiro no topo
              const Spacer(flex: 2),

              // 2. Área da Ilustração / Ícone Central
              // Substitua este Container por um Image.asset() quando tiver o arquivo do rapaz
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9), // Verde bem claro de fundo
                  shape: BoxShape.circle,
                ),
                child: const Image(
                  image: AssetImage('assets/imagens/rapaz_acenando.jpg'), // Substitua pelo caminho correto da imagem
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 40), // Espaço generoso entre a imagem e o título

              // 3. Bloco de Textos
              const Text(
                'Bem-vindo!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A), // Preto suave para o título
                ),
              ),
              
              const SizedBox(height: 12), // Espaço entre o título e o subtítulo
              
              const Text(
                'Que bom ter você aqui.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey, // Tom cinza idêntico ao layout
                ),
              ),

              // 4. Este Spacer ganha mais peso para empurrar o botão totalmente para baixo
              const Spacer(flex: 3),

              // 5. Botão "Começar" posicionado na base da tela
              SizedBox(
                width: double.infinity, // Ocupa toda a largura interna disponível
                height: 56, // Altura padrão e confortável para botões mobile
                child: ElevatedButton(
                  onPressed: () {
                    // Ação ao clicar no botão Começar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32), // Verde oficial do botão
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // Bordas arredondadas suaves
                    ),
                    elevation: 0, // Remove sombras pesadas
                  ),
                  child: const Text(
                    'Começar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}