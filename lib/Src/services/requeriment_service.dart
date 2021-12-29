
import 'package:cefops/Src/model/adm/requeriment_model.dart';
import 'package:cefops/Src/repository/adm/RequerimentsRepository.dart';

///servicos dos requerimentos
class RequerimentService{

  Future<dynamic> CreateRequerime(int requerimentID,String alunoID,String nomeAluno,
      String observacao)async{
    return await CreateRequeriment(requerimentID, alunoID, nomeAluno, observacao);

  }
  Future<List<RequerimentModel>> GetRequerimentsById(String id)async{
    return await GetRequerimentById(id: id);

  }
  Future<dynamic> UpdateRequeriment(int id,String resp,String status,bool isUpdate)async{
    return await updateReq(id, resp, status, isUpdate);

  }
  Future<List<RequerimentModel>> GetALlRequeriments()async{
    return GetAllRequeriment();
  }

}