import 'package:flutter/material.dart';

import 'moradias.dart';
import 'trabalhos.dart';
import 'conversar.dart';
import 'instituicoes.dart';
import 'noticias.dart';
import 'imigracao.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Refugiados',
      theme: new ThemeData(
          primarySwatch: Colors.grey, backgroundColor: Colors.blue),
      home: new MyHomePage(title: 'Refugiados'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(color: Colors.white),
        child: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new Container(
                decoration: new BoxDecoration(color: Colors.yellow),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new HomeButton(Icons.hotel, "Moradias", "Viviendas",
                          Colors.grey, Colors.yellow, MoradiasPage()),
                      new HomeButton(Icons.work, "Trabalhos", "Trabajos",
                          Colors.grey, Colors.yellow, TrabalhosPage()),
                    ]),
              ),
            ),
            new Expanded(
              child: new Container(
                decoration: new BoxDecoration(color: Colors.blue[900]),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new HomeButton(
                        Icons.business,
                        "Instituições",
                        "Instituciones",
                        Colors.grey,
                        Colors.blue[900],
                        InstituicoesPage()),
                    new HomeButton(Icons.gavel, "Imigração", "Inmigración",
                        Colors.grey, Colors.blue[900], ImigracaoPage()),
                  ],
                ),
              ),
            ),
            new Expanded(
              child: new Container(
                decoration: new BoxDecoration(color: Colors.red[800]),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new HomeButton(
                        Icons.developer_board,
                        "Notícias",
                        "Noticias",
                        Colors.grey,
                        Colors.red[800],
                        NoticiasPage()),
                    new HomeButton(Icons.chat, "Conversar", "Hablar",
                        Colors.grey, Colors.red[800], ConversarPage()),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}

class HomeButton extends StatelessWidget {
  final IconData icon;
  final String label_pt;
  final String label_es;
  final Color bgColor;
  final Color fgColor;
  final StatelessWidget page;

  const HomeButton(
    this.icon,
    this.label_pt,
    this.label_es,
    this.bgColor,
    this.fgColor,
    this.page, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 160.0,
        width: 160.0,
        child: new Padding(
          padding: new EdgeInsets.all(8.0),
          child: new RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            elevation: 10.0,
            color: bgColor,
            padding: EdgeInsets.all(10.0),
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: <Widget>[
                Icon(
                  icon,
                  size: 64.0,
                  color: fgColor,
                ),
                Text(label_pt,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black)),
                Text(label_es,
                    style: new TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                        color: Colors.black))
              ],
            ),
          ),
        ));
  }
}
