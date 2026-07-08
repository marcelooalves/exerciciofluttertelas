import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoCartao());
}

class MeuAplicativoCartao extends StatelessWidget {
  const MeuAplicativoCartao({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreditCardScreen(),
    );
  }
}

class CreditCardScreen extends StatelessWidget {
  const CreditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definindo os tons de roxo com base na imagem do exercício
    const Color cardPurple = Color(0xFF6200EE); 
    const Color textPurple = Color(0xFF6200EE);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // 1. CONTAINER DO CARTÃO DE CRÉDITO
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  color: cardPurple,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: cardPurple.withValues(alpha: 0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Linha Superior: Logo "nu" simulado e bandeira do cartão
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'nu',
                                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                              ),
                              SizedBox(width: 8),
                              Text('Cartão\nVirtual', style: TextStyle(color: Colors.white70, fontSize: 10, height: 1.1)),
                            ],
                          ),
                          const Icon(Icons.credit_card, color: Colors.white70, size: 32),
                        ],
                      ),

                      // Ícone do Chip do Cartão
                      Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.sim_card, color: Colors.black38),
                      ),

                      // Central: Número do Cartão
                      const Text(
                        '1234  5678  9012  3456',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),

                      // Base: Nome do Titular e Logo da Bandeira
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'JOSÉ VIEIRA',
                            style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1),
                          ),
                          Text(
                            'VISA',
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 36),

              // 2. TEXTO DE LIMITE DISPONÍVEL
              const Text(
                'Limite disponível',
                style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 6),
              const Text(
                'R\$ 2.450,00',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
              ),

              const Spacer(), // Empurra as ações rápidas totalmente para a base da tela

              // 3. MENU DE AÇÕES RÁPIDAS (Pagar fatura, Bloquear cartão, Ajustes)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMenuActionItem(
                    icon: Icons.payment_outlined,
                    label: 'Pagar fatura',
                    iconColor: textPurple,
                  ),
                  _buildMenuActionItem(
                    icon: Icons.lock_outline,
                    label: 'Bloquear\ncartão',
                    iconColor: textPurple,
                  ),
                  _buildMenuActionItem(
                    icon: Icons.settings_outlined,
                    label: 'Ajustes',
                    iconColor: textPurple,
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  // 4. DOCUMENTAÇÃO INTERNA: COMPONENTE AUXILIAR PARA CADA ITEM DO MENU INFERIOR
  Widget _buildMenuActionItem({
    required IconData icon,
    required String label,
    required Color iconColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.08), // Fundo roxo bem clarinho para dar destaque ao ícone
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 28),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}