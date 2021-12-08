import 'dart:convert';

import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/Src/controller/requerimentTypeController.dart';
import 'package:cefops/Src/model/adm/requeriment_type_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;


Future<List<RequerimentTypeModel>> GetRequeRequerimentType()async{
  RequerimentTypeController controler=RequerimentTypeController.reqType;
  final response=await http.get(
    Uri.parse("${urls.app}/tiposrequerimentos"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${UserController.user.token}',
    },
  );
  controler.loading.value=true;
  var data1=controler.groupsFiltered.value=[];

  final data = utf8.decode(response.bodyBytes);
  var decodeData = jsonDecode(data);

  if (response.statusCode == 200) {
    controler.loading.value=false;
    ErroController.error.ok.value=true;
    List jsonResponse = decodeData;
    var setGroups=jsonResponse.forEach(( element) {
      controler.groups.add(element['grupo']);
      controler.type.add(element);
    });
    List<dynamic> groupeData =  controler.groups;
    List<dynamic> groupeDatafiltered = [];
    Set<String> setGroupeData = Set();

    for (dynamic data in groupeData){
      if (!setGroupeData.contains(data)){
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


    developer.log("${RequerimentTypeController.reqType.groupsFiltered}",
        name: "Resposta api Carregando os tipos de requerimentos");

    List<RequerimentTypeModel> model=jsonResponse.map((req) =>
        RequerimentTypeModel.fromJson(req)).toList();


    return model;
  }

  else {
    controler.loading.value=false;

    ErroController.error.ok.value=false;
    print(response.body);
    developer.log(response.body,
        name: "Erro ao carregar tipos de requerimentos",
    );
    throw Exception('error');
  }

}
