import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}

class NoticiasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Notícias'),
        ),
        body: Center(
          child: ListView(children: <Widget>[
            new Column(children: <Widget>[
              new Padding(padding: EdgeInsets.all(10.0)),
              new Noticia(
                imgURL: 'https://evtvmiami.com/wp-content/uploads/2018/06/frontera-brasilx43795-800x445.jpg',
                title: 'Venezolanos en Brasil cuentan con un refugio en Paracaima',
                datetime: '28 julio 2018',
                source: 'EvTV',
                sourceURL: 'https://evtvmiami.com/venezolanos-en-brasil-cuentan-con-un-refugio-en-paracaima/',
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new Noticia(
                imgURL: 'https://i2.wp.com/venexradio.com/wp-content/uploads/2018/07/venezolanos_en_brazil.jpg?fit=996%2C560&ssl=1',
                title: 'Pedidos de refugio de venezolanos en Brasil se duplicaron en seis meses',
                datetime: '17 julio 2018',
                source: 'VeneXRadio',
                sourceURL: 'https://venexradio.com/2018/07/17/pedidos-de-refugio-de-venezolanos-en-brasil-se-duplicaron-en-seis-meses/',
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new Noticia(
                imgURL: 'http://talcualdigital.com/wp-content/uploads/2018/06/1-35.jpg',
                title: 'Más de 16 mil venezolanos pidieron refugio en Brasil en primer semestre de 2018',
                datetime: '11 julio 2018',
                source: 'TalCual',
                sourceURL: 'http://talcualdigital.com/index.php/2018/07/11/mas-de-16-mil-venezolanos-pidieron-refugio-en-brasil-el-primer-semestre-de-2018/',
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new Noticia(
                imgURL: 'https://endimages.s3.amazonaws.com/cache/40/0b/400bf046df0b3ed159993b047ae77608.jpg',
                title: 'Casi 17.000 venezolanos pidieron refugio en Brasil durante primer semestre',
                datetime: '11 julio 2018',
                source: 'El Nuevo Diario',
                sourceURL: 'https://www.elnuevodiario.com.ni/internacionales/469340-venezolanos-piden-refugio-brasil/',
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new Noticia(
                imgURL: 'http://en-cdnmed.agilecontent.com//resources/jpg/9/7/1530060681379.jpg',
                title: '164 venezolanos serán trasladados a tres ciudades de Brasil',
                datetime: '2 Julio 2018',
                source: 'El Nacional',
                sourceURL: 'http://www.el-nacional.com/noticias/latinoamerica/164-venezolanos-seran-trasladados-tres-ciudades-brasil_242402',
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
            ])
            ])
          ),
        );
  }
}

class Noticia extends StatelessWidget {

  String imgURL;
  String title;
  String datetime;
  String source;
  String sourceURL;

  Noticia({this.imgURL, this.title, this.datetime, this.source, this.sourceURL});

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new Padding(padding: EdgeInsets.all(10.0)),
      new Expanded(child:
          new Column(children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                image: new DecorationImage(
                  image: new AdvancedNetworkImage(imgURL),
                  fit: BoxFit.cover
                ),
              ),
              child: new Container(
                height: 130.0,
              )
            ),
            new Padding(padding: EdgeInsets.all(1.0)),
            new Row(children: <Widget>[
              new Text(source, style: TextStyle(fontSize: 16.0, color: Colors.grey),),
              new Padding(padding: EdgeInsets.all(10.0)),
              new Text(datetime, style: TextStyle(fontSize: 16.0, color: Colors.grey),)
            ],),
            new Padding(padding: EdgeInsets.all(1.0)),
            new RaisedButton(
              elevation: 0.0,
              padding: EdgeInsets.all(0.0),
              color: Colors.white,
              onPressed: () => _launchURL(sourceURL),
              child: new Text(title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            )
    ])
    ),
    new Padding(padding: EdgeInsets.all(10.0)),
    ]);
  }
}