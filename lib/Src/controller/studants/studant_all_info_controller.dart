
import 'package:cefops/Src/controller/studants/studant_anddress_controller.dart';
import 'package:cefops/Src/controller/studants/studant_info_controller.dart';
import 'package:cefops/Src/views/studantDetails/controller/documents_controller.dart';
import 'package:get/get.dart';

class StudantAllInfoController extends GetxController{
  static StudantAllInfoController data=StudantAllInfoController();

  var documents=DocumentsController.data;
  var studantsInfo=StudantInfoController.data;
  var anddress=StudantAnddressController.anddres;





}