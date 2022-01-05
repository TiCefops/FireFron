import 'package:cefops/app/widgets/views/adm/finances/internal/widget_new_finance_internal.dart';
///
NewFinance rotutesPageFinance(int pos) {
  switch (pos) {
    case 0:
      return const NewFinance();
  }
  throw Exception("Erro ao Abrir Pagina");
}