

import 'package:cefops/app/views/adm/studantDetails/pages/page_studant_infos_submenu.dart';
import 'package:cefops/app/views/adm/studantDetails/pages/page_studant_notes.dart';
import 'package:cefops/app/views/adm/studantDetails/pages/page_studant_requeriment.dart';

SetStudantPage(int pos,{required String id}) {
  switch (pos) {
    case 0:
      return ViewInfoFromStudant();
    case 1:
      return ViewInfoNotesStudant();
    case 5:
      return StuddantRequeriment(id);


  }
}