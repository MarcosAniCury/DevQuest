import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cadastro.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<PaginaLogin> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
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
              Padding(
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
              ),
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
              Padding(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
