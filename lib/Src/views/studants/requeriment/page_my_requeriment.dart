import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/studants/studant_info_controller.dart';
import 'package:cefops/Src/model/adm/requeriment_model.dart';
import 'package:cefops/Src/repository/adm/RequerimentsRepository.dart';
import 'package:cefops/Src/widgets/widget_GetRequeriments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyRequeriments extends StatelessWidget {
  final String id;
  const MyRequeriments( {Key? key, required this.id,}) : super(key: key);

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
            SizedBox(height: Get.height*0.03,),
            Container(
              height: Get.height*0.8,
              width: Get.width*0.60,
              child: FutureBuilder(

                  future: GetRequerimentById(id: id),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<RequerimentModel>> snapshot) {
                    if (snapshot.hasData) {
                     List<RequerimentModel>? data =snapshot.data;
                      return GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return  Container(
                              child: myItems(data![index].tipo.name,
                                  data[index].tipo.grupo,
                                  data[index].abertoem.toLocal(),
                                  data[index].tipo.diasPentregar.toString(),
                                  data[index].status,
                                  data[index].responsavel,
                                  data[index].dataatualizacao.toLocal(),context),
                            );
                          },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                        (crossAxisCount: 2,
                          childAspectRatio: Get.width / (Get.height *1.1),),
                      );

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
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
/// items para o future
Widget myItems(String titulo,String setor,DateTime dataAbertura,
    String prazoEntrega,String status,String responsavel,DateTime ultimaAtuali,BuildContext context) {


  int color=0xFF1DE9B6;
  String statusFormatado="Em andamento";
  if(status=="andando"){
    statusFormatado="Em andamento";
  }else if(status=="Aberto"){
    statusFormatado="Enviado";
  }else{
    statusFormatado=status;
  }
    setStatus(status){
     switch (status) {
       case "Aberto":
         return color=0xFFf55d30;
       case "andando":
        return "Iniciado";
       case "Concluido":
         return color=0xFF30f558;;
       default: color=0xFF30f558;
     }
     }
setStatus(status);

  var openDate = DateFormat(" dd/MM/yyyy 'as' HH:mm").format(dataAbertura);
  var updateDate = DateFormat(" dd/MM/yyyy 'as' HH:mm").format(ultimaAtuali);

  return Expanded(
    flex: 1,
    child: Card(
      shadowColor: AppColors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color:AppColors.orange, width: 1),
      ),
      child: Container(
        height: Get.height*0.01,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(titulo,style: TextStyles.titleRegular,),
            ),
            SizedBox(height: Get.height*0.02,),

            textLo("Setor: "+setor),
            RichText(
              text: TextSpan(
                text: 'Status: ',
                style: TextStyles.titleRegular,
                children:  <TextSpan>[
                  TextSpan(text: '$statusFormatado',
                      style: TextStyle(
                        color: Color(color),
                      )),

                ],
              ),
            ),
            textLo("Entrega estimada em: $prazoEntrega dias úteis"),
            textLo("Responsavel: $responsavel"),
            textLo("Data Abertura: $openDate"),
            textLo("Ùltima atualização: $updateDate"),
          ],
        ),
      ),
    ),
  );

}
///texto para facilizar formatação
Widget textLo(String text){
  return  Padding(
    padding: const EdgeInsets.all(3.0),
    child: Text(text,style: TextStyles.titleListTile,),
  );
}
