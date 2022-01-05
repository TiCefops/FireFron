///interface
abstract class IFinanceRepository {
  ///busca todas as financas
  Future <List>findAllFinances();
  ///Busca por finanças por id
    Future findFinanceById();
    Future updateFinace();
    Future pathFinance();


}