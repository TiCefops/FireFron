import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/data/model/adm/requeriment_model.dart';
import 'package:cefops/app/services/adm/requeriment/requeriment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

///
class MyRequeriments extends StatelessWidget {
  ///
  const MyRequeriments({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    final RequerimentService _service = RequerimentService();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Meus Requerimentos",
              style: TextStyles.titleListTile3Black,
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          SizedBox(
            height: GetPlatform.isMobile ? Get.height * 0.8 : Get.height * 0.82,
            width: GetPlatform.isMobile ? Get.width * 0.9 : Get.width * 0.60,
            child: FutureBuilder(
              future: _service.getRequerimentsById(id),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<RequerimentModel>> snapshot,
              ) {
                if (snapshot.hasData) {
                  final DateFormat openDate =
                      DateFormat(" dd/MM/yyyy 'às' HH:mm");
                  final DateFormat updateDate = DateFormat(" dd/MM/yyyy");

                  List<RequerimentModel>? data = snapshot.data;
                  int color = 0xFF1DE9B6;
                  int setStatus(String status) {
                    switch (status) {
                      case "Solicitado":
                        return color = 0xFF991E0B;
                      case "Em Andamento":
                        return color = 0xFFDA9100;

                      case "Concluído":
                        return color = 0xFF498A85;

                      default:
                        color = 0xFF30f558;
                    }
                    return color = 0xFF30f558;
                  }

                  return GetPlatform.isMobile
                      ? ListView.builder(
                          itemCount: data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            setStatus(data[index].status);

                            return Card(
                              shadowColor: AppColors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  color: AppColors.orange,
                                  width: 1,
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Center(
                                      child: SizedBox(
                                        child: Container(
                                          width: 30,
                                          height: 2,
                                          color: Color(color),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        data[index].tipo.name,
                                        style: TextStyles.titleListTile,
                                      ),
                                    ),
                                    SelectableText.rich(
                                      TextSpan(
                                        text: 'Protocolo:',
                                        style: TextStyle(color: AppColors.blue),
                                        // default text style
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' ${data[index].protocolo}',
                                            style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              color: AppColors.orange,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Setor: ${data[index].tipo.grupo}",
                                      style: TextStyles.titleListTile,
                                    ),
                                    Text(
                                      "Responsável: ${data[index].responsavel}",
                                      style: TextStyles.titleListTile,
                                    ),
                                    Text(
                                      "Data Abertura: ${openDate.format(data[index].abertoem.toLocal())}",
                                      style: TextStyles.titleListTile,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Prazo: ${data[index].tipo.diasPentregar} dias "
                                          "úteis",
                                          style: TextStyles.titleListTile,
                                        ),
                                        if (data[index].concluido)
                                          IconButton(
                                            icon: const Icon(
                                              Icons.picture_as_pdf,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {},
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                          )
                                        else
                                          const Icon(
                                            Icons.picture_as_pdf,
                                            color: Colors.grey,
                                          ),
                                      ],
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Status: ',
                                        style: TextStyles.titleRegular,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: data[index].status,
                                            style: TextStyle(
                                              color: Color(color),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Última Atualização:${openDate.format(data[index].dataatualizacao)}",
                                      style: TextStyles.titleListTile,
                                    ),
                                    if (data[index].concluido)
                                      Text(
                                        "Concluído Em:${updateDate.format(data[index].entregue.toLocal())}",
                                        style: TextStyles.titleListTile,
                                      )
                                    else
                                      const Text(""),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            setStatus(data![index].status);
                            return Card(
                              shadowColor: AppColors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  color: AppColors.orange,
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Center(
                                      child: SizedBox(
                                        child: Container(
                                          width: 30,
                                          height: 2,
                                          color: Color(color),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        data[index].tipo.name,
                                        style: TextStyles.titleListTile,
                                      ),
                                    ),
                                    SelectableText.rich(
                                      TextSpan(
                                        text: 'Protocolo:',
                                        style: TextStyles.titleListTile,
                                        // default text style
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' ${data[index].protocolo}',
                                            style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              color: AppColors.orange,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Setor: ${data[index].tipo.grupo}",
                                      style: TextStyles.titleListTile,
                                    ),
                                    Text(
                                      "Responsavel: ${data[index].responsavel}",
                                      style: TextStyles.titleListTile,
                                    ),
                                    Text(
                                      "Data Abertura: ${openDate.format(data[index].abertoem.toLocal())}",
                                      style: TextStyles.titleListTile,
                                    ),
                                    Text(
                                      "Prazo: ${data[index].tipo.diasPentregar} dias "
                                      "úteis",
                                      style: TextStyles.titleListTile,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        RichText(
                                          text: TextSpan(
                                            text: 'Status: ',
                                            style: TextStyles.titleRegular,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: data[index].status,
                                                style: TextStyle(
                                                  color: Color(color),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (data[index].concluido)
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            icon: const Icon(
                                              Icons.picture_as_pdf,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {},
                                          )
                                        else
                                          const Text("")
                                      ],
                                    ),
                                    Text(
                                      "Última Atualização:${openDate.format(data[index].dataatualizacao.toLocal())}",
                                      style: TextStyles.titleListTile,
                                    ),
                                    if (data[index].concluido)
                                      Text(
                                        "Concluído Em:${updateDate.format(data[index].entregue.toLocal())}",
                                        style: TextStyles.titleListTile,
                                      )
                                    else
                                      const Text(""),
                                  ],
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: Get.width / (Get.height * 1.1),
                          ),
                        );
                } else if (snapshot.hasError) {
                  return Text(
                    "Erro ao buscar dados${snapshot.error}",
                  );
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
          ),
        ],
      ),
    );
  }
}
