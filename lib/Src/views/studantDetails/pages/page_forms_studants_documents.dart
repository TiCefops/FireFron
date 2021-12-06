
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/controller_cep.dart';
import 'package:cefops/Src/views/studantDetails/controller/controller_studantDetails.dart';
import 'package:cefops/Src/views/studantDetails/controller/documents_controller.dart';
import 'package:cefops/Src/views/studantDetails/widget/widget_form_studantDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormsStudantsDocuments extends StatelessWidget {
  const FormsStudantsDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final cpfController = TextEditingController();
    final rgController = TextEditingController();
    final estadoRgController = TextEditingController();
    final dataRgController = TextEditingController();
    final tituloController = TextEditingController();
    final estadoTituloController = TextEditingController();
    final zonaTituloController = TextEditingController();
    final secaoTituloController = TextEditingController();
    final dataEmisoaTituloController = TextEditingController();
    var docController = DocumentsController.data;
    var pageController = StudandDetailsController.details;


    return Container(
        height: Get.height,
        width: Get.width,
        child:
        Column(
          children: [
            Row(children: [
              Container(
                height: Get.height*0.1,
                width: Get.width*0.2,
                alignment: Alignment.centerLeft,
                child:  Form(
                  key: _formKey,
                  child: TextFormField(
                    keyboardType:  TextInputType.number,
                    maxLength: 11,
                    onChanged: (value){
                     if(value.length==11){
                       _formKey.currentState!.validate();
                     }

                    },
                    controller: cpfController..text = '${docController.cpf}',
                    style: TextStyle(color: Colors.black,),
                    decoration: InputDecoration(
                        fillColor: Colors.black,
                        labelText: "CPF",
                        labelStyle: TextStyles.titleRegular,
                        hintText: "Insisra o CPF",
                        hintStyle: TextStyles.input,
                        focusedBorder: OutlineInputBorder(
                        )
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "o campo cep esta vazio";
                      }
                      if (value.isCpf==false) {
                        return "CPF Invalido";
                      }return null;

                    },
                    maxLines: 1,
                  ),
                ),
              ),

              IconButton(
                  onPressed: () {
                    if(cpfController.value.text.length==11){

                    }else {
                      print("Error");
                    }

                  },
                  icon: Icon(Icons.search)),
              Obx(
                      () {
                    return Container(
                      child:  FormStudntDetails(
                          tituloController
                            ..text = '${docController.titulo}',
                          "Titulo eleitoral",
                          "Insira o Titulo eleitoral",
                          "preencha o Titulo eleitoral "),
                    );
                  }
              ),
            ]
            ),
            Row(
              children: [
                Obx(
                        () {
                      return Container(
                        child:  FormStudntDetails(
                            rgController
                              ..text = '${docController.rg}',
                            "RG",
                            "Insira o RG",
                            "preencha o RG "),
                      );
                    }
                ),
                SizedBox(width: Get.width*0.02,),
                Obx(
                        () {
                      return Container(
                        child:  FormStudntDetails(
                            estadoTituloController
                              ..text = '${docController.estadoEmissortitulo}',
                            "Estado Emissor do Titulo",
                            "Insira o Estado Emissor",
                            "preencha o Estado Emissor"),
                      );
                    }
                ),
              ],
            ),
            Obx(
                    () {
                  return Container(
                    child:  Row(
                      children: [
                        FormStudntDetails(
                            estadoRgController
                              ..text = '${docController.estadoEmissorRg}',
                            "Estado Emissor RG",
                            "Insira o RG",
                            "preencha o RG "),
                        SizedBox(width: Get.width*0.02,),

                        Container(
                          child:  FormStudntDetails(
                              zonaTituloController
                                ..text = '${docController.zona}',
                              "Zona",
                              "Zona",
                              "Zona ") ,
                          width: Get.width*0.05,
                        ),
                        SizedBox(width: Get.width*0.02,),
                        Container(
                          child:  FormStudntDetails(
                              secaoTituloController ..text = '${docController.secao}',
                              "Seção",
                              "Seção",
                              "Seção "), width: Get.width*0.05,),
                        SizedBox(width: Get.width*0.02,),
                        FormStudntDetails(
                            dataEmisoaTituloController
                              ..text = '${docController.dataEmissorTitulo}',
                            "Data de Emissão Titulo",
                            "Insira a  Data de Emissão",
                            "preencha a Data de Emissão "),

                      ],
                    ),
                  );
                }
            ),
            SizedBox(
              height: Get.height*0.02,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: FormStudntDetails(
                  dataRgController
                    ..text = '${cepControll.endereco.localidade}',
                  "Data de Emissão RG",
                  "Insira a  Data de Emissão do RG",
                  "preencha a Data de Emissão "),
            ),
            SizedBox(
              height: Get.height*0.05,
            ),
            Center(

            ),
            ElevatedButton(
                onPressed: (){pageController.navegar.value=1;},
                child: Text("Continuar")),

          ],
        )
    );
  }
}
