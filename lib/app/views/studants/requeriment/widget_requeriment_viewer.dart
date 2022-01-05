import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/data/model/adm/requeriment_type_model.dart';
import 'package:cefops/app/services/adm/requeriment/requeriment_types_service.dart';
import 'package:cefops/app/views/studants/requeriment/page_my_requeriment.dart';
import 'package:cefops/app/views/studants/requeriment/widget_new_requeriment.dart';
import 'package:cefops/shared/error/page_error_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///inicio
class RequerimentViewer extends StatelessWidget {
  final String page;

  ///sla
  const RequerimentViewer(this.page, {Key? key}) : super(key: key);

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

Widget GetRequerimentTypeByName(String filter) {
  String filterData = filter;
  RequerimentTypeService _service=RequerimentTypeService();
  if (filter != "Meus Requerimentos") {
    return FutureBuilder(
        future: _service.getAllRequerimentsTypes(),
        builder: (BuildContext context,
            AsyncSnapshot<List<RequerimentTypeModel>> snapshot) {
          if (snapshot.hasData) {
            List<RequerimentTypeModel> data = [];
            data = snapshot.data!.toList();

            List<RequerimentTypeModel> filter =
                data.where((u) => u.grupo == filterData).toList();

            return GetPlatform.isMobile
                ? ListView.builder(
             itemCount: filter.length,
                    itemBuilder: (BuildContext context, int index) {
               return Container(
                 height: Get.height*0.2,
                 child: Card(
                   color: Colors.amber,
                   child: InkWell(
                     child: Center(
                         child: Text(
                           filter[index].name,
                           style: TextStyles.titleListTile3Black,
                         )),
                     onTap: () {
                       Get.to(() =>
                           NewRequerimentFromStudant(filter[index]));
                     },
                   ),
                 ),
               );

                    })
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: filter.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Card(
                          color: Colors.amber,
                          child: InkWell(
                            child: Center(
                                child: Text(
                              filter[index].name,
                              style: TextStyles.titleListTile3Black,
                            )),
                            onTap: () {
                              Get.to(() =>
                                  NewRequerimentFromStudant(filter[index]));
                            },
                          ),
                        ),
                      );
                    });
          } else if (snapshot.hasError) {
            return ErrorInfo();
          } else {
            return Center(
              child: CircularProgressIndicator(
                  color: AppColors.blue, backgroundColor: AppColors.orange),
            );
          }
        });
  } else {
    return MyRequeriments(
      id: UserController.user.alunoId.value,
    );
  }
}
