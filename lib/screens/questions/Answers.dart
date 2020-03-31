//widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:achievement_view/achievement_view.dart';
//request
import 'package:imperium/request/request.dart';
import 'package:imperium/request/json/QuestionsJson.dart';
import 'dart:convert';

// ignore: must_be_immutable, camel_case_types
class answers extends StatefulWidget {
  String matter;
  int id =0;
  answers(this.matter, this.id);
  @override
  _Answers createState() => _Answers();
}
enum SingingCharacter { A, B, C, D, E, F }

class _Answers extends State<answers> {
  int a;
  SingingCharacter _character;
  var list = new List<QuestionsJson>();
  var animes = new List<QuestionsJson>();

  getQuestions() async {
    print(widget.id);
    API.getQuestions(widget.id).then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        list = lista.map((model) => QuestionsJson.fromJson(model)).toList();
      });
    });
  }

  String Questions = 'Quais são os elemtos constitutivos de um Estado?';
  List<String> anwser = ['Clima, Geografia e localização', 'Povo Território e soberania', 'Voto, democracia e cidadania', 'Nação, cultura e idioma', 'Fidelidade, patriotismo, e governo totalitário'];
  @override
  Widget build(BuildContext context) {
    if(a == 1){

    }else{
      a = 1;
      getQuestions();
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor.fromHex('#48006d'),
        elevation: 0,
        title: Text(widget.matter),

      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10, right: 10,left: 10),
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Text(
                      'Questão '+Questions.length.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.blue[700],
                      ),
                    ),
                    Text(
                      'Questão '+Questions.length.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
          Container(
            width: 180,
            child: Center(
              child: Text(
                list[0].title,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            height: 300,
            child: Card(
              elevation: 5,
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Text(list[0].answers[0].s1,
                          style: TextStyle(
                              fontSize: 13
                          ),),
                        leading: Radio(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: SingingCharacter.values[0],
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(list[0].answers[0].s2,
                          style: TextStyle(
                              fontSize: 13
                          ),),
                        leading: Radio(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: SingingCharacter.values[1],
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(list[0].answers[0].s3,
                          style: TextStyle(
                              fontSize: 13
                          ),),
                        leading: Radio(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: SingingCharacter.values[2],
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(list[0].answers[0].s4,
                          style: TextStyle(
                              fontSize: 13
                          ),),
                        leading: Radio(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: SingingCharacter.values[3],
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(list[0].answers[0].s5,
                          style: TextStyle(
                              fontSize: 13
                          ),),
                        leading: Radio(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: SingingCharacter.values[4],
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      )
                    ],
                  )
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
          ),
          RaisedButton(
            padding: EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.blue,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            onPressed: (){
              if((_character.index+1) == list[0].correct){
                AchievementView(
                  context,
                  title: "Parabéns!",
                  subTitle: "A resposta está correta",
                  icon: Icon(Icons.insert_emoticon, color: Colors.white,),
                  borderRadius: 5.0,
                  color: Colors.green,
                  textStyleTitle: TextStyle(),
                  alignment: Alignment.topCenter,
                  duration: Duration(seconds: 2),
                  isCircle: true,
                )..show();
              }
              else{
                AchievementView(
                  context,
                  title: "Poxa não foi dessa vez!",
                  subTitle: "Tente novamente:",
                  icon: Icon(Icons.mood_bad, color: Colors.white,),
                  borderRadius: 5.0,
                  color: Colors.red,
                  textStyleTitle: TextStyle(),
                  alignment: Alignment.topCenter,
                  duration: Duration(seconds: 2),
                  isCircle: true,
                )..show();
              }


            },
            child: Text("Próximo"),
          ),
        ],
      ),
    );
  }
}


extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
