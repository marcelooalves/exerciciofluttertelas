import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoFilmes());
}

class MeuAplicativoFilmes extends StatelessWidget {
  const MeuAplicativoFilmes({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieDetailsScreen(),
    );
  }
}

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E17), // Fundo azul bem escuro/preto do app
      body: Stack(
        children: [
          // 1. IMAGEM DE FUNDO DO FILME (Interestelar)
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6, // Ocupa 60% da altura da tela
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1506703719100-a0f3a48c0f86?q=80&w=1000', // Imagem de espaço representando o filme
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. GRADIENTE ESCURO POR CIMA DA IMAGEM (Para dar leitura ao texto)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.3),  // Transparente no topo
                  const Color(0xFF0A0E17).withValues(alpha: 0.8), // Começa a escurecer no meio
                  const Color(0xFF0A0E17), // Totalmente escuro na base onde ficam os textos
                ],
                stops: const [0.0, 0.4, 0.7], // Controla onde cada tom de cor se posiciona
              ),
            ),
          ),

          // 3. CONTEÚDO DA TELA (Textos e Botões)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Botões de Voltar e Favoritos no topo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.white, size: 28),
                        onPressed: () {},
                      ),
                    ],
                  ),

                  const Spacer(), // Empurra as informações para a metade inferior da tela

                  // Título do Filme
                  const Text(
                    'Interestelar',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Ano e Gênero
                  const Text(
                    '2014  •  Ficção científica',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Linha de Avaliação e Duração
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFFFD54F), size: 22), // Estrela amarela
                      const SizedBox(width: 6),
                      const Text(
                        '8.6',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(width: 24),
                      const Icon(Icons.access_time, color: Colors.white70, size: 20), // Relógio
                      const SizedBox(width: 6),
                      const Text(
                        '2h 49m',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Sinopse / Descrição
                  const Text(
                    'Um grupo de exploradores viaja através de um buraco de minhoca em busca de um novo lar para a humanidade.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Botão "Assistir agora"
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF673AB7), // Roxo idêntico ao do print
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Assistir agora',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}