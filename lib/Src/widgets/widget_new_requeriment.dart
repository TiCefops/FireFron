import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/home_emplooyes_controller.dart';
import 'package:cefops/Src/controller/requerimentController.dart';
import 'package:cefops/Src/controller/requerimentTypeController.dart';
import 'package:cefops/Src/repository/adm/RequerimentsRepository.dart';
import 'package:cefops/Src/repository/adm/requerimentTypesRepository.dart';
import 'package:cefops/Src/repository/aluno/AlunosRepository.dart';
import 'package:cefops/Src/views/adm/page_home_employes.dart';
import 'package:cefops/Src/widgets/widget_dropmenu_grup.dart';
import 'package:cefops/Src/widgets/widget_Navegation.dart';
import 'package:cefops/Src/widgets/widget_dropmenu_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


showAlertDialog(BuildContext context) {
  final cpfController = TextEditingController();
  final nameController = TextEditingController();
  final observaao = TextEditingController();
  var controller=RequerimentTypeController.reqType;


  final size = MediaQuery.of(context).size;
  Widget cancelButton = TextButton(
    child: const Text('Canceler'),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    child: HomeEmployesController.c.updating.value ?CircularProgressIndicator():Text('Salvar'),
    onPressed: () {
      var requerimentoid=int.parse(controller.selectedType.value);
      CreateRequeriment(requerimentoid, RequerimentController.req.idStudant.value,
          RequerimentController.req.StudantFullName.value,
          RequerimentController.req.observertion.value);
      HomeEmployesController.c.updateScreen.value=true;
      HomeEmployesController.c.updateScreenFun();
          Get.to(MyApp());


    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Center(
      child: Text(
        'Cadastrando um Novo Requerimento',
        style: TextStyle(color: Colors.red),
      ),
    ),
    content: Container(
      width: size.width / 1.9,
      child: Column(
        children: <Widget> [
          Center(
              child: Obx(
                 () {

                  return Container(
                      child: Image.network(
                          RequerimentController.req.linkPhoto.value,
                        height: size.height*0.1,));
                }
              )),
          SizedBox(
              width: size.width,
              child: Row(children: [
                Container(
                  width: size.width / 4,
                  height: size.height * 0.076,
                  child: TextFormField(
                    controller: cpfController,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      labelText: 'CPF Do aluno',
                      labelStyle: TextStyles.titleRegular,
                      hintText: 'Cpf',
                      hintStyle: TextStyles.input,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'error';
                      }

                      return null;
                    },
                    maxLines: 1,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      GetStudantById(cpfController.value.text);
                      RequerimentController.req.idStudant.value=
                          cpfController.value.text;
                      print(RequerimentController.req.idStudant.value);
                    },
                    icon: Icon(Icons.search)),
                DropMenuGrup(),
              ])),
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
              width: size.width,
              child: Row(children: [
                Container(
                  width: size.width / 4,
                  height: size.height * 0.076,
                  child: Obx(() {
                    return TextFormField(
                      controller: TextEditingController()
                        ..text = '${RequerimentController.req.StudantFullName}',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        labelText: 'Nome Do aluno',
                        labelStyle: TextStyles.titleRegular,
                        hintText: 'Nome',
                        hintStyle: TextStyles.input,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'error';
                        }
                        return null;
                      },
                      maxLines: 1,
                    );
                  }),
                ),
                DropMenuItems(),
              ])),
          SizedBox(height: size.height * 0.01),
          SizedBox(height: size.height * 0.01),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: size.width * 0.4,
            height: size.height * 0.4,
            child: TextFormField(
              controller: TextEditingController()
                ..text = '${RequerimentController.req.observertion}',
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                fillColor: Colors.black,
                labelText: 'Observação',
                labelStyle: TextStyles.titleRegular,
                hintText: 'O aluno...',
                hintStyle: TextStyles.input,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'error';
                }
                return null;
              },
              maxLines: 12,
            ),
          )
        ],
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
