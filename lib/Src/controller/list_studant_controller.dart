
import 'package:cefops/Shared/Security/Repository/AuthRepository.dart';
import 'package:get/get.dart';

class ListStudantController extends GetxController{
  static ListStudantController data =ListStudantController();

  var pageSize=15.obs;
  var totalPages=0.obs;
  var totalElements=0.obs;
  var size=0.obs;
  var number=0.obs;
  var newTotalElement=15.obs;
  var newPage=0.obs;
  var newDirection="asc".obs;
  var searchData="".obs;
  var defaultConfigSearch="Nome".obs;








}