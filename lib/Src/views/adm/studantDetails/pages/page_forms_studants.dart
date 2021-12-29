import 'package:cefops/Src/controller/studants/studant_info_controller.dart';
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
    required bool formList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final lastNameController = TextEditingController();
    final telCellController = TextEditingController();
    final telResController = TextEditingController();
    final burnDataController = TextEditingController();
    final emailController = TextEditingController();
    final nationController = TextEditingController();
    final cpfController = TextEditingController();
    var infos = StudantInfoController.data;

    return Form(
      key: _formKey,
      child: Stack(
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
            children: [
              Row(
                children: [
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
                children: [
                  FormStudntDetails(
                      emailController..text = '${infos.email.toString()}',
                      "Email",
                      "Email do Aluno",
                      "preencha o Email do aluno"),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  Container(
                    width: Get.width * 0.09,
                    child: FormStudntDetails(
                        telCellController..text = '${infos.phoneCell}',
                        "Telefone Celular",
                        "Telefone do Aluno",
                        "preencha o Telefone do aluno"),
                  ),
                  SizedBox(
                    width: Get.width * 0.01,
                  ),
                  Container(
                    width: Get.width * 0.09,
                    child: FormStudntDetails(
                        telResController..text = '${infos.phoneHome}',
                        "Tel Residencial",
                        "Telefone rescidencial Aluno",
                        "preencha  a Telefone Residencial"),
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
                  Container(
                    width: Get.width * 0.09,
                    child: FormStudntDetails(
                        cpfController..text = '${infos.cpf.toString()}',
                        "Cpf",
                        "Cpf do Aluno",
                        "preencha  o Cpf"),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.10,
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
                            // print(fromList);
                            // if(fromList==true){
                            //
                            //   infos.loading.value = true;
                            //
                            // }else {
                            //   print("oii");
                            //   await  infos.singInStudant();
                            // }
                            // infos.loading.value = false;
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
      ),
    );
  }
}
