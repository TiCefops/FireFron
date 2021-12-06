
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/list_studant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///dropdow para pesquisa;
class DropMenuForSearch extends StatelessWidget {
  const DropMenuForSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(
      () {
        return DropdownButton<String>(
          value: ListStudantController.data.defaultConfigSearch.value,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyles.titleListTile3Black,
          underline: Container(
            height: 2,
            color: AppColors.blue,
          ),
          onChanged: (String? newValue) {

            ListStudantController.data.defaultConfigSearch.value = newValue!;

          },
          items: <String>['Nome', 'CPF',]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      }
    );
  }
}
