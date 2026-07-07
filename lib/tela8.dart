import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoEstatisticas());
}

class MeuAplicativoEstatisticas extends StatelessWidget {
  const MeuAplicativoEstatisticas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatsScreen(),
    );
  }
}

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFBF7), // Cor de fundo levemente off-white da imagem
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // 1. CABEÇALHO (Número 08 + Títulos)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5B233), // Cor amarela dourada do card 08
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        '08',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Estatísticas do App',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E272C)),
                      ),
                      Text(
                        'Intermediário',
                        style: TextStyle(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 28),

              // 2. PAINEL PRINCIPAL DE ESTATÍSTICAS (Container cinza arredondado)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F3FA), // Fundo azul/cinza bem suave do painel
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.black12, width: 0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Estatísticas',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1E272C)),
                    ),
                    
                    const SizedBox(height: 20),

                    // 3. RENDERIZAÇÃO DOS CARDS (Usando o componente dinâmico reutilizável)
                    const StatItemCard(
                      label: 'Usuários',
                      value: '1.250',
                      icon: Icons.people_alt_outlined,
                      iconColor: Color(0xFF673AB7), // Roxo
                    ),
                    
                    const SizedBox(height: 16),
                    
                    const StatItemCard(
                      label: 'Vendas',
                      value: '3.460',
                      icon: Icons.shopping_cart_outlined,
                      iconColor: Color(0xFF2E7D32), // Verde
                    ),
                    
                    const SizedBox(height: 16),
                    
                    const StatItemCard(
                      label: 'Visitas',
                      value: '8.920',
                      icon: Icons.visibility_outlined,
                      iconColor: Color(0xFF2979FF), // Azul
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// MINI-COMPONENTE: CARD DE MÉTRICA INDIVIDUAl (Reutilizável)
// -------------------------------------------------------------
class StatItemCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;

  const StatItemCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Textos da esquerda (Métrica e Número)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ],
          ),
          // Ícone Colorido da direita
          Icon(
            icon,
            size: 38,
            color: iconColor,
          ),
        ],
      ),
    );
  }
}