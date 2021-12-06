import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:flutter/material.dart';

onSelectItem(context) {
  statusApp.status.selectedIndex.value;
  Navigator.of(context).pop();
}

MenuDescicion(role) {
  print("iniciando tomada de descisão");
  if (role=="ADM") {
    statusApp.status.adm.value=true;
  }
  if (role=="Aluno") {
    statusApp.status.aluno.value=true;
  }
  if (role=="Financeiro") {
    statusApp.status.financeiro.value=true;
  }
  if (role=="Secretaria") {
    statusApp.status.secretaria.value=true;
  }


}

