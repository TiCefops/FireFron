import 'package:cefops/Src/module/financeiro/interno/controller/new_finance_controller.dart';
import 'package:cefops/Src/widgets/widget_FormsForAll.dart';
import 'package:get/get.dart';

NewFinanceWidget(String nome, String descri, String dataPagamento,
    String dataVencimento, double valor, bool pago, bool pagoNadata) {
  final NewFinanceController controller = Get.put(NewFinanceController());
  controller.name.value = nome;
  controller.description.value = descri;
  controller.valor.value = valor;
  controller.dueDate.value = dataVencimento;
  controller.payDate.value = dataPagamento;
  controller.ispay.value = pago;
  controller.isPayOnDate.value = pagoNadata;
}
