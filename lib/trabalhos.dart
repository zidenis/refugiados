import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'sample_data.dart';


class Trabalho {
  String titulo;
  String localizacao;
  DateTime data;
  bool liked = false;
  int numFotos = 1;
  String descricao;

  Trabalho(
      this.titulo, this.localizacao, this.data, this.numFotos, this.descricao);
}

class TrabalhosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Trabalhos'),
        actions: <Widget>[
          new FloatingActionButton(
            child: Icon(Icons.favorite_border
            ),
            heroTag: "likes",
            elevation: 0.0,
            backgroundColor: Colors.grey,
            mini: true,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new TrabalhosFavoritedPage()),
              );
            },
          ),
          new Padding(padding: EdgeInsets.all(10.0)),
          new FloatingActionButton(
            child: Icon(Icons.add),
            elevation: 0.0,
            backgroundColor: Colors.yellow,
            mini: true,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new TrabalhoOfertaPage()),
              );
            },
          ),
          new Padding(padding: EdgeInsets.all(10.0))
        ],
      ),
      body: Center(
        child: new Trabalhos(),
      ),
    );
  }
}

class Trabalhos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TrabalhosState();
  }
}

class TrabalhosState extends State<Trabalhos> {
  @override
  Widget build(BuildContext context) {
    return _buildTrabalhos();
  }

  Widget _buildTrabalhos() {
    trabalhos_sample.sort((Trabalho1, Trabalho2) => Trabalho2.data.compareTo(Trabalho1.data));
    return new ListView.builder(
        itemCount: trabalhos_sample.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(trabalhos_sample[i]);
        });
  }

  Widget _buildRow(Trabalho Trabalho) {
    return new Card(
        child: new ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new TrabalhoDetailPage(Trabalho)),
              );
            },
            leading: new Image(
              image: new AssetImage('assets/placeholder.png'),
              width: 64.0,
            ),
            title: new Text(
              Trabalho.titulo,
              style: const TextStyle(fontSize: 20.0),
              overflow: TextOverflow.ellipsis,
            ),
            isThreeLine: true,

            //subtitle: ,
            subtitle: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    new Text(Trabalho.localizacao)
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.date_range, color: Colors.grey),
                    new Text(
                        "${Trabalho.data.day}/${Trabalho.data.month}/${Trabalho
                            .data.year}")
                  ],
                )
              ],
            ),
            trailing: new TrabalhoLiked(Trabalho)));
  }
}

class TrabalhoDetailPage extends StatelessWidget {
  Trabalho trabalho;

  TrabalhoDetailPage(this.trabalho);

  @override
  Widget build(BuildContext context) {
    var fotoList = List.generate(trabalho.numFotos, (i) => i + 1);
    return new Scaffold(
      appBar: new AppBar(
        title: Text(trabalho.titulo),
      ),
      body: new ListView(children: [
        new Padding(padding: EdgeInsets.all(10.0)),
        new CarouselSlider(
            items: fotoList.map((i) {
              return new Builder(
                builder: (BuildContext context) {
                  return new Container(
                      width: MediaQuery.of(context).size.width,
                      margin: new EdgeInsets.symmetric(horizontal: 3.0),
                      decoration: new BoxDecoration(color: Colors.grey),
                      child: new Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          new Image(
                            image: new AssetImage('assets/placeholder.png'),
                          ),
                          new Text(
                            "Foto ${i.toString()}",
                            style: TextStyle(fontSize: 28.0),
                          ),
                        ],
                      ));
                },
              );
            }).toList(),
            height: 200.0),
        new Padding(padding: EdgeInsets.all(5.0)),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.date_range),
            new Text(
              " ${trabalho.data.day}/${trabalho.data.month}/${trabalho.data.year}",
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Icon(Icons.location_on),
            new Text(trabalho.localizacao, style: TextStyle(fontSize: 18.0))
          ],
        ),
        new Divider(),
        new Container(
          child: new Text(trabalho.descricao, style: TextStyle(fontSize: 18.0)),
          margin: EdgeInsets.all(10.0),
        ),
        new Container(
          child: new  Padding(padding: EdgeInsets.all(30.0)),
        )
      ]),
      floatingActionButton: new FloatingActionButton(
        child: TrabalhoLiked(trabalho),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}

class TrabalhoLiked extends StatefulWidget {
  Trabalho trabalho;

  TrabalhoLiked(this.trabalho);

  @override
  State<StatefulWidget> createState() {
    return new TrabalhoLikedState(trabalho);
  }
}

class TrabalhoLikedState extends State<TrabalhoLiked> {
  Trabalho trabalho;

  TrabalhoLikedState(this.trabalho);

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      icon: new Icon(
        // Add the lines from here...
        trabalho.liked ? Icons.favorite : Icons.favorite_border,
        color: trabalho.liked ? Colors.red : null,
      ),
      onPressed: () {
        setState(() {
          trabalho.liked ? trabalho.liked = false : trabalho.liked = true;
        });
      },
    );
  }
}

class TrabalhoOfertaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TrabalhoOfertaState();
  }
}

class TrabalhoOfertaState extends State<TrabalhoOfertaPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _titulo;
  String _localizacao;
  DateTime _data = DateTime.now();
  bool _liked = false;
  int _numFotos = 0;
  String _descricao;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Ofertar Trabalho"),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                        height: 70.0,
                        width: 70.0,
                        child: new Padding(
                          padding: new EdgeInsets.all(8.0),
                          child: new RaisedButton(
                            onPressed: () {
                              _numFotos++;
                              setState(() {});
                            },
                            elevation: 6.0,
                            color: Colors.yellow,
                            padding: EdgeInsets.all(10.0),
                            shape: new CircleBorder(),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  size: 32.0,
                                  color: Colors.black,
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        )),
                    _numFotos > 0
                        ? new IconButton(
                        icon: new Icon(Icons.photo, size: 64.0),
                        onPressed: () {
                          _numFotos--;
                          setState(() {});
                        })
                        : new Container(),
                    new Padding(padding: EdgeInsets.all(5.0)),
                    _numFotos > 1
                        ? new IconButton(
                        icon: new Icon(Icons.photo, size: 64.0),
                        onPressed: () {
                          _numFotos--;
                          setState(() {});
                        })
                        : new Container(),
                    new Padding(padding: EdgeInsets.all(5.0)),
                    _numFotos > 2
                        ? new IconButton(
                        icon: new Icon(Icons.photo, size: 64.0),
                        onPressed: () {
                          _numFotos--;
                          setState(() {});
                        })
                        : new Container(),
                    new Padding(padding: EdgeInsets.all(5.0)),
                    _numFotos > 3
                        ? new IconButton(
                        icon: new Icon(Icons.photo, size: 64.0),
                        onPressed: () {
                          _numFotos--;
                          setState(() {});
                        })
                        : new Container(),
                  ],
                ),
                new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration:
                  new InputDecoration(labelText: 'Título do anúncio'),
                  maxLength: 30,
                  onSaved: (str) => _titulo = str,
                  validator: (str) {
                    if (str.length < 4) return "Titulo inválido";
                  },
                ),
                new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration:
                  new InputDecoration(labelText: 'Localização da Trabalho'),
                  maxLength: 30,
                  onSaved: (str) => _localizacao = str,
                  validator: (str) {
                    if (str.length < 4) return "Localização inválida";
                  },
                ),
                new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Descrição'),
                  maxLength: 300,
                  onSaved: (str) => _descricao = str,
                  validator: (str) {
                    if (str.length < 10) return "Descrição inválida";
                  },
                ),
                new Container(
                  child: new  Padding(padding: EdgeInsets.all(30.0)),
                )
              ],
            ),
          )),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              trabalhos_sample.add(new Trabalho(
                  _titulo, _localizacao, _data, _numFotos, _descricao));
              Navigator.pop(context);
            }
            ;
          },
          backgroundColor: Colors.yellow),
    );
  }
}

class TrabalhosFavoritedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Trabalhos Favoritos '),
        actions: <Widget>[
          new FloatingActionButton(
            child: Icon(Icons.favorite, color: Colors.red,
            ),
            heroTag: "likes",
            elevation: 0.0,
            backgroundColor: Colors.grey,
            mini: true,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          new Padding(padding: EdgeInsets.all(10.0)),
          new FloatingActionButton(
            child: Icon(Icons.add),
            elevation: 0.0,
            backgroundColor: Colors.yellow,
            mini: true,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new TrabalhoOfertaPage()),
              );
            },
          ),
          new Padding(padding: EdgeInsets.all(10.0))
        ],
      ),
      body: Center(
        child: new TrabalhosFavorited(),
      ),
    );
  }
}

class TrabalhosFavorited extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TrabalhosFavoritedState();
  }
}

class TrabalhosFavoritedState extends State<TrabalhosFavorited> {
  @override
  Widget build(BuildContext context) {
    return _buildMoradias();
  }

  Widget _buildMoradias() {
    trabalhos_sample.sort((trabalho1, trabalho2) => trabalho2.data.compareTo(trabalho1.data));
    return new ListView.builder(
        itemCount: trabalhos_sample.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(trabalhos_sample[i]);
        });
  }

  Widget _buildRow(Trabalho trabalho) {
    if (trabalho.liked) {
      return new Card(
          child: new ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new TrabalhoDetailPage(trabalho)),
                );
              },
              leading: new Image(
                image: new AssetImage('assets/placeholder.png'),
                width: 64.0,
              ),
              title: new Text(
                trabalho.titulo,
                style: const TextStyle(fontSize: 20.0),
                overflow: TextOverflow.ellipsis,
              ),
              isThreeLine: true,

              //subtitle: ,
              subtitle: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      new Text(trabalho.localizacao)
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Icon(Icons.date_range, color: Colors.grey),
                      new Text(
                          "${trabalho.data.day}/${trabalho.data.month}/${trabalho
                              .data.year}")
                    ],
                  )
                ],
              ),
              trailing: new TrabalhoLiked(trabalho)));
    }
    else {
      return new Container();
    }
  }
}