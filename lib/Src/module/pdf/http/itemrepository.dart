
import 'dart:convert';
import 'package:cefops/Src/module/pdf/http/itemmodel.dart';
import 'package:http/http.dart'as http;
final String url="https://60f1e82aa0984c0017dfae9f.mockapi.io/it/";
final String endPoint="items";

Future<List<ItemModel>> FetchItems() async {
  final response = await http.get(
      Uri.parse(url + endPoint));

  final data = utf8.decode(response.bodyBytes);
  var decodeData = jsonDecode(data);

  if (response.statusCode == 200) {
    List jsonResponse = decodeData;
    print(decodeData);
    return jsonResponse.map((items) => ItemModel.fromJson(items)).toList();




  } else {
    throw Exception('Failed to load jobs from API');
  }
}