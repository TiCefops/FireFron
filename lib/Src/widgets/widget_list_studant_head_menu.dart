
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/list_studant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'GestaoEscola/Alunos/widget_dropmenu_for_search.dart';

class ListStudantHeadMenu extends StatelessWidget {
  const ListStudantHeadMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controllerViewer=ListStudantController.data;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: Get.width*0.02,
            ),
            Container(
              width: Get.width * 0.07,
              child: Text("Buscar Por",
                style: TextStyles.titleListTile3Black,),
            ),
            SizedBox(
              width: Get.width*0.04,
            ),
            DropMenuForSearch(),
            SizedBox(
              width: Get.width*0.03,
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: Get.width * 0.3,
                child: TextFormField(
                  onChanged: (newVal){

                    controllerViewer.searchData.value=newVal;

                    ;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.brown,
                    hintText: 'Buscar',
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),

                    contentPadding: EdgeInsets.only(top: 20),
                    // add padding to adjust text
                    isDense: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 15),
                      // add padding to adjust icon
                      child: Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  cursorColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
