import 'package:cefops/app/views/adm/finances/interno/controller/new_finance_controller.dart';
import 'package:cefops/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
class DropdownFinanceInstallments extends StatelessWidget {
  const DropdownFinanceInstallments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewFinanceInternalController _controller=Get.find<NewFinanceInternalController>();

    return Obx(
            () {
          return DropdownButton<String>(
            value: _controller.totalparcelas.value.toString(),
            icon:  Icon(Icons.arrow_downward,color: AppColors.orange,),
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
              _controller.totalparcelas.value=int.parse(newValue!);
            },
            items: <String>['1','2', '3','4','5','6','7','8','9','10','11','12']
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
