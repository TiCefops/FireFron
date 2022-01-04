import 'package:cefops/app/views/adm/finances/interno/controller/new_finance_controller.dart';
import 'package:cefops/app/views/adm/finances/interno/widgets/widget_routes_pages.dart';
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
            child: Obx(
                    () {
                  return Text("${controller.nome}",
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.end,);
                }
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary:  Colors.orange
                ),
                onPressed: (){
                             },
                child: Container(
                  width: 80,
                  height: 60,
                  decoration: const BoxDecoration(
                  ),
                  child: const Center(
                    child: const Text("Abrir Fluxo"),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width*0.01,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary:  Colors.orange
                ),
                onPressed: (){
                           },
                child: Container(
                  width: 80,
                  height: 60,
                  decoration: const BoxDecoration(
                  ),
                  child: const Center(
                    child: Text("Fechar Fluxo"),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width*0.01,
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
