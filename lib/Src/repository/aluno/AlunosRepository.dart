import 'dart:convert';
import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/Security/Model/error_model.dart';
import 'package:cefops/Shared/Security/Services/Logar.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/Src/controller/list_studant_controller.dart';
import 'package:cefops/Src/controller/requerimentController.dart';
import 'package:cefops/Src/model/aluno/aluno_model.dart';
import 'package:cefops/Src/model/aluno/one_studant_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import "dart:developer" as developer;



  Future<StudantModel> GetAllAlunos() async {

    ListStudantController controller=ListStudantController.data;
    String urlPadrao="${urls.app}/alunos/?page=${controller.newPage}&limit=${controller.newTotalElement}&direction=${controller.newDirection}";
    String urlSearch="${urls.app}/alunos/buscarnome/${controller.searchData}/?page=${controller.newPage}&limit=${controller.newTotalElement}&direction=${controller.newDirection}";
    String urlCpf="${urls.app}/alunos/${controller.searchData}";

    String urlReturn(){
      if(controller.searchData.value.isNotEmpty){
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
      Map<String,dynamic> jsonResponse = decodeData;
      var model=StudantModel.fromJson(jsonResponse);
      controller.number.value=model.number;
      controller.pageSize.value=model.size;
      controller.totalPages.value=model.totalPages;
      ListStudantController.data.totalElements.value=model.totalElements;




      return model;
    }

    if (response.statusCode == 500) {
      ErroController.error.ok.value = false;

      return Logar();
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      ErroController.error.ok.value = false;
      print(response.body);
      throw Exception('error');
    }
  }

  Future<OneStudantModel> GetStudantById(id) async {
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
      String Fullname=data.name! + " " + data.lastName!;
      RequerimentController.req.StudantFullName.value =Fullname;

      RequerimentController.req.linkPhoto.value = data.photo.toString();

      return data;
    }


    if (response.statusCode == 500) {
      ErroController.error.ok.value = false;

      return Logar();
    }
    else {
      final data1 = utf8.decode(response.bodyBytes);

     var error= errorModelFromJson(data1);
     ErroController.error.tipoError.value=error.message;
     print(ErroController.error.tipoError.value);

     Get.showSnackbar(GetBar(message:ErroController.error.tipoError.value,
       duration: Duration(seconds: 3),
       ));
      ErroController.error.ok.value = false;
      throw Exception('error');
    }
  }

  Future<StudantModel> createAluno(int id, String name, String lastName, int Cpf,
      String email, int grupe,) async {
    final response = await http.post(
      Uri.parse('${urls.app}/alunos'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserController.user.token}',
      },
      body: jsonEncode(<String, dynamic>{
        'id': Cpf,
        'cpf': Cpf,
        'name': name,
        'lastName': lastName,
        'email': email,
        "grupe": grupe,

      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return StudantModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 409) {
      throw Exception('conflito de usuario');
    }
    else if (response.statusCode == 400) {
      throw Exception('falha na requisição');
    } else {
      throw Exception("erro ao criar usuario");
    }
  }
