import 'package:cefops/Shared/Security/Controller/ErrorControlers.dart';
import 'package:cefops/Shared/Security/Repository/AuthRepository.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/views/Security/Singup.dart';
import 'package:cefops/Src/widgets/widget_FormsForLoginPage.dart';
import 'package:cefops/Src/widgets/widget_Navegation.dart';
import 'package:cefops/res.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';



final _formKey = GlobalKey<FormState>();
final userController = TextEditingController();
final passwordController = TextEditingController();
String os = Platform.operatingSystem;
bool android = false;
int colorIcons = 0xff15355C;

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;





  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
        body: Builder(builder: (BuildContext context) {
          return Container(

              color: AppColors.blue,


            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width/6,
                      ),
                      Expanded(
                        child: Container(

                          child:Image.asset(
                            Res.fundo,

                              colorBlendMode: BlendMode.modulate
                          )
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                        ),

                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height*0.02,
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
                                          print(userController.value.text);
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

              ],
            ),
          );
        }),
      ),
    );
  }
}
