import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'sample_data.dart';


class Moradia {
  String titulo;
  String localizacao;
  DateTime data;
  bool liked = false;
  int numFotos = 1;
  String descricao;

  Moradia(
      this.titulo, this.localizacao, this.data, this.numFotos, this.descricao);
}

class MoradiasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Moradias'),
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
                    builder: (context) => new MoradiasFavoritedPage()),
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
                    builder: (context) => new MoradiaOfertaPage()),
              );
            },
          ),
          new Padding(padding: EdgeInsets.all(10.0))
        ],
      ),
      body: Center(
        child: new Moradias(),
      ),
    );
  }
}

class Moradias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MoradiasState();
  }
}

class MoradiasState extends State<Moradias> {
  @override
  Widget build(BuildContext context) {
    return _buildMoradias();
  }

  Widget _buildMoradias() {
    moradias_sample.sort((moradia1, moradia2) => moradia2.data.compareTo(moradia1.data));
    return new ListView.builder(
        itemCount: moradias_sample.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(moradias_sample[i]);
        });
  }

  Widget _buildRow(Moradia moradia) {
    return new Card(
        child: new ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new MoradiaDetailPage(moradia)),
              );
            },
            leading: new Image(
              image: new AssetImage('assets/placeholder.png'),
              width: 64.0,
            ),
            title: new Text(
              moradia.titulo,
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
                    new Text(moradia.localizacao)
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.date_range, color: Colors.grey),
                    new Text(
                        "${moradia.data.day}/${moradia.data.month}/${moradia
                            .data.year}")
                  ],
                )
              ],
            ),
            trailing: new MoradiaLiked(moradia)));
  }
}

class MoradiaDetailPage extends StatelessWidget {
  Moradia moradia;

  MoradiaDetailPage(this.moradia);

  @override
  Widget build(BuildContext context) {
    var fotoList = List.generate(moradia.numFotos, (i) => i + 1);
    return new Scaffold(
      appBar: new AppBar(
        title: Text(moradia.titulo),
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
              " ${moradia.data.day}/${moradia.data.month}/${moradia.data.year}",
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Icon(Icons.location_on),
            new Text(moradia.localizacao, style: TextStyle(fontSize: 18.0))
          ],
        ),
        new Divider(),
        new Container(
          child: new Text(moradia.descricao, style: TextStyle(fontSize: 18.0)),
          margin: EdgeInsets.all(10.0),
        ),
        new Container(
          child: new  Padding(padding: EdgeInsets.all(30.0)),
        )
      ]),
      floatingActionButton: new FloatingActionButton(
        child: MoradiaLiked(moradia),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}

class MoradiaLiked extends StatefulWidget {
  Moradia moradia;

  MoradiaLiked(this.moradia);

  @override
  State<StatefulWidget> createState() {
    return new MoradiaLikedState(moradia);
  }
}

class MoradiaLikedState extends State<MoradiaLiked> {
  Moradia moradia;

  MoradiaLikedState(this.moradia);

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      icon: new Icon(
        // Add the lines from here...
        moradia.liked ? Icons.favorite : Icons.favorite_border,
        color: moradia.liked ? Colors.red : null,
      ),
      onPressed: () {
        setState(() {
          moradia.liked ? moradia.liked = false : moradia.liked = true;
        });
      },
    );
  }
}

class MoradiaOfertaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MoradiaOfertaState();
  }
}

class MoradiaOfertaState extends State<MoradiaOfertaPage> {
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
        title: Text("Ofertar Moradia"),
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
                      new InputDecoration(labelText: 'Localização da Moradia'),
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
                  child: new  Padding(padding: EdgeInsets.all(60.0)),
                )
              ],
            ),
          )),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              moradias_sample.add(new Moradia(
                  _titulo, _localizacao, _data, _numFotos, _descricao));
              Navigator.pop(context);
            }
            ;
          },
          backgroundColor: Colors.yellow),
    );
  }
}

class MoradiasFavoritedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Moradias Favoritas '),
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
                    builder: (context) => new MoradiaOfertaPage()),
              );
            },
          ),
          new Padding(padding: EdgeInsets.all(10.0))
        ],
      ),
      body: Center(
        child: new MoradiasFavorited(),
      ),
    );
  }
}

class MoradiasFavorited extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MoradiasFavoritedState();
  }
}

class MoradiasFavoritedState extends State<MoradiasFavorited> {
  @override
  Widget build(BuildContext context) {
    return _buildMoradias();
  }

  Widget _buildMoradias() {
    moradias_sample.sort((moradia1, moradia2) => moradia2.data.compareTo(moradia1.data));
    return new ListView.builder(
        itemCount: moradias_sample.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (BuildContext _context, int i) {
          return _buildRow(moradias_sample[i]);
        });
  }

  Widget _buildRow(Moradia moradia) {
    if (moradia.liked) {
      return new Card(
          child: new ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new MoradiaDetailPage(moradia)),
                );
              },
              leading: new Image(
                image: new AssetImage('assets/placeholder.png'),
                width: 64.0,
              ),
              title: new Text(
                moradia.titulo,
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
                      new Text(moradia.localizacao)
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Icon(Icons.date_range, color: Colors.grey),
                      new Text(
                          "${moradia.data.day}/${moradia.data.month}/${moradia
                              .data.year}")
                    ],
                  )
                ],
              ),
              trailing: new MoradiaLiked(moradia)));
    }
    else {
      return new Container();
    }
  }
}
