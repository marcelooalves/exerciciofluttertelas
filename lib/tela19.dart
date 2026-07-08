import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoDashboard());
}

class MeuAplicativoDashboard extends StatelessWidget {
  const MeuAplicativoDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mantendo a paleta de roxos padrão que une o seu projeto integrado
    const Color purpleColor = Color(0xFF5E2BBA); 
    const Color bgGrey = Color(0xFFF8F9FD); // Fundo acinzentado suave para destacar os cards

    return Scaffold(
      backgroundColor: bgGrey,
      // 1. BARRA SUPERIOR
      appBar: AppBar(
        backgroundColor: purpleColor,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white, size: 26),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
        automaticallyImplyLeading: false,
      ),
      // 2. CORPO DO DASHBOARD
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CARD 1: Receita Total
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 6, offset: const Offset(0, 3))],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Receita Total', style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500)),
                        SizedBox(height: 6),
                        Text('R\$ 12.450,00', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 6),
                        Text('▲ 12% vs mês passado', style: TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    // Mini gráfico de barras decorativo na direita do card
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBarraGrafico(height: 15, width: 8, color: purpleColor.withValues(alpha: 0.4)),
                        const SizedBox(width: 4),
                        _buildBarraGrafico(height: 25, width: 8, color: purpleColor.withValues(alpha: 0.6)),
                        const SizedBox(width: 4),
                        _buildBarraGrafico(height: 35, width: 8, color: purpleColor.withValues(alpha: 0.8)),
                        const SizedBox(width: 4),
                        _buildBarraGrafico(height: 45, width: 8, color: purpleColor),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // BLCO DO MEIO: Linha com Pedidos e Clientes Lado a Lado
              Row(
                children: [
                  Expanded(
                    child: _buildMiniCardMetrica(label: 'Pedidos', value: '320'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildMiniCardMetrica(label: 'Clientes', value: '1.120'),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // CARD 3: Vendas nos Últimos 7 Dias (Gráfico Completo)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 6, offset: const Offset(0, 3))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Vendas nos últimos 7 dias',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const SizedBox(height: 32),
                    
                    // Estrutura das Barras do Gráfico
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end, // Garante que as barras cresçam de baixo para cima
                      children: [
                        _buildColunaComDia(dia: 'Seg', alturaBarra: 50, corBarra: purpleColor),
                        _buildColunaComDia(dia: 'Ter', alturaBarra: 75, corBarra: purpleColor),
                        _buildColunaComDia(dia: 'Qua', alturaBarra: 60, corBarra: purpleColor),
                        _buildColunaComDia(dia: 'Qui', alturaBarra: 90, corBarra: purpleColor),
                        _buildColunaComDia(dia: 'Sex', alturaBarra: 95, corBarra: purpleColor),
                        _buildColunaComDia(dia: 'Sáb', alturaBarra: 70, corBarra: purpleColor),
                        _buildColunaComDia(dia: 'Dom', alturaBarra: 98, corBarra: purpleColor),
                      ],
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

  // 3. DOCUMENTAÇÃO INTERNA: COMPONENTE AUXILIAR PARA CRIAR BARRAS SIMPLES
  static Widget _buildBarraGrafico({required double height, required double width, required Color color}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3), // Deixa as pontas das barras suavemente arredondadas igual ao print
      ),
    );
  }

  // 4. DOCUMENTAÇÃO INTERNA: COMPONENTE AUXILIAR PARA OS MINICARDS (Pedidos e Clientes)
  static Widget _buildMiniCardMetrica({required String label, required String value}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 6, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // 5. DOCUMENTAÇÃO INTERNA: COMPONENTE AUXILIAR DA COLUNA DE BARRAS COM LEGENDA (Dia da Semana)
  static Widget _buildColunaComDia({required String dia, required double alturaBarra, required Color corBarra}) {
    return Column(
      children: [
        _buildBarraGrafico(height: alturaBarra, width: 14, color: corBarra),
        const SizedBox(height: 10),
        Text(
          dia,
          style: const TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}