import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/controller/list_studant_controller.dart';
import 'package:cefops/app/controller/studants/studant_all_info_controller.dart';
import 'package:cefops/app/controller/studants/studant_info_controller.dart';
import 'package:cefops/app/data/model/aluno/aluno_model.dart';
import 'package:cefops/app/services/adm/studant_service.dart';
import 'package:cefops/app/views/adm/studantDetails/controller/documents_controller.dart';
import 'package:cefops/app/views/adm/studantDetails/controller/studant_details_controller.dart';
import 'package:cefops/app/views/adm/studantDetails/pages/page_studant_details_menu.dart';
import 'package:cefops/app/widgets/school_management/studantsListViewer/widget_dropmenu_for_search_studant.dart';
import 'package:cefops/shared/error/page_error_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
class GetStudants extends GetView<ListStudantController> {
  const GetStudants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ListStudantController controllerViewer = ListStudantController.data;
    final StudantInfoController setinfos = StudantInfoController.data;
    final StudantService _service = StudantService();
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            width: Get.width,
            height: Get.height * 0.08,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    SizedBox(
                      width: Get.width * 0.07,
                      child: Text(
                        "Buscar Por",
                        style: TextStyles.titleListTile3Black,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    const DropMenuForSearchStudant(),
                    SizedBox(
                      width: Get.width * 0.03,
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: Get.width * 0.3,
                        child: TextFormField(
                          onChanged: (String newVal) {
                            controllerViewer.searchData.value = newVal;
                          },
                          decoration: const InputDecoration(
                            fillColor: Colors.brown,
                            hintText: 'Buscar',
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),

                            contentPadding: EdgeInsets.only(top: 20),
                            // add padding to adjust text
                            isDense: true,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 15),
                              // add padding to adjust icon
                              child: Icon(
                                Icons.search,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          cursorColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                height: Get.height * 0.80,
                width: Get.width * 0.2,
                color: Colors.red,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Organizar de",
                          style: TextStyles.titleListTile2,
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Row(
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                controllerViewer.newDirection.value = "ASC";
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(AppColors.blue),
                              ),
                              child: const Text(
                                "AZ",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            TextButton(
                              onPressed: () {
                                controllerViewer.newDirection.value = "DESC";
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(AppColors.blue),
                              ),
                              child: const Text(
                                "ZA",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Quantos studantsListViewer por Página",
                            style: TextStyles.titleListTile2,
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Row(
                            children: <Widget>[
                              TextButton(
                                onPressed: () {
                                  controllerViewer.newTotalElement.value = 15;
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(AppColors.blue),
                                ),
                                child: const Text(
                                  "15",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.01,
                              ),
                              TextButton(
                                onPressed: () {
                                  controllerViewer.newTotalElement.value = 30;
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(AppColors.blue),
                                ),
                                child: const Text(
                                  "30",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.01,
                              ),
                              TextButton(
                                onPressed: () {
                                  controllerViewer.newTotalElement.value = 45;
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(AppColors.blue),
                                ),
                                child: const Text(
                                  "45",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.01,
                              ),
                              TextButton(
                                onPressed: () {
                                  controllerViewer.newTotalElement.value = 60;
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(AppColors.blue),
                                ),
                                child: const Text(
                                  "60",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "Ir para Página",
                          style: TextStyles.titleListTile2,
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        SizedBox(
                          width: Get.width,
                          height: Get.height * 0.04,
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      AppColors.blue,
                                    ),
                                  ),
                                  child: const Text(
                                    "1",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.5,
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        width: Get.width * 0.13,
                        height: Get.height * 0.047,
                        color: AppColors.blue,
                        child: Obx(
                          () => Center(
                            child: Text(
                              "Mostrando: "
                              "${controllerViewer.pageSize} de "
                              "${controllerViewer.totalElements}",
                              style: TextStyles.titleListTile2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        width: Get.width * 0.13,
                        height: Get.height * 0.047,
                        color: AppColors.menuColor,
                        child: Obx(
                          () => Center(
                            child: Text(
                              "Pagina: "
                              "${controllerViewer.number} de "
                              "${controllerViewer.totalPages}",
                              style: TextStyles.titleListTile2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Obx(() {
                  return SizedBox(
                    width: Get.width,
                    height: Get.height * 0.80,
                    child: FutureBuilder(
                      future: _service.getAllStudats(),
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<StudantModel> snapshot,
                      ) {
                        if (snapshot.hasData) {
                          final data = snapshot.data!.content;
                          return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int Index) {
                              return ExpansionTile(
                                title: Container(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 22,
                                        backgroundImage:
                                            NetworkImage(data[Index].photo),
                                      ),
                                      const SizedBox(
                                        width: 22,
                                      ),
                                      Text(
                                        "${data[Index].name} ${data[Index].lastName}",
                                        style: TextStyles.titleListTile,
                                      ),
                                      const SizedBox(
                                        width: 22,
                                      ),
                                    ],
                                  ),
                                ),
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "CPF: ${data[Index].id}",
                                      style: TextStyles.titleListTile,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "E-mail: ${data[Index].email}",
                                      style: TextStyles.titleListTile,
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: TextButton(
                                            child: Text(
                                              "Editar",
                                              style: TextStyle(
                                                color: AppColors.blue,
                                              ),
                                            ),
                                            onPressed: () {
                                              // infos.setInfos(data[Index],Index);
                                              StudantInfoController
                                                  .data.isFromPage.value = true;
                                              String genero;

                                              if (data[Index].genero !=
                                                      "Masculino" ||
                                                  data[Index].genero !=
                                                      "Feminino") {
                                                genero = "Gênero";
                                              } else {
                                                genero = data[Index].genero;
                                              }

                                              StudandDetailsController.details
                                                  .setActive(
                                                data[Index].enabled,
                                              );

                                              StudandDetailsController.details
                                                  .gender.value = genero;

                                              StudandDetailsController.details
                                                      .civilState.value =
                                                  data[Index].estadoCivil;
                                              DocumentsController.data.cpf
                                                  .value = data[Index].id;
                                              StudantAllInfoController
                                                  .data.anddress
                                                  .clarAndress();

                                              setinfos.SetAll(
                                                data[Index].toJson(),
                                              );
                                              StudantAllInfoController
                                                  .data.anddress
                                                  .getAndress();

                                              AlunoDetails(
                                                context,
                                              );
                                            },
                                          ),
                                        ),
                                        TextButton(
                                          child: Text(
                                            "Suspender",
                                            style: TextStyle(
                                              color: AppColors.orange,
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                        TextButton(
                                          child: const Text(
                                            "Deletar",
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return const ErrorInfo();
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.blue,
                              backgroundColor: AppColors.orange,
                            ),
                          );
                        }
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          AlunoDetails(context);
          StudantInfoController.data.isFromPage.value = false;
        },
      ),
    );
  }
}
