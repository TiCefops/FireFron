import 'package:cefops/app/widgets/app/widget_forms_for_all.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
class NewFinance extends StatelessWidget {
  const NewFinance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nome = TextEditingController();
    TextEditingController valor = TextEditingController();

    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              Container(
                  width: Get.width / 6,
                  child: FormsForAll(
                      nome, "Nome", "Insira o nome", "preencha o campo nome")),
              Container(
                  width: Get.width / 6,
                  child: FormsForAll(valor, "Valor", "Insira o Valor",
                      "preencha o campo Valor")),

            ],
          )
        ],
      ),
    );
  }
}
