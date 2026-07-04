import 'package:exerciciofluttertelas/exercicio1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Fundo da tela ligeiramente cinza para destacar o card branco
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 240, // Define uma largura fixa proporcional à imagem do card
            padding: const EdgeInsets.all(16.0), // Espaço interno entre a borda do card e o conteúdo
            decoration: BoxDecoration(
              color: Colors.white, // Fundo branco do card
              borderRadius: BorderRadius.circular(20), // Bordas bem arredondadas como no print
              border: Border.all(
                color: Colors.grey.shade300, // Linha de contorno sutil externa
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Faz o card se ajustar ao tamanho do conteúdo interno
              crossAxisAlignment: CrossAxisAlignment.start, // Alinha os textos à esquerda
              children: [
                // 1. Área da Imagem com fundo cinza claro
                Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0), // Cor de fundo cinza da foto
                    borderRadius: BorderRadius.circular(12), // Bordas arredondadas do fundo da foto
                  ),
                  child: const Image(
                    image: AssetImage('assets/imagens/fone_de_ouvido.jpg'), // Substitua pelo caminho correto da imagem
                    fit: BoxFit.cover,
                  ),
                ),
                
                const SizedBox(height: 16), // Espaçamento abaixo da imagem

                // 2. Título do Produto
                const Text(
                  'Fone de Ouvido',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 8), // Espaçamento abaixo do título

                // 3. Descrição do Produto
                const Text(
                  'Fone sem fio com cancelamento de ruído e alta qualidade sonora.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54, // Cor preta suavizada (cinza escuro)
                    height: 1.3, // Altura da linha para não amassar o texto
                  ),
                ),

                const SizedBox(height: 16), // Espaçamento abaixo da descrição

                // 4. Preço do Produto
                const Text(
                  'R\$ 299,90',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 16), // Espaçamento abaixo do preço

                // 5. Botão "Adicionar ao carrinho" com ícone
                SizedBox(
                  width: double.infinity, // Faz o botão ocupar toda a largura interna do card
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Ação ao clicar no botão de compra
                    },
                    icon: const Icon(Icons.shopping_cart_outlined, size: 20), // Ícone do carrinho
                    label: const Text(
                      'Adicionar ao carrinho',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32), // Verde igual ao do botão anterior
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Bordas do botão
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}