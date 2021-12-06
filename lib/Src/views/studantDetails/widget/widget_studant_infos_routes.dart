

import 'package:cefops/Src/views/studantDetails/pages/page_forms_studants_documents.dart';
import 'package:cefops/Src/views/studantDetails/pages/page_studant_infos_submenu.dart';
import 'package:cefops/Src/views/studantDetails/pages/page_studant_notes.dart';

SetStudantPage(int pos,{context}) {
  switch (pos) {
    case 0:
      return ViewInfoFromStudant();
    case 1:
      return ViewInfoNotesStudant();

  }
}