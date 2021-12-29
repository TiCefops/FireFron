import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/model/adm/requeriment_model.dart';
import 'package:cefops/Src/services/requeriment_service.dart';
import 'package:cefops/Src/views/adm/studantDetails/pages/page_studant_requeriment_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StuddantRequeriment extends StatelessWidget {
  final String id;

  const StuddantRequeriment(
    this.id, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _service = RequerimentService();
    final DateFormat dateFormate = DateFormat(" dd/MM/yyyy 'às' HH:mm");
    return Scaffold(
      body: Container(
        width: Get.width * 0.35,
        margin: EdgeInsets.fromLTRB(Get.width * 0.15, 0, 0, 0),
        child: FutureBuilder(
          future: _service.GetRequerimentsById(id),
          builder: (BuildContext context,
              AsyncSnapshot<List<RequerimentModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.orange),
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "${snapshot.data![index].tipo.name}",
                                    style: TextStyles.titleRegular,
                                  ),
                                ),
                                SelectableText.rich(
                                  TextSpan(
                                    text: 'Protocolo:',
                                      style: TextStyles.titleRegular, // default text style
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' ${snapshot.data![index].protocolo}',
                                          style: TextStyle(
                                              fontStyle: FontStyle.normal, color: AppColors.orange)),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Status: ${snapshot.data![index].status}",
                                      style: TextStyles.titleRegular,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.info,
                                        color: AppColors.blue,
                                      ),
                                      onPressed: () {
                                        StudantRequerimentDetails(
                                            context, snapshot.data![index]);
                                      },
                                    )
                                  ],
                                ),
                                Text(
                                  "Ùltima Atualização: ${dateFormate.
                                  format(snapshot.data![index].
                                  dataatualizacao.toLocal())}",
                                  style: TextStyles.titleRegular,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }
            } else if (snapshot.hasError) {
              return Container(
                child: Text("Erro"),
              );
            } else {
              return Container(child: CircularProgressIndicator());
            }
            return Container(
              child: Center(
                  child: Text(
                "Não há requerimentos cadastrados ",
                style: TextStyles.titleRegular,
              )),
            );
          },
        ),
      ),
    );
  }
}
