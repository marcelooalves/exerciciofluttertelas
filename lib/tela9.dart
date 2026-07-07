import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoMenu());
}

class MeuAplicativoMenu extends StatelessWidget {
  const MeuAplicativoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mantendo a mesma cor roxa das telas anteriores para consistência do projeto
    const Color purpleColor = Color(0xFF5E2BBA); 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: purpleColor,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white, size: 28),
        title: const Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 8),

              // 1. LISTA DE OPÇÕES DO MENU
              // ListTile cria a estrutura perfeita de ícone + texto de forma nativa
              ListTile(
                leading: const Icon(Icons.home_outlined, color: Colors.black87, size: 28),
                title: const Text('Início', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {},
              ),
              const Divider(height: 1),

              ListTile(
                leading: const Icon(Icons.search_outlined, color: Colors.black87, size: 28),
                title: const Text('Explorar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {},
              ),
              const Divider(height: 1),

              ListTile(
                leading: const Icon(Icons.favorite_border_outlined, color: Colors.black87, size: 28),
                title: const Text('Favoritos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {},
              ),
              const Divider(height: 1),

              // Item com o Badge de Notificação Vermelho (Mensagens)
              ListTile(
                leading: const Icon(Icons.chat_bubble_outline, color: Colors.black87, size: 26),
                title: const Text('Mensagens', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                trailing: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE53935), // Vermelho da notificação
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 24,
                    minHeight: 24,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {},
              ),
              const Divider(height: 1),

              ListTile(
                leading: const Icon(Icons.settings_outlined, color: Colors.black87, size: 28),
                title: const Text('Configurações', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {},
              ),
              const Divider(height: 1),

              const Spacer(), // Empurra o botão Sair totalmente para a base

              // 2. BOTÃO "SAIR" NO RODAPÉ
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Ação para deslogar do app
                  },
                  icon: const Icon(Icons.logout, size: 22),
                  label: const Text(
                    'Sair',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
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
}