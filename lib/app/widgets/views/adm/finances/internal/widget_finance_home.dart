import 'package:cefops/app/controller/views/adm/finances/internal/new_finance_controller.dart';
import 'package:cefops/app/widgets/views/adm/finances/internal/widget_routes_pages.dart';
import 'package:cefops/shared/themes/app_textstayle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
 NewFinanceInternal(BuildContext context) {
   NewFinanceInternalController controller=NewFinanceInternalController.data;

  Widget cancelButton = TextButton(
    child: const Text("Cancelar"),
    onPressed: () {
      controller.deleteAll();
      Get.back();    },
  );
  Widget continueButton = TextButton(
    child: const Text("Salvar"),
    onPressed: () {

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Container(
      child: Column(

        children:<Widget> [
          Container(
            margin: const EdgeInsets.only(left: 35),
            child: Text("Novo Fluxo",
                    style: TextStyles.titleHome)
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: Get.width*0.02,
              ),
            ],
          ),
          SizedBox(
            height:Get.height*0.01 ,
          ),
          SingleChildScrollView(
            child: Container(
              width: Get.width*0.7,
              height: Get.height*0.64,
              child: Obx(
                    () => rotutesPageFinance(controller.page.value),
              ),
            ),
          )
        ],
      ),
    ),

    actions: <Widget>[
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
