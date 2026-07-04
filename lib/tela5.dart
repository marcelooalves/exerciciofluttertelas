import 'package:flutter/material.dart';
// Importe a sua tela de sucesso aqui. 
// Substitua 'seu_projeto' pelo nome real do seu pacote se necessário.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // O MaterialApp introduz o Directionality e os estilos padrão do Material Design
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de "Debug" do canto da tela
      home: SuccessScreen(), // Define a tela de sucesso como a tela inicial
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco como na imagem
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0), // Margem ao redor de toda a tela
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Espaço flexível para centralizar o bloco de cima
              const Spacer(),

              // 2. Ícone de Sucesso Verde
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Colors.green, // Cor verde do círculo
                  shape: BoxShape.circle, // Transforma o container em círculo
                ),
                child: const Icon(
                  Icons.check, // Ícone de "visto"
                  color: Colors.white, // Cor do ícone interna
                  size: 80, // Tamanho do ícone
                ),
              ),

              const SizedBox(height: 32), // Espaçamento entre o ícone e o título

              // 3. Título "Sucesso!"
              const Text(
                'Sucesso!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 12), // Espaçamento entre o título e a descrição

              // 4. Descrição da ação
              const Text(
                'Sua ação foi realizada\ncom sucesso.',
                textAlign: TextAlign.center, // Centraliza o texto textualmente
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey, // Tom cinza para a descrição
                  height: 1.4, // Altura da linha para melhor leitura
                ),
              ),

              // 5. Outro espaço flexível que empurra o botão para baixo
              const Spacer(),

              // 6. Botão "Voltar para o início"
              SizedBox(
                width: double.infinity, // Faz o botão ocupar toda a largura disponível
                height: 56, // Altura confortável para o clique do usuário
                child: ElevatedButton(
                  onPressed: () {
                    // Aqui você colocará a ação de voltar
                    // Exemplo: Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Cor de fundo verde do botão
                    foregroundColor: Colors.white, // Cor do texto interna do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // Bordas arredondadas
                    ),
                    elevation: 0, // Sem sombra para um visual mais limpo e moderno
                  ),
                  child: const Text(
                    'Voltar para o início',
                    style: TextStyle(
                      fontSize: 16,
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