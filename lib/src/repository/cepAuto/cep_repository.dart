import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cefops/Src/controller/studants/studant_all_info_controller.dart';
import 'package:http/http.dart' as http;
import 'package:cefops/Src/model/cep_model.dart';

Future <CepModel> GetCep(cp) async{
  var endereco=StudantAllInfoController.data.anddress;

  http.Response response = await http.get(
    Uri.parse('https://viacep.com.br/ws/${cp}/json'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },


  ).timeout(Duration(
      seconds: 5),
      onTimeout: () {

        return throw TimeoutException("Connection Time out");
      }

  );

  try{
    if (response.statusCode==200) {
      var cep=CepModel.fromJson(jsonDecode(response.body));
     endereco.bairro.value=cep.bairro;
     endereco.uf.value=cep.uf;
     endereco.cidade.value=cep.localidade;
     endereco.rua.value=cep.logradouro;
     endereco.complemento.value=cep.complemento;
     endereco.setEstado(cep.uf);
      return cep;
    }if (response.statusCode==400) {
      return throw new Exception("error cep invalido");
    }

  }catch (e){
    return throw new Exception("error");


  }
  return throw SocketException("Falha na conexão, verifique sua rede");

}
