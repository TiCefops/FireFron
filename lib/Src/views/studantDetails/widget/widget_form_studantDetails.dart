
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/studants/studant_anddress_controller.dart';
import 'package:cefops/Src/controller/studants/studant_info_controller.dart';
import 'package:cefops/Src/views/studantDetails/pages/page_studant_anddress.dart';
import 'package:cefops/Src/widgets/widget_FormsForAll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FormStudntDetails extends StatelessWidget {
  var controller;
  var labels;
  var hintTExt;
  var error;
   FormStudntDetails(this.controller,this.labels,this.hintTExt,this.error, {Key? key}) : super(key: key);

var setErros=StudantAnddressController.anddres;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.height*0.08,
          width: Get.width*0.2,
          alignment: Alignment.centerLeft,
          child:  TextFormField(


            controller: controller,
            style: TextStyle(color: Colors.black,),
            decoration: InputDecoration(
                fillColor: Colors.black,
                labelText: labels,
                labelStyle: TextStyles.titleRegular,
                hintText: hintTExt,
                hintStyle: TextStyles.input,
                focusedBorder: OutlineInputBorder(
                )
            ),

            validator: (value) {
              if (value == null || value.isEmpty) {
                setErros.carregando.value=true;
                setErros.erro.value=error;

                return error;
              }
              return null;
            },
            maxLines: 1,
          ),
        ),

      ],
    );
  }
}
