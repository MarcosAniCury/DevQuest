import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaAbout extends StatefulWidget {
  const PaginaAbout({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<PaginaAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(backgroundColor: Colors.blueGrey.shade900),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 130,
                  height: 100,
                  child: Image.asset("images/logo.png"),
                ),
                Text(
                  "DevQuest, v0.0.1/2021",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 300,
              child: Text(
                "Feito por Bernardo Temponi, Danniel Vieira, Letícia Americano, Marcos Ani",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: SizedBox(
                width: 300,
                child: Text(
                  "Feito com Flutter, Dart e AndroidStudio",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
