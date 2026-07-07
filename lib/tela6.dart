import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativoTarefas());
}

class MeuAplicativoTarefas extends StatelessWidget {
  const MeuAplicativoTarefas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListScreen(), // Carrega a tela de tarefas
    );
  }
}

// Usamos StatefulWidget porque a tela precisa mudar o estado quando clicamos nos checkboxes
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // Criamos uma estrutura de dados simples para guardar as tarefas e se estão concluídas ou não
  final List<Map<String, dynamic>> _tarefas = [
    {'titulo': 'Estudar Flutter', 'concluida': true},
    {'titulo': 'Fazer exercícios', 'concluida': false},
    {'titulo': 'Ler livro', 'concluida': false},
    {'titulo': 'Praticar projeto', 'concluida': false},
    {'titulo': 'Descansar', 'concluida': false},
  ];

  @override
  Widget build(BuildContext context) {
    // Código para calcular dinamicamente quantas tarefas estão concluídas
    int concluidas = _tarefas.where((t) => t['concluida'] == true).length;
    int total = _tarefas.length;
    
    // Calcula o progresso para a barra (de 0.0 a 1.0)
    double progresso = total > 0 ? concluidas / total : 0.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Cabeçalho: Título + Botão de Adicionar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Minhas Tarefas',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Ação futura para adicionar tarefas se necessário
                    },
                    icon: const Icon(Icons.add, size: 30, color: Colors.black),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              const Divider(height: 1), // Linha inicial divisória

              // 2. Lista de Tarefas (Construída de forma dinâmica)
              Expanded(
                child: ListView.separated(
                  itemCount: _tarefas.length,
                  separatorBuilder: (context, index) => const Divider(height: 1), // Divisor entre as linhas
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(
                        _tarefas[index]['titulo'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      value: _tarefas[index]['concluida'],
                      controlAffinity: ListTileControlAffinity.leading, // Coloca o Checkbox na ESQUERDA
                      activeColor: Colors.blue, // Cor azul da caixinha marcada idêntica à imagem
                      onChanged: (bool? valor) {
                        // setState diz ao Flutter para redesenhar a tela com as novas informações
                        setState(() {
                          _tarefas[index]['concluida'] = valor ?? false;
                        });
                      },
                      contentPadding: EdgeInsets.zero, // Remove margens internas extras para alinhar com o print
                    );
                  },
                ),
              ),

              const Divider(height: 1), // Linha divisória antes do rodapé
              const SizedBox(height: 24),

              // 3. Rodapé: Texto descritivo do progresso
              Text(
                '$concluidas de $total concluídas',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 12),

              // 4. Barra de Progresso Verde
              ClipRRect(
                borderRadius: BorderRadius.circular(8), // Deixa os cantos da barra arredondados
                child: LinearProgressIndicator(
                  value: progresso, // Valor do progresso calculado dinamicamente
                  minHeight: 10, // Espessura da barra igual à do print
                  backgroundColor: Colors.grey.shade200, // Fundo cinza claro da barra
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green), // Cor verde do preenchimento
                ),
              ),
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}