
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/controller/navigatorController.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/js.dart';

MenuStudant(){

  return  <Widget>[
        ListTile(
          leading: Icon(
            Icons.book,
            color: AppColors.background,
          ),
          title: Text(
            'Meu Curso',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            statusApp.status.selectedIndex.value = 1;

            onSelectItem(context);
            statusApp.status.title.value = "Meu Curso";
          },
        ),
        ListTile(
          title: Text(
            'Minhas Notas',
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            Icons.calendar_view_month,
            color: AppColors.iconColor,
          ),

          onTap: () {
            statusApp.status.selectedIndex.value = 2;
            statusApp.status.title.value = "Minhas Notas";
          },
        ),
        ListTile(
          title: Text(
            'Requerimentos',
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(Icons.note_add, color: AppColors.iconColor),

          onTap: () {
            statusApp.status.selectedIndex.value = 3;

            statusApp.status.title.value = "Requerimentos";
          },
        ),
        ListTile(
          title: Text(
            'Financeiro',
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(Icons.description, color: AppColors.iconColor),

          onTap: () {
            statusApp.status.selectedIndex.value = 4;
            statusApp.status.title.value = "Financeiro";
          },
        ),
      ];



}