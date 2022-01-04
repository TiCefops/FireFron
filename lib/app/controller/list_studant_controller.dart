
import 'package:cefops/Shared/Security/Repository/auth_repository.dart';
import 'package:get/get.dart';
///controla menu lateral da listagem de alunos
class ListStudantController extends GetxController{
  static ListStudantController data =ListStudantController();

  RxInt pageSize=15.obs;
  RxInt totalPages=0.obs;
  RxInt totalElements=0.obs;
  RxInt size=0.obs;
  RxInt number=0.obs;
  RxInt newTotalElement=15.obs;
  RxInt newPage=0.obs;
  RxString newDirection="asc".obs;
  RxString searchData="".obs;
  RxString defaultConfigSearch="Nome".obs;








}