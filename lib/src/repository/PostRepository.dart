import 'dart:convert';
import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/Src/model/model_publication.dart';
import 'package:http/http.dart' as http;

Future<PostModel> FetchPosts(context)   async {
  final response = await http.get(Uri.parse('${urls.app}/post/1'),
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