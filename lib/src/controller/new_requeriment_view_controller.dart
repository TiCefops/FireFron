
import 'package:get/get.dart';
///controla os dados para o dropdown de grupos de  requerimentos
class RequerimentViewController extends GetxController{
 static RequerimentViewController sts=RequerimentViewController();
  String grup="Secretaria";
 String Req="";

  GrupSet(grupS){
      grup=grupS;
      update();
  }
 ReqSet(req){
   Req=req;
   update();
 }


}