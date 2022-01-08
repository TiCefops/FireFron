
import 'package:get/get.dart';
///controla os dados para o dropdown de grupos de  requerimentos
class RequerimentViewController extends GetxController{
 static RequerimentViewController sts=RequerimentViewController();
  String grup="Secretaria";
 String Req="";

  GrupSet(String grupS){
      grup=grupS;
      update();
  }
 ReqSet(String req){
   Req=req;
   update();
 }


}