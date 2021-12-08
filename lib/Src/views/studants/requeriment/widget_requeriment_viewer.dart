
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/model/adm/requeriment_type_model.dart';
import 'package:cefops/Src/repository/adm/requerimentTypesRepository.dart';
import 'package:cefops/Src/views/studants/requeriment/widget_new_requeriment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
///inicio
class RequerimentViewer extends StatelessWidget {
 final String page;
  ///sla
  const RequerimentViewer( this.page, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
      ),
      body: GetRequerimentTypeByName(page),
    );
  }
}

Widget GetRequerimentTypeByName(String filter){
  String filterData=filter;
  if(filter !="Meus Requerimentos"){
    return FutureBuilder(
        future: GetRequeRequerimentType(),
        builder: (BuildContext context,
            AsyncSnapshot<List<RequerimentTypeModel>> snapshot) {
          if (snapshot.hasData) {
            List<RequerimentTypeModel> data = [];
            data = snapshot.data!.toList() ;

            List<RequerimentTypeModel> filter =
            data.where((u) => u.grupo == filterData).toList();

            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: filter.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Card(
                      color: Colors.amber,
                      child: InkWell(
                        child: Center(
                            child: Text(filter[index].name,style: TextStyles.titleListTile3Black,)
                        ),
                        onTap: (){
                          Get.to(()=> NewRequerimentFromStudant(filter[index]));
                        },
                      ),
                    ),
                  );
                }
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
        });
  }else{
    return Container(
      color: Colors.red,
    );
  }
}