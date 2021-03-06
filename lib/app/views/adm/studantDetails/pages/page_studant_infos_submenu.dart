import 'package:cefops/app/views/adm/studantDetails/controller/studant_details_controller.dart';
import 'package:cefops/app/views/adm/studantDetails/widget/widget_setstudant_details_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///Info do Aluno
class ViewInfoFromStudant extends StatelessWidget {
  const ViewInfoFromStudant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StudandDetailsController controller = StudandDetailsController.details;

    return Container(
      child: Column(
        children:<Widget> [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children:<Widget> [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff062761),
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400)),
                onPressed: () {
                  controller.navegar.value = 0;
                },
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(),
                  child: Center(
                    child: const Text("Identificação"),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.01,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff062761),
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
                onPressed: () {
                  controller.navegar.value = 1;
                },
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(),
                  child: Center(
                    child: const Text(
                      "Endereço",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.01,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff062761),
                    textStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                onPressed: () {
                  controller.navegar.value =2;
                },
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(),
                  child: Center(
                    child: const Text(
                      "Documentos",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.01,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff062761),
                    textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                onPressed: () {
                  controller.navegar.value = 0;
                },
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(),
                  child: Center(
                    child: const Text(
                      "Responsáveis",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.01,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff062761),
                    textStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                onPressed: () {
                  controller.navegar.value = 3;
                },
                child: Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(),
                  child: Center(
                    child: const Text(
                      "Usúario",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                ),
              )
            ],
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          SingleChildScrollView(
            child: Container(
              width: Get.width,
              height: Get.height * 0.54,
              child: Obx(
                () => SetStudantDetails(controller.navegar.value,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
