import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/home_emplooyes_controller.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/model/adm/requeriment_model.dart';
import 'package:cefops/Src/repository/adm/RequerimentsRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

var controller=HomeEmployesController.c;



class GetRequeriments extends StatefulWidget {
  const GetRequeriments({Key? key}) : super(key: key);

  @override
  State<GetRequeriments> createState() => _GetRequerimentsState();
}

class _GetRequerimentsState extends State<GetRequeriments> {
  @override

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetAllRequeriment(),
        builder: (BuildContext context,
            AsyncSnapshot<List<RequerimentModel>> snapshot) {
          if (snapshot.hasData) {

            controller.allData.value=snapshot.data!.toList();
            List<RequerimentModel>? data = [];
            data = controller.allData.value.cast<RequerimentModel>();

            List<RequerimentModel> permissionFilter;
            if (UserController.user.role.first == "ADM") {
              permissionFilter = data;
            } else {
              permissionFilter = data
                  .where((u) => u.tipo.grupo == UserController.user.role.first)
                  .toList();
            }
            var filter =
            permissionFilter.where((u) => u.status == 'Aberto').toList();
            statusApp.status.requerimentosAberto.value = filter.length;
            return ListView.builder(
                itemCount: filter.length,

                itemBuilder: (BuildContext context, int Index) {
                  DateTime now = filter[Index].abertoem;
                  DateFormat formatter = new DateFormat(" dd'/'MM'/'y 'as' hh:mm");
                  String previsaoFormater =
                  DateFormat("'Previsão de Entrega:' dd/MM/yyyy").format(now
                      .add(Duration(days: filter[Index].tipo.diasPentregar)));
                  String formatted = formatter.format(now);
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget> [
                                  Text("Aberto Em:$formatted"),
                                  statusApp.status.loading.value
                                      ? Center(
                                    child: CircularProgressIndicator(
                                        color: AppColors.blue,
                                        backgroundColor: AppColors.orange),
                                  )
                                      : IconButton(
                                      onPressed: () async {
                                        await updateReq(
                                            filter[Index].id,
                                            UserController.user.Fullname.value,
                                            "andando",false);
                                        HomeEmployesController.c.updateScreen.value=true;
                                        HomeEmployesController.c.updateScreenFun();
                                        setState(() {

                                        });
                                      },
                                      icon: Icon(Icons.add))
                                ],
                              ),
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

          }
          else if (snapshot.hasError) {
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


GetRequerimentsAndando() {
  return FutureBuilder(
      future: GetAllRequeriment(),
      builder: (BuildContext context,
          AsyncSnapshot<List<RequerimentModel>> snapshot) {
        if (snapshot.hasData) {
          List<RequerimentModel> data = [];
          data = snapshot.data!.toList();
          Iterable<RequerimentModel> permissionFilter;
          if (UserController.user.role.first == "ADM") {
            permissionFilter = data;
          } else {
            permissionFilter = data
                .where((RequerimentModel u) => u.tipo.grupo == UserController.user.role.first);
          }

          var filter =
              permissionFilter.where((u) => u.status == 'andando').toList();

          return ListView.builder(

              itemCount: filter.length,
              itemBuilder: (BuildContext context, int Index) {
                var now = filter[Index].abertoem;
                var formatter = new DateFormat(" dd'/'MM'/'y 'as' hh:mm");
                var previsaoFormater =
                    DateFormat("'Previsão de Entrega:' dd/MM/yyyy").format(
                        now.add(Duration(
                            days: snapshot.data![Index].tipo.diasPentregar)));
                String formatted = formatter.format(now);

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
                          "Responsavel: ${filter[Index].responsavel}",
                        ),
                        Container(
                          height: 16,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Aberto Em:$formatted"),
                              IconButton(
                                  onPressed: () async{
                                    await updateReq(
                                        filter[Index].id,
                                        UserController.user.Fullname.value,
                                        "concluido",true);

                                    HomeEmployesController.c.updateScreen.value=true;
                                    HomeEmployesController.c.updateScreenFun();
                                  }, icon: Icon(Icons.add))
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

GetRequerimentsConcluido() {
  return FutureBuilder(
      future: GetAllRequeriment(),
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
              permissionFilter.where((u) => u.status == 'concluido').toList();

          return ListView.builder(
              itemCount: filter.length,
              itemBuilder: (BuildContext context, int Index) {
                var OpenDate = filter[Index].abertoem;
                var CloseDate = filter[Index].entregue;
                var formatterOpenDate =
                    new DateFormat(" dd'/'MM'/'y 'as' hh:mm");
                String formatted = formatterOpenDate.format(OpenDate);

                var formatterCloseDate =
                    new DateFormat(" dd'/'MM'/'y 'as' hh:mm");
                String formattedClose = formatterCloseDate.format(CloseDate);
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget> [
                        Text(
                          snapshot.data![Index].tipo.name,
                          style: TextStyles.titleListTile,
                        ),
                        Text(
                          "Nome: ${filter[Index].nomeAluno}",
                          style: TextStyles.titleListTile,
                        ),
                        Text(
                          "Responsavel: ${filter[Index].responsavel}",
                        ),
                        Container(
                          height: 16,
                          child: Text("Aberto Em:$formatted"),
                        ),
                        Text("Concluído  Em: $formattedClose"),
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
