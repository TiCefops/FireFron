import 'package:cefops/app/controller/studants/studant_info_controller.dart';
import 'package:cefops/app/views/adm/studantDetails/controller/studant_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownCivilState extends StatelessWidget {
  const DropDownCivilState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller=StudandDetailsController.details;
    return Obx(
            () {
          return DropdownButton<String>(
            value: controller.civilState.value,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(
                color: Colors.black
            ),
            underline: Container(
              height: 2,
              color: Colors.blueAccent,
            ),
            onChanged: (String? newValue) {

              controller.civilState.value = newValue!;
              StudantInfoController.data.stsCivil.value=newValue;

            },
            items: <String>['Estado Civil','Solteiro', 'Casado','Viúvo','Divorciado','Separado',]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            })
                .toList(),
          );
        }
    );
  }
}
