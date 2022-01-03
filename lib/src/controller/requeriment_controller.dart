import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:get/get.dart';
///controla os dados da tela de cadastro de requerimentos do colaborador
class RequerimentController extends GetxController{
  static RequerimentController req=RequerimentController();
  RxString idStudant="".obs;
  RxInt tipoRequeriment=0.obs;
  RxString StudantFullName="".obs;
  RxString linkPhoto="https://img.icons8.com/external-flatart-icons-lineal-color-flatarticons/64/000000/external-photo-appliances-flatart-icons-lineal-color-flatarticons.png".obs;
  RxString observertion="".obs;
  RxString statusCeate="".obs;
  RxString protocolo="".obs;
  RxDouble valor=0.0.obs;



}

isAluno(){
  if (UserController.user.role.value=="Aluno") {
    RequerimentController.req.idStudant.value=UserController.user.id.value;
  }  else{

  }
}

