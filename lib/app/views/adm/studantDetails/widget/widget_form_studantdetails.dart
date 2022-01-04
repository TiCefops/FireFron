import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/controller/studants/studant_anddress_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Forms para Preencher pagina aluno
class FormStudntDetails extends StatelessWidget {
  TextEditingController controller;
  String labels;
  String hintTExt;
  String error;

  ///
  FormStudntDetails(this.controller, this.labels, this.hintTExt, this.error,
      {Key? key})
      : super(key: key);

  StudantAnddressController setErros = StudantAnddressController.anddres;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: Get.height * 0.08,
          width: Get.width * 0.2,
          alignment: Alignment.centerLeft,
          child: TextFormField(
            controller: controller,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
                fillColor: Colors.black,
                labelText: labels,
                labelStyle: TextStyles.titleRegular,
                hintText: hintTExt,
                hintStyle: TextStyles.input,
                focusedBorder: const OutlineInputBorder()),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                setErros.carregando.value = true;
                setErros.erro.value = error;

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
