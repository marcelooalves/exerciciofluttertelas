import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoOnboarding());
}

class MeuAplicativoOnboarding extends StatelessWidget {
  const MeuAplicativoOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos o roxo padrão do layout com base nas telas anteriores e na imagem
    const Color purpleColor = Color(0xFF6200EE); 

    return Scaffold(
      backgroundColor: purpleColor, // O fundo geral começa roxo
      body: SafeArea(
        child: Stack(
          children: [
            // -------------------------------------------------------------
            // CAMADA 1: CONTEÚDO SUPERIOR (Fundo Roxo + Imagem do Foguete)
            // -------------------------------------------------------------
            Column(
              children: [
                const SizedBox(height: 40),
                // Contêiner para centralizar e exibir a imagem do foguete da internet
                Center(
                  child: SizedBox(
                    height: 280,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1541185933-ef5d8ed016c2?q=80&w=400', // Imagem conceitual de foguete/espaço funcional
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        // Proteção caso o link falhe
                        return const Icon(Icons.rocket_launch, color: Colors.white, size: 80);
                      },
                    ),
                  ),
                ),
              ],
            ),

            // -------------------------------------------------------------
            // CAMADA 2: CARD BRANCO INFERIOR (Textos + Indicadores + Botão)
            // -------------------------------------------------------------
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                // Define a altura proporcional para o card cobrir a parte de baixo da tela
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),  // Cantos arredondados no topo igual ao print
                    topRight: Radius.circular(32),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribui os blocos verticalmente
                  children: [
                    // Bloco de Textos
                    Column(
                      children: const [
                        Text(
                          'Bem-vindo ao App!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'A melhor experiência\ncomeça aqui.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),

                    // Indicador de Páginas (3 bolinhas na horizontal)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(isActive: true, color: purpleColor), // Bolinha ativa roxa
                        const SizedBox(width: 8),
                        _buildDot(isActive: false, color: purpleColor), // Bolinha inativa clara
                        const SizedBox(width: 8),
                        _buildDot(isActive: false, color: purpleColor), // Bolinha inativa clara
                      ],
                    ),

                    // Botão "Próximo"
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          // Ação do botão
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: purpleColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16), // Bordas arredondadas do botão
                          ),
                        ),
                        child: const Text(
                          'Próximo',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 3. DOCUMENTAÇÃO INTERNA: FUNÇÃO AUXILIAR PARA AS BOLINHAS INDICADORAS
  Widget _buildDot({required bool isActive, required Color color}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // Se a bolinha estiver ativa, usa a cor roxa cheia. Se não, usa um roxo bem clarinho opaco.
        color: isActive ? color : color.withValues(alpha: 0.25),
      ),
    );
  }
}