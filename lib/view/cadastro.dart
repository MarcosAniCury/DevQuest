import 'package:dev_quest/controller/user_controller.dart';
import 'package:dev_quest/model/user.dart';
import 'package:flutter/material.dart';

enum Difficults { easy, medium, hard }

class PaginaCadastro extends StatefulWidget {
  const PaginaCadastro({Key? key}) : super(key: key);

  @override
  _PaginaCadastroState createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
  Difficults? _difficult = Difficults.easy;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _responseController = TextEditingController();

  int difficult_option = 0;

  Future<bool> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final user = User(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          difficult: difficult_option,
          permission: 1);

      //print(user.toString());
      addUser(user);
      _formKey.currentState!.save();
      _formKey.currentState!.reset();
      //Navigator.pushNamed(context, '/PaginaHomeQuest');
      // if (await UserController.emailValidation(_emailController.text)) {
      //
      //   _formKey.currentState!.save();
      //   _formKey.currentState!.reset();
      //   Navigator.pushNamed(context, '/PaginaHomeQuest');
      //   return true;
      // }
    }

    Navigator.pushNamed(context, '/PaginaLogin');
    return false;
  }

  String? _validateInput(String? value) {
    if (value!.trim().isEmpty || value == null) {
      return 'Valor inválido!';
    }
    return null;
  }

  Future addUser(User user) async {
    await UserController.createUser(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
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
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            // hintText: 'Enter your email',
                            labelText: 'Nome de usuário',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            filled: true,
                            fillColor: Colors.white),
                        keyboardType: TextInputType.text,
                        controller: _nameController,
                        validator: _validateInput,
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        decoration: const InputDecoration(
                            // hintText: 'Enter your email',
                            labelText: 'Email',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            filled: true,
                            fillColor: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: _validateInput,
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            // hintText: 'Enter your email',
                            labelText: 'Senha',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            filled: true,
                            fillColor: Colors.white),
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        validator: _validateInput,
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            // hintText: 'Enter your email',
                            labelText: 'Confirmar senha',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            filled: true,
                            fillColor: Colors.white),
                        keyboardType: TextInputType.visiblePassword,
                        controller: _confirmPasswordController,
                        validator: _validateInput,
                      ),
                      const SizedBox(height: 5.0),
                      ListTile(
                          title: Text("Nível de experiência:",
                              style: TextStyle(color: Colors.white))),
                      RadioListTile<Difficults>(
                        title: const Text('Iniciante',
                            style: TextStyle(color: Colors.white)),
                        value: Difficults.easy,
                        groupValue: _difficult,
                        onChanged: (Difficults? value) {
                          difficult_option = 0;
                          setState(() {
                            _difficult = value;
                          });
                        },
                      ),
                      const SizedBox(height: 5.0),
                      RadioListTile<Difficults>(
                        title: const Text('Júnior',
                            style: TextStyle(color: Colors.white)),
                        value: Difficults.medium,
                        groupValue: _difficult,
                        onChanged: (Difficults? value) {
                          difficult_option = 1;
                          setState(() {
                            _difficult = value;
                          });
                        },
                      ),
                      const SizedBox(height: 5.0),
                      RadioListTile<Difficults>(
                        title: const Text('Sênior',
                            style: TextStyle(color: Colors.white)),
                        value: Difficults.hard,
                        groupValue: _difficult,
                        onChanged: (Difficults? value) {
                          difficult_option = 2;
                          setState(() {
                            _difficult = value;
                          });
                        },
                      ),
                      const SizedBox(height: 5.0),
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _submitForm();
                                  }
                                },
                                child: const Text('Cadastrar'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Process data.
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),*/
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
