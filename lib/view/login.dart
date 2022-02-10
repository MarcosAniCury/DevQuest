import 'package:dev_quest/controller/user_controller.dart';
import 'package:dev_quest/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<PaginaLogin> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _nextFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final user = {
        'email': _emailController.text,
        'password': _passwordController.text
      };
      //var db = await DatabaseHandler.instance.database;
      if (await UserController.loginValidation(
              _emailController.text, _passwordController.text) !=
          null) {
        _formKey.currentState!.save();
        _formKey.currentState!.reset();
        Navigator.pushNamed(context, '/PaginaHomeQuest');
      } else {}
      //DatabaseHandler.instance.close();
      //   print("Nulo");
    }

    List<User> lu = await UserController.listUsersInserted();
    print(lu);

    try {
      //Navigator.pushNamed(context, '/PaginaHomeQuest');
    } on Exception catch (_) {}
  }

  String? _validateInput(String? value) {
    if (value!.trim().isEmpty || value == null) {
      return 'Valor inválido!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Faça seu login",
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 300.0,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        focusNode: _emailFocusNode,
                        onFieldSubmitted: (String value) {
                          _nextFocus(_passwordFocusNode);
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: "Email",
                          hintStyle:
                              TextStyle(fontSize: 23, color: Colors.white70),
                        ),
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _emailController,
                        validator: _validateInput,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10.0, left: 10.0, bottom: 0.0, right: 10.0),
                    child: SizedBox(
                      width: 300.0,
                      child: TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        focusNode: _passwordFocusNode,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: "Senha",
                          hintStyle:
                              TextStyle(fontSize: 23, color: Colors.white70),
                        ),
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _passwordController,
                        validator: _validateInput,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 270.0,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, left: 10.0, bottom: 0.0, right: 10.0),
                        child: ElevatedButton(
                            onPressed:
                                _submitForm /*() =>
                                Navigator.pushNamed(context, '/PaginaHome')*/
                            ,
                            style: ElevatedButton.styleFrom(
                                elevation: 5.0,
                                padding: EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                primary: Colors.white),
                            child: Text("LOGIN",
                                style: TextStyle(
                                    color: Colors.blueGrey.shade500))),
                      ))
                ]),
              ),
              /*Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 23, color: Colors.white70),
                    ),
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _textEditingController,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, left: 10.0, bottom: 0.0, right: 10.0),
                child: SizedBox(
                  width: 300.0,
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Senha",
                      hintStyle: TextStyle(fontSize: 23, color: Colors.white70),
                    ),
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _textEditingController,
                  ),
                ),
              ),*/
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () =>
                          print("Esqueci minha senha pressionado."),
                      child: Text(
                        "Esqueci minha senha",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/PaginaCadastro'),
                        child: Text(
                          "Não tem conta? Cadastre-se agora",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        style: ButtonStyle()),
                  ],
                ),
              ),
              /*Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: 270.0,
                  child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () =>
                          Navigator.pushNamed(context, '/PaginaHome'),
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      child: Text("LOGIN",
                          style: TextStyle(color: Colors.blueGrey.shade500))),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
