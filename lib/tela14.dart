import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoCadastro());
}

class MeuAplicativoCadastro extends StatelessWidget {
  const MeuAplicativoCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Variável booleana para controlar o estado se o usuário aceitou os termos ou não
  bool _aceitouTermos = false;

  @override
  Widget build(BuildContext context) {
    // Mantendo o mesmo tom de roxo das telas anteriores para consistência visual
    const Color purpleColor = Color(0xFF5E2BBA); 

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA), // Fundo suave do aplicativo
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. TÍTULO PRINCIPAL
                const Text(
                  'Criar Conta',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                
                const SizedBox(height: 24),

                // 2. FORMULÁRIO DE INPUTS
                // Input A: Nome Completo
                _buildInputField(
                  hintText: 'Nome completo',
                  icon: Icons.person_outline,
                ),
                
                const SizedBox(height: 16),

                // Input B: E-mail
                _buildInputField(
                  hintText: 'E-mail',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                
                const SizedBox(height: 16),

                // Input C: Senha
                _buildInputField(
                  hintText: 'Senha',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                
                const SizedBox(height: 16),

                // Input D: Confirmar Senha
                _buildInputField(
                  hintText: 'Confirmar senha',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                
                const SizedBox(height: 20),

                // 3. LINHA DO CHECKBOX (Aceito os termos)
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _aceitouTermos,
                        activeColor: purpleColor, // Deixa o fundo roxo quando marcado igual ao print
                        side: const BorderSide(color: purpleColor, width: 2), // Borda roxa grossa quando desmarcado
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4), // Caixinha levemente arredondada
                        ),
                        onChanged: (bool? valor) {
                          // Modifica o estado e força a tela a se atualizar com a marcação
                          setState(() {
                            _aceitouTermos = valor ?? false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Aceito os termos e condições',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // 4. BOTÃO "CADASTRAR"
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Ação futura de cadastro
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purpleColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

  // 5. DOCUMENTAÇÃO INTERNA: COMPONENTE AUXILIAR REUTILIZÁVEL PARA OS CAMPOS DE TEXTO
  Widget _buildInputField({
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        prefixIcon: Icon(icon, color: Colors.grey.shade600),
        filled: true,
        fillColor: Colors.white, // Fundo branco das caixinhas
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none, // Remove a linha preta padrão de contorno
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade200, width: 1), // Linha cinza bem sutil em volta
        ),
      ),
    );
  }
}