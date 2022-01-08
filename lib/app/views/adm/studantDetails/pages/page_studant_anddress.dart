import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/controller/controller_cep.dart';
import 'package:cefops/app/controller/studants/studant_all_info_controller.dart';
import 'package:cefops/app/controller/studants/studant_anddress_controller.dart';
import 'package:cefops/app/data/repository/cepAuto/cep_repository.dart';
import 'package:cefops/app/views/adm/studantDetails/widget/widget_form_studantdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudantAnddress extends GetView<StudantAllInfoController> {
  const StudantAnddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudantAllInfoController.data.anddress.refresh();

    final TextEditingController cepControllerText = TextEditingController();
    final TextEditingController ruaController = TextEditingController();
    final TextEditingController complementoController = TextEditingController();
    final TextEditingController cidadeController = TextEditingController();
    final TextEditingController estadoController = TextEditingController();
    final TextEditingController ufController = TextEditingController();
    final TextEditingController numeroController = TextEditingController();
    final TextEditingController bairroController = TextEditingController();

    StudantAnddressController endereco=StudantAllInfoController.data.anddress;
    cepControll cepOnline=cepControll.endereco;


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
        children:<Widget> [
          Row(children: <Widget>[
          Container(
            height: Get.height*0.1,
            width: Get.width*0.2,
            alignment: Alignment.centerLeft,
            child:  TextFormField(
              maxLength: 8,
              onChanged: (String value){
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

              validator: (String? value) {
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

