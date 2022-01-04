
import 'package:cefops/app/controller/studants/studant_all_info_controller.dart';
import 'package:cefops/app/views/adm/studantDetails/pages/page_forms_studants_documents.dart';
import 'package:cefops/app/views/adm/studantDetails/pages/page_studant_anddress.dart';
import 'package:cefops/app/views/adm/studantDetails/pages/page_user_infos.dart';
import 'package:cefops/app/views/studants/requeriment/page_my_requeriment.dart';
import '../pages/page_forms_studants.dart';
SetStudantDetails(int pos) {
  switch (pos) {
    case 0:
      return FormsStudants() ;
    case 1:
      return StudantAnddress();
    case 2:
      return FormsStudantsDocuments();
    case 3:
      return UserInfo();
    case 5:
      return MyRequeriments(id:StudantAllInfoController.data.studantsInfo.id.value
      );
  }
}