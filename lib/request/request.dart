import 'json/QuestionsJson.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const baseUrl = "http://192.168.1.70:7844";

class API {
  static Future getAnimes(String id, int page) async{
    String url;
    url = baseUrl + "/api/Question/";
    return await http.get(url);
  }
  static Future getMatters() async{
    String url;
    url = baseUrl + "/api/Matter";
    return await http.get(url);
  }
  static Future getQuestions(id) async{
    print(id);
    String url;
    url = baseUrl + "/api/Questions/search?matter="+id.toString();
    return await http.get(url);
  }
}
class ListJson {
  static tag(questions1, questions2 ,questions3,questions4,questions5){
    Map toJson() => {
      '1': '$questions1',
      '2': '$questions2',
      '3': '$questions3',
      '4': '$questions4',
      '5': '$questions5'
    };
    return toJson();
  }
}
class POST
{
  static Future<http.Response> postcreate(nome, correct, matter, questionA, questionB, questionC, questionD, questionE) async {
    var url = baseUrl+'/api/Questions';
    Map data = {
      'Title': '$nome',
      'Correct': '$correct',
      'Matter': '$matter',
      'Answers': ListJson.tag(questionA, questionB, questionC, questionD, questionE)
    };
    var body = json.encode(data);
    return await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );











//    var a =	[{
//      '1':'Clima, Geografia e localização.',
//      '2':'Povo Território e soberania.',
//      '3':'Voto, democracia e cidadania',
//      '4':'Nação, cultura e idioma',
//      '5':'Fidelidade, patriotismo, e governo totalitário'
//    }];
//    var b = json.encode(a);
//    Map data = {
//      'Title': '$nome',
//      'Correct': '$Correct',
//      'Matter': '$Matter',
//      'Answers': b,
//    };
//    var ado = json.encode(data);
//    ado = ado.replaceAll('\\', '').replaceAll(']"', ']').replaceAll('"[', '[');
//    print(ado);
////    body = body.replaceAll('""}', b+'}');
//    return http.post(url,
//        headers: {"Content-Type": "application/json"},
//        body: ado
//    );
  }
}
