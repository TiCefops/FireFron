import 'package:cefops/app/views/adm/finances/interno/controller/new_finance_controller.dart';
import 'package:cefops/app/views/adm/finances/interno/widgets/widget_dropdown_finance_installments.dart';
import 'package:cefops/app/views/adm/finances/interno/widgets/widget_dropdown_finance_state.dart';
import 'package:cefops/app/views/adm/finances/interno/widgets/widget_dropmenu_type_entitity.dart';
import 'package:cefops/app/views/adm/studantDetails/widget/widget_custom_form_with_validate.dart';
import 'package:cefops/app/widgets/app/widget_forms_for_all.dart';
import 'package:cefops/shared/themes/app_textstayle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
class NewFinance extends StatelessWidget {
  const NewFinance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nomeController = TextEditingController();
    TextEditingController valorController = TextEditingController();
    TextEditingController valorParcelaController = TextEditingController();
    TextEditingController cpfConttroller = TextEditingController();

    List<GlobalKey<FormState>> _formKeys = [
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
      GlobalKey<FormState>()
    ];


    NewFinanceInternalController  _controller=Get.put(NewFinanceInternalController());


    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Tipo de Movimentação:",
                style: TextStyles.titleRegular,
              ),
              DropdownmenuTypeEntity(),
              DropdownfinanceState(),
              SizedBox(
                child: Container(
                  width: Get.width * 0.2,
                  child: FormsForAll(
                      nomeController..text = "${_controller.nome}",
                      "Item",
                      "Insira o Item",
                      "preencha o campo Item"),
                ),
              ),
              Container(
                width: Get.width * 0.15,
                child: FormsForAll(
                    valorController..text = "${_controller.valor}",
                    "Valor",
                    "Insira o Valor",
                    "preencha o campo Valor"),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Row(
            children: <Widget>[
              Text(
                "Parcelado",
                style: TextStyles.titleRegular,
              ),
              Obx(
                () {
                  return Checkbox(
                    value: _controller.parcelado.value,
                    onChanged: (bool? value) {
                      _controller.parcelado.value = value!;
                    },
                  );
                },
              ),
              Obx(
                () {
                  return _controller.parcelado.value
                      ? Row(
                          children: <Widget>[
                            Text(
                              "Parcelado em",
                              style: TextStyles.titleRegular,
                            ),
                            SizedBox(
                              width: Get.width * 0.008,
                            ),
                            DropdownFinanceInstallments(),
                            SizedBox(
                              width: Get.width * 0.008,
                            ),
                            Text(
                              "Valor das Parcelas",
                              style: TextStyles.titleRegular,
                            ),
                            SizedBox(
                              width: Get.width * 0.008,
                            ),
                            Container(
                              width: Get.width * 0.08,
                              height: Get.height * 0.08,
                              child: FormsForAll(valorParcelaController,
                                  "Valor", "Valor", "preencha o campo Valor"),
                            )
                          ],
                        )
                      : Text("");
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Estudante",
                style: TextStyles.titleRegular,
              ),
              Obx(
                () {
                  return Row(
                    children: <Widget>[
                      Checkbox(
                        value: _controller.aluno.value,
                        onChanged: (bool? value) {
                          _controller.aluno.value = value!;
                        },
                      ),
                      _controller.aluno.value
                          ? Container(
                              width: Get.width * 0.1,
                              height: Get.height * 0.1,
                              child: CustomFormWithValidate(
                                  _formKeys[0],
                                  11,
                                  cpfConttroller,
                                  "CPF",
                                  "Insira o CPF",
                                  "O  CPF não pode ser vazio",
                                  "CPF inválido",
                                  "O CPF deve Conter 11 Digitos",
                                  TextInputType.number),
                            )
                          : Text("")
                    ],
                  );
                },
              ),
              SizedBox(
                width: Get.width * 0.008,
              ),
              Text(
                "Pago",
                style: TextStyles.titleRegular,
              ),
              Obx(
                () {
                  return Checkbox(
                    value: _controller.pago.value,
                    onChanged: (bool? value) {
                      _controller.pago.value = value!;
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: Get.height*0.09,),
          Center(
            child: SizedBox(
              width: Get.width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(onPressed: () {}, child: Text("Continuar")),
                  ElevatedButton(onPressed: () {}, child: Text("Cupom fiscal"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
