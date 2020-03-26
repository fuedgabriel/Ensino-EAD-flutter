import 'package:imperium/screens/Matter.dart';

import 'json/QuestionsJson.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const baseUrl = "https://192.168.1.70:7844";

class API {
  static Future getAnimes(String id, int page) async{
    String url;
    url = baseUrl + "/api/Question/";
    return await http.get(url);
  }
}

class POST
{
  static Future<http.Response> postcreate (nome, Correct, Matter) async {
    var url = baseUrl+'/api/Questions';
    var a =	[{
      "1":"Clima, Geografia e localização.",
      "2":"Povo Território e soberania.",
      "3":"Voto, democracia e cidadania",
      "4":"Nação, cultura e idioma",
      "5":"Fidelidade, patriotismo, e governo totalitário"
    }];
    print(a);
    Map data = {
      'Title': '$nome',
      'Answers': '$a',
      'Correct': '$Correct',
      'Matter': '$Matter'
    };
    //encode Map to JSON
    var body = json.encode(data);
    return http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
  }
}
