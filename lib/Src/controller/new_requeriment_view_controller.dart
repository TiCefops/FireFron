
import 'package:get/get.dart';

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