import 'dart:convert';
import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/Security/Model/error_model.dart';

import 'package:cefops/Shared/urls.dart';
import 'package:cefops/Src/controller/list_studant_controller.dart';
import 'package:cefops/Src/controller/requeriment_controller.dart';
import 'package:cefops/Src/controller/studants/studant_info_controller.dart';
import 'package:cefops/Src/model/aluno/aluno_model.dart';
import 'package:cefops/Src/model/aluno/one_studant_model.dart';
import 'package:cefops/Src/views/adm/studantDetails/controller/studant_details_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
///
class StudantRepository {
///
  Future<StudantModel> getAllStudants() async {
    ListStudantController controller = ListStudantController.data;
    String urlPadrao = "${urls.app}/alunos/?page=${controller
        .newPage}&limit=${controller.newTotalElement}&direction=${controller
        .newDirection}";
    String urlSearch = "${urls.app}/alunos/buscarnome/${controller
        .searchData}/?page=${controller.newPage}&limit=${controller
        .newTotalElement}&direction=${controller.newDirection}";
    String urlCpf = "${urls.app}/alunos/${controller.searchData}";

    String urlReturn() {
      if (controller.searchData.value.isNotEmpty) {
        return urlSearch;
      }
      else {
        return urlPadrao;
      }
    }


    final response = await http.get(
      Uri.parse(urlReturn()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',

      },
    );
    final data = utf8.decode(response.bodyBytes);
    var decodeData = jsonDecode(data);


    if (response.statusCode == 200) {
      ErroController.error.ok.value = true;
      Map<String, dynamic> jsonResponse = decodeData;
      var model = StudantModel.fromJson(jsonResponse);
      controller.number.value = model.number;
      controller.pageSize.value = model.size;
      controller.totalPages.value = model.totalPages;
      ListStudantController.data.totalElements.value = model.totalElements;


      return model;
    }

    if (response.statusCode == 500) {
      ErroController.error.ok.value = false;
      throw Exception("");


    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      ErroController.error.ok.value = false;
      print(response.body);
      throw Exception('error');
    }
  }

  Future<OneStudantModel> getStudantById(id) async {
    final response = await http.get(
      Uri.parse("${urls.app}/alunos/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',

      },
    );
    final data = utf8.decode(response.bodyBytes);
    var decodeData = jsonDecode(data);

    if (response.statusCode == 200) {
      ErroController.error.ok.value = true;

      var jsonResponse = decodeData;
      var data = OneStudantModel.fromJson(jsonResponse);
      String Fullname = data.name! + " " + data.lastName!;
      RequerimentController.req.StudantFullName.value = Fullname;

      RequerimentController.req.linkPhoto.value = data.photo.toString();

      return data;
    }


    if (response.statusCode == 500) {
      ErroController.error.ok.value = false;
    throw Exception("Error");


    }
    else {
      final data1 = utf8.decode(response.bodyBytes);

      var error = errorModelFromJson(data1);
      ErroController.error.tipoError.value = error.message;
      print(ErroController.error.tipoError.value);

      Get.showSnackbar(GetBar(message: ErroController.error.tipoError.value,
        duration: Duration(seconds: 3),
      ));
      ErroController.error.ok.value = false;
      throw Exception('error');
    }
  }

  Future<String> createStudant(String name, String lastName, String Cpf,
      String email, String dataNaciento, String telefone,
      String telefoneCelular,
      String genero, String estadoCivil, String nacionalidade,
      bool ativo) async {
    StudantInfoController.data.loading.value = true;

    final response = await http.post(
      Uri.parse('${urls.app}/alunos'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',
      },
      body: jsonEncode(<String, dynamic>{
        "id": "$Cpf",
        "cpf": "$Cpf",
        "name": "${name.toUpperCase()}",
        "lastName": "${lastName.toUpperCase()}",
        "dataNanscimento": "$dataNaciento",
        "email": "$email",
        "teleFone": "$telefone",
        "teleFoneCelular": "$telefoneCelular",
        "photo": "https://robohash.org/delenitinullaquae.jpg?size=50x50&set=set1",
        "enabled": ativo,
        "genero": "$genero",
        "estadoCivil": "$estadoCivil",
        "nacionalidade": "${nacionalidade.toUpperCase()}"
      }),
    );
    final data;
    var decodeData;
    if (response.body.isNotEmpty) {
      data = utf8.decode(response.bodyBytes);
      decodeData = jsonDecode(data);
    }


    try {
      if (response.statusCode == 201) {
        StudantInfoController.data.loading.value = false;

        StudantInfoController.data.status.value = "Cadastrado Com Sucesso";
        Future.delayed(Duration(seconds: 3), () {
          StudandDetailsController.details.navegar.value = 1;
          StudantInfoController.data.status.value = "";
        });


        return "Criado";
      } else if (response.statusCode == 409) {
        StudantInfoController.data.loading.value = false;
        StudantInfoController.data.status.value = "Usuário já Cadastrado";
        Future.delayed(const Duration(seconds: 3),(){
          StudantInfoController.data.status.value = "";
        });
        throw Exception('conflito de usuario');

      }
      else if (response.statusCode == 400) {
        StudantInfoController.data.loading.value = false;
        StudantInfoController.data.status.value = "Erro desconhecido";

        throw Exception('falha na requisição');
      } else if (response.statusCode == 500) {
        var error = decodeData;
        var erroMapper = ErrorModel.fromJson(error);
        if (erroMapper.message == "Aluno já cadastrado") {
          StudantInfoController.data.loading.value = false;
          StudantInfoController.data.status.value = "Usuário já Cadastrado";
          return "Usuário já Cadastrado";
        } else if (erroMapper.message.contains("SQL")) {
          StudantInfoController.data.loading.value = false;
          StudantInfoController.data.status.value = "Error verifique os dados";
          return "Error verifique os dados";
        }
        StudantInfoController.data.loading.value = false;
        StudantInfoController.data.status.value = "Error Desconhecido";
        return "Error";
      }

      else {
        StudantInfoController.data.loading.value = false;
        StudantInfoController.data.status.value = "Erro desconhecido";

        throw Exception("erro ao criar usuario");
      }
    } catch (e) {
      StudantInfoController.data.loading.value = false;
      StudantInfoController.data.status.value = "Erro desconhecido";

      return "Error";
    }
  }
}