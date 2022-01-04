import 'dart:convert';
import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/app/data/model/model_publication.dart';
import 'package:cefops/app/module/pdf/mobile.dart';
import 'package:http/http.dart' as http;
///
class PostRepository{
  Future<PostModel> fetchPosts()   async {
    final http.Response response = await http.get(Uri.parse('${urls.app}/post/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',
      },);
    final data = utf8.decode(response.bodyBytes);
    var decodeData = jsonDecode(data);
    if (response.statusCode == 200) {
      return PostModel.fromJson(decodeData);
    } else {
      throw Exception('Failed to load ');
    }
  }

  Future updateNews(String Name,) async {
    final  http.Client client = http.Client();
    final http.Response response = await http.post(
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




}
