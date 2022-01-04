import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/controller/home_emplooyes_controller.dart';
import 'package:cefops/app/controller/status_app_controller.dart';
import 'package:cefops/app/data/model/adm/requeriment_model.dart';
import 'package:cefops/app/services/adm/requeriment/requeriment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

var controller = HomeEmployesController.c;
final RequerimentService _service = RequerimentService();

class GetRequeriments extends StatefulWidget {
  const GetRequeriments({Key? key}) : super(key: key);

  @override
  State<GetRequeriments> createState() => _GetRequerimentsState();
}

class _GetRequerimentsState extends State<GetRequeriments> {
  @override
  Widget build(BuildContext context) {
    ScrollController controller1 = ScrollController();
    return FutureBuilder(
        future: _service.getALlRequeriments(),
        builder: (BuildContext context,
            AsyncSnapshot<List<RequerimentModel>> snapshot) {
          if (snapshot.hasData) {
            controller.allData.value = snapshot.data!.toList();
            List<RequerimentModel>? data = <RequerimentModel>[];
            data = controller.allData.value.cast<RequerimentModel>();

            List<RequerimentModel> permissionFilter;
            if (UserController.user.role.first == "ADM") {
              permissionFilter = data;
            } else {
              permissionFilter = data
                  .where((u) => u.tipo.grupo == UserController.user.role.first)
                  .toList();
            }
            var filter = permissionFilter
                .where((u) => u.status == 'Solicitado')
                .toList();

            statusApp.status.requerimentosAberto.value = filter.length;
            return ListView.builder(
                controller: controller1,
                itemCount: filter.length,
                itemBuilder: (BuildContext context, int Index) {
                  DateTime now = filter[Index].abertoem.toLocal();
                  var createDate =
                      DateFormat(" dd/MM/yyyy 'às' HH:mm").format(now);
                  String previsaoFormater = DateFormat(
                          "'Previsão de Entrega:' dd/MM/yyyy")
                      .format(now.add(
                          Duration(days: filter[Index].tipo.diasPentregar)));
                  String formatted = createDate;
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            filter[Index].tipo.name,
                            style: TextStyles.titleListTile,
                          ),
                          Text(
                            "Nome: ${filter[Index].nomeAluno} ",
                            style: TextStyles.titleListTile,
                          ),
                          Obx(
                            () => Container(
                              height: 16,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Aberto Em:$formatted"),
                                  statusApp.status.loading.value
                                      ? Center(
                                          child: CircularProgressIndicator(
                                              color: AppColors.blue,
                                              backgroundColor:
                                                  AppColors.orange),
                                        )
                                      : IconButton(
                                          onPressed: () async {
                                            await _service.updateRequeriment(
                                                filter[Index].id,
                                                UserController
                                                    .user.Fullname.value,
                                                "Em Andamento",
                                                false);
                                            HomeEmployesController
                                                .c.updateScreen.value = true;
                                            HomeEmployesController.c
                                                .updateScreenFun();

                                          },
                                          icon: Icon(Icons.add))
                                ],
                              ),
                            ),
                          ),
                          SelectableText.rich(
                            TextSpan(
                              text: 'Protocolo:',
                              style: TextStyle(color: AppColors.blue),
                              // default text style
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' ${filter[Index].protocolo}',
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.orange)),
                              ],
                            ),
                          ),
                          Text(previsaoFormater),
                          Center(
                            child: Container(
                              color: Colors.green,
                              width: 40,
                              height: 4,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Container(
              child: Text("Erro ao buscar dados" + snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                  color: AppColors.blue, backgroundColor: AppColors.orange),
            );
          }
        });
  }
}

class GetRequerimentsAndando extends StatelessWidget {
  const GetRequerimentsAndando({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController controller2 = ScrollController();

    return FutureBuilder(
        future: _service.getALlRequeriments(),
        builder: (BuildContext context,
            AsyncSnapshot<List<RequerimentModel>> snapshot) {
          if (snapshot.hasData) {
            List<RequerimentModel> data = [];
            data = snapshot.data!.toList();
            Iterable<RequerimentModel> permissionFilter;
            if (UserController.user.role.first == "ADM") {
              permissionFilter = data;
            } else {
              permissionFilter = data.where((RequerimentModel u) =>
                  u.tipo.grupo == UserController.user.role.first);
            }

            var filter = permissionFilter
                .where((u) => u.status == 'Em Andamento')
                .toList();
            statusApp.status.requerimentosAndando.value = filter.length;

            return ListView.builder(
                controller: controller2,
                itemCount: filter.length,
                itemBuilder: (BuildContext context, int Index) {
                  var now = filter[Index].abertoem.toLocal();
                  var createDate =
                      DateFormat(" dd/MM/yyyy 'às' HH:mm").format(now);

                  var previsaoFormater =
                      DateFormat("'Previsão de Entrega:' dd/MM/yyyy").format(
                          now.add(Duration(
                              days: snapshot.data![Index].tipo.diasPentregar)));
                  String formatted = createDate;

                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            snapshot.data![Index].tipo.name,
                            style: TextStyles.titleListTile,
                          ),
                          Text(
                            "Nome:${filter[Index].nomeAluno} ",
                            style: TextStyles.titleListTile,
                          ),
                          Text(
                            "Responsável: ${filter[Index].responsavel}",
                          ),
                          Container(
                            height: 16,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Aberto Em:$formatted"),
                                IconButton(
                                    onPressed: () async {
                                      HomeEmployesController.c.concluidoEm
                                          .value = DateTime.now().toString();
                                      await _service.updateRequeriment(
                                          filter[Index].id,
                                          UserController.user.Fullname.value,
                                          "Concluído",
                                          true);

                                      HomeEmployesController
                                          .c.updateScreen.value = true;
                                      HomeEmployesController.c
                                          .updateScreenFun();
                                    },
                                    icon: Icon(Icons.add))
                              ],
                            ),
                          ),
                          SelectableText.rich(
                            TextSpan(
                              text: 'Protocolo:',
                              style: TextStyle(color: AppColors.blue),
                              // default text style
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' ${filter[Index].protocolo}',
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.orange)),
                              ],
                            ),
                          ),
                          Text(previsaoFormater),
                          Center(
                            child: Container(
                              color: Colors.green,
                              width: 40,
                              height: 4,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Container(
              child: Text("Erro ao buscar dados" + snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                  color: AppColors.blue, backgroundColor: AppColors.orange),
            );
          }
        });
  }
}

class GetRequerimentsConcluido extends StatelessWidget {
  const GetRequerimentsConcluido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController controller3 = ScrollController();

    return FutureBuilder(
        future: _service.getALlRequeriments(),
        builder: (BuildContext context,
            AsyncSnapshot<List<RequerimentModel>> snapshot) {
          if (snapshot.hasData) {
            List<RequerimentModel> data = [];
            data = snapshot.data!.toList();
            List<RequerimentModel> permissionFilter;
            if (UserController.user.role.first == "ADM") {
              permissionFilter = data;
            } else {
              permissionFilter = data
                  .where((u) => u.tipo.grupo == UserController.user.role.first)
                  .toList();
            }

            var filter =
                permissionFilter.where((u) => u.status == 'Concluído').toList();
            statusApp.status.requerimentosConcluido.value = filter.length;

            return ListView.builder(
                controller: controller3,
                itemCount: filter.length,
                itemBuilder: (BuildContext context, int Index) {
                  DateTime OpenDate = filter[Index].abertoem.toLocal();
                  DateTime CloseDate = filter[Index].entregue.toLocal();
                  DateFormat formatedDate =
                      DateFormat(" dd/MM/yyyy 'às' HH:mm");
                  DateFormat formatedDateForDone = DateFormat(" dd/MM/yyyy");

                  String formatted = formatedDate.format(OpenDate);
                  ;
                  String formattedClose = formatedDateForDone.format(CloseDate);

                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            snapshot.data![Index].tipo.name,
                            style: TextStyles.titleListTile,
                          ),
                          Text(
                            "Nome: ${filter[Index].nomeAluno}",
                            style: TextStyles.titleListTile,
                          ),
                          Text(
                            "Responsável: ${filter[Index].responsavel}",
                          ),
                          Container(
                            height: 16,
                            child: Text("Aberto Em:$formatted"),
                          ),
                          SelectableText.rich(
                            TextSpan(
                              text: 'Protocolo:',
                              style: TextStyle(color: AppColors.blue),
                              // default text style
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' ${filter[Index].protocolo}',
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.orange)),
                              ],
                            ),
                          ),
                          Text("Concluído  Em:$formattedClose"),
                          Center(
                            child: Container(
                              color: Colors.green,
                              width: 40,
                              height: 4,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Container(
              child: Text("Erro ao buscar dados" + snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                  color: AppColors.blue, backgroundColor: AppColors.orange),
            );
          }
        });
  }
}
