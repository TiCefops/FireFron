import 'package:cefops/app/controller/home_emplooyes_controller.dart';
import 'package:cefops/app/data/model/adm/requeriment_model.dart';
import 'package:cefops/app/data/repository/adm/requeriment_repository.dart';
import 'package:get/get.dart';

///servicos dos requerimentos
class RequerimentService{
  RequerimentRepository _repository=RequerimentRepository();

  Future<dynamic> createRequerimet(int requerimentID,String alunoID,String nomeAluno,
      String observacao,double valor)async{
    var requerimt= await _repository.createRequeriment(requerimentID, alunoID, nomeAluno, observacao,valor);
    Get.find<HomeEmployesController>().updating.value=false;
    return requerimt;

  }
  Future<List<RequerimentModel>> getRequerimentsById(String id)async{
    return await _repository.getRequerimentById(id: id);

  }
  Future<dynamic> updateRequeriment(int id,String resp,String status,bool isUpdate)async{
    return await _repository.updateRequeriment(id, resp, status, isUpdate);

  }
  Future<List<RequerimentModel>> getALlRequeriments()async{
    return _repository.getAllRequeriment();
  }

}