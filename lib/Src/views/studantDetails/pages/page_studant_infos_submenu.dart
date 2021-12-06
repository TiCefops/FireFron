import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/views/studantDetails/controller/controller_studantDetails.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_setStudant_details_routes.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_studant_infos_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewInfoFromStudant extends StatelessWidget {
  const ViewInfoFromStudant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = StudandDetailsController.details;

    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
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
                () => SetStudantDetails(controller.navegar.value,
                    context: context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
