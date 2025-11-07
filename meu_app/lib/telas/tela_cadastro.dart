// lib/telas/tela_cadastro.dart

import 'package:flutter/material.dart';

// Não precisamos importar outras telas aqui, pois após o cadastro
// apenas voltaremos para a tela anterior (TelaLogin) usando Navigator.pop.

// === TELA DE CADASTRO ===
class TelaCadastro extends StatelessWidget {
  TelaCadastro({super.key});

  // Controladores simples para coletar o input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: const Text('Criar Conta', style: TextStyle(color: Colors.white)),
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
              const Icon(Icons.person_add, size: 80, color: Colors.blue),
              const SizedBox(height: 30),

              // Campo de Nome
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome Completo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),

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
                  labelText: 'Criar Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 30),

              // Botão de Cadastro
              ElevatedButton(
                onPressed: () {
                  // TODO: Implementar a lógica real de registro (ex: enviar dados para o Firebase)

                  // 1. Volta para a Tela de Login (o pop remove a TelaCadastro da pilha)
                  Navigator.of(context).pop(); 

                  // 2. Mostra uma mensagem de sucesso na tela de Login
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cadastro realizado com sucesso! Faça login.')),
                  );
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}