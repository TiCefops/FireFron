import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/Security/Model/error_model.dart';
import 'package:cefops/Src/controller/studants/studant_all_info_controller.dart';
import 'package:cefops/Shared/urls.dart';
import 'package:cefops/Src/controller/studants/studant_info_controller.dart';
import 'dart:convert';
import 'package:cefops/Src/model/aluno/documentos/document_model.dart';
import 'package:cefops/Src/views/adm/studantDetails/controller/controller_studantDetails.dart';
import 'package:cefops/Src/views/adm/studantDetails/controller/documents_controller.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


Future<DocumentModel> GetDocumentsById(id) async {

  var controller=StudantAllInfoController.data.documents;



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

      print(decodeData);
      var dados = DocumentModel.fromJson(decodeData);


      controller.setDocuments(dados);


      return dados;
    }


    if (response.statusCode == 500) {

      throw Exception("Error");
    }
    else {



      throw Exception('error');
    }
  }catch(e,s){
    throw Exception("${response.statusCode}");
  }
}



Future<String> CreateDocuments(String cpf,String rg,
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
  var dateTime1 = DateFormat('dd/M/yyyy').parse(dataemissao);
  var day1=dateTime1.day;
  var moth=dateTime1.month;
  var yeer=dateTime1.year;

  String emissaoRg="$yeer"+"-"+"$moth"+"-"+"$day1";
  var dateTime2 = DateFormat('dd/M/yyyy').parse(dataemissaotitulo);
  var day=dateTime2.day;
  var moth1=dateTime2.month;
  var yeer1=dateTime2.year;
  String emissaotitulo="$yeer1"+"-"+"$moth1"+"-"+"$day";

  StudantInfoController.data.loading.value=true;
  DocumentsController.data.loading.value=true;
print(alunosId);
  final response = await http.post(
    Uri.parse('${urls.app}/documentos'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${UserController.user.token}',
    },
    body: jsonEncode(<String, dynamic>{
      "id": 0,
      "cpf": "${cpf}",
      "rg": "${rg}",
      "dataemissao": "${emissaoRg}",
      "orgaoemissor": "${orgaoemissor}",
      "estadoemissor": "${estadoemissor}",
      "tituloeleitor": "${tituloeleitor}",
      "zona": "${zona}",
      "secao": "${secao}",
      "dataemissaotitulo": "${emissaotitulo}",
      "estemissortitulo": "${estemissortitulo}",
      "nomedamae": "${nomedamae}",
      "nomedopai": "${nomedopai}",
      "alunosId": {
        "id":"00067102935"
      }

    }),
  );
  print(response.body);
  final data;
  var decodeData;
  if(response.body.isNotEmpty){
    data = utf8.decode(response.bodyBytes);
    decodeData= jsonDecode(data);
  }



  print(response.statusCode);
  try{
    if(response.statusCode==200){
      DocumentsController.data.loading.value=true;

    }
    if (response.statusCode == 201) {
      DocumentsController.data.loading.value=false;
      Future.delayed(Duration(seconds: 3),(){
        StudandDetailsController.details.navegar.value=4;      });


      return "Criado" ;
    } else if (response.statusCode == 409) {
      DocumentsController.data.loading.value=false;
      StudantInfoController.data.status.value="Usuário já Cadastrado";


      throw Exception('conflito de usuario');
    }
    else if (response.statusCode == 400) {
      DocumentsController.data.loading.value=false;
      StudantInfoController.data.status.value="Erro desconhecido";

      throw Exception('falha na requisição');
    } else if(response.statusCode==500){
      var error=decodeData;
      var erroMapper=ErrorModel.fromJson(error);
      if(erroMapper.message=="Aluno já cadastrado"){
        DocumentsController.data.loading.value=false;
        StudantInfoController.data.status.value="Usuário já Cadastrado";
        return "Usuário já Cadastrado";
      }else if(erroMapper.message.contains("SQL")){
        DocumentsController.data.loading.value=false;
        StudantInfoController.data.status.value="Error verifique os dados";
        return"Error verifique os dados";

      }
      DocumentsController.data.loading.value=false;
      StudantInfoController.data.status.value="Error Desconhecido";
      return "Error";
    }

    else {

      DocumentsController.data.loading.value=true;
      StudantInfoController.data.status.value="Erro desconhecido";

      throw Exception("erro ao criar usuario");
    }
  }catch(e,s){
    DocumentsController.data.loading.value=true;
    StudantInfoController.data.status.value="Erro desconhecido";

    return "Error";
  }
}
