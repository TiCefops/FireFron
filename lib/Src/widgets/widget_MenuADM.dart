import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:flutter/material.dart';

MenuADM(){
  return Container(
      color: AppColors.primary,
      child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Cadastrar Aluno',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.person_add,
                color: AppColors.iconColor,
              ),
              onTap: () {
                statusApp.status.selectedIndex.value = 4;
                statusApp.status.title.value = "Financeiro";
              },
            ),
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
            ListTile(
              title: Text(
                'Cadastrar Aluno',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.person_add,
                color: AppColors.iconColor,
              ),
              onTap: () {
                statusApp.status.selectedIndex.value = 4;
                statusApp.status.title.value = "Financeiro";
              },
            ),
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



