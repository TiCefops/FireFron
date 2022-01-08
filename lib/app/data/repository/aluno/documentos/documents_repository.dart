import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/Shared/Security/Model/error_model.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/app/controller/studants/studant_all_info_controller.dart';
import 'package:cefops/app/controller/studants/studant_info_controller.dart';
import 'dart:convert';
import 'package:cefops/app/data/model/aluno/documentos/document_model.dart';
import 'package:cefops/app/views/adm/studantDetails/controller/documents_controller.dart';
import 'package:cefops/app/views/adm/studantDetails/controller/studant_details_controller.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DocumentsRepository {
  Future<DocumentModel> GetDocumentsById(String id) async {
    DocumentsController controller = StudantAllInfoController.data.documents;

    final http.Response response = await http.get(
      Uri.parse("${urls.app}/documentos/08283504465"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',
      },
    );

    final data = utf8.decode(response.bodyBytes);
    var decodeData = jsonDecode(data);
    try {
      if (response.statusCode == 200) {
        DocumentModel dados = DocumentModel.fromMap(decodeData);

        controller.setDocuments(dados);

        return dados;
      }

      if (response.statusCode == 500) {
        throw Exception("Error");
      } else {
        throw Exception('error');
      }
    } catch (e) {
      print(e);
      throw Exception("${response.statusCode}");
    }
  }

  Future<String> CreateDocuments(
    String cpf,
    String rg,
    String dataemissao,
    String orgaoemissor,
    String estadoemissor,
    String tituloeleitor,
    String zona,
    String secao,
    String dataemissaotitulo,
    String estemissortitulo,
    String nomedamae,
    String nomedopai,
    String alunosId,
  ) async {
    DocumentsController controller = StudantAllInfoController.data.documents;

    DateTime dateTime1 = DateFormat('dd/M/yyyy').parse(dataemissao);
    int day1 = dateTime1.day;
    int moth = dateTime1.month;
    int year = dateTime1.year;

    String emissaoRg = "$year" + "-" + "$moth" + "-" + "$day1";
    DateTime dateTime2 = DateFormat('dd/M/yyyy').parse(dataemissaotitulo);
    int day = dateTime2.day;
    int moth1 = dateTime2.month;
    int yeer1 = dateTime2.year;
    String emissaotitulo = "$yeer1" + "-" + "$moth1" + "-" + "$day";

    controller.loading.value = true;
    print(alunosId);
    final http.Response response = await http.post(
      Uri.parse('${urls.app}/documentos'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',
      },
      body: jsonEncode(<String, dynamic>{
        "id": 0,
        "cpf": "${cpf}",
        "rg": "${rg}",
        "dataemissaorg": "${emissaoRg}",
        "orgaoemissorrg": "${orgaoemissor}",
        "estadoemissorrg": "${estadoemissor}",
        "tituloeleitor": "${tituloeleitor}",
        "zona": "${zona}",
        "secao": "${secao}",
        "dataemissaotitulo": "${emissaotitulo}",
        "estadoemissortitulo": "${estemissortitulo}",
        "nomedamae": "${nomedamae}",
        "nomedopai": "${nomedopai}",
        "alunosId": {"id": "${alunosId}"}
      }),
    );
    print(response.body);
    final String data;
    var decodeData;
    if (response.body.isNotEmpty) {
      data = utf8.decode(response.bodyBytes);
      decodeData = jsonDecode(data);
    }

    print(response.statusCode);
    try {
      if (response.statusCode == 200) {
        controller.loading.value = false;
      }
      if (response.statusCode == 201) {
        controller.loading.value = false;
        Future.delayed(Duration(seconds: 3), () {
          StudandDetailsController.details.navegar.value = 5;
        });

        return "Criado";
      } else if (response.statusCode == 409) {
        controller.loading.value = false;
        StudantInfoController.data.status.value = "Usuário já Cadastrado";

        throw Exception('conflito de usuario');
      } else if (response.statusCode == 400) {
        controller.loading.value = false;
        StudantInfoController.data.status.value = "Erro desconhecido";

        throw Exception('falha na requisição');
      } else if (response.statusCode == 500) {
        var error = decodeData;
        ErrorModel erroMapper = ErrorModel.fromJson(error);
        if (erroMapper.message == "Aluno já cadastrado") {
          controller.loading.value = false;
          StudantInfoController.data.status.value = "Usuário já Cadastrado";
          return "Usuário já Cadastrado";
        } else if (erroMapper.message.contains("SQL")) {
          controller.loading.value = false;
          StudantInfoController.data.status.value = "Error verifique os dados";
          return "Error verifique os dados";
        }
        controller.loading.value = false;
        StudantInfoController.data.status.value = "Error Desconhecido";
        return "Error";
      } else {
        controller.loading.value = false;
        StudantInfoController.data.status.value = "Erro desconhecido";

        throw Exception("erro ao criar usuario");
      }
    } catch (e) {
      controller.loading.value = false;
      StudantInfoController.data.status.value = "Erro desconhecido";

      return "Error";
    }
  }
  Future<String> updateDocuments(
      String cpf,
      String rg,
      String dataemissao,
      String orgaoemissor,
      String estadoemissor,
      String tituloeleitor,
      String zona,
      String secao,
      String dataemissaotitulo,
      String estemissortitulo,
      String nomedamae,
      String nomedopai,
      String alunosId,
      ) async {
    DocumentsController controller = StudantAllInfoController.data.documents;

    DateTime dateTime1 = DateFormat('dd/M/yyyy').parse(dataemissao);
    int day1 = dateTime1.day;
    int moth = dateTime1.month;
    int year = dateTime1.year;

    String emissaoRg = "$year" + "-" + "$moth" + "-" + "$day1";
    DateTime dateTime2 = DateFormat('dd/M/yyyy').parse(dataemissaotitulo);
    int day = dateTime2.day;
    int moth1 = dateTime2.month;
    int yeer1 = dateTime2.year;
    String emissaotitulo = "$yeer1" + "-" + "$moth1" + "-" + "$day";

    controller.loading.value = true;
    print(alunosId);
    final http.Response response = await http.put(
      Uri.parse('${urls.app}/documentos/update'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',
      },
      body: jsonEncode(<String, dynamic>{
        "id": 0,
        "cpf": "${cpf}",
        "rg": "${rg}",
        "dataemissaorg": "${emissaoRg}",
        "orgaoemissorrg": "${orgaoemissor}",
        "estadoemissorrg": "${estadoemissor}",
        "tituloeleitor": "${tituloeleitor}",
        "zona": "${zona}",
        "secao": "${secao}",
        "dataemissaotitulo": "${emissaotitulo}",
        "estadoemissortitulo": "${estemissortitulo}",
        "nomedamae": "${nomedamae}",
        "nomedopai": "${nomedopai}",
        "alunosId": {"id": "${alunosId}"}
      }),
    );
    print(response.body);
    final String data;
    var decodeData;
    if (response.body.isNotEmpty) {
      data = utf8.decode(response.bodyBytes);
      decodeData = jsonDecode(data);
    }

    print(response.statusCode);
    try {
      if (response.statusCode == 200) {
        controller.loading.value = false;
      }
      if (response.statusCode == 201) {
        controller.loading.value = false;
        Future.delayed(Duration(seconds: 3), () {
          StudandDetailsController.details.navegar.value = 5;
        });

        return "Criado";
      } else if (response.statusCode == 409) {
        controller.loading.value = false;
        StudantInfoController.data.status.value = "Usuário já Cadastrado";

        throw Exception('conflito de usuario');
      } else if (response.statusCode == 400) {
        controller.loading.value = false;
        StudantInfoController.data.status.value = "Erro desconhecido";

        throw Exception('falha na requisição');
      } else if (response.statusCode == 500) {
        var error = decodeData;
        ErrorModel erroMapper = ErrorModel.fromJson(error);
        if (erroMapper.message == "Aluno já cadastrado") {
          controller.loading.value = false;
          StudantInfoController.data.status.value = "Usuário já Cadastrado";
          return "Usuário já Cadastrado";
        } else if (erroMapper.message.contains("SQL")) {
          controller.loading.value = false;
          StudantInfoController.data.status.value = "Error verifique os dados";
          return "Error verifique os dados";
        }
        controller.loading.value = false;
        StudantInfoController.data.status.value = "Error Desconhecido";
        return "Error";
      } else {
        controller.loading.value = false;
        StudantInfoController.data.status.value = "Erro desconhecido";

        throw Exception("erro ao criar usuario");
      }
    } catch (e) {
      controller.loading.value = false;
      StudantInfoController.data.status.value = "Erro desconhecido";

      return "Error";
    }
  }
}
