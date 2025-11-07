// lib/telas/tela_login.dart

import 'package:flutter/material.dart';
// Importamos a TelaPrincipal e TelaCadastro, que estão no mesmo diretório 'telas/'
import 'tela_principal.dart'; 
import 'tela_cadastro.dart'; 

// === TELA DE LOGIN ===
class TelaLogin extends StatelessWidget {
  TelaLogin({super.key});

  // Controladores para os campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text('Entrar', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // 
              const Icon(Icons.lock_open, size: 80, color: Colors.blue),
              const SizedBox(height: 30),

              // Campo de Email
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de Senha
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 30),

              // Botão de Login
              ElevatedButton(
                onPressed: () {
                  // Após o login bem-sucedido, navega para a TelaPrincipal
                  // pushReplacement: remove a tela de login da pilha para que o usuário não volte
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const TelaPrincipal()),
                  );
                },
                child: const Text('Entrar'),
              ),
              const SizedBox(height: 16),

              // Botão para ir para o Cadastro
              TextButton(
                onPressed: () {
                  // Navega para a TelaCadastro
                  // push: adiciona a tela de cadastro na pilha (o botão Voltar funcionará)
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TelaCadastro()),
                 );
                },
                child: const Text('Não tem conta? Cadastre-se!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}