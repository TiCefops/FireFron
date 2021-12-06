
import 'package:cefops/Src/views/adm/financeiro/interno/controller/new_finance_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownmenuFinanceEntity extends StatelessWidget {
  List<String> grupo=['Cefops'];

  DropdownmenuFinanceEntity( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller=NewFinanceInternalController.data;
    return GetBuilder<NewFinanceInternalController>(

        builder: (_) =>  DropdownButton<String>(
          value: controller.entidade.value,
          hint: Text("Selecione Um Unidade"),

          onChanged: (String? newValue) {
            controller.entidade.value=newValue!;

          },

          items: grupo
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
    );
  }
}

