import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Repository/AuthRepository.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/views/Security/Page_Login.dart';
import 'package:cefops/Src/widgets/widget_FormsForLoginPage.dart';
import 'package:cefops/Src/widgets/widget_Navegation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:io' show Platform;

import '../../../res.dart';

var _controler;
final _formKey = GlobalKey<FormState>();
final UserController = TextEditingController();
final passwController = TextEditingController();
String os = Platform.operatingSystem;
bool android=false;
int widet=1;
int height=1;
int colorIcons=0xff15355C;

class loginPage_Mobile extends StatefulWidget {
  @override
  _loginPage_MobileState createState() => _loginPage_MobileState();
}

class _loginPage_MobileState extends State<loginPage_Mobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

  }

  @override
  void dispose() {
    UserController.dispose();
    passwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,


      home: Scaffold(
        backgroundColor:  Colors.black,
        body: Builder(builder: (context) {
          return Container(

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              color: Colors.white,
              child: Center(
                  child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height *0.20,
                        width: MediaQuery.of(context).size.width *0.50,
                        child: Image.asset(
                          Res.cefops1_orig,
                        ),
                        margin: EdgeInsets.only(bottom: 0.0),
                      ),
                     Container(
                       width: MediaQuery.of(context).size.width * 0.90,
                        child: LoginForms(
                            UserController,
                            "Insira Seu Usuário",
                            "Usuário",
                            "Por Favor informe seu  Usuário",
                            Icons.person,
                            false,
                            false,
                            context),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Obx(
                            () => LoginForms(
                                passwController,
                                "Insira Sua Senha",
                                "Senha",
                                "Por Favor Informe sua Senha",
                                Icons.lock,
                                statusApp.status.verSenha.value,

                                true,
                                context),
                          )),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.63,
                          ),
                          Container(

                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () async {},
                              child: Text(
                                'Esqueci a Senha',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Center(
                          child: Obx(() => Text(
                                "${statusApp.status.erros1.value}",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                          child: Obx(() => statusApp.status.loading.value
                              ? CircularProgressIndicator(
                                  backgroundColor: AppColors.background,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      AppColors.blue),
                                )
                              : FlatButton(
                            height: size.height * 0.07,
                            child: Column(
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: size.height * 0.03, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            color: AppColors.secondary,
                            textColor: AppColors.textOnSecondary,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: AppColors.blue, width: 1, style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(7)),
                            onPressed: () async {



                              if (_formKey.currentState!.validate()) {
                                statusApp.status.loading.value = true;

                                  await Login(userController.text.toString(), passwController.toString());



                                if (ErroController.error.ok == true) {
                                  statusApp.status.loading.value = false;

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyApp()),
                                  );
                                }
                              } else {}
                            },
                          )
                          )
                      )
                    ],
                  ),
                ),
              )),
            ),
          );
        }),
      ),
    );
  }
}