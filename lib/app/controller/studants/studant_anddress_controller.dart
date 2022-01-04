import 'package:cefops/app/controller/studants/studant_info_controller.dart';
import 'package:cefops/app/data/model/aluno/documentos/andress_model.dart';
import 'package:cefops/app/data/repository/aluno/documentos/andress_repository.dart';
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

  setEstado(String data){
    switch (data) {
      case "AC":
        return estado.value="Acre" ;
      case "AL":
        return "Alagoas";
      case "AP":
        return "Amapá";
      case "AM":
        return estado.value= "Amazonas";
      case "BA":
        return estado.value= "Bahia";
      case "CE":
        return estado.value= "Ceará";
      case "DF":
        return estado.value= "Distrito Federal";
      case "ES":
        return estado.value= "Espírito Santo";
      case "GO":
        return estado.value= "Goiás";
      case "MA":
        return estado.value= "Maranhão";
      case "MT":
        return estado.value= "Mato Grosso";
      case "MS":
        return estado.value= "Mato Grosso do Sul";
      case "MG":
        return estado.value= "Minas Gerais";
      case "PA":
        return estado.value= "Pará";
      case "PB":
        return estado.value= "Paraíba";
      case "PR":
        return estado.value= "Paraná";
      case "PE":
        return estado.value= "Pernambuco";
      case "PI":
        return estado.value= "Piauí";
      case "RJ":
        return estado.value= "Rio de Janeiro";
      case "RN":
        return estado.value= "Rio Grande do Norte";
      case "RS":
        return estado.value= "Rio Grande do Sul";
      case "RO":
        return estado.value= "Rondônia";
      case "RR":
        return estado.value= "Roraima";
      case "SC":
        return estado.value= "Santa Catarina";
      case "SP":
        return estado.value= "São Paulo";
      case "SE":
        return estado.value= "Sergipe";
      case "TO":
        return estado.value= "Tocantins";

    }

  }



}