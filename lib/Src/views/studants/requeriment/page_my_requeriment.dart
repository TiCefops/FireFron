import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/model/adm/requeriment_model.dart';
import 'package:cefops/Src/repository/adm/RequerimentsRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyRequeriments extends StatelessWidget {
  final String id;

  ///
  const MyRequeriments({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Container(
              height: GetPlatform.isMobile? Get.height * 0.8:Get.height*0.82,
              width:GetPlatform.isMobile?Get.width*0.9: Get.width * 0.60,
              child: FutureBuilder(
                  future: GetRequerimentById(id: id),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<RequerimentModel>> snapshot) {
                    if (snapshot.hasData) {
                      var openDate = DateFormat(" dd/MM/yyyy 'as' HH:mm");
                      var updateDate = DateFormat(" dd/MM/yyyy");

                      List<RequerimentModel>? data = snapshot.data;
                      int color = 0xFF1DE9B6;
                      setStatus(String status) {
                        switch (status) {
                          case "Solicitado":
                            return color = 0xFF991E0B;
                          case "Em Andamento":
                            return color = 0xFFDA9100;;
                          case "Concluído":
                            return color = 0xFF498A85;
                            ;
                          default:
                            color = 0xFF30f558;
                        }
                      }
                      return GetPlatform.isMobile? ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (BuildContext context, int index){
                          setStatus(data[index].status);

                          return Card(
                            shadowColor: AppColors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color:AppColors.orange, width: 1),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                                children: <Widget>[
                                  Center(child: SizedBox(
                                    child: Container(
                                      width: 30,
                                      height: 2,
                                      color: Color(color),
                                    ),
                                  ),),
                                  Center(
                                    child: Text("${data[index].tipo.name}",
                                        style: TextStyles.titleListTile),
                                  ),
                                  Text("Setor: ${data[index].tipo.grupo}",
                                      style: TextStyles.titleListTile),
                                  Text("Responsável: ${data[index].responsavel}",
                                      style: TextStyles.titleListTile),
                                  Text("Data Abertura: ${openDate.format(data[index].
                                  abertoem.toLocal())}",
                                      style: TextStyles.titleListTile),
                                  Text("Prazo: ${data[index].tipo.diasPentregar} dias "
                                      "úteis",
                                      style: TextStyles.titleListTile),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Status: ',
                                      style: TextStyles.titleRegular,
                                      children:  <TextSpan>[
                                        TextSpan(text: '${data[index].status}',
                                            style: TextStyle(
                                              color: Color(color),
                                            )),

                                      ],
                                    ),
                                  ),

                                  Text("Última Atualização:${openDate.format(
                                      data[index].dataatualizacao)}",
                                      style: TextStyles.titleListTile),
                                  data[index].concluido?
                                  Text("Concluido Em:${updateDate.format(
                                      data[index].entregue.toLocal())}",
                                      style: TextStyles.titleListTile):
                                  Text(""),
                                ],
                              ),
                            ),
                          );
                        },
                      ):GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          setStatus(data![index].status);
                          return Card(
                              shadowColor: AppColors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color:AppColors.orange, width: 1),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            
                            children: <Widget>[
                              Center(child: SizedBox(
                                child: Container(
                                  width: 30,
                                  height: 2,
                                  color: Color(color),
                                ),
                              ),),
                                Center(
                                  child: Text("${data[index].tipo.name}",
                                    style: TextStyles.titleListTile),
                                ),
                                Text("Setor: ${data[index].tipo.grupo}",
                                    style: TextStyles.titleListTile),
                                Text("Responsavel: ${data[index].responsavel}",
                                    style: TextStyles.titleListTile),
                                Text("Data Abertura: ${openDate.format(data[index].
                                abertoem.toLocal())}",
                                    style: TextStyles.titleListTile),
                                Text("Prazo: ${data[index].tipo.diasPentregar} dias "
                                    "úteis",
                                    style: TextStyles.titleListTile),
                              RichText(
                                text: TextSpan(
                                  text: 'Status: ',
                                  style: TextStyles.titleRegular,
                                  children:  <TextSpan>[
                                    TextSpan(text: '${data[index].status}',
                                        style: TextStyle(
                                          color: Color(color),
                                        )),

                                  ],
                                ),
                              ),

                                Text("Última Atualização:${openDate.format(
                                    data[index].dataatualizacao.toLocal())}",
                                    style: TextStyles.titleListTile),
                              data[index].concluido?
                                Text("Concluido Em:${updateDate.format(
                                    data[index].entregue.toLocal())}",
                                    style: TextStyles.titleListTile):
                              Text(""),
                            ],
                          ),
                              ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: Get.width / (Get.height * 1.1),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                        child: Text(
                            "Erro ao buscar dados" + snapshot.error.toString()),
                      );
                    } else {

                      return Center(
                        child: CircularProgressIndicator(
                            color: AppColors.blue,
                            backgroundColor: AppColors.orange),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}