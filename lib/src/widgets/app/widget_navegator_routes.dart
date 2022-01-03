import 'dart:io';

import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/Src/module/pdf/homeP.dart';
import 'package:cefops/Src/views/adm/finances/alunos/page_finance_status.dart';
import 'package:cefops/Src/views/adm/finances/interno/page_internal_finance.dart';

import 'package:cefops/Src/views/adm/secretaria/page_sigin_studant.dart';
import 'package:cefops/Src/views/adm/secretaria/page_update_news.dart';
import 'package:cefops/Src/views/adm/shared/page_home_employes.dart';
import 'package:cefops/Src/views/adm/shared/page_list_studants.dart';
import 'package:cefops/Src/views/adm/shared/page_requeriment_status.dart';
import 'package:cefops/Src/views/page_home.dart';
import 'package:cefops/Src/views/studants/page_course.dart';
import 'package:cefops/Src/views/studants/requeriment/page_requeriment_menu_types.dart';
import 'package:cefops/Src/views/studants/page_socre.dart';

getDrawerItem(int pos,{context}) {
  switch (pos) {
    case 0:
      return HomeChange();
    case 1:
      return myCourse();
    case 2:
      return NotesPage();
    case 3:
      return SiginStudant();
    case 4:
      return ListUSers();
    case 5:
      return RequerimentMenuTypes();
    case 6:
      return pdfHome();
    case 7:
      return RequerimentStatus();
    case 8:
      return FinancePage();
    case 9:
      return EditNews();
    case 10:
      return InternalFinance();
  }
}

HomeChange(){
  if(UserController.user.role.contains("Aluno")){
    return HomePage();
  }
   else{
     return EmployeesPage();
  }
}
