import 'package:cefops/Src/model/aluno/aluno_model.dart';
import 'package:get/get.dart';
import "dart:developer" as developer;
class DocumentsController extends GetxController{
  static DocumentsController data =DocumentsController();

  var cpf="".obs;
  var rg="".obs;
  var estadoEmissorRg="".obs;
  var dataEmissorRg="".obs;
  var titulo="".obs;
  var estadoEmissortitulo="".obs;
  var zona="".obs;
  var secao="".obs;
  var dataEmissorTitulo="".obs;

  deleteAllData(){
     cpf.value="";
     rg.value="";
     estadoEmissorRg.value="";
     dataEmissorRg.value="";
     titulo.value="";
     estadoEmissortitulo.value="";
     zona.value="";
     secao.value="";
     dataEmissorTitulo.value="";
  }

// setDocuments(StudantModel data,int Index){
//   cpf.value=data.content[Index].id;
//   rg.value="";
//   estadoEmissorRg.value=data.content[Index].endereco.cidade;
//   dataEmissorRg.value=data.content[Index].dataNanscimento.toString();
//   titulo.value=data.content[Index].id;
//   estadoEmissortitulo.value=data.content[Index].endereco.uf;
//   zona.value=data.content[Index].endereco.uf;
//   secao.value=data.content[Index].endereco.uf;
//   dataEmissorTitulo.value=data.content[Index].dataNanscimento.toString();
// }





}