// main.dart (Refatorado)

import 'package:flutter/material.dart';
// Importa a tela inicial, que agora será o login
import 'telas/tela_login.dart'; 

void main() {
   runApp(const MyApp());
}

// Widget raiz do aplicativo
class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
      return MaterialApp(
         // ... Seu tema e configurações ...
       // A tela inicial AGORA É o Login
         home: TelaLogin(), 
      );
   }
}
// O código da TextAnalyzerScreen DEVE ser removido daqui!