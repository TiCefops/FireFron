
import 'package:get/get.dart';

class UserControllerForStudant extends GetxController  {

  RxString password="".obs;
  RxString idStudant="".obs;
  RxString idUser="".obs;
  RxInt idPermission=0.obs;
  RxString permission="Aluno".obs;

  ///converte para a api;
  void setPermissionForApi(String permission){
    switch(permission){
      case "Aluno":
         idPermission.value=1;
         break;
      case "Pofessor":
         idPermission.value=2;
         break;
      case "Secretaria":
         idPermission.value=3;
         break;
      case "Diretoria":
         idPermission.value=4;
         break;
      case "Financeiro":
         idPermission.value=5;
         break;
      case "ADM":
         idPermission.value=6;
         break;
      case "Gerência":
         idPermission.value=7;
         break;
      case "FinanceiroAdm":
         idPermission.value=8;
         break;
      default :0;
    }

  }

}

