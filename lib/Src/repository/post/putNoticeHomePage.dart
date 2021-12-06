import 'dart:convert';
import 'dart:io';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/Src/model/model_publication.dart';
import 'package:cefops/Src/module/pdf/web.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future UpdateNews(String Name,) async {
  status.loading;
  final  client = http.Client();
  final response = await http.post(
    Uri.parse('${urls.url}/pdf/Generate'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Api-Key': 'pa896bocvi85_1hpagneogvjzd1pjki0btclu3f',
    },
    body: jsonEncode(<String, dynamic>{
      "templateId":"60f9c7ff3bbdc1611ee0b3ac",
      "templateVersion":1,
      "file":{
        "name" : Name,
        "description" : "teste",
        "items" : [ {
          "name" : "get",
          "status" : "ok",
          "date" : "20222",
          "person" : "Eu"
        } ]
      }

    }
    ),

  );
  client.close();
  if (response.statusCode == 200) {

    print(response.bodyBytes);

    var bytes = response.bodyBytes;

    return     saveAndLaunche(bytes, "Output.pdf");


  } else {
    throw Exception('Failed to update album.');
  }
}
enum status{
  loading,
  sucess,
  error,

}
