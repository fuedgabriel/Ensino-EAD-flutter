//request
import 'package:flutter/cupertino.dart';
import 'package:imperium/request/request.dart';
import 'package:imperium/request/json/Documents.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
//page
//widget
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Matter extends StatefulWidget {
  String title;
  int id;
  Matter(this.title, this.id);
  @override
  _MatterState createState() => _MatterState();
}

class _MatterState extends State<Matter> {
  var img;
  var list = List<Documents>();
  _MatterState(){
    getDocument();
  }

  getDocument() async {
    Future.delayed(const Duration(milliseconds: 400), () {
      API.getDocuments(widget.id).then((response){
        setState(() {
          Iterable lista = json.decode(response.body);
          list = lista.map((model) => Documents.fromJson(model)).toList();
        });
      });
    });
  }


  TextEditingController _textFieldController = TextEditingController();


  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: Colors.deepPurple),
              gapPadding: 5
            ),
            elevation: 10,
            title: Text('Digite sua dúvida'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                hintText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              showCursor: true,
              enableSuggestions: true,
              autocorrect: true,

            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Enviar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Voltar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              if(list[index].type == 'Youtube'){
                img = AssetImage('assets/youtube-icon.png');
              }else if(list[index].type == 'PDF'){
                img = AssetImage('assets/pdf-icon.png');
              } else{
                img = NetworkImage(list[index].image);
              }
              return Card(
                margin: EdgeInsets.only(top: 6, left: 6, right: 6),
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding:EdgeInsets.all(2),
                          child: Text(list[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              height: 80,
                              width: 250,
                              child: Text(
                                  list[index].description
                              )
                            ),
                            GestureDetector(
                              child: Image(
                                width:  MediaQuery.of(context).size.width * 0.25,
                                height:  MediaQuery.of(context).size.width * 0.2,
                                image: img,
                              ),
                              onTap: (){
                                _launchURL(list[index].link);
                              },
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              );
            })
    );
  }
}