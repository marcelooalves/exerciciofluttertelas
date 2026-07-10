import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoEstatistias());
}

class MeuAplicativoEstatistias extends StatelessWidget {
  const MeuAplicativoEstatistias({super.key});

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
    // Cores extraídas do layout da imagem
    const Color bgContainerColor = Color(0xFFF1F3F9); // Cor cinza claro do painel de fundo
    const Color purpleIconColor = Color(0xFF6A1B9A);  // Cor do ícone de Usuários
    const Color greenIconColor = Color(0xFF2E7D32);   // Cor do ícone de Vendas
    const Color blueIconColor = Color(0xFF2962FF);    // Cor do ícone de Visitas

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Fundo externo suave
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            // CONTÊINER PRINCIPAL DAS ESTATÍSTICAS
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: bgContainerColor,
                borderRadius: BorderRadius.circular(28), // Cantos bem arredondados do painel
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Título Interno
                    const Text(
                      'Estatísticas',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1C20),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // CARD 1: Usuários
                    _buildStatCard(
                      label: 'Usuários',
                      value: '1.250',
                      icon: Icons.people_alt_outlined,
                      iconColor: purpleIconColor,
                    ),
                    const SizedBox(height: 16),

                    // CARD 2: Vendas
                    _buildStatCard(
                      label: 'Vendas',
                      value: '3.460',
                      icon: Icons.shopping_cart_outlined,
                      iconColor: greenIconColor,
                    ),
                    const SizedBox(height: 16),

                    // CARD 3: Visitas
                    _buildStatCard(
                      label: 'Visitas',
                      value: '8.920',
                      icon: Icons.visibility_outlined,
                      iconColor: blueIconColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 3. DOCUMENTAÇÃO INTERNA: COMPONENTE REUTILIZÁVEL PARA OS CARDS INTERNOS
  // Este método evita a repetição desnecessária de código para cada bloco de dados.
  Widget _buildStatCard({
    required String label,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Cantos arredondados dos cards brancos
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.015),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Textos alinhados à esquerda
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1C20),
                ),
              ),
            ],
          ),
          // Ícone colorido à direita
          Icon(
            icon,
            color: iconColor,
            size: 32,
          ),
        ],
      ),
    );
  }
}