import 'dart:io';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/model/model_publication.dart';

import 'package:cefops/Src/widgets/widget_NavegatorRoutes.dart';

import 'package:cefops/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';


final ismobiles = GetPlatform.isMobile;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<PostModel> futurePost;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CEFOPS DIGITAL',
      home: MyHomePage(title: 'CEFOPS DIGITAL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? title;

  const MyHomePage({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.menuColor,
          title: Center(
              child: Obx(
            () => Text(
              statusApp.status.title.value,
              textAlign: TextAlign.center,
            ),
          )),
          actions: <Widget>[
            Center(
              child: Image.asset(Res.logo_branco_Laranja),
            ),
          ],
        ),
        drawer: Drawer(
          child:  Container(
              color: AppColors.menuColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: AppColors.primary),
                    accountName: Text(
                        "${UserController.user.Fullname} "),
                    accountEmail: Text("${UserController.user.email}"),
                    currentAccountPicture: Center(
                      child: CircleAvatar(
                        child: Image.network("${UserController.user.photo}"),
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.background,
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    leading: Icon(
                      Icons.home,
                      color: AppColors.iconColor,
                    ),
                    title: const Text(
                      'Início',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {

                      statusApp.status.selectedIndex.value = 0;
                      statusApp.status.title.value = "Início";
                      Navigator.pop(context);


                    },
                  ),

                  if (UserController.user.role.contains("Aluno")||UserController.user.role.contains("ADM"))
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
                  if (UserController.user.role.contains("Aluno")||UserController.user.role.contains("ADM"))
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
                  if (UserController.user.role.contains("Aluno")||UserController.user.role.contains("ADM"))
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
                  if (UserController.user.role.contains("Aluno")||UserController.user.role.contains("ADM"))
                    ListTile(
                      title: Text(
                        'Financeiro',
                        style: TextStyle(color: Colors.white),
                      ),
                      leading:
                          Icon(Icons.description, color: AppColors.iconColor),
                      onTap: () {
                        statusApp.status.selectedIndex.value = 10;
                        statusApp.status.title.value = "Financeiro";
                        Navigator.pop(context);
                      },
                    ),

                  //Fim da area aluno

                  //Inicio area secretaria
                  if (UserController.user.role.contains("secretaria")||UserController.user.role.contains("ADM"))
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
                        statusApp.status.selectedIndex.value = 3;
                        statusApp.status.title.value = "Cadastrar Aluno";
                        Navigator.pop(context);
                      },
                    ),
                  if (UserController.user.role.contains("secretaria")||UserController.user.role.contains("ADM"))

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
                        statusApp.status.title.value = "Listar Alunos";
                        Navigator.pop(context);
                      },
                    ),

                  if (UserController.user.role.contains("secretaria")||UserController.user.role.contains("ADM"))

                    ListTile(
                      title: Text(
                        'Postagem',
                        style: TextStyle(color: Colors.white),
                      ),
                      leading:
                          Icon(Icons.description, color: AppColors.iconColor),
                      onTap: () {
                        statusApp.status.selectedIndex.value = 9;
                        statusApp.status.title.value = "Postagem";
                        Navigator.pop(context);
                      },
                    ),

                  ListTile(
                    title: Text(
                      'Sair',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Icon(
                      Icons.exit_to_app,
                      color:AppColors.iconColor,
                    ),
                    onTap: () {
                      exit(0);
                    },
                  ),
                ],
              ),
            ),
          ),

        body: Obx(
          () => getDrawerItem(statusApp.status.selectedIndex.value,
              context: context),
        ));
  }
}

