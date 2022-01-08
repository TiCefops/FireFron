import 'package:cefops/app/controller/app/status_app_controller.dart';
import 'package:get/get.dart';
///detecta o menu
onSelectItem() {
  statusApp.status.selectedIndex.value;
  Get.back();
}

MenuDescicion(role) {
  print("iniciando tomada de descisão");
  if (role=="ADM") {
    statusApp.status.adm.value=true;
  }
  if (role=="Aluno") {
    statusApp.status.aluno.value=true;
  }
  if (role=="Financeiro") {
    statusApp.status.financeiro.value=true;
  }
  if (role=="Secretaria") {
    statusApp.status.secretaria.value=true;
  }


}

