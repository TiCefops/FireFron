import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Repository/AuthRepository.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/views/Security/Page_Login.dart';
import 'package:cefops/Src/widgets/widget_FormsForLoginPage.dart';
import 'package:cefops/Src/widgets/widget_Navegation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

import '../../../res.dart';
import 'Singup.dart';

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
                      SizedBox(
                        height:Get.height*0.02 ,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Image.asset(
                          Res.logoV4,

                        ),
                      ),

                      SizedBox(
                        height: Get.height*0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: LoginForms(
                            userController,
                            "Insira Seu E-mail",
                            "E-mail",
                            "Por Favor informe seu  E-mail",
                            Icons.person,
                            false,
                            false,
                            context),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Obx(
                                () => LoginForms(
                                passwordController,
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
                            width: MediaQuery.of(context).size.width * 0.25,
                          ),
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () async {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Singup()),
                                );

                              },
                              child: Text(
                                'Esqueci a Senha',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.019,
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
                            backgroundColor: AppColors.blue,
                            valueColor:AlwaysStoppedAnimation<Color>(
                              AppColors.orange,


                            ),
                          )
                              : FlatButton(
                            height: size.height * 0.07,
                            child: Column(
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: size.height * 0.03,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            color: AppColors.blue,
                            textColor: AppColors.textOnPrimary,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: AppColors.blue,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(7)),
                            onPressed: () async {

                              if (_formKey.currentState!.validate()) {
                                statusApp.status.loading.value = true;
                                await Login(userController.value.text,
                                    passwordController.value.text);
                                if (ErroController.error.ok == true) {
                                  statusApp.status.loading.value = false;

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder:(BuildContext context)
                                        => MyApp()),
                                  );
                                }
                              } else {}
                            },
                          ))),
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