import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoPlayer());
}

class MeuAplicativoPlayer extends StatelessWidget {
  const MeuAplicativoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  // Variável para controlar a posição atual do Slider da música de forma dinâmica
  double _posicaoMusica = 80.0; // Correspondente a 1 minuto e 20 segundos

  @override
  Widget build(BuildContext context) {
    const Color darkPurple = Color(0xFF1B0E47); // Roxo escuro do fundo do player
    const Color accentPurple = Color(0xFF673AB7); // Roxo de destaque das bordas

    return Scaffold(
      backgroundColor: darkPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              // 1. CABEÇALHO (Voltar, Títulos, Menu)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    onPressed: () {},
                  ),
                  Column(
                    children: const [
                      Text(
                        'Imagine Dragons',
                        style: TextStyle(fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Believer',
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                    onPressed: () {},
                  ),
                ],
              ),

              const Spacer(), // Empurra o álbum para o centro da tela

              // 2. CAPA DO ÁLBUM CIRCULAR (Com borda roxa iluminada)
              Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: accentPurple, width: 4), // Borda brilhante do print
                  boxShadow: [
                    BoxShadow(
                      color: accentPurple.withValues(alpha: 0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1614613535308-eb5fbd3d2c17?q=80&w=400', // Imagem abstrata colorida simulando a capa original do Evolve
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const Spacer(), // Empurra a barra de tempo para baixo

              // 3. BARRA DE PROGRESSO (Timeline)
              Row(
                children: [
                  const Text(
                    '1:20',
                    style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white, // Barra preenchida branca idêntica ao print
                        inactiveTrackColor: Colors.white24, // Barra restante transparente
                        thumbColor: Colors.white, // Bolinha arrastável branca
                        trackHeight: 3,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                      ),
                      child: Slider(
                        min: 0.0,
                        max: 204.0, // Duração total de 3:24 convertida em segundos
                        value: _posicaoMusica,
                        onChanged: (double novoValor) {
                          setState(() {
                            _posicaoMusica = novoValor; // Altera dinamicamente ao arrastar no Chrome
                          });
                        },
                      ),
                    ),
                  ),
                  const Text(
                    '3:24',
                    style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 4. CONTROLES DE MÍDIA (Shuffle, Back, Play/Pause, Next, Repeat)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shuffle, color: Colors.white70, size: 24),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_previous, color: Colors.white38, size: 32), // Ícone esmaecido igual ao print
                    onPressed: () {},
                  ),
                  
                  // Botão Central de Pause (Círculo Branco)
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.pause,
                      size: 38,
                      color: darkPurple, // Cor do ícone interna igual à do fundo
                    ),
                  ),
                  
                  IconButton(
                    icon: const Icon(Icons.skip_next, color: Colors.white, size: 32),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.repeat, color: Colors.white70, size: 24),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}