
import 'package:cefops/Src/views/adm/financeiro/interno/controller/new_finance_controller.dart';
import 'package:cefops/Src/views/adm/financeiro/interno/widgets/widget_routes_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
 NewFinanceInterna(BuildContext context) {
   var controller=NewFinanceInternalController.data;

  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      controller.deleteAll();
      Get.back();    },
  );
  Widget continueButton = TextButton(
    child: Text("Salvar"),
    onPressed: () {

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Container(
      child: Column(

        children: [
          Container(
            margin: EdgeInsets.only(left: 35),
            child: Obx(
                    () {
                  return Text("${controller.nome}",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.end,);
                }
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary:  Colors.orange
                ),
                onPressed: (){
                             },
                child: Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                  ),
                  child: Center(
                    child: Text("Abrir Fluxo"),
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
                  decoration: BoxDecoration(
                  ),
                  child: Center(
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
