
import 'package:cefops/app/data/model/adm/requeriment_type_model.dart';
import 'package:cefops/app/data/repository/adm/requeriment_types_repository.dart';

class RequerimentTypeService{
  RequerimentTypesRepository _repository=RequerimentTypesRepository();


  Future<List<RequerimentTypeModel>> getAllRequerimentsTypes(){

    return _repository.getAllRequeRequerimentType();
  }

}