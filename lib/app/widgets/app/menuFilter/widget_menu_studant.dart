
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/app/controller/app/navigator_controller.dart';
import 'package:cefops/app/controller/app/status_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

MenuStudant(context){

  return  Column( children:<Widget>[
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
            statusApp.status.title.value = "Meu Curso";
            Navigator.pop(context);
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
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text(
            'Requerimentos',
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(Icons.note_add, color: AppColors.iconColor),

          onTap: () {
            statusApp.status.selectedIndex.value = 5;
            statusApp.status.title.value = "Requerimentos";
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text(
            'Financeiro',
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(Icons.description, color: AppColors.iconColor),

          onTap: () {
            statusApp.status.selectedIndex.value = 8;
            statusApp.status.title.value = "Financeiro";
            Navigator.pop(context);
          },
        ),
      ]);



}