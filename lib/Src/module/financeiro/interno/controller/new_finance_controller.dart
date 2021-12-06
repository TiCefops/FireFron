import 'package:get/get.dart';

class NewFinanceController extends GetxController {
  var name = "".obs;
  var description = "".obs;
  var valor = 0.0.obs;
  var payDate = "".obs;
  var dueDate = "".obs;
  var ispay = false.obs;
  var isPayOnDate = false.obs;

  Save() {}
}
