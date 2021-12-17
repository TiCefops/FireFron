
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/widgets/widget_GetRequeriments.dart';
import 'package:get/get.dart';
///controlador da pagina inicial dos funcionarios
class HomeEmployesController extends GetxController{
  static HomeEmployesController c=HomeEmployesController();

  RxList allData=[].obs;
  RxInt requerimentsOpen=0.obs;
  RxInt requerimentsInProgress=0.obs;
  RxInt requerimentsDone=0.obs;
  RxInt totalForBar=0.obs;
  RxBool updateScreen=false.obs;
  RxBool updating=false.obs;
  RxBool click=false.obs;
  RxString concluidoEm="2021-11-30".obs;


  void updateScreenFun(){
    Future.delayed(Duration(seconds: 2));
    updateScreen.value=false;
    update();
  }
  double calcProgress(){
    var total=statusApp.status.requerimentosAberto.toDouble()+
        statusApp.status.requerimentosConcluido.toDouble();
    var progress=total*statusApp.status.requerimentosConcluido.toDouble()/100;
return progress;
  }

}