import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Src/views/studantDetails/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

///
class DropDownPermission extends StatelessWidget {
  ///
  const DropDownPermission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<UserControllerForStudant>();

    return Obx(
            () {
          return DropdownButton<String>(
            value: controller.permission.value.toString(),
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
              controller.setPermissionForApi(newValue!.toString()) ;
              controller.permission.value=newValue;
            },
            items: UserController.user.role.contains("ADM")? <String>['Aluno','Pofessor', 'Secretaria', 'Diretoria',
              "Financeiro","ADM","Gerência","FinanceiroAdm"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            })
                .toList(): <String>['Aluno','Pofessor']
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
