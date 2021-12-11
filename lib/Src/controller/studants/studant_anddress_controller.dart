
import 'package:cefops/Src/controller/studants/studant_info_controller.dart';
import 'package:cefops/Src/model/aluno/documentos/andress_model.dart';
import 'package:cefops/Src/repository/aluno/documentos/andress_repository.dart';
import 'package:get/get.dart';

class StudantAnddressController extends GetxController{
  static StudantAnddressController anddres =StudantAnddressController();
  var id=0.obs;
  var cep="".obs;
  var numero="".obs;
  var complemento="".obs;
  var bairro="".obs ;
  var cidade="".obs ;
  var estado="".obs;
  var uf="".obs;
  var rua="".obs;
  var erro="".obs;
  var carregando=false.obs;
  var click=false.obs;
  var status="nd".obs;

 setEndereco(AndressModel data){
   var _endereco=data;
   id.value=_endereco.id;
   cep.value=_endereco.cep;
   numero.value=_endereco.numero;
   complemento.value=_endereco.complemento;
   bairro.value=_endereco.bairro;
   cidade.value=_endereco.cidade;
   estado.value=_endereco.estado;
   uf .value=_endereco.uf;
   rua.value=_endereco.rua;

 }
 clarAndress(){
   id.value=0;
   cep.value="";
   numero.value="";
   complemento.value="";
   bairro.value="";
   cidade.value="";
   estado.value="";
   uf .value="";
   rua.value="";
   update();


 }

setDocuments(){
  CreateAndress(cep.value, rua.value, StudantInfoController.data.cpf.value,
      cidade.value, estado.value, uf.value, numero.value, complemento.value, bairro.value);


}
 getAndress(){
   GetStudantAndressById(StudantInfoController.data.cpf.value);
 }


}