
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


  void updateScreenFun(){
    Future.delayed(Duration(seconds: 2));
    updateScreen.value=false;
    print("Atualizar");
    update();
  }








}