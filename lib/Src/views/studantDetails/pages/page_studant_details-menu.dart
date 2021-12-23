
import 'package:cefops/Src/controller/studants/studant_anddress_controller.dart';
import 'package:cefops/Src/controller/studants/studant_info_controller.dart';
import 'package:cefops/Src/views/studantDetails/controller/documents_controller.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_studant_infos_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cefops/Src/controller/status.dart';


AlunoDetails(BuildContext context,bool usuer) {
  StudantAnddressController endereco=Get.put(StudantAnddressController());

  Widget cancelButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      StudantInfoController.data.clearAll();
      DocumentsController.data.deleteAllData();
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

        children: <Widget> [
          Container(
            margin: EdgeInsets.only(left: 35),
            child: Obx(
              () {
                return Text("${StudantInfoController.data.fullName}",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.end,);
              }
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:  Colors.orange
                ),
                onPressed: (){
                statusApp.status.navegar.value=0;              },
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                  ),
                  child: Center(
                    child: Text("Info"),
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
                statusApp.status.navegar.value=1;


                },
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                  ),
                  child: Center(
                    child: Text("Notas"),
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
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(

                  ),
                  child: Center(
                    child: Text("Diario"),
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
                  width: Get.width*0.07,
                  height: 40,
                  decoration: BoxDecoration(

                  ),
                  child: Center(
                    child: Text("Financeiro",style: TextStyle(
                      overflow: TextOverflow.fade
                    ),),
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
                  statusApp.status.navegar.value = 5;

                },
                child: Container(
                  width: Get.width*0.09,
                  height: 40,
                  decoration: BoxDecoration(

                  ),
                  child: Center(
                    child: Text("Requerimentos"),
                  ),
                ),
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
              () => SetStudantPage(statusApp.status.navegar.value,
              context: context),
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
