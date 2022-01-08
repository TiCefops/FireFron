import 'dart:convert';

import 'package:cefops/Shared/Security/Controller/error_controler.dart';
import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/app/controller/views/adm/shared/home_emplooyes_controller.dart';
import 'package:cefops/app/controller/views/adm/shared/requeriment_controller.dart';
import 'package:cefops/app/controller/app/status_app_controller.dart';
import 'package:cefops/app/data/model/views/adm/secretaria/requerimentos/requeriment_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import 'package:intl/intl.dart';
///
class RequerimentRepository {
  Future<List<RequerimentModel>> getAllRequeriment() async {
    final http.Response response = await http.get(
      Uri.parse("${urls.app}/requerimetos"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',
      },
    );

    final String data = utf8.decode(response.bodyBytes);
    var decodeData = jsonDecode(data);
    if (response.statusCode == 200) {
      ErroController.error.ok.value = true;
      List jsonResponse = decodeData;

      List<RequerimentModel> requeriments =
          jsonResponse.map((req) => RequerimentModel.fromJson(req)).toList();

      return requeriments;
    } else {
      ErroController.error.ok.value = false;
      throw Exception('error');
    }
  }

  Future createRequeriment(
    int requerimentID,
    String alunoID,
    String nomeAluno,
    String observacao,
    double valor,
  ) async {
    isAluno();
    final DateTime data = new DateTime.now().toLocal();

    DateFormat dataFormat = new DateFormat("yMMddhhmms");
    String protocolo = dataFormat.format(data);
    RequerimentController.req.protocolo.value = protocolo;
    final http.Response response = await http.post(
      Uri.parse('${urls.app}/requerimetos'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',
      },
      body: jsonEncode(<String, dynamic>{
        "tipo": {"id": requerimentID},
        "aluno": {"id": "${UserController.user.alunoId}"},
        "nomeAluno": "$nomeAluno",
        "idaluno": "${alunoID}",
        "statusPagameto": "Aguardando",
        "pdfLink": "www.cefops.net",
        "observacao": "$observacao",
        "status": "Solicitado",
        "responsavel": "ND",
        "entregue": "2021-12-01",
        "abertoem": "${data.toIso8601String()}",
        "protocolo": "$protocolo",
        "concluido": false
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      Get.find<HomeEmployesController>().updating.value = false;
      return RequerimentController.req.statusCeate.value = "Criado";
    } else if (response.statusCode == 409) {
      throw Exception('conflito de usuario');
    } else if (response.statusCode == 500) {
      throw Exception('Seção Expirada');
    } else if (response.statusCode == 400) {
      Get.find<HomeEmployesController>().updating.value = false;
      ;

      throw Exception('falha na requisição');
    } else {
      throw Exception("erro ao criar Requerimento ");
    }
  }

  Future<void> updateRequeriment(
      int id, String resp, String status, bool isUpdate) async {
    statusApp.status.loading.value = true;

    String url =
        '${urls.app}/requerimetos?id=$id&responsavel=$resp&status=$status';
    String url2 = '${urls.app}/requerimetos/status?id=$id&status=$status';
    String URL() {
      if (isUpdate == true) {
        return url2;
      } else {
        return url;
      }
    }

    ;
    final http.Response response = await http.patch(
      Uri.parse(URL()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',
      },
    );

    if (response.statusCode == 200) {
      statusApp.status.loading.value = false;
      statusApp.status.clicouAtualizar.value = true;
      HomeEmployesController.c.updateScreenFun();
    } else {
      statusApp.status.loading.value = false;

      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Falha ao atualizar:');
    }
  }

  Future<List<RequerimentModel>> getRequerimentById(
      {required String id}) async {
    final http.Response response = await http.get(
      Uri.parse("${urls.app}/requerimetos/aluno/${id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',
      },
    );
    final String data = utf8.decode(response.bodyBytes);
    var decodeData = jsonDecode(data);

    if (response.statusCode == 200) {
      ErroController.error.ok.value = true;
      List jsonResponse = decodeData;

      List<RequerimentModel> requeriments =
          jsonResponse.map((req) => RequerimentModel.fromJson(req)).toList();
      return requeriments;
    } else {
      ErroController.error.ok.value = false;
      throw Exception('error');
    }
  }
}
