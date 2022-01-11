

import 'package:cefops/app/data/interface/adm/finance/inetrnal/i_finances_repository.dart';
import 'package:cefops/app/data/model/adm/finance/internal/finance_model.dart';
import 'package:cefops/app/data/repository/adm/adm/finance/finance_repository.dart';
import 'package:get/get.dart';

class FinanceInternalController extends GetxController with StateMixin{
late final IFinanceRepository _iFinanceRepository;
@override
  void onInit() {
    super.onInit();
    _iFinanceRepository =FinanceRepository();
  }


  Future<List<FinanceModel>> getAllFinances()async{
  change([],status: RxStatus.loading());
  try{
    final List<FinanceModel> data= await _iFinanceRepository.findAllFinances();
    change(data,status: RxStatus.success());
    return data;

  }catch(e){
    change([],status: RxStatus.error());
    throw Exception("Error ao buscar dados");

  }


  }
  ///busca os dados
Future<FinanceModel> newFinances(FinanceModel dados)async{
  change([],status: RxStatus.loading());
  try{
    final FinanceModel data= await _iFinanceRepository.newFinance(dados);
    change(data,status: RxStatus.success());
    return data;

  }catch(e){
    change([],status: RxStatus.error());
    throw Exception("Error ao enviar dados");
  }


}

}