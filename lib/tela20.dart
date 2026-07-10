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
    // Tom de roxo atualizado para combinar perfeitamente com a Tela 02
    const Color purpleColor = Color(0xFF6A3DE8); 

    return Scaffold(
      backgroundColor: purpleColor, 
      body: SafeArea(
        child: Stack(
          children: [
            // -------------------------------------------------------------
            // CAMADA 1: Ilustração Centralizada (Foguete)
            // -------------------------------------------------------------
            Column(
              children: [
                const SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    height: 260,
                    // Substituição da foto antiga por uma ilustração integrada
                    child: Image.network(
                      'https://images.unsplash.com/photo-1541185933-ef5d8ed016c2?q=80&w=400', 
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.rocket_launch_rounded, color: Colors.white, size: 90);
                      },
                    ),
                  ),
                ),
              ],
            ),

            // -------------------------------------------------------------
            // CAMADA 2: Painel Branco Inferior de Informações
            // -------------------------------------------------------------
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),  
                    topRight: Radius.circular(32),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [
                    // Textos de Boas-vindas
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

                    // Três bolinhas indicadoras de progresso
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(isActive: true, color: purpleColor), 
                        const SizedBox(width: 8),
                        _buildDot(isActive: false, color: purpleColor), 
                        const SizedBox(width: 8),
                        _buildDot(isActive: false, color: purpleColor), 
                      ],
                    ),

                    // Botão "Próximo" ajustado com margens laterais perfeitas
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purpleColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16), 
                            ),
                          ),
                          child: const Text(
                            'Próximo',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
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

  // 3. DOCUMENTAÇÃO INTERNA: COMPONENTE AUXILIAR PARA CADA BOLINHA DO INDICADOR
  Widget _buildDot({required bool isActive, required Color color}) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? color : color.withValues(alpha: 0.25),
      ),
    );
  }
}