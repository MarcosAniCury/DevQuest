import 'package:flutter/material.dart';

class PaginaHome extends StatefulWidget {
  const PaginaHome({Key? key}) : super(key: key);

  @override
  _PaginaHomeState createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PaginaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: SizedBox(
                    height: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/PaginaHomeQuest');
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      child: Center(
                        child: Text(
                          "Quest",
                          style: TextStyle(fontSize: 80, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: SizedBox(
                    height: 200,
                    child: ElevatedButton(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Em breve'),
                          content: const Text('Em breve disponivel...'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey)),
                      child: Center(
                        child: Text(
                          "Dev",
                          style:
                              TextStyle(fontSize: 80, color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              /*SizedBox(
                width: 300.0,
                child: ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    Navigator.pushNamed(context, '/PaginaQuest');
                  },
                  child: null,
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
