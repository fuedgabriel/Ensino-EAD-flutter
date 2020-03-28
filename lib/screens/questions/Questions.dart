//widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imperium/widgets/menu.dart';
//request
import 'package:imperium/request/request.dart';
import 'package:imperium/request/json/MatterJson.dart';
import 'dart:convert';
//page
import 'Answers.dart';
import 'AnswersAdd.dart';
class Questions extends StatefulWidget {
  @override
  _Questions createState() => _Questions();
}

class _Questions extends State<Questions> {
  var list = new List<MatterJson>();
  var animes = new List<MatterJson>();



  _Questions(){
    API.getMatters().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        list = lista.map((model) => MatterJson.fromJson(model)).toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      drawer: MenuWidget(page: 'Questions and Answers',),
      appBar: AppBar(
        title: Text('Perguntas e respostas'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 0,),
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (context, index) {

            return Center(
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(4)),
                  Container(
                    width: 130,
                    height: 130,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: ListView(
                        children: <Widget>[
                          Container(
                            height: 90,
                            child: GestureDetector(
                              child: Image(
                                image: AssetImage('src/image/matters/'+(list[index].id).toString()+'.png'),
                                fit: BoxFit.contain,
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Answers(list[index].title, 0)
                                    )
                                );
                              },
                              onLongPress: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AnswersAdd(
                                          list[index].title,
                                          list[index].id
                                        )
                                    )
                                );
                              },
                            ),
                          ),
                          Center(
                            child: Text(
                              list[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
    );
  }
}
