// lib/telas/tela_principal.dart (CORRIGIDO)

import 'package:flutter/material.dart';

// === TELA PRINCIPAL E DE RESULTADOS ===
// Renomeamos TextAnalyzerScreen para TelaPrincipal
class TelaPrincipal extends StatefulWidget { 
   const TelaPrincipal({super.key});

   @override
   // O Estado agora é _TelaPrincipalState
   State<TelaPrincipal> createState() => _TelaPrincipalState(); 
}

// O estado do Widget é agora _TelaPrincipalState
class _TelaPrincipalState extends State<TelaPrincipal> {
   final TextEditingController _controller = TextEditingController();

   // Variável de estado para armazenar os resultados da análise
   Map<String, dynamic>? _analysisResults;

   @override
   void dispose() {
      _controller.dispose();
      super.dispose();
   }

   // Lista de palavras de ligação (stopwords)
   static const List<String> _stopwords = [
      'a', 'o', 'que', 'de', 'para', 'com', 'sem', 'mas', 'e', 'ou', 'entre',
      'em', 'por', 'da', 'do', 'na', 'no', 'as', 'os', 'um', 'uma', 'uns', 'umas',
      'do', 'da', 'dos', 'das', 'pelo', 'pela', 'pelos', 'pelas', 'ao', 'aos',
      'à', 'às', 'é', 'está', 'ser', 'estar', 'ter', 'haver',
   ];

   // Todas as suas funções (_getWordFrequency, _countCharactersWithoutSpaces, etc.)
  //... [Suas funções de análise permanecem aqui] ...

  // Função para contar a frequência das palavras (Movida para o State)
  Map<String, int> _getWordFrequency(String text) {
    final cleanedText = text.toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '');
    final words = cleanedText.split(RegExp(r'\s+'));
    final Map<String, int> frequencyMap = <String, int>{};
    for (var word in words) {
      if (word.isNotEmpty && !_stopwords.contains(word)) {
        frequencyMap[word] = (frequencyMap[word] ?? 0) + 1;
      }
    }
    return frequencyMap;
  }
  
  // Função unificada para realizar a análise e atualizar o estado
  void _analyzeText() {
    // ... (Sua lógica de _analyzeText) ...
    // Note que _countCharactersWithoutSpaces e _countSentences precisam estar aqui ou serem redefinidas/chamadas.
  }
  
  void _clearTextConfirmed() {
    // ... (Sua lógica de _clearTextConfirmed) ...
  }
  
  void _showClearConfirmationDialog() {
    // ... (Sua lógica de _showClearConfirmationDialog) ...
  }
  
  Widget _buildStatItem(String label, String value) {
    // ... (Sua lógica de _buildStatItem) ...
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(value, style: const TextStyle(fontSize: 16)),
            ],
        ),
    );
  }
  
  Widget _buildResultsPanel() {
      // ... (Sua lógica de _buildResultsPanel) ...
      return const Text('Implementação do painel de resultados...');
  }
  

   @override
   Widget build(BuildContext context) {
      return Scaffold( // <--- Uma tela interna retorna Scaffold, não MaterialApp!
         appBar: AppBar(
            title: const Text(
               "Analisador de Texto",
               style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
               ),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
         ),
         body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
               children: <Widget>[
                  // Área de Entrada de Texto (Fixo)
                  Expanded(
                     flex: 1, 
                     child: TextField(
                        controller: _controller,
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                           border: OutlineInputBorder(),
                           hintText: "Digite ou cole seu texto aqui...",
                           alignLabelWithHint: true,
                        ),
                     ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Botões (Fixo)
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                        Expanded(
                           child: ElevatedButton(
                              onPressed: _analyzeText,
                              child: const Text("Analisar"),
                           ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                           child: ElevatedButton(
                              onPressed: _showClearConfirmationDialog, 
                              style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.redAccent,
                              ),
                              child: const Text("Limpar"),
                           ),
                        ),
                     ],
                  ),
                  const SizedBox(height: 10),

                  // Área de Resultados (Expansível e com Scroll)
                  Expanded(
                     flex: 2, 
                     child: SingleChildScrollView(
                        child: _buildResultsPanel(),
                     ),
                  ),
               ],
            ),
         ),
         bottomNavigationBar: Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: const Text(
               '© 2025 Guilherme França - Todos os direitos reservados.',
               style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
               ),
             textAlign: TextAlign.center,
            ),
         ),
   );
   }
}