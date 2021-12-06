import 'package:cefops/Src/controller/requerimentTypeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropMenuItems extends StatefulWidget {
  DropMenuItems({Key? key}) : super(key: key);

  @override
  State<DropMenuItems> createState() => _DropMenuItemsState();
}

class _DropMenuItemsState extends State<DropMenuItems> {
  var controller=RequerimentTypeController.reqType;

  @override
  Widget build(BuildContext context) {
    String _selectedLocation=controller.selectedType.value;


    return Flexible(
      flex: 1,
      child: Obx(
              () {
            return  DropdownButton(
              hint: Text('Selecione um tipo'), // Not necessary for Option 1
              value: controller.selectedType.value,
              onChanged: (newValue) {
                  print(newValue);
                  controller.selectedType.value = newValue.toString();

              },
              items: controller.itemsFilterd.map((types) {


                return DropdownMenuItem(
                  child: new Text(types["name"].toString(),
                    overflow: TextOverflow.ellipsis,),
                  value: types["id"].toString(),
                );
              }).toList(),
            );
          }
      ),
    );
  }
}
