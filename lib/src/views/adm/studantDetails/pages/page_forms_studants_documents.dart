import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/repository/aluno/documentos/documents_repository.dart';
import 'package:cefops/Src/views/adm/studantDetails/controller/studant_details_controller.dart';
import 'package:cefops/Src/views/adm/studantDetails/controller/documents_controller.dart';
import 'package:cefops/Src/views/adm/studantDetails/widget/widget_custom_form.dart';
import 'package:cefops/Src/views/adm/studantDetails/widget/widget_form_studantdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
class FormsStudantsDocuments extends StatelessWidget {
  ///
  const FormsStudantsDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<GlobalKey<FormState>> _formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];
    final TextEditingController cpfController = TextEditingController();
    final TextEditingController orgaoEmissorController = TextEditingController();
    final TextEditingController rgController = TextEditingController();
    final TextEditingController estadoRgController = TextEditingController();
    final TextEditingController dataRgController = TextEditingController();
    final TextEditingController tituloController = TextEditingController();
    final TextEditingController estadoTituloController =
        TextEditingController();
    final TextEditingController zonaTituloController = TextEditingController();
    final TextEditingController secaoTituloController = TextEditingController();
    final TextEditingController dataEmisoaTituloController =
        TextEditingController();
    final TextEditingController nomeMaeController = TextEditingController();
    final TextEditingController nomePaiController = TextEditingController();

    DocumentsController docController = DocumentsController.data;
    StudandDetailsController pageController = StudandDetailsController.details;

    return Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              CustomForm(
                  _formKeys[0],
                  11,
                  cpfController..text = '${docController.cpf}',
                  "CPF",
                  "Insira o CPF",
                  "O  CPF não pode ser vazio",
                  "CPF inválido","O CPF deve Conter 11 Digitos",
                  TextInputType.number
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Obx(() {
                return Container(
                  child: CustomForm(
                      _formKeys[1],
                      12,
                      tituloController..text = '${docController.titulo}',
                      "Titulo",
                      "Insira o Titulo",
                      "O Titulo não pode ser vazio",
                      "Titulo inválido","O Titulo deve Conter 12 Digitos",
                      TextInputType.number),
                );
              }),
            ]),
            Row(
              children: <Widget>[
                Obx(() {
                  return Container(

                    child: CustomForm(_formKeys[2], 10,
                      rgController..text = '${docController.rg}',
                      "RG", "Insira o RG", "O RG não pode Ser vazio",
                      "RG inválido", "O RG deve conter 10 Digitos",
                        TextInputType.number)
                  );
                }),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Obx(() {
                  return Container(
                    child: FormStudntDetails(
                        estadoTituloController
                          ..text = '${docController.estadoEmissortitulo}',
                        "Estado Emissor do Titulo",
                        "Insira o Estado Emissor",
                        "preencha o Estado Emissor"),
                  );
                }),
              ],
            ),
            Obx(() {
              return Container(
                child: Row(
                  children: <Widget>[
                    FormStudntDetails(
                        estadoRgController
                          ..text = '${docController.estadoEmissorRg}',
                        "Estado Emissor RG",
                        "Insira o RG",
                        "preencha o RG "),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Container(
                      child: FormStudntDetails(
                          zonaTituloController..text = '${docController.zona}',
                          "Zona",
                          "Zona",
                          "Zona "),
                      width: Get.width * 0.05,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Container(
                      child: FormStudntDetails(
                          secaoTituloController
                            ..text = '${docController.secao}',
                          "Seção",
                          "Seção",
                          "Seção "),
                      width: Get.width * 0.05,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    FormStudntDetails(
                        dataEmisoaTituloController
                          ..text = '${docController.dataEmissorTitulo}',
                        "Data de Emissão Titulo",
                        "Insira a  Data de Emissão",
                        "preencha a Data de Emissão "),
                  ],
                ),
              );
            }),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: FormStudntDetails(
                      dataRgController
                        ..text = '${'${docController.dataEmissorRg}'}',
                      "Data de Emissão RG",
                      "Insira a  Data de Emissão do RG",
                      "preencha a Data de Emissão "),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: FormStudntDetails(
                      nomeMaeController..text = '${docController.nomeMae}',
                      "Nome Da Mãe",
                      "Insira  o Nome Da Mãe",
                      "preencha o Nome Da Mãe "),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: FormStudntDetails(
                      nomePaiController..text = '${docController.nomePai}',
                      "Nome Do Pai",
                      "Insira  o Do Pai",
                      "preencha o Do Pai "),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            ElevatedButton(
                onPressed: () async {
                  await CreateDocuments(
                      cpfController.text,
                      rgController.text,
                      dataRgController.text,
                      orgaoEmissorController.text,
                      estadoRgController.text,
                      tituloController.text,
                      zonaTituloController.text,
                      secaoTituloController.text,
                      dataEmisoaTituloController.text,
                      estadoTituloController.text,
                      nomeMaeController.text,
                      nomePaiController.text,
                      docController.cpf.value);
                  // pageController.navegar.value = 1;
                },
                child: Text("Continuar")),
          ],
        ));
  }
}

