

import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/controller_cep.dart';
import 'package:cefops/Src/controller/studants/studant_all_info_controller.dart';
import 'package:cefops/Src/repository/cepAuto/cep_repository.dart';
import 'package:cefops/Src/views/adm/studantDetails/widget/widget_form_studantdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudantAnddress extends GetView<StudantAllInfoController> {
  const StudantAnddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudantAllInfoController.data.anddress.refresh();

    int page=1;
    final cepControllerText = TextEditingController();
    final ruaController = TextEditingController();
    final complementoController = TextEditingController();
    final cidadeController = TextEditingController();
    final estadoController = TextEditingController();
    final ufController = TextEditingController();
    final numeroController = TextEditingController();
    final bairroController = TextEditingController();
    var endereco=StudantAllInfoController.data.anddress;
    var cepOnline=cepControll.endereco;

    if(cepOnline.cep.isEmpty){
      cepOnline.cep.value=endereco.cep.value;
      cepOnline.localidade.value=endereco.cidade.value;
      cepOnline.uf.value=endereco.uf.value;
      cepOnline.estado.value=endereco.estado.value;
      cepOnline.bairro.value=endereco.bairro.value;
      cepOnline.complemento.value=endereco.complemento.value;
      cepOnline.logradouro.value=endereco.rua.value;
    }


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
            child:  TextFormField(
              maxLength: 8,
              onChanged: (value){
                if(value.length==8){
                  Future.delayed(const Duration(seconds: 2),(){
                    GetCep(cepControllerText.value.text);
                  });
                }
              },
              controller: cepControllerText..text = '${endereco.cep}',
              style: TextStyle(color: Colors.black,),
              decoration: InputDecoration(
                  fillColor: Colors.black,
                  labelText: "CEP",
                  labelStyle: TextStyles.titleRegular,
                  hintText: "Insisra o cep",
                  hintStyle: TextStyles.input,
                  focusedBorder: OutlineInputBorder(
                  )
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "o campo cep esta vazio";
                }
                return null;
              },
              maxLines: 1,
            ),
          ),

          IconButton(
              onPressed: () {
                if(cepControllerText.value.text.length==8){
                  GetCep(cepControllerText.value.text);
                }else {
                  print("Error");
                }

              },
              icon: Icon(Icons.search)),
            Obx(
              () {
                if(cepOnline.cep.isEmpty){
                  cepOnline.logradouro.value=endereco.cidade.value;
                };
                return Container(
                  child:  FormStudntDetails(
                      ruaController
                        ..text = '${endereco.rua}',
                      "Endereço",
                      "Insira o Endereço",
                      "preencha o Endereço "),

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
                          bairroController
                            ..text = '${endereco.bairro}',
                          "Bairro",
                          "Insira o bairro",
                          "preencha o bairro "),
                    );
                  }
              ),
              SizedBox(width: Get.width*0.02,),
              Obx(
                      () {
                    return Container(
                      child:  FormStudntDetails(
                          complementoController
                            ..text = '${endereco.complemento}',
                          "Complemento",
                          "Insira o complemento",
                          "preencha o complemento "),
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
                      Obx(
                         () {
                          return FormStudntDetails(
                              cidadeController
                                ..text = '${endereco.cidade}',
                              "Cidade",
                              "Insira o Cidade",
                              "preencha o Cidade ");
                        }
                      ),
                      SizedBox(width: Get.width*0.02,),
                      Container(
                        child:  FormStudntDetails(
                           estadoController
                              ..text = '${endereco.estado}',
                            "Estado",
                            "Estado",
                            "Estado ") ,
                        width: Get.width*0.1,
                      ),
                      SizedBox(width: Get.width*0.02,),
                      Container(
                        child:  FormStudntDetails(
                            ufController
                              ..text = '${endereco.uf}',
                            "UF",
                            "UF",
                            "UF ") ,
                        width: Get.width*0.05,
                      ),
                      SizedBox(width: Get.width*0.02,),
                    Container(
                    child:  FormStudntDetails(
                    numeroController..text = '${endereco.numero}',
                    "Número",
                    "número",
                    "número "), width: Get.width*0.05,),
                    ],
                  ),
                );
              }
          ),
          SizedBox(
            height: Get.height*0.05,
          ),
          Center(

            ),
              Obx(
               () {
                  return endereco.carregando.value ?  CircularProgressIndicator():
                  ElevatedButton(
                      onPressed: (){
                        endereco.cep.value=cepControllerText.text;
                        endereco.cidade.value=cidadeController.text;
                        endereco.numero.value=numeroController.text;
                        endereco.rua.value=ruaController.text;
                        endereco.complemento.value=complementoController.text;
                        endereco.bairro.value=bairroController.text;
                        endereco.estado.value=estadoController.text;
                        endereco.uf.value=ufController.text;
                        endereco.setDocuments();


                        ;
                        },
                      child: Text("Continuar")) ;
                }
              ),

        ],
      )
    );
  }
}

