import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoCatalogo());
}

class MeuAplicativoCatalogo extends StatelessWidget {
  const MeuAplicativoCatalogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF2979FF); // Mantendo o azul oficial do feed de notícias

    // Lista contendo os dados dos produtos que aparecem na imagem
    final List<Map<String, String>> produtos = [
      {
        'nome': 'Tênis',
        'preco': 'R\$ 199,90',
        'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=300',
      },
      {
        'nome': 'Mochila',
        'preco': 'R\$ 129,90',
        'image': 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=300',
      },
      {
        'nome': 'Relógio',
        'preco': 'R\$ 259,90',
        'image': 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=300',
      },
      {
        'nome': 'Óculos',
        'preco': 'R\$ 89,90',
        'image': 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?q=80&w=300',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Fundo levemente off-white para destacar os cards
      // 1. BARRA SUPERIOR
      appBar: AppBar(
        backgroundColor: blueColor,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white, size: 26),
        title: const Text(
          'Catálogo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 26),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
        automaticallyImplyLeading: false,
      ),
      // 2. GRADE DE PRODUTOS
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: produtos.length,
          // SliverGridDelegateWithFixedCrossAxisCount define as colunas e proporções da grade
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Define estritamente 2 colunas
            crossAxisSpacing: 16, // Espaçamento horizontal entre os cards
            mainAxisSpacing: 16, // Espaçamento vertical entre os cards
            childAspectRatio: 0.78, // Proporção de largura/altura para o card caber perfeitamente
          ),
          itemBuilder: (context, index) {
            final produto = produtos[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // A. Fundo cinza com a imagem do produto
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F3F5), // Fundo acinzentado do produto
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            produto['image']!,
                            fit: BoxFit.contain, // Garante que o produto apareça inteiro centralizado
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image_outlined, color: Colors.grey, size: 32);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // B. Nome do Produto
                    Text(
                      produto['nome']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // C. Preço do Produto
                    Text(
                      produto['preco']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}