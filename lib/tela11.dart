import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoNoticias());
}

class MeuAplicativoNoticias extends StatelessWidget {
  const MeuAplicativoNoticias({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsFeedScreen(),
    );
  }
}

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF2979FF); 

    return Scaffold(
      backgroundColor: Colors.white,
      // 1. BARRA SUPERIOR
      appBar: AppBar(
        backgroundColor: blueColor,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Notícias',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
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
      // 2. LISTA DE NOTÍCIAS
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: const [
            NoticiaItemCard(
              categoria: 'Tecnologia',
              titulo: 'Avanços em IA transformam o mundo',
              tempo: '2h atrás',
              imageUrl: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?q=80&w=300',
            ),
            Divider(height: 1, thickness: 0.5),

            NoticiaItemCard(
              categoria: 'Ciência',
              titulo: 'Nova descoberta sobre Marte',
              tempo: '5h atrás',
              imageUrl: 'https://images.unsplash.com/photo-1614728894747-a83421e2b9c9?q=80&w=300',
            ),
            Divider(height: 1, thickness: 0.5),

            // Item 3: Link atualizado e funcional para Esportes
            NoticiaItemCard(
              categoria: 'Esportes',
              titulo: 'Time conquista título importante',
              tempo: '1d atrás',
              imageUrl: 'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?q=80&w=300',
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// COMPONENTE: NOTICIAITEMCARD (Atualizado com Proteção Antierro)
// -------------------------------------------------------------
class NoticiaItemCard extends StatelessWidget {
  final String categoria;
  final String titulo;
  final String tempo;
  final String imageUrl;

  const NoticiaItemCard({
    super.key,
    required this.categoria,
    required this.titulo,
    required this.tempo,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGEM COM PROTEÇÃO CONTRA LINKS QUEBRADOS
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              // O errorBuilder entra em ação se a imagem falhar em carregar
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey.shade200, // Fundo cinza neutro
                  child: const Icon(
                    Icons.broken_image_outlined, // Ícone amigável de imagem quebrada
                    color: Colors.grey,
                    size: 32,
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(width: 16),

          // COLUNA DE TEXTOS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoria,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF37474F),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tempo,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}