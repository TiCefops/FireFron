import 'dart:io';

import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/module/pdf/homeP.dart';
import 'package:cefops/Src/views/adm/financeiro/interno/page_internal_finance.dart';
import 'package:cefops/Src/views/adm/page_home_employes.dart';
import 'package:cefops/Src/views/adm/financeiro/alunos/page_finance_status.dart';
import 'package:cefops/Src/views/adm/secretaria/page_list_studants.dart';
import 'package:cefops/Src/views/adm/compartilhada/page_requeriment_status.dart';
import 'package:cefops/Src/views/adm/secretaria/page_sigin_studant.dart';
import 'package:cefops/Src/views/adm/secretaria/page_update_news.dart';
import 'package:cefops/Src/views/page_Home.dart';
import 'package:cefops/Src/views/studants/page_Course.dart';
import 'package:cefops/Src/views/studants/page_Requeriment.dart';
import 'package:cefops/Src/views/studants/page_Socre.dart';

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
      return RequeriViews();
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
  if(statusApp.status.aluno==true){
    return HomePage();
  }
   else{
     return EmployeesPage();
  }
}
