import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/home_emplooyes_controller.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/model/adm/requeriment_model.dart';
import 'package:cefops/Src/model/adm/requeriment_type_model.dart';
import 'package:cefops/Src/module/pdf/ComprovanteMatriculaPDFModel.dart';
import 'package:cefops/Src/repository/adm/RequerimentsRepository.dart';
import 'package:cefops/Src/repository/adm/requerimentTypesRepository.dart';
import 'package:cefops/Src/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
class RequeriViews extends StatelessWidget {
  const RequeriViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: Get.height*0.9,
              child:  FutureBuilder(
                  future: GetRequeRequerimentType(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<RequerimentTypeModel>> snapshot) {

                    if (snapshot.hasData) {

                      return GridView.builder(
                          itemCount:snapshot.data!.length,
                          itemBuilder: (BuildContext context, int Index) {
                            var formatter = new DateFormat(" dd'/'MM'/'y 'as' hh:mm");
                            return Card(
                              color: Colors.orange,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data![Index].name,
                                      style: TextStyles.titleListTile,
                                    ),
                                    Text(
                                      "Nome:${snapshot.data![Index].name} ",
                                      style: TextStyles.titleListTile,
                                    ),

                                    Center(
                                      child: Container(
                                        color: Colors.green,
                                        width: 7,
                                        height: 4,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),);
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
