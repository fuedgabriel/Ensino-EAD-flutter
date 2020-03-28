import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imperium/request/request.dart';
import 'package:achievement_view/achievement_view.dart';
class AnswersAdd extends StatefulWidget {
  String Matter;

  int id;
  AnswersAdd(this.Matter, this.id);
  @override
  _AnswersAdd createState() => _AnswersAdd();
}

class _AnswersAdd extends State<AnswersAdd> {
  int id;
  String select = "Selecione a resposta correta";
  TextEditingController _textFieldControllerQuestions = TextEditingController();
  TextEditingController _textFieldControllerAnswerA = TextEditingController();
  TextEditingController _textFieldControllerAnswerB = TextEditingController();
  TextEditingController _textFieldControllerAnswerC = TextEditingController();
  TextEditingController _textFieldControllerAnswerD = TextEditingController();
  TextEditingController _textFieldControllerAnswerE = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Matter),
        elevation: 0
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Card(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                controller: _textFieldControllerQuestions,
                decoration: InputDecoration(
                  hintText: 'Digite sua pergunta: ',
                  hintStyle: TextStyle(
                    color: Colors.black87
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Card(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: _textFieldControllerAnswerA,
                  decoration: InputDecoration(
                    hintText: 'Digite a letra A: ',
                    hintStyle: TextStyle(
                        color: Colors.black87
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Card(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: _textFieldControllerAnswerB,
                  decoration: InputDecoration(
                    hintText: 'Digite a letra B: ',
                    hintStyle: TextStyle(
                        color: Colors.black87
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Card(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: _textFieldControllerAnswerC,
                  decoration: InputDecoration(
                    hintText: 'Digite a letra C: ',
                    hintStyle: TextStyle(
                        color: Colors.black87
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Card(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: _textFieldControllerAnswerD,
                  decoration: InputDecoration(
                    hintText: 'Digite a letra D: ',
                    hintStyle: TextStyle(
                        color: Colors.black87
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Card(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: _textFieldControllerAnswerE,
                  decoration: InputDecoration(
                    hintText: 'Digite a letra E: ',
                    hintStyle: TextStyle(
                        color: Colors.black87
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              )
          ),
          Card(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: ExpansionTile(
              title: Text(select),
              children: <Widget>[
                Divider(),
                ListTile(title: Text('A'),
                  onTap: (){
                  setState(() {
                    select = "A";
                  });
                  id = 1;
                  },),
                Divider(),
                ListTile(title: Text('B'),
                  onTap: (){
                    setState(() {
                      select = "B";
                    });
                    id = 2;
                  },),
                ListTile(title: Text('C'),
                  onTap: (){
                    setState(() {
                      select = "C";
                    });
                    id = 3;
                  },),
                Divider(),
                ListTile(title: Text('D'),
                  onTap: (){
                    setState(() {
                      select = "D";
                    });
                    id = 4;
                  },),
                ListTile(title: Text('E'),
                  onTap: (){
                    setState(() {
                      select = "E";
                    });
                    id = 5;
                  },),

              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 125.0, right: 125, bottom: 10),
            child: FlatButton(
                onPressed: (){
                  if(_textFieldControllerQuestions.text == '' || _textFieldControllerAnswerA.text == '' || _textFieldControllerAnswerB.text == '' || _textFieldControllerAnswerC.text == '' || _textFieldControllerAnswerD.text == '' || _textFieldControllerAnswerE.text == '' || id == null){
                    showGeneralDialog(
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionBuilder: (context, a1, a2, widget) {
                          return Transform.scale(
                            scale: a1.value,
                            child: Opacity(
                              opacity: a1.value,
                              child: AlertDialog(
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Ok"),
                                    onPressed: () async{
                                      Navigator.of(context).pop();
                                    },)],
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0)),
                                title: Text('Existe valores vazíos',
                                  style: TextStyle(
                                    fontSize: 15.6,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        transitionDuration: Duration(milliseconds: 500),
                        barrierDismissible: true,
                        barrierLabel: '',
                        context: context,
                        pageBuilder: (context, animation1, animation2) {var a; return a; });
                  }
                  else{
                    AchievementView(
                      context,
                      title: "Questão enviada!",
                      subTitle: "",
                      icon: Icon(Icons.insert_emoticon, color: Colors.white,),
                      borderRadius: 5.0,
                      color: Colors.green,
                      textStyleTitle: TextStyle(),
                      //textStyleSubTitle: TextStyle(),
                      alignment: Alignment.topCenter,
                      duration: Duration(seconds: 2),
                      isCircle: true,
                    )..show();
                    POST.postcreate(_textFieldControllerQuestions, id, widget.id, _textFieldControllerAnswerA.text, _textFieldControllerAnswerB.text, _textFieldControllerAnswerC.text, _textFieldControllerAnswerD.text, _textFieldControllerAnswerE.text);
                    _textFieldControllerQuestions.clear();
                    _textFieldControllerAnswerE.clear();
                    _textFieldControllerAnswerD.clear();
                    _textFieldControllerAnswerC.clear();
                    _textFieldControllerAnswerB.clear();
                    _textFieldControllerAnswerA.clear();
                    setState(() {
                      select = "Selecione a resposta correta";
                    });

                  }

                },
                child: Row(
                  children: <Widget>[
                    Text('Enviar pergunta ',
                      style: TextStyle(
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Icon(Icons.send)
                  ],
                )
            ),
          )
        ],
      )
    );
  }
}
