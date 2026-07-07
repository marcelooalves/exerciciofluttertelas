import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoCheckout());
}

class MeuAplicativoCheckout extends StatelessWidget {
  const MeuAplicativoCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckoutScreen(),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color purpleColor = Color(0xFF673AB7); // Roxo oficial do layout

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA), // Fundo levemente acinzentado do app
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Checkout',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
        ),
        backgroundColor: purpleColor,
        elevation: 0,
        automaticallyImplyLeading: false, // Remove botão de voltar padrão
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // 1. Linha das Etapas (Stepper Customizado)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStep(numero: '1', legenda: 'Dados', ativo: true, cor: purpleColor),
                  _buildLinhaConectora(),
                  _buildStep(numero: '2', legenda: 'Pagamento', ativo: false, cor: purpleColor),
                  _buildLinhaConectora(),
                  _buildStep(numero: '3', legenda: 'Confirmação', ativo: false, cor: purpleColor),
                ],
              ),

              const SizedBox(height: 32),

              // 2. Card Branco: Resumo do Pedido
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resumo do pedido',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 20),

                    // Linha do Fone de Ouvido
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F2F1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.headphones, size: 24, color: Colors.black87),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Fone de Ouvido',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        const Text(
                          'R\$ 299,90',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Linha do Frete
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F2F1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.local_shipping_outlined, size: 24, color: Colors.black87),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Frete',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        const Text(
                          'R\$ 15,00',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    const Divider(thickness: 1),
                    const SizedBox(height: 12),

                    // Linha do Total
                    Row(
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          'R\$ 314,90',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: purpleColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(), // Empurra o botão para a parte inferior da tela

              // 3. Botão "Finalizar compra"
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Ação para finalizar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Finalizar compra',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para construir cada bolinha com texto do Stepper
  static Widget _buildStep({required String numero, required String legenda, required bool ativo, required Color cor}) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: ativo ? cor : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: ativo ? cor : Colors.grey.shade400, width: 1.5),
          ),
          child: Center(
            child: Text(
              numero,
              style: TextStyle(
                color: ativo ? Colors.white : Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          legenda,
          style: TextStyle(
            fontSize: 12,
            fontWeight: ativo ? FontWeight.bold : FontWeight.normal,
            color: ativo ? cor : Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  // Widget auxiliar para fazer a linha cinza ou roxa que conecta as bolinhas
  static Widget _buildLinhaConectora() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18.0), // Alinha a linha no centro vertical das bolinhas
        child: Container(
          height: 2,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}