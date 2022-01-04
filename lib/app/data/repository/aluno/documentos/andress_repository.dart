import 'dart:convert';
import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/Shared/Security/Model/error_model.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/app/controller/studants/studant_all_info_controller.dart';
import 'package:cefops/app/controller/studants/studant_anddress_controller.dart';
import 'package:cefops/app/controller/studants/studant_info_controller.dart';
import 'package:cefops/app/data/model/aluno/documentos/andress_model.dart';
import 'package:cefops/app/views/adm/studantDetails/controller/studant_details_controller.dart';
import 'package:http/http.dart' as http;


Future<AndressModel> GetStudantAndressById(id) async {

  var controller=StudantAllInfoController.data.anddress;

  StudantAnddressController.anddres.clarAndress();

  final response = await http.get(

    Uri.parse("${urls.app}/endereco/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${UserController.user.token}',

    },
  );


  final data = utf8.decode(response.bodyBytes);
  var decodeData = jsonDecode(data);
  try{
    if (response.statusCode == 200) {

      var dados = AndressModel.fromJson(decodeData);


      controller.setEndereco(dados);


      return dados;
    }


    if (response.statusCode == 500) {

      throw Exception("Error");
    }
    else {
      final data1 = utf8.decode(response.bodyBytes);

      var error= errorModelFromJson(data1);


      throw Exception('error');
    }
  }catch(e,s){
   throw Exception("${response.statusCode}");
  }
}



Future<String> CreateAndress(String cep, String rua,String aluno,
    String cidade,String estado, String uf,
    String numero,String complemento,String bairro) async {
  StudantInfoController.data.loading.value=true;
  StudantAnddressController.anddres.carregando.value=true;

  final response = await http.post(
    Uri.parse('${urls.app}/endereco'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${UserController.user.token}',
    },
    body: jsonEncode(<String, dynamic>{
      "cep": "$cep",
      "rua": "${rua.toUpperCase()}",
      "numero": "$numero",
      "complemento": "${complemento.toUpperCase()}",
      "bairro": "${bairro.toUpperCase()}",
      "cidade": "${cidade.toUpperCase()}",
      "estado": "${estado.toUpperCase()}",
      "uf": "$uf",
      "aluno": {
        "id":"$aluno"
      }

    }),
  );
  final data;
  var decodeData;
  if(response.body.isNotEmpty){
    data = utf8.decode(response.bodyBytes);
    decodeData= jsonDecode(data);
  }



  print(response.statusCode);
  try{
    if(response.statusCode==200){
      StudantAnddressController.anddres.carregando.value=true;
      StudantAnddressController.anddres.status.value="Cadastrado Com Sucesso";
    }
    if (response.statusCode == 201) {
      StudantAnddressController.anddres.carregando.value=false;
      StudantAnddressController.anddres.status.value="Cadastrado Com Sucesso";
      Future.delayed(Duration(seconds: 3),(){
        StudandDetailsController.details.navegar.value=2;      });


      return "Criado" ;
    } else if (response.statusCode == 409) {
      StudantAnddressController.anddres.carregando.value=false;
      StudantInfoController.data.status.value="Usuário já Cadastrado";


      throw Exception('conflito de usuario');
    }
    else if (response.statusCode == 400) {
      StudantAnddressController.anddres.carregando.value=false;
      StudantInfoController.data.status.value="Erro desconhecido";

      throw Exception('falha na requisição');
    } else if(response.statusCode==500){
      var error=decodeData;
      var erroMapper=ErrorModel.fromJson(error);
      if(erroMapper.message=="Aluno já cadastrado"){
        StudantAnddressController.anddres.carregando.value=false;
        StudantInfoController.data.status.value="Usuário já Cadastrado";
        return "Usuário já Cadastrado";
      }else if(erroMapper.message.contains("SQL")){
        StudantAnddressController.anddres.carregando.value=false;
        StudantInfoController.data.status.value="Error verifique os dados";
        return"Error verifique os dados";

      }
      StudantAnddressController.anddres.carregando.value=false;
      StudantInfoController.data.status.value="Error Desconhecido";
      return "Error";
    }

    else {

      StudantAnddressController.anddres.carregando.value=true;
      StudantInfoController.data.status.value="Erro desconhecido";

      throw Exception("erro ao criar usuario");
    }
  }catch(e,s){
    StudantAnddressController.anddres.carregando.value=true;
    StudantInfoController.data.status.value="Erro desconhecido";

    return "Error";
  }
}
