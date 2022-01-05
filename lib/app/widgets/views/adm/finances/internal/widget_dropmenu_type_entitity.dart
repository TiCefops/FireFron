import 'package:cefops/app/controller/views/adm/finances/internal/new_finance_controller.dart';
import 'package:cefops/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
class DropdownmenuTypeEntity extends StatelessWidget {
  ///
  const DropdownmenuTypeEntity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewFinanceInternalController _controller =
        Get.find<NewFinanceInternalController>();

    return Obx(() {
      return DropdownButton<String>(
        value: _controller.formaPagamento.value,
        icon: Icon(
          Icons.arrow_downward,
          color: AppColors.orange,
        ),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.blueAccent,
        ),
        onChanged: (String? newValue) {
          _controller.formaPagamento.value = newValue!;
        },
        items: <String>['Dinheiro', 'Cartão', 'PIX', 'Boleto']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
