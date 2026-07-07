import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoClima());
}

class MeuAplicativoClima extends StatelessWidget {
  const MeuAplicativoClima({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(), // Abre a nossa tela de clima
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 1. Aplicação do Fundo Degradê (Gradient)
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2979FF), // Azul mais vivo no topo
              Color(0xFF448AFF), // Azul suave na base
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Pequeno espaçador no topo
                const SizedBox(height: 16),

                // 2. Nome da Cidade
                const Text(
                  'São Paulo, SP',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                const Spacer(), // Empurra os elementos para distribuir no centro

                // 3. Temperatura Principal (Bem grande)
                const Text(
                  '26°',
                  style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.w300, // Traço mais fino e elegante
                    color: Colors.white,
                  ),
                ),

                // 4. Status do Clima
                const Text(
                  'Ensolarado',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16),

                // 5. Ícone Principal do Sol
                const Icon(
                  Icons.wb_sunny,
                  size: 80,
                  color: Color(0xFFFFD54F), // Amarelo sol brilhante
                ),

                const Spacer(), // Empurra os cards da semana para a parte inferior

                // 6. Linha Horizontal com a Previsão dos Dias (Row)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // Usando o nosso mini-componente customizado que criamos abaixo
                    DiaPrevisaoCard(dia: 'Seg', icone: Icons.wb_twilight, temp: '27°', isPrincipal: true),
                    DiaPrevisaoCard(dia: 'Ter', icone: Icons.cloudy_snowing, temp: '24°'),
                    DiaPrevisaoCard(dia: 'Qua', icone: Icons.cloudy_snowing, temp: '22°'),
                  ],
                ),
                
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// MINI-COMPONENTE: CARD DOS DIAS DA SEMANA (Reutilizável para a Atividade)
// -------------------------------------------------------------
class DiaPrevisaoCard extends StatelessWidget {
  final String dia;
  final IconData icone;
  final String temp;
  final bool isPrincipal; // Se for verdadeiro, podemos destacar sutilmente se quiser

  const DiaPrevisaoCard({
    super.key,
    required this.dia,
    required this.icone,
    required this.temp,
    this.isPrincipal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85, // Largura ideal para caber 3 lado a lado na Row
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        // Cor azul escura semitransparente (usando o comOpacity) idêntico ao print
        color: Colors.black.withValues(alpha: 0.15), 
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Nome do Dia
          Text(
            dia,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          // Ícone do Clima do dia
          Icon(
            icone,
            size: 32,
            color: isPrincipal ? const Color(0xFFFFD54F) : Colors.white,
          ),
          const SizedBox(height: 12),
          // Temperatura do dia
          Text(
            temp,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}