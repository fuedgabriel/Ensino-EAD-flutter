import 'package:flutter/material.dart';
import 'package:imperium/widgets/menu.dart';
class Matter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuWidget(page: 'Home',),
        appBar: AppBar(
          title: Text('Home page'),
        ),
        body: ListView(
            children: <Widget>[

            ]
        )
    );
  }
}
