import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/controller/views/adm/shared/home_emplooyes_controller.dart';
import 'package:cefops/app/controller/views/adm/shared/requeriment_controller.dart';
import 'package:cefops/app/controller/views/adm/shared/requeriment_type_controller.dart';
import 'package:cefops/app/services/adm/requeriment/requeriment_service.dart';
import 'package:cefops/app/services/adm/requeriment/requeriment_types_service.dart';
import 'package:cefops/app/services/adm/studant_service.dart';
import 'package:cefops/app/widgets/views/adm/shared/requeriments/widget_dropmenu_group.dart';
import 'package:cefops/app/widgets/views/adm/shared/requeriments/widget_dropmenu_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
///
NewRequeriment(BuildContext context) {
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController obsController = TextEditingController();
  Get.lazyPut(()=>HomeEmployesController());
  RequerimentTypeController controller=RequerimentTypeController.reqType;
  RequerimentTypeService _requerimentType=RequerimentTypeService();
  _requerimentType.getAllRequerimentsTypes();

  ///Instancia de servico
  final RequerimentService _service=RequerimentService();
  final StudantService _studantService=StudantService();

  Widget cancelButton = TextButton(
    child: const Text('Canceler'),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    child: HomeEmployesController.c.updating.value ?CircularProgressIndicator():Text('Salvar'),
    onPressed: () async {
      HomeEmployesController.c.updateScreen.value=true;
      var requerimentoid=int.parse(controller.selectedType.value);
     await _service.createRequerimet(requerimentoid, RequerimentController.req.idStudant.value,
          RequerimentController.req.StudantFullName.value,
          RequerimentController.req.observertion.value,RequerimentController.req.valor.value);
      HomeEmployesController.c.updateScreenFun();
      HomeEmployesController.c.updateScreen.value=false;
      Get.back();



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
      width: Get.width / 1.9,
      child: Column(
        children: <Widget> [
          Center(
              child: Obx(
                 () {

                  return Container(
                      child: Image.network(
                          RequerimentController.req.linkPhoto.value,
                        height: Get.height*0.1,));
                }
              )),
          SizedBox(
              width: Get.width,
              child: Row(children: <Widget>[
                Container(
                  width: Get.width / 4,
                  height: Get.height * 0.076,
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
                    onChanged: (String value){

                    },
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
                      _studantService.getStudantById(cpfController.value.text);
                      RequerimentController.req.idStudant.value=
                          cpfController.value.text;
                    },
                    icon: Icon(Icons.search)),
                DropMenuGroup(),
              ])),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Container(
              width: Get.width,
              child: Row(children:<Widget> [
                Container(
                  width: Get.width / 4,
                  height: Get.height * 0.076,
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
          SizedBox(height: Get.height * 0.01),
          SizedBox(height: Get.height * 0.01),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: Get.width * 0.4,
            height: Get.height * 0.4,
            child: TextFormField(
              controller:obsController,
              onChanged: (String value){
                if (GetPlatform.isWindows) {
                  int pos = obsController.selection.start;
                  String newValue = value
                  // A
                      .replaceAll('´´a', 'á')
                      .replaceAll('``a', 'à')
                      .replaceAll('^^a', 'â')
                      .replaceAll('~~a', 'ã')
                      .replaceAll('´´A', 'Á')
                      .replaceAll('``A', 'À')
                      .replaceAll('^^A', 'Â')
                      .replaceAll('~~A', 'Ã')
                  // E
                      .replaceAll('´´e', 'é')
                      .replaceAll('``e', 'è')
                      .replaceAll('^^e', 'ê')
                      .replaceAll('´´E', 'É')
                      .replaceAll('``E', 'È')
                      .replaceAll('^^E', 'Ê')
                  // I
                      .replaceAll('´´i', 'í')
                      .replaceAll('``i', 'ì')
                      .replaceAll('^^i', 'î')
                      .replaceAll('´´I', 'Í')
                      .replaceAll('``I', 'Ì')
                      .replaceAll('^^I', 'î')
                  // O
                      .replaceAll('´´o', 'ó')
                      .replaceAll('``o', 'ò')
                      .replaceAll('^^o', 'ô')
                      .replaceAll('~~o', 'õ')
                      .replaceAll('´´O', 'Ó')
                      .replaceAll('``O', 'Ò')
                      .replaceAll('^^O', 'Ô')
                      .replaceAll('~~O', 'Õ')
                  // U
                      .replaceAll('´´u', 'ú')
                      .replaceAll('``u', 'ù')
                      .replaceAll('^^u', 'û')
                      .replaceAll('´´U', 'Ú')
                      .replaceAll('``U', 'Ù')
                      .replaceAll('^^U', 'Û');

                  /// Makes the cursor stay in the correct place
                  pos -= (value.length - newValue.length);
                  if (pos > newValue.length) {
                    pos = newValue.length;
                  }
                  obsController.selection =
                      TextSelection.fromPosition(TextPosition(offset: pos));
                  onChanged(newValue);
                } else {
                  onChanged(value);
                }
              },
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

void onChanged(String value) {
  RequerimentController.req.observertion.value=value;

}


