import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/Security/Model/SignUpModel.dart';
import 'package:cefops/Shared/Security/Model/login_model.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Shared/Security/Model/error_model.dart';
import 'package:cefops/Shared/Security/Services/Logar.dart';
import 'package:cefops/Src/module/exceptions/http/exception_request_error.dart';
import 'package:http/http.dart' as http;
import "dart:developer" as developer;

String token = "";
UserController controller = UserController.user;

Future<LoginModel> Login(String username, String password) async {
  http.Response response = await http
      .post(
    Uri.parse('${urls.auth}/signin'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'username': username, 'password': password}),
  )
      .timeout(Duration(seconds: 20), onTimeout: () {
    statusApp.status.loading.value = false;
    statusApp.status.erros1.value = "Falha na conexão, verifique sua rede."
        " COD:002";
    return throw TimeoutException("Error 002: Tempo de Conexão excedido ");
  });
  try {
    if (response.statusCode == 200) {
      statusApp.status.loading.value = false;
      ErroController.error.ok.value = true;
      LoginModel mod = LoginModel.fromJson(jsonDecode(response.body));
      token = mod.token;
      controller.token.value = mod.token;
      controller.Fullname.value = mod.fullName;
      controller.photo.value = mod.foto;
      controller.role.value = mod.role;
      controller.id.value = mod.alunoId;
      controller.alunoId.value = mod.alunoId;

      return mod;
    } else {
      return throw new Exception("Erro 001");
    }
  } catch (_) {
    if (response.statusCode == 500) {
      ErrorModel erros = ErrorModel.fromJson(jsonDecode(response.body));

      if (erros.message == "Invalid username or password !") {
        statusApp.status.loading.value = false;
        statusApp.status.erros1.value = "usuário ou senha inválido";
        developer.log("Erro 001",
            name: "Erro de senha", error: "Usário ou senha incorreta");
        throw new Exception("Usuário ou senha Incorreta");
      }
    }
    if (response.statusCode == 403) {
      return throw Exception("Error 003 token Expirado ou invalido ");
    } else {
      statusApp.status.loading.value = false;
      statusApp.status.erros1.value = "Falha na conexão, verifique sua rede";
      return throw SocketException("Falha na conexão, verifique sua rede");
    }
  }
}

Future<SignUpModel> SingUpNewUser(
    {required String email,
    required String password,
    required String fristName,
    required String lastName,
    required String alunoId,
    required String cpf}) async {
  statusApp.status.loading.value = true;
  http.Response response = await http
      .post(
    Uri.parse('${urls.auth}/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "username": email,
      "password": password,
      "email": email,
      "fristName": fristName,
      "lastName": lastName,
      "aluno": {
        "id": alunoId,
      },
      "cpf": cpf
    }),
  )
      .timeout(Duration(seconds: 5), onTimeout: () {
    statusApp.status.loading.value = false;
    statusApp.status.erros1.value = "Falha na conexão, verifique sua rede";

    return throw TimeoutException("Error 002 Connection Time out");
  });
  try {
    if (response.statusCode == 200) {
      var singUp = SignUpModel.fromJson(jsonDecode(response.body));
      statusApp.status.loading.value = false;

      return singUp;
    }
  } catch (e, a) {
    statusApp.status.loading.value = false;
    developer.log("Erro 003");
    return throw new Exception("error 003");
  }
  developer.log("Erro 001", error: "Falha ao connectar");
  return throw SocketException("Falha na conexão, verifique sua rede");
}
