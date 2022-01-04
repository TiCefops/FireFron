
import 'package:cefops/app/controller/requeriment_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
///
class DropMenuGroup extends StatefulWidget {
///
   const DropMenuGroup( {Key? key}) : super(key: key);

  @override
  State<DropMenuGroup> createState() => _DropMenuGroupState();
}

class _DropMenuGroupState extends State<DropMenuGroup> {

    RequerimentTypeController controller=RequerimentTypeController.reqType;

  final List<String> _groupeTypes = <String>[];
    void initState() {
      controller.groupsFiltered.forEach((element) {
        _groupeTypes.add(element.toString());
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
                onChanged: (Object? newValue) {
                  controller.filterDataRequerimentType(newValue.toString());
                  setState(() {
                    _selectedLocation = newValue.toString();


                  });
                },
                items: controller.groupsFiltered.map((location) {

                  return  DropdownMenuItem(
                    value: location,
                    child:  Text(location.toString()),
                  );
                }).toList(),
              ),

        );
      }
    );
  }
}
