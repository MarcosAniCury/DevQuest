import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dev_quest/view/custom_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_list_item.dart';

class PaginaExercise extends StatefulWidget {
  const PaginaExercise({Key? key}) : super(key: key);

  @override
  _PaginaExerciseState createState() => _PaginaExerciseState();
}

class _PaginaExerciseState extends State<PaginaExercise> {
  List _exercs = [
    {"titulo": "Hello World!", "descricao": "", "tipo": "", "num_users": 500},
    {"titulo": "Fibonacci", "descricao": "", "tipo": "", "num_users": 10000},
    {"titulo": "Landing Page", "descricao": "", "tipo": "", "num_users": 1300},
    {
      "titulo": "Caixeiro Viajante",
      "descricao": "",
      "tipo": "",
      "num_users": 40000
    },
    {
      "titulo": "Algoritmo de Ordenação",
      "descricao": "",
      "tipo": "",
      "num_users": 500
    }
  ];

  void _carregarItens() {
    _exercs = []; // puxar do banco
    for (int i = 0; i < 5; i++) {
      // i <= _exercs.length
      Map<String, dynamic> exerc = Map();
      exerc["titulo"] = _exercs[i]['titulo']; //PASSIVEL DE MUDAR
      exerc["descricao"] = _exercs[i]['descricao'];
      exerc["tipo"] = _exercs[i]['tipo'];
      exerc["num_users"] = _exercs[i]['num_users'];

      _exercs.add(exerc);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; // Tamanho da tela atual
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      appBar: AppBar(
        title: Text("Exercícios",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w900, color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 0, bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    height: 50,
                    /*decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.5),
                    ),*/
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10, left: 0),
                          child: Column(
                            children: <Widget>[
                              /*Expanded(
                                child: Container(),
                              ),*/
                              TextButton(
                                onPressed: () => {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blueGrey.shade900),
                                ),
                                child: Column(
                                  // Replace with a Row for horizontal icon + text
                                  children: <Widget>[Text("Front-End")],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10, left: 0),
                          child: Column(
                            children: <Widget>[
                              /*Expanded(
                                child: Container(),
                              ),*/
                              TextButton(
                                onPressed: () => {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blueGrey.shade900),
                                ),
                                child: Column(
                                  // Replace with a Row for horizontal icon + text
                                  children: <Widget>[Text("Back-End")],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10, left: 0),
                          child: Column(
                            children: <Widget>[
                              /*Expanded(
                                child: Container(),
                              ),*/
                              TextButton(
                                onPressed: () => {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blueGrey.shade900),
                                ),
                                child: Column(
                                  // Replace with a Row for horizontal icon + text
                                  children: <Widget>[Text("SQL")],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10, left: 0),
                          child: Column(
                            children: <Widget>[
                              /*Expanded(
                                child: Container(),
                              ),*/
                              TextButton(
                                onPressed: () => {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blueGrey.shade900),
                                ),
                                child: Column(
                                  // Replace with a Row for horizontal icon + text
                                  children: <Widget>[Text("Scripts")],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: _exercs.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return CustomListItem(
                          title: _exercs[index]['titulo'],
                          description: _exercs[index]['descricao'],
                          type: _exercs[index]['tipo'],
                          press: () {
                            //print("Clique com onTap ${indice}");
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    title: Text(_exercs[index]["titulo"]),
                                    backgroundColor: Colors.blueGrey.shade300,
                                    titleTextStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    children: [
                                      Text(_exercs[index]["descricao"]),
                                      Text(_exercs[index]["tipo"]),
                                    ],
                                  );
                                });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
