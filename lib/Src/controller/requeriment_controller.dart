import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:get/get.dart';
class RequerimentController extends GetxController{
  static RequerimentController req=RequerimentController();
  var idStudant="".obs;
  var tipoRequeriment=0.obs;
  var StudantFullName="".obs;
  var linkPhoto="https://img.icons8.com/external-flatart-icons-lineal-color-flatarticons/64/000000/external-photo-appliances-flatart-icons-lineal-color-flatarticons.png".obs;
  var observertion="".obs;
  var statusCeate="".obs;
  var protocolo="".obs;
  RxDouble valor=0.0.obs;



}

isAluno(){
  if (UserController.user.role.value=="Aluno") {
    RequerimentController.req.idStudant.value=UserController.user.id.value;
  }  else{

  }
}

