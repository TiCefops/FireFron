
import 'package:cefops/Src/model/aluno/aluno_model.dart';
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
 //
 // SetEndereco(StudantModel aluno,int Index){
 //   var _endereco=aluno.content[Index]
 //   id.value=_endereco.id;
 //   cep.value=_endereco.cep;
 //   numero.value=_endereco.numero;
 //   complemento.value=_endereco.complemento;
 //   bairro.value=_endereco.bairro;
 //   cidade.value=_endereco.cidade;
 //   estado.value=_endereco.estado;
 //   uf .value=_endereco.uf;
 //   rua.value=_endereco.rua;
 //
 //
 //
 //
 //
 //
 // }


}