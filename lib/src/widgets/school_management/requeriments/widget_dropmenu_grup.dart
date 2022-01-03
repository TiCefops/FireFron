
import 'package:cefops/Src/controller/requeriment_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropMenuGrup extends StatefulWidget {

   DropMenuGrup( {Key? key}) : super(key: key);

  @override
  State<DropMenuGrup> createState() => _DropMenuGrupState();
}

class _DropMenuGrupState extends State<DropMenuGrup> {

    var controller=RequerimentTypeController.reqType;

  List<String> _groupeTypes = [];
    void initState() {
      controller.groupsFiltered.forEach((element) {
        _groupeTypes.add(element);
      });

      super.initState();

      }

   String _selectedLocation="Secretaria";



    @override
  Widget build(BuildContext context) {

    return  Obx(
      () {
        return controller.loading.value?CircularProgressIndicator(): Container(
              child: DropdownButton(
                hint: Text('Selecione um tipo'), // Not necessary for Option 1
                value: _selectedLocation,
                onChanged: (newValue) {
                  controller.filterDataRequerimentType(newValue.toString());
                  setState(() {
                    _selectedLocation = newValue.toString();


                  });
                },
                items: controller.groupsFiltered.map((location) {

                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
              ),

        );
      }
    );
  }
}

