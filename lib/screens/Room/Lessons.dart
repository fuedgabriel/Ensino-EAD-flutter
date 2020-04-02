//widget
import 'package:flutter/material.dart';
import 'package:imperium/widgets/menu.dart';
//request
import 'package:imperium/request/request.dart';
import 'package:imperium/request/json/MatterJson.dart';
//page
import 'package:imperium/screens/Room/Matter.dart';
import 'dart:convert';

class Lessons extends StatefulWidget {
  @override
  _Lessons createState() => _Lessons();
}

class _Lessons extends State<Lessons> {
  var list = new List<MatterJson>();

  _Lessons(){
    API.getMatters().then((response){
      setState(() {
        Iterable lista = json.decode(response.body);
        list = lista.map((model) => MatterJson.fromJson(model)).toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {

//    List<String> state = ['Novas tarefas', 'Concluido', 'Novas tarefas', 'Concluido', 'Concluido', 'Concluido', 'Concluido', 'Novas tarefas', ''];



    return Scaffold(
      drawer: MenuWidget(page: '',),
      appBar: AppBar(
        title: Text('Matérias'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
//          Color cor;
//          if(state[index] == 'Concluido'){
//            cor = Colors.green;
//          }
//          else{
//            cor = Colors.yellowAccent;
//          }

          var listMatters = ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1.0, color: Colors.black26))),
              child: Image.asset('src/image/matters/'+(list[index].id).toString()+'.png'),
            ),
            title: Text(
              list[index].title,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ), 
            subtitle: Container(),
//            subtitle: Row(
//              children: <Widget>[
//                Icon(Icons.linear_scale, color: cor),
//                Text(" "+state[index], style: TextStyle(color: Colors.black))
//              ],
//            ),
            trailing: GestureDetector(
              child: Icon
                (Icons.keyboard_arrow_right,
                  color: Colors.black,
                  size: 30.0),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Matter(list[index].title, list[index].id),
                  ),
                );
              },
            ),
          );
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white60),
              child: listMatters,
            ),
          );
        }
      ),
    );
  }
}
