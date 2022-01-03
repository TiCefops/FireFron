import 'package:get/get.dart';
///controla o status da aplicção geral
class statusApp extends GetxController {
  static statusApp status = statusApp();
  RxBool loged = false.obs;
  RxBool loading = false.obs;
  RxBool senhaIncorreta = false.obs;
  RxString erros1 = "".obs;
  RxBool verSenha = true.obs;
  RxString user = "".obs;
  RxString password = "".obs;
  RxInt closeDialog=1.obs;
  RxBool devendo=false.obs;
  RxInt  selectedIndex = 0.obs;
  RxString title="Início".obs;
  RxBool adm=false.obs;
  RxBool aluno=false.obs;
  RxBool secretaria=false.obs;
  RxBool financeiro=false.obs;
  RxInt  requerimentosAberto = 0.obs;
  RxInt  requerimentosAndando = 0.obs;
  RxInt  requerimentosConcluido = 0.obs;
  RxBool clicouAtualizar=false.obs;
  RxInt navegar=0.obs;

}
