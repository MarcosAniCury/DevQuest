import 'package:dev_quest/controller/question_controller.dart';
import 'package:dev_quest/model/permission.dart';
import 'package:flutter/material.dart';
import 'view/about.dart';
import 'view/cadastro.dart';
import 'view/home.dart';
import 'view/home_dev.dart';
import 'view/home_quest.dart';
import 'view/login.dart';
import 'view/language.dart';
import 'view/exercise.dart';

import 'db/database_handler.dart';

import 'controller/user_controller.dart';
import 'controller/language_controller.dart';

import 'model/user.dart';
import 'model/language.dart';
import 'model/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        '/PaginaLanguage': (context) => const PaginaLanguage(),
        '/PaginaExercise': (context) => const PaginaExercise(),
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
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    // this.handler = DatabaseHandler();
    // this.handler.initializeDB().whenComplete(() async {
    //   setState(() {});
    // });
  }

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
                width: 400.0,
                child: Image.asset(
                  'images/devQuest_logo.png',
                  fit: BoxFit.values.first,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                  width: 200.0,
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
                  width: 200.0,
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
