import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPreviewScreen(), // Chama a tela de teste do fone
    );
  }
}

// 1. TELA DE TESTE (Para centralizar o card no seu navegador Chrome)
class ProductPreviewScreen extends StatelessWidget {
  const ProductPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF), // Fundo cinza para destacar o card branco
      body: const Center(
        child: ProductCard(), // Centraliza o card do fone na tela do Chrome
      ),
    );
  }
}

// 2. COMPONENTE DO CARD DE PRODUTO (Baseado na foto do fone)
class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280, // Mantém a largura fixa para o formato vertical perfeito no Chrome
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.08), // Linha de contorno fina
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Envolve o conteúdo sem esticar para cima
        crossAxisAlignment: CrossAxisAlignment.start, // Alinha os textos à esquerda
        children: [
          // A. Fundo cinza da foto do fone
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2F1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(
                Icons.headphones, // Ícone temporário do fone
                size: 90,
                color: Color(0xFF2C3E50),
              ),
            ),
          ),
          
          const SizedBox(height: 16),

          // B. Título
          const Text(
            'Fone de Ouvido',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 8),

          // C. Descrição
          const Text(
            'Fone sem fio com cancelamento de ruído e alta qualidade sonora.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 16),

          // D. Preço
          const Text(
            'R\$ 299,90',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 16),

          // E. Botão Adicionar ao carrinho
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined, size: 18),
              label: const Text(
                'Adicionar ao carrinho',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF239656), // Verde idêntico ao do print
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}