import 'dart:convert';

import 'package:cefops/Shared/Security/Controller/error_controler.dart';
import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/app/controller/views/adm/shared/requeriment_type_controller.dart';
import 'package:cefops/app/data/model/views/adm/secretaria/requerimentos/requeriment_type_model.dart';
import 'package:http/http.dart' as http;

class RequerimentTypesRepository {
  Future<List<RequerimentTypeModel>> getAllRequeRequerimentType() async {
    RequerimentTypeController controler = RequerimentTypeController.reqType;
    final http.Response response = await http.get(
      Uri.parse("${urls.app}/tiposrequerimentos"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',
      },
    );
    controler.loading.value = true;

    final String data = utf8.decode(response.bodyBytes);
    var decodeData = jsonDecode(data);

    if (response.statusCode == 200) {
      controler.loading.value = false;
      ErroController.error.ok.value = true;
      List jsonResponse = decodeData;

      List<dynamic> groupeData = controler.groups;
      List<dynamic> groupeDatafiltered = [];
      Set<String> setGroupeData = Set();

      for (dynamic data in groupeData) {
        if (!setGroupeData.contains(data)) {
          setGroupeData.add(data);
          groupeDatafiltered.add(data);
        }
      }

      groupeDatafiltered.forEach((element) {
        controler.groupsFiltered.add(element);
      });
      controler.setType(decodeData);
      controler.setDefaultGroups();
      controler.setDefaultRequeriment();
      List<RequerimentTypeModel> model = jsonResponse.map((req) =>
          RequerimentTypeModel.fromJson(req)).toList();


      return model;
    }

    else {
      controler.loading.value = false;

      ErroController.error.ok.value = false;


      throw Exception('error');
    }
  }
}