import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoFotos());
}

class MeuAplicativoFotos extends StatelessWidget {
  const MeuAplicativoFotos({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotosGridScreen(),
    );
  }
}

class PhotosGridScreen extends StatelessWidget {
  const PhotosGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mantendo a cor roxa padrão do projeto para consistência visual
    const Color purpleColor = Color(0xFF5E2BBA); 

    return Scaffold(
      backgroundColor: Colors.white,
      // 1. BARRA SUPERIOR (AppBar Roxa)
      appBar: AppBar(
        backgroundColor: purpleColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 26),
          onPressed: () {},
        ),
        title: const Text(
          'Minhas Fotos',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view_sharp, color: Colors.white70, size: 22),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
        automaticallyImplyLeading: false,
      ),
      // 2. GRADE ASSIMÉTRICA COM SCROLL
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // COLUNA DA ESQUERDA
              Expanded(
                child: Column(
                  children: [
                    _buildPhotoCard(
                      imageUrl: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=400', // Montanha
                      height: 200,
                    ),
                    const SizedBox(height: 12),
                    _buildPhotoCard(
                      imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=400', // Coqueiro/Praia alto
                      height: 280,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 12), // Espaçamento horizontal entre as duas colunas
              
              // COLUNA DA DIREITA
              Expanded(
                child: Column(
                  children: [
                    _buildPhotoCard(
                      imageUrl: 'https://images.unsplash.com/photo-1505118380757-91f5f5632de0?q=80&w=400', // Praia longa vertical
                      height: 290,
                    ),
                    const SizedBox(height: 12),
                    _buildPhotoCard(
                      imageUrl: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?q=80&w=400', // Floresta/Vale menor
                      height: 190,
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

  // 3. DOCUMENTAÇÃO INTERNA: FUNÇÃO AUXILIAR PARA CRIAR O CARD DA FOTO
  // Este método centraliza a estilização de bordas arredondadas e o carregamento seguro da imagem.
  Widget _buildPhotoCard({required String imageUrl, required double height}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16), // Aplica as bordas arredondadas do print
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover, // Preenche o contêiner recortando proporcionalmente sem distorcer
        errorBuilder: (context, error, stackTrace) {
          // Plano B caso a internet falhe ou o link quebre
          return Container(
            width: double.infinity,
            height: height,
            color: const Color(0xFFF1F3F5),
            child: const Icon(Icons.broken_image_outlined, color: Colors.grey, size: 32),
          );
        },
      ),
    );
  }
}