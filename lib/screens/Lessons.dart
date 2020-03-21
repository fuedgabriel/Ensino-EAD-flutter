import 'package:flutter/material.dart';
import 'package:imperium/widgets/menu.dart';
import 'package:imperium/screens/Matter.dart';
class Lessons extends StatefulWidget {
  @override
  _Lessons createState() => _Lessons();
}

class _Lessons extends State<Lessons> {


  final makeListTileBiologia = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.black26))),
        child: Image.asset('src/image/biologia.png'),
      ),
      title: Text(
        "Biologia",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.green),
          Text(" Concluido", style: TextStyle(color: Colors.black87))
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0)
  );

  final makeListTilePortugues = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.black26))),
        child: Image.asset('src/image/portugues.png'),
      ),
      title: Text(
        "Portugues",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.green),
          Text(" Concluido", style: TextStyle(color: Colors.black87))
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0)
  );

  final makeListTileMedicina = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.black26))),
        child: Image.asset('src/image/medicina.png'),
      ),
      title: Text(
        "Medicina",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.green),
          Text(" Concluido", style: TextStyle(color: Colors.black87))
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0)
  );

  final makeListTileRedacao = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.black26))),
        child: Image.asset('src/image/redacao.png'),
      ),
      title: Text(
        "Redação",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.yellowAccent),
          Text(" Novas tarefas", style: TextStyle(color: Colors.black))
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0)
  );

  final makeListTileMatematica = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.black26))),
        child: Image.asset('src/image/matematica.png'),
      ),
      title: Text(
        "Matemática",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.green),
          Text(" Concluido", style: TextStyle(color: Colors.black87))
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0)
  );

  final makeListTileFisica = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.black26))),
        child: Image.asset('src/image/fisica.png'),
      ),
      title: Text(
        "Física",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.green),
          Text(" Concluido", style: TextStyle(color: Colors.black87))
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0)
  );


  @override
  Widget build(BuildContext context) {
    var makeListTile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.black26))),
        child: Image.asset('src/image/socrates.png'),
      ),
      title: Text(
        "Filosofia",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Icon(Icons.linear_scale, color: Colors.yellowAccent),
          Text(" Novas tarefas", style: TextStyle(color: Colors.black))
        ],
      ),
      trailing: GestureDetector(child: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Matter(),
            ),
          );
        },),
    );
    return Scaffold(
      drawer: MenuWidget(page: 'nada',),
      appBar: AppBar(
        title: Text('Matérias'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white60),
              child: makeListTile,
            ),
          ),
          Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white60),
              child: makeListTilePortugues,
            ),
          ),
          Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white60),
              child: makeListTileRedacao,
            ),
          ),
          Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white60),
              child: makeListTileMedicina,
            ),
          ),
          Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white60),
              child: makeListTileBiologia,
            ),
          ),
          Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white60),
              child: makeListTileMatematica,
            ),
          ),
          Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white60),
              child: makeListTileFisica,
            ),
          ),
        ],
      ),
    );
  }
}
