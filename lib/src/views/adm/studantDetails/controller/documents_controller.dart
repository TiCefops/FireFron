import 'package:cefops/Src/model/aluno/aluno_model.dart';
import 'package:cefops/Src/model/aluno/documentos/document_model.dart';
import 'package:get/get.dart';
import "dart:developer" as developer;
class DocumentsController extends GetxController{
  static DocumentsController data =DocumentsController();

  RxString cpf="".obs;
  RxString rg="".obs;
  RxString estadoEmissorRg="".obs;
  RxString dataEmissorRg="".obs;
  RxString titulo="".obs;
  RxString estadoEmissortitulo="".obs;
  RxString zona="".obs;
  RxString secao="".obs;
  RxString dataEmissorTitulo="".obs;
  RxBool loading=false.obs;
  RxString nomeMae="".obs;
  RxString nomePai="".obs;

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

setDocuments(DocumentModel data,){
  cpf.value=data.cpf;
  rg.value=data.rg;
  estadoEmissorRg.value=data.estadoemissor;
  dataEmissorRg.value=data.dataemissao.toString();
  titulo.value=data.tituloeleitor;
  estadoEmissortitulo.value=data.estemissortitulo;
  zona.value=data.zona;
  secao.value=data.secao;
  dataEmissorTitulo.value=data.dataemissaotitulo.toIso8601String();
}





}