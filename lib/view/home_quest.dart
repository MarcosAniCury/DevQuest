import 'package:dev_quest/view/custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PaginaHomeQuest extends StatefulWidget {
  const PaginaHomeQuest({Key? key}) : super(key: key);

  @override
  _PaginaHomeQuestState createState() => _PaginaHomeQuestState();
}

class _PaginaHomeQuestState extends State<PaginaHomeQuest> {
  String _user_name = "Desenvolvedor";
  int _lvl = 0, _current_xp = 30, _xp_to_pass = 100;

  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; // Tamanho da tela atual
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade400,
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  colorFilter: ColorFilter.mode(
                      Colors.blueGrey.shade400.withOpacity(0.25),
                      BlendMode.dstATop),
                  image: AssetImage("images/devQuest_logoSymbol.png")),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 10,
                      width: 52,
                    ),
                  ),
                  Text("Olá ${_user_name},\nbem-vindo!",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.w900, color: Colors.white)),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Level ${_lvl}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black54)),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("${_current_xp}/${_xp_to_pass}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black54)),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: new LinearPercentIndicator(
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: 0.3,
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.greenAccent,
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .95,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CustomCard(
                            assetSrc: "images/lang.svg",
                            title: "Linguagens",
                            press: () {
                              Navigator.pushNamed(context, '/PaginaLanguage');
                            }),
                        CustomCard(
                            assetSrc: "images/exerc.svg",
                            title: "Exercícios",
                            press: () {
                              Navigator.pushNamed(context, '/PaginaExercise');
                            }),
                        CustomCard(
                            assetSrc: "images/trabalho-feito.svg",
                            title: "Exercícios Resolvidos",
                            press: () {}),
                        CustomCard(
                            assetSrc: "images/leaderboard.svg",
                            title: "Leaderboard",
                            press: () {}),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
