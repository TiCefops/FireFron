import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/app/module/pdf/homeP.dart';
import 'package:cefops/app/views/adm/finances/interno/page_finance_internal_list.dart';
import 'package:cefops/app/views/studants/page_finance_studant.dart';
import 'package:cefops/app/views/adm/finances/interno/page_new_internal_finance.dart';
import 'package:cefops/app/views/adm/secretaria/page_update_news.dart';
import 'package:cefops/app/views/adm/shared/page_home_employes.dart';
import 'package:cefops/app/views/adm/shared/page_list_studants.dart';
import 'package:cefops/app/views/adm/shared/page_requeriment_status.dart';
import 'package:cefops/app/views/studants/page_home_studant.dart';
import 'package:cefops/app/views/studants/page_course.dart';
import 'package:cefops/app/views/studants/page_socre.dart';
import 'package:cefops/app/views/studants/page_requeriment_menu_types.dart';

import 'package:flutter/material.dart';
///Rotas de menus
Widget getDrawerItem(int pos) {
  switch (pos) {
    case 0:
      return homeChange();
    case 1:
      return MyCourse();
    case 2:
      return ScoreStudantPage();
    // case 3:
    //   return SiginStudant();
    case 4:
      return const ListUSers();
    case 5:
      return const RequerimentMenuTypes();
    case 6:
      return const pdfHome();
    case 7:
      return const RequerimentStatus();
    case 8:
      return const FinanceStudantPage();
    case 9:
      return const UpdateNews();
    case 10:
      return const NewInternalFinance();
    case 11:
      return const FinanceInternalList();
  }
  return Container(
    child: Center(
      child: Text("Error"),
    ),
  );
}
///detecta tipo de usuário
Widget homeChange(){
  if(UserController.user.role.contains("Aluno")){
    return const HomePageStudant();
  }

     return const EmployeesPage();

}
