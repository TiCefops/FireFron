import 'package:cefops/app/module/exceptions/http/exception_request_error.dart';
import 'package:cefops/app/views/adm/finances/interno/widgets/widget_new_finance_internal.dart';
///
NewFinance rotutesPageFinance(int pos) {
  switch (pos) {
    case 0:
      return const NewFinance();
  }
  throw Exception("Erro ao Abrir Pagina");
}