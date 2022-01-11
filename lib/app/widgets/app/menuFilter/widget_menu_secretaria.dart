import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/app/controller/app/status_app_controller.dart';
import 'package:flutter/material.dart';

MenuSec() {
  return Container(
      color: AppColors.primary,
      child: ListView(
          children: <Widget>[

            ListTile(
              title: Text(
                'Listar Alunos',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.person_search,
                color: AppColors.iconColor,
              ),
              onTap: () {
                statusApp.status.selectedIndex.value = 4;
                statusApp.status.title.value = "Financeiro";
              },
            ),
            ListTile(
              title: Text(
                'Status Financeiro',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.request_quote,
                color: AppColors.iconColor,
              ),
              onTap: () {
                statusApp.status.selectedIndex.value = 4;
                statusApp.status.title.value = "Status Financeiro";
              },
            ),
            ListTile(
              title: Text(
                'Postagem',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(Icons.description, color: AppColors.iconColor),

              onTap: () {
                statusApp.status.selectedIndex.value = 4;
                statusApp.status.title.value = "Postagem";
              },
            ),

          ]
      )

  );
}
