import 'package:get/get.dart';
import 'dart:developer' as developer;

class RequerimentTypeController extends GetxController{
  static RequerimentTypeController reqType=RequerimentTypeController();
  var loading=false.obs;
  var loadingTypes=false.obs;
  var nome="".obs;
  var id=0.obs;
  var selectedType="".obs;
  var selectedGroupe="Secretaria".obs;
  var groupsFiltered=[].obs;
  
  List<String> groups=[];
  List<dynamic> type=[];
  List<dynamic> itemsFilterd=[];

  setGroupe(List<String> data){
    groups=data;
    update();

  }
  setType(List data){
    type=data;
    update();
  }
      ///define o valor inicial do grupo de requerimentos
  void setDefaultGroups(){
    if(groups.isNotEmpty){
      selectedGroupe.value=groups.first;
    }else{
      selectedGroupe.value="";
    }



}///define o valor inicial do requerimento
  void setDefaultRequeriment() {
    if (type.isNotEmpty) {
      selectedType.value = "";
    } else {
      selectedType.value = "";
    }
  }
    ///filtrar os tipos de requerimento pelo grupo;
  filterDataRequerimentType(String data){
    loadingTypes.value=true;

   itemsFilterd=type.where((element) =>
   element["grupo"]==data).toList();
   update();
    loadingTypes.value=false;
     selectedType.value=itemsFilterd.first["id"].toString();
    developer.log(itemsFilterd.first.toString(),name: "tipos iniciado no controllador");


  }

}