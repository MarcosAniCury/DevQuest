import 'package:flutter/material.dart';

class PaginaHomeDev extends StatefulWidget {
  const PaginaHomeDev({Key? key}) : super(key: key);

  @override
  _PaginaHomeDevState createState() => _PaginaHomeDevState();
}

class _PaginaHomeDevState extends State<PaginaHomeDev> {
  List _itens = [];

  void _carregarItens() {
    _itens = [];
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Trabalho ${i} cadastrado";
      item["descricao"] = "Descrição da proposta de emprego ${i}";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      appBar: AppBar(
        title: Text("Dev"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice) {
              return ListTile(
                onTap: () {
                  //print("Clique com onTap ${indice}");
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(_itens[indice]["titulo"]),
                          backgroundColor: Colors.blueGrey.shade300,
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          content: Text(_itens[indice]["descricao"]),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                print("Selecionado fechar");
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Fechar",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      });
                },
                onLongPress: () {
                  print("Clique com onLongPress ${indice}");
                },
                title: Text(
                  _itens[indice]["titulo"],
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  _itens[indice]["descricao"],
                  style: TextStyle(color: Colors.white),
                ),
              );
            }),
      ),
    );
  }
}
