import 'package:cefops/Shared/Security/Controller/error_controler.dart';
import 'package:cefops/Shared/Security/Repository/auth_repository.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/app/controller/status_app_controller.dart';
import 'package:cefops/app/views/Security/page_login.dart';
import 'package:cefops/app/widgets/security/widget_forms_for_login_page.dart';
import 'package:cefops/app/widgets/app/widget_navegation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res.dart';
import 'page_singup.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController UserController = TextEditingController();
final TextEditingController passwController = TextEditingController();


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
AuthRepository _service=AuthRepository();
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      home: Scaffold(
        backgroundColor:  Colors.black,
        body: Builder(builder: (BuildContext context) {
          return Container(

            width: Get.width,
            height: Get.height,
            child: Container(
              color: Colors.white,
              child: Center(
                  child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children:<Widget> [

                      Container(
                        height: Get.height*0.3,
                        width:Get.width / 2,
                        child: Image.asset(
                          Res.logoV4,

                        ),
                      ),


                      Container(
                        width: Get.width *0.9,

                        child: FormsForLoginPage(
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
                        height: Get.height * 0.02,
                      ),
                      Container(
                          width: Get.width *0.9,
                          child: Obx(
                                () => FormsForLoginPage(
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
                            width: Get.width * 0.25,
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
                                  fontSize: Get.height *
                                      0.019,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Center(
                          child: Obx(() => Text(
                            "${statusApp.status.erros1.value}",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ))),
                      SizedBox(
                        height: Get.height * 0.03,
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
                            height: Get.height * 0.07,
                            child: Column(
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: Get.height * 0.03,
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
                                await _service.login(userController.value.text,
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