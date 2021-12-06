

import 'package:cefops/Src/model/cep_model.dart';
import 'package:get/get.dart';

class cepControll extends GetxController{
  static cepControll endereco= cepControll();

  var cep="".obs;
  var logradouro="".obs;
  var complemento="".obs;
  var bairro="".obs;
  var localidade="".obs;
  var uf="".obs;
  var ibge="".obs;
  var gia="".obs;
  var ddd="".obs;
  var siafi="".obs;
  var estado="".obs;



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