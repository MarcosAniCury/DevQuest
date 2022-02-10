import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dev_quest/view/custom_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_list_item.dart';

class PaginaLanguage extends StatefulWidget {
  const PaginaLanguage({Key? key}) : super(key: key);

  @override
  _PaginaLanguageState createState() => _PaginaLanguageState();
}

class _PaginaLanguageState extends State<PaginaLanguage> {
  List _langs = [
    {"titulo": "Java", "descricao": "", "tipo": "", "num_users": 500},
    {"titulo": "C", "descricao": "", "tipo": "", "num_users": 10000},
    {"titulo": "Python", "descricao": "", "tipo": "", "num_users": 1300},
    {"titulo": "HTML", "descricao": "", "tipo": "", "num_users": 40000},
    {"titulo": "PHP", "descricao": "", "tipo": "", "num_users": 500}
  ];

  void _carregarItens() {
    _langs = []; // puxar do banco
    for (int i = 0; i < 5; i++) {
      // i <= _langs.length
      Map<String, dynamic> lang = Map();
      lang["titulo"] = _langs[i]['titulo']; //PASSIVEL DE MUDAR
      lang["descricao"] = _langs[i]['descricao'];
      lang["tipo"] = _langs[i]['tipo'];
      lang["num_users"] = _langs[i]['num_users'];

      _langs.add(lang);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; // Tamanho da tela atual
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      appBar: AppBar(
        title: Text("Linguagens",
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
                      itemCount: _langs.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return CustomListItem(
                          title: _langs[index]['titulo'],
                          description: _langs[index]['descricao'],
                          type: _langs[index]['tipo'],
                          press: () {
                            //print("Clique com onTap ${indice}");
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    title: Text(_langs[index]["titulo"]),
                                    backgroundColor: Colors.blueGrey.shade300,
                                    titleTextStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    children: [
                                      Text(_langs[index]["descricao"]),
                                      Text(_langs[index]["tipo"]),
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
