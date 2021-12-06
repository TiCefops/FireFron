
import 'package:cefops/Src/views/studantDetails/pages/page_forms_studants_documents.dart';
import 'package:cefops/Src/views/studantDetails/pages/page_studant_anddress.dart';

import '../pages/page_forms_studants.dart';

SetStudantDetails(int pos,{context}) {
  switch (pos) {
    case 0:
      return FormsStudants() ;
    case 1:
      return StudantAnddress();
    case 2:
      return FormsStudantsDocuments();
  }
}