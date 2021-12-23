import 'package:cefops/Src/controller/studants/studant_info_controller.dart';
import 'package:cefops/Src/views/studantDetails/controller/user_controller.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_dropdown_permission.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
///
class UserInfo extends StatelessWidget {
  ///
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey=GlobalKey();
     UserControllerForStudant info =Get.put(UserControllerForStudant());


    return Container(
      child: Form(
        key:globalKey,
          child: Column(
            children: <Widget>[
              Row(
                children:<Widget> [
                  Container(
                    width: Get.width*0.4,
                    child: TextFormField(
                      initialValue: "${StudantInfoController.data.email}",
                      keyboardType:TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label:const Text("E-mail"),
                      ),
                        onChanged: (String? value){
                        globalKey.currentState!.validate();
                        globalKey.currentState!.save();
                        },
                      onSaved: (String?value){
                        StudantInfoController.data.email.value=value!;
                      },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "E-mail não pode ser vazio";
                          }else if(!value.isEmail){
                            return("E-mail Invalido");
                          }
                          return null;
                        },
                    ),
                  ),
                  DropDownPermission()
                ],

              ),
              Row(
                children:<Widget> [
                  Container(
                    width: Get.width*0.4,
                    child: TextFormField(
                      initialValue: "************",

                      decoration: InputDecoration(
                        label:const Text("Senha"),
                      ),
                      onChanged: (String? value){
                        globalKey.currentState!.validate();
                        globalKey.currentState!.save();
                      },
                      onSaved: (String?value){
                      info.password.value=value!;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "A senha esta em branco";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ), SizedBox(
                height: Get.height * 0.01,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff062761),
                    textStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                onPressed: () {
                },
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(),
                  child: Center(
                    child: const Text(
                      "Atualizar",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
