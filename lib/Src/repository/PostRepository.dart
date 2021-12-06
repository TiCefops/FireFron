import 'dart:convert';
import 'package:cefops/Src/model/model_publication.dart';
import 'package:http/http.dart' as http;

Future<PostModel> FetchPosts(context)   async {
  final response = await http.get(Uri.parse(''));
  final data = utf8.decode(response.bodyBytes);
  var decodeData = jsonDecode(data);
  if (response.statusCode == 200) {
    return PostModel.fromJson(decodeData);
  } else {
    throw Exception('Failed to load ');
  }
}