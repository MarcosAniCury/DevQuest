import 'package:flutter/material.dart';
import 'Login.dart';

class PaginaCadastro extends StatefulWidget {
  const PaginaCadastro({Key? key}) : super(key: key);

  @override
  _PaginaCadastroState createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 340.0,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                            // hintText: 'Enter your email',
                            labelText: 'Nome de usuário',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            filled: true,
                            fillColor: Colors.white),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Tente outro nome.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        decoration: const InputDecoration(
                            // hintText: 'Enter your email',
                            labelText: 'Email',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            filled: true,
                            fillColor: Colors.white),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Insira um e-mail válido.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        decoration: const InputDecoration(
                            // hintText: 'Enter your email',
                            labelText: 'Senha',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            filled: true,
                            fillColor: Colors.white),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Tente uma senha mais forte.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        decoration: const InputDecoration(
                            // hintText: 'Enter your email',
                            labelText: 'Confirmar senha',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            filled: true,
                            fillColor: Colors.white),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'As senhas diferem.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const Text(
                              'Já possui uma conta?',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, '/PaginaLogin'),
                                child: const Text(
                                  "Faça login aqui.",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                style: null),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Process data.
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
