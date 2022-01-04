import 'package:cefops/Shared/Security/Controller/error_controler.dart';
import 'package:cefops/Shared/Security/Services/auth_service.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/app/controller/status_app_controller.dart';
import 'package:cefops/app/views/Security/page_singup.dart';
import 'package:cefops/app/widgets/app/widget_navegation.dart';
import 'package:cefops/app/widgets/security/widget_forms_for_login_page.dart';
import 'package:cefops/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final TextEditingController userController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
///
class loginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<loginPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

final AuthService _service=AuthService();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
        body: Builder(builder: (BuildContext context) {
          return Container(
            color: AppColors.blue,
            width: Get.width,
            height: Get.height,
            child: Stack(
              children:<Widget> [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Container(
                      width: Get.width / 6,
                    ),
                    Expanded(
                      child: Container(
                          child: Image.asset(Res.fundo,
                              colorBlendMode: BlendMode.modulate)),
                    )
                  ],
                ),
                Center(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  width: Get.width * 0.4,
                  height: Get.height * 0.7,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        SizedBox(
                          height: Get.height / 4,
                          width: Get.width / 5,
                          child: Image.asset(
                            Res.logoV4,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        SizedBox(
                          width: Get.width / 3,
                          child: formsForLoginPage(
                              userController,
                              "E-mail",
                              "E-mail",
                              "Por Favor informe seu  E-mail",
                              Icons.person,
                              context, isobscure: false,icon2:  false,),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        SizedBox(
                            width: Get.width / 3,
                            child: Obx(
                              () => formsForLoginPage(
                                  passwordController,
                                  "Senha",
                                  "Senha",
                                  "Por Favor Informe sua Senha",
                                  Icons.lock,
                                  context, icon2: true,
                                  isobscure: statusApp.status.verSenha.value),
                            ),),
                        Row(
                          children: <Widget>[
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
                                    fontSize:
                                        Get.height *
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.orange,
                                    ),
                                  )
                                : FlatButton(
                                    height: Get.height * 0.07,
                                    child: Column(
                                      children:<Widget> [
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
                                        borderRadius:
                                            BorderRadius.circular(7)),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        statusApp.status.loading.value = true;
                                        await _service.login(email: userController.text,
                                            password: passwordController.value.text);
                                        if (ErroController.error.ok == true) {
                                          statusApp.status.loading.value =
                                              false;

                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        MyApp()),
                                          );
                                        }
                                      } else {}
                                    },
                                  ))),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          );
        }),
      ),
    );
  }
}
