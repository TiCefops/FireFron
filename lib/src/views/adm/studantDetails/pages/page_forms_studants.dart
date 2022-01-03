import 'package:cefops/Src/controller/studants/studant_info_controller.dart';
import 'package:cefops/Src/services/adm/studant_service.dart';
import 'package:cefops/Src/views/adm/studantDetails/widget/widget_custom_form.dart';
import 'package:cefops/Src/views/adm/studantDetails/widget/widget_dropdown_civilState.dart';
import 'package:cefops/Src/views/adm/studantDetails/widget/widget_dropdown_gender.dart';
import 'package:cefops/Src/views/adm/studantDetails/widget/widget_dropdown_state.dart';
import 'package:cefops/Src/views/adm/studantDetails/widget/widget_form_studantdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
class FormsStudants extends StatelessWidget {
  ///
  const FormsStudants({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    List<GlobalKey<FormState>> _formKeys = [GlobalKey<FormState>(),
      GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];
    final  TextEditingController nameController = TextEditingController();
    final  lastNameController = TextEditingController();
    final  TextEditingController telCellController = TextEditingController();
    final  TextEditingController telResController = TextEditingController();
    final  TextEditingController burnDataController = TextEditingController();
    final  TextEditingController emailController = TextEditingController();
    final  TextEditingController nationController = TextEditingController();
    final  TextEditingController cpfController = TextEditingController();
    StudantInfoController infos = StudantInfoController.data;
    StudantService _service=StudantService();

    return Stack(
        children: <Widget>[
          Positioned(
            left: Get.width / 2,
            child: Container(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(
                  () {
                    return Image.network(
                      StudantInfoController.data.photo.value,
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                      alignment: Alignment.center,
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            left: Get.width / 2.01,
            top: Get.height * 0.2,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Enviar Nova foto"),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[

                  FormStudntDetails(nameController..text = '${infos.name}',
                      "Nome", "Nome do Aluno", "preencha o nome do aluno"),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  FormStudntDetails(
                      lastNameController..text = '${infos.lastName}',
                      "Sobreome",
                      "Sobreome do Aluno",
                      "preencha o nome do Sobreome"),
                ],
              ),
              Row(
                children: [
                  Container(width: Get.width * 0.09, child: DropDownGender()),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  Container(width: Get.width * 0.09, child: DropDownStatus()),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  Container(
                      width: Get.width * 0.09, child: DropDownCivilState()),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  Container(
                    width: Get.width * 0.1,
                    child: FormStudntDetails(
                        burnDataController..text = '${infos.birthDate}',
                        "Data  nascimento",
                        "Data de nascimento",
                        "preencha A Data de nascimento"),
                  ),
                ],
              ),
              SizedBox(
                width: Get.width * 0.01,
              ),
              Row(
                children: <Widget>[
                  FormStudntDetails(
                      emailController..text = '${infos.email.toString()}',
                      "Email",
                      "Email do Aluno",
                      "preencha o Email do aluno"),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  Container(
                    width: Get.width*0.09,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: Get.height*0.037),
                        Container(
                          child: CustomForm(_formKeys[0], 11,
                              telCellController..text = '${infos.phoneCell}',
                              "Telefone Celular", "Telefone do Aluno",
                              "O Telefone não pode ser vazio",
                              "Telefone Invalido", "O Telefone deve conter 11 digitos", TextInputType.number),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),

                  Container(
                    width: Get.width * 0.09,
                    child:Column(
                      children: <Widget>[
                        SizedBox(height: Get.height*0.037),
                        Container(
                          child: CustomForm(_formKeys[1], 10,
                              telResController..text = '${infos.phoneHome}',
                              "Tel Residencial", "Telefone rescidencial Aluno",
                              "O Telefone não pode ser vazio",
                              "Telefone Invalido", "O Telefone deve conter 10 digitos", TextInputType.number),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  Container(
                    width: Get.width * 0.09,
                    child: FormStudntDetails(
                        nationController..text = '${infos.nation}',
                        "Nacionalidade",
                        "Nacionalidade do Aluno",
                        "preencha  a Nacionalidade"),
                  ),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: Get.width*0.14,
                        margin: EdgeInsets.only(top: Get.height*0.03),

                        child: CustomForm(_formKeys[2], 11, cpfController..text="${infos.cpf}", "CPF", "CPF",
                            "CPF não pode ser vazio", "CPF inválido",
                            "O CPF deve ter 11 digitos", TextInputType.number),
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Obx(
                () {
                  return infos.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            infos.name.value = nameController.text;
                            infos.lastName.value = lastNameController.text;
                            infos.birthDate.value = burnDataController.text;
                            infos.email.value = emailController.text;
                            infos.phoneCell.value = telCellController.text;
                            infos.phoneHome.value = telResController.text;
                            infos.nation.value = nationController.text;
                            infos.cpf.value = cpfController.text;
                            if(infos.isFromPage.value==true){
                              await _service.updateStudant();

                            }else {

                               await _service.createStudant();
                             }
                            infos.loading.value = false;
                          },
                          child: Text("Continuar"));
                },
              ),
              Obx(() {
                return Center(
                  child: Text("${infos.status}"),
                );
              }),
            ],
          )
        ],
      );
  }
}
