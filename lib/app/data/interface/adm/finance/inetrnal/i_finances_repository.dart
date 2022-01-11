import 'package:cefops/app/data/model/adm/finance/internal/finance_model.dart';

///interface
abstract class IFinanceRepository {
  ///busca todas as financas
  Future <List<FinanceModel>>findAllFinances();
  ///Busca por finanças por id
    Future  <FinanceModel> findFinanceById(int id);
    Future <FinanceModel>updateFinace(int id);
    Future <FinanceModel>pathFinance(int id);
    Future <FinanceModel> newFinance(FinanceModel model);


}