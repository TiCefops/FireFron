import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/controller/views/adm/shared/list_studant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ListStudantLeftMenu extends StatelessWidget {
  const ListStudantLeftMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controllerViewer=ListStudantController.data;
    var controlleDataInfos = ListStudantController.data;
    return Column(
      children: <Widget>[
        Container(

          child: Column(
            children: <Widget>[
              Text("Organizar de",style: TextStyles.titleListTile2,),
              SizedBox(height: Get.height*0.01,),
              Row(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      controllerViewer.newDirection.value="ASC";

                    },
                    child: Text(
                      "AZ",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColors.blue),
                    ),
                  ),
                  SizedBox(
                    width: Get.width*0.01,
                  ),
                  TextButton(
                    onPressed: () {
                      controllerViewer.newDirection.value="DESC";
                    },
                    child: Text(
                      "ZA",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text("Quantos studantsListViewer por Página",
                style: TextStyles.titleListTile2,),
              SizedBox(height: Get.height*0.01,),

              Row(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      controllerViewer.newTotalElement.value=15;


                    },
                    child: Text(
                      "15",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColors.blue),
                    ),
                  ),
                  SizedBox(
                    width: Get.width*0.01,
                  ),
                  TextButton(
                    onPressed: () {
                      controllerViewer.newTotalElement.value=30;},
                    child: Text(
                      "30",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColors.blue),
                    ),
                  ),
                  SizedBox(
                    width: Get.width*0.01,
                  ),
                  TextButton(
                    onPressed: () {
                      controllerViewer.newTotalElement.value=45;
                    },
                    child: Text(
                      "45",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColors.blue),
                    ),
                  ),
                  SizedBox(
                    width: Get.width*0.01,
                  ),
                  TextButton(
                    onPressed: () {
                      controllerViewer.newTotalElement.value=60;},
                    child: Text(
                      "60",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text("Ir para Página",style: TextStyles.titleListTile2),
              SizedBox(height: Get.height*0.01,),

              Container(
                width: Get.width,
                height: Get.height*0.04,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: TextButton(

                        onPressed: () {},
                        child: Text(
                          "1",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(

                          backgroundColor:
                          MaterialStateProperty.all(AppColors.blue),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: Get.height*0.5,
        ),

        Flexible(
          flex: 2,
          child: Container(
            width: Get.width * 0.13,
            height: Get.height * 0.047,
            color: AppColors.blue,
            child: Obx(() => Center(
                child: Text(
                  "Mostrando: "
                      "${controlleDataInfos.pageSize} de "
                      "${controlleDataInfos.totalElements}",
                  style: TextStyles.titleListTile2,
                ))),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            width: Get.width * 0.13,
            height: Get.height * 0.047,
            color: AppColors.menuColor,
            child: Obx(() => Center(
                child: Text(
                  "Pagina: "
                      "${controlleDataInfos.number} de "
                      "${controlleDataInfos.totalPages}",
                  style: TextStyles.titleListTile2,
                ))),
          ),
        )
      ],

    );
  }
}
