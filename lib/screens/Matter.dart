import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Matter extends StatefulWidget {
  @override
  _MatterState createState() => _MatterState();
}

class _MatterState extends State<Matter> {
  List<String> title = ['A apologia de sócrates', 'A morte', 'aveado'];
  List<String> description = ['Documentário representado a morte de sócrates', 'O que a morte de sócrates ocasionou', 'Tú é né'];

  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      const url = 'http://docs.google.com/viewer?url=http://www.pdf995.com/samples/pdf.pdf';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Sala de aula'),
        ),
        body: ListView.builder(
            itemCount: title.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(title[index]),
                background: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    title.removeAt(index);
                  });
                  },
                direction: DismissDirection.endToStart,
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 100.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(title[index],),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                  child: Container(
                                    width: 260,
                                    child: Text(description[index],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 48, 48, 54)
                                      ),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            height: 100.0,
                            width: 70.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5)
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage("https://is2-ssl.mzstatic.com/image/thumb/Video2/v4/e1/69/8b/e1698bc0-c23d-2424-40b7-527864c94a8e/pr_source.lsr/268x0w.png")
                                )
                            ),
                          ),
                          onTap: () async{
                            _launchURL();
                          },
                        )

                      ],
                    ),
                  ),
                ),
              );
            })
    );
  }
}

