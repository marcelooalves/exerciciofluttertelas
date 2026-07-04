
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos a cor principal azul-turquesa baseada na imagem
    final Color primaryColor = Color(0xFF1E90A4);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Topo com o fundo azul e a foto de perfil
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Positioned(
                  top: 100, // Posiciona a foto metade para dentro e metade para fora do container
                  child: CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 60,
                      // Substitua pela URL da imagem real ou use AssetImage se tiver localmente
                      backgroundImage: AssetImage('assets/imagens/perfil.jpg')
                    ),
                  ),
                ),
              ],
            ),

            // Espaço para compensar o posicionamento da foto
            const SizedBox(height: 60),

            // 2. Nome e E-mail
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Text(
                    'Marcelo Alves',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'marcelo@email.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // 3. Bloco de Estatísticas (Publicações, Seguidores, Seguindo)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem('128', 'Publicações'),
                  _buildStatItem('340', 'Seguidores'),
                  _buildStatItem('512', 'Seguindo'),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 4. Botão Editar Perfil
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SizedBox(
                width: double.infinity, // O botão ocupa toda a largura disponível respeitando o padding
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Ação do botão aqui
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Editar Perfil',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para criar cada item de estatística de forma organizada
  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}