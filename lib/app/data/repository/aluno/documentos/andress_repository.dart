import 'dart:convert';
import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/Shared/Security/Model/error_model.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/app/controller/studants/studant_anddress_controller.dart';
import 'package:cefops/app/controller/studants/studant_info_controller.dart';
import 'package:cefops/app/data/model/aluno/documentos/andress_model.dart';
import 'package:cefops/app/views/adm/studantDetails/controller/studant_details_controller.dart';
import 'package:http/http.dart' as http;


Future<AndressModel> GetStudantAndressById(id) async {

  StudantAnddressController controller=StudantAnddressController.anddres;

controller.clarAndress();
  final http.Response response = await http.get(

    Uri.parse("${urls.app}/endereco/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${UserController.user.token}',

    },
  );


  final String data = utf8.decode(response.bodyBytes);
  var decodeData = jsonDecode(data);
  try{
    if (response.statusCode == 200) {

      AndressModel dados = AndressModel.fromJson(decodeData);


      controller.setEndereco(dados);


      return dados;
    }


    if (response.statusCode == 500) {

      throw Exception("Error");
    }
    else {
      final String data1 = utf8.decode(response.bodyBytes);



      throw Exception('error');
    }
  }catch(e){
   throw Exception("${response.statusCode}");
  }
}



Future<String> CreateAndress(String cep, String rua,String aluno,
    String cidade,String estado, String uf,
    String numero,String complemento,String bairro) async {
  StudantAnddressController controller=StudantAnddressController.anddres;
  controller.carregando.value=true;


  final http.Response response = await http.post(
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

    }
    ),
  );
  print(aluno);
  final String data;
  var decodeData;
  if(response.body.isNotEmpty){
    data = utf8.decode(response.bodyBytes);
    decodeData= jsonDecode(data);
  }



  print(response.statusCode);
  try{
    if(response.statusCode==200){
      controller.carregando.value=false;
      StudantAnddressController.anddres.status.value="Cadastrado Com Sucesso";
    }
    if (response.statusCode == 201) {
      controller.carregando.value=false;
      StudantAnddressController.anddres.status.value="Cadastrado Com Sucesso";
      Future.delayed(Duration(seconds: 3),(){
        StudandDetailsController.details.navegar.value=2;      });


      return "Criado" ;
    } else if (response.statusCode == 409) {
      controller.carregando.value=false;

      StudantInfoController.data.status.value="Usuário já Cadastrado";


      throw Exception('conflito de usuario');
    }
    else if (response.statusCode == 400) {
      controller.carregando.value=false;
      StudantInfoController.data.status.value="Erro desconhecido";

      throw Exception('falha na requisição');
    } else if(response.statusCode==500){
      var error=decodeData;
      ErrorModel erroMapper=ErrorModel.fromJson(error);
      if(erroMapper.message=="Aluno já cadastrado"){
        controller.carregando.value=false;
        StudantInfoController.data.status.value="Usuário já Cadastrado";
        return "Usuário já Cadastrado";
      }else if(erroMapper.message.contains("SQL")){
        controller.carregando.value=false;
        StudantInfoController.data.status.value="Error verifique os dados";
        return"Error verifique os dados";

      }
      controller.carregando.value=false;
      StudantInfoController.data.status.value="Error Desconhecido";
      return "Error";
    }

    else {

      controller.carregando.value=false;
      StudantInfoController.data.status.value="Erro desconhecido";

      throw Exception("erro ao criar usuario");
    }
  }catch(e){
    controller.carregando.value=false;
    StudantInfoController.data.status.value="Erro desconhecido";

    return "Error";
  }
}
