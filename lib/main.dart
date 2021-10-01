import 'package:flutter/material.dart';
import 'paginas/Login.dart';
import 'paginas/About.dart';
import 'paginas/Home.dart';
import 'paginas/HomeDev.dart';
import 'paginas/HomeQuest.dart';

import 'paginas/cadastro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Quest',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'DevQuest'),

      // Manejo de rotas
      initialRoute: '/',
      routes: {
        '/PaginaCadastro': (context) => const PaginaCadastro(),
        '/PaginaAbout': (context) => const PaginaAbout(),
        '/PaginaLogin': (context) => const PaginaLogin(),
        '/PaginaHome': (context) => const PaginaHome(),
        '/PaginaHomeDev': (context) => const PaginaHomeDev(),
        '/PaginaHomeQuest': (context) => const PaginaHomeQuest(),
        '/PaginaAbout': (context) => const PaginaAbout(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: SafeArea(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300.0,
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.values.first,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                  width: 250.0,
                  child: ElevatedButton(
                    style: null,
                    onPressed: () {
                      Navigator.pushNamed(context, '/PaginaLogin');
                    },
                    child: const Text('Login'),
                  )),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                  width: 250.0,
                  child: ElevatedButton(
                    style: null,
                    onPressed: () {
                      Navigator.pushNamed(context, '/PaginaCadastro');
                    },
                    child: const Text('Cadastro'),
                  )),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                  width: 100.0,
                  child: ElevatedButton(
                    style: null,
                    onPressed: () {
                      Navigator.pushNamed(context, '/PaginaAbout');
                    },
                    child: const Text('Sobre'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
