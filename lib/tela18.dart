import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoChat());
}

class MeuAplicativoChat extends StatelessWidget {
  const MeuAplicativoChat({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color purpleColor = Color(0xFF5E2BBA); // Roxo padrão das telas anteriores
    const Color bgChatColor = Color(0xFFD6E4EF); // Fundo azul claro/cinza do chat igual ao print

    return Scaffold(
      backgroundColor: bgChatColor,
      // 1. CABEÇALHO PERSONALIZADO
      appBar: AppBar(
        backgroundColor: purpleColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          onPressed: () {},
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white24,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=150', // Foto simulando o João Silva
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'João Silva',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  'online',
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.white, size: 24),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      // 2. CORPO DO CHAT (Mensagens + Barra de Digitação)
      body: SafeArea(
        child: Column(
          children: [
            // Área de Mensagens com Rolagem
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: const [
                  BalaoMensagem(
                    texto: 'Olá! Tudo bem?',
                    hora: '10:30',
                    isMe: false, // Recebida (Esquerda, Branca)
                  ),
                  BalaoMensagem(
                    texto: 'Oi João! Tudo ótimo 🤩',
                    hora: '10:31',
                    isMe: true, // Enviada (Direita, Verde)
                  ),
                  BalaoMensagem(
                    texto: 'Vamos almoçar hoje?',
                    hora: '10:32',
                    isMe: false,
                  ),
                  BalaoMensagem(
                    texto: 'Bora! Que horas?',
                    hora: '10:33',
                    isMe: true,
                  ),
                  BalaoMensagem(
                    texto: '12h está bom?',
                    hora: '10:34',
                    isMe: false,
                  ),
                ],
              ),
            ),

            // 3. BARRA DE DIGITAÇÃO INFERIOR
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  // Campo de Entrada Branco
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Digite uma mensagem...',
                          style: TextStyle(color: Colors.black38, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Botão de Enviar Roxo
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: purpleColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// COMPONENTE REUTILIZÁVEL: BALÃO DE MENSAGEM (BalaoMensagem)
// -------------------------------------------------------------
class BalaoMensagem extends StatelessWidget {
  final String texto;
  final String hora;
  final bool isMe;

  const BalaoMensagem({
    super.key,
    required this.texto,
    required this.hora,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    // Cores baseadas exatamente no print do exercício
    final Color corBalao = isMe ? const Color(0xFFDCF8C6) : Colors.white;
    final BorderRadius borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(18),
      topRight: const Radius.circular(18),
      bottomLeft: isMe ? const Radius.circular(18) : const Radius.circular(0),
      bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(18),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: corBalao,
                borderRadius: borderRadius,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    texto,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    hora,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
