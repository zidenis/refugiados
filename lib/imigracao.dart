import 'package:flutter/material.dart';
import 'sample_data.dart';

class ImigracaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Imigração / Inmigración'),
      ),
      body: Column(children: <Widget>[
        new Imigracao(),
      ]),
    );
  }
}

class Imigracao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new Container(
        color: Colors.blue[900],
        child: new ListView(
          children: <Widget>[
            new ListItem(
              titulo: "Documento CPF",
              descricao: "Documento de identificación del ciudadano",
              imageURL: "https://raw.githubusercontent.com/tallesl/net-Cpf/master/Assets/logo.png",
            ),
            new ListItem(
              titulo: "Carteira de Trabalho",
              descricao: "Obtener un permiso de trabajo",
              imageURL: "https://marcelolacerdablog.files.wordpress.com/2016/12/carteira-de-trabalho-2-300x271.png?w=640",
            ),
            new ListItem(
              titulo: "Autorização de Residência",
              descricao: "Autorización de Residencia para inmigrantes",
              imageURL: "https://publicdomainvectors.org/photos/aiga_immigration.png",
            ),
            new ListItem(
              titulo: "Legislação do Imigrante",
              descricao: "Legislación brasileña y del MERCOSUR para inmigrantes",
              imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaQgFHV7cK8cIEU1U6XjIqmoVqIhVt6MfkZDOkp9aSF6xRLMvi",
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {

  final String titulo;
  final String descricao;
  final String imageURL;

  ListItem({this.titulo, this.descricao, this.imageURL});

  @override
  Widget build(BuildContext context) {
    final thumbnail = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 24.0),
      child: new Hero(
        tag: '$titulo',
        child: new Image(
          image: new NetworkImage(imageURL),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    final info = new Container(
      margin: const EdgeInsets.only(left: 60.0, right: 24.0),
      decoration: new BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 70.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(titulo, style: TextStyle(fontSize: 20.0)),
            new Padding(padding: EdgeInsets.all(2.0)),
            new Text(descricao, style: TextStyle(fontSize: 14.0, color: Colors.black)),
          ],
        ),
      ),
    );

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new CTPSDetailPage(),
          ));
        },
        child: new Stack(
          children: <Widget>[
            info,
            thumbnail,
          ],
        ),
      ),
    );
  }

}


class CTPSDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text("Carteira de Trabalho - CTPS"),
      ),
      body: new ListView(children: [
        new Padding(padding: EdgeInsets.all(10.0)),
        new Divider(height: 3.0,),
        new Text("Como obtener CTPS", textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0)),
        new Divider(height: 3.0,),
        new Container(
          child: new Text(lore1, style: TextStyle(fontSize: 18.0)),
          margin: EdgeInsets.all(20.0),
        ),
        new Container(
          child: new Text(lore2, style: TextStyle(fontSize: 18.0)),
          margin: EdgeInsets.all(20.0),
        ),
        new Divider(height: 3.0,),
        new RaisedButton(onPressed: () {}, child: new Text("Clic aquí para programar su atención", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),),
        new Container(
          child: new  Padding(padding: EdgeInsets.all(30.0)),
        )
      ]),
    );
  }
}