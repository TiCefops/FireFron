import 'package:cefops/app/data/interface/adm/finance/inetrnal/i_finances_repository.dart';
import 'package:cefops/app/data/model/adm/finance/internal/finance_model.dart';
import 'package:cefops/Shared/Security/Controller/user_controller.dart';

import 'package:cefops/shared/urls.dart';
import 'package:get/get.dart';

///
class FinanceRepository extends GetConnect implements IFinanceRepository {
  String token=UserController.user.token.value;

  @override
  Future<List<FinanceModel>> findAllFinances() async {
    final Response<List<FinanceModel>?> response =
        await get("${urls.app}/financa/interna", headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'Bearer $token',
        }, decoder: (body) {
      try{
        if (body is List) {
          return body
              .map<FinanceModel>((data) => FinanceModel.fromJson(data))
              .toList();
        }else{
          throw Exception("Falha");
        }
      }catch(e){
        print(e);
      }
    });
    if(response.hasError){

        throw Exception("Erro ao Buscar dados");

    }

    return response.body??[];
  }

  @override
  Future<FinanceModel> findFinanceById(int id) {
    // TODO: implement findFinanceById
    throw UnimplementedError();
  }

  @override
  Future<FinanceModel> pathFinance(int id) {
    // TODO: implement pathFinance
    throw UnimplementedError();
  }

  @override
  Future<FinanceModel> updateFinace(int id) {
    // TODO: implement updateFinace
    throw UnimplementedError();
  }

  @override
  Future<FinanceModel> newFinance(FinanceModel model) async {
    throw UnimplementedError();
  }
}
