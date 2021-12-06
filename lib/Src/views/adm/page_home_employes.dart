import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/home_emplooyes_controller.dart';
import 'package:cefops/Src/controller/requerimentController.dart';
import 'package:cefops/Src/controller/new_requeriment_view_controller.dart';
import 'package:cefops/Src/controller/requerimentsController.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/repository/adm/requerimentTypesRepository.dart';
import 'package:cefops/Src/widgets/widget_new_requeriment.dart';
import 'package:cefops/Src/widgets/widget_GetRequeriments.dart';
import 'package:cefops/Src/widgets/widget_GetStudants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EmployeesPage extends GetView <HomeEmployesController>{
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   var size = MediaQuery.of(context).size;
   return Scaffold(
      body: Container(

        child: Container(
          height: size.height,
          width: size.width,
          child:Column(
              children: <Widget>[
                Container(
                  width: size.width / 2,
                  height: size.height * 0.01,
                  margin: EdgeInsets.only(left: 60),
                  child: LinearProgressIndicator(
                    value: 0.01,
                    backgroundColor: AppColors.secondary,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width,
                  child: Row(
                    children: <Widget> [
                      Container(
                        width: size.width * 0.24,
                        color: Colors.white70,
                        height: size.height * 0.85,
                        child: Column(
                          children: [
                            Center(
                              child:  Text(
                                "Requerimentos Aberto"
                                    " ${statusApp.status.requerimentosAberto}",
                                style: TextStyles.titleListTile,
                              ),
                            ),
                            Obx(
                             () {
                                return Container(
                                  height: size.height *0.80,
                                  child: controller.updateScreen.value?
                                  CircularProgressIndicator():GetRequeriments(),

                                );
                              }
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.24,
                        color: Colors.white70,
                        height: size.height * 0.85,
                        child: Column(
                          children: <Widget> [
                            Center(
                              child: Text(
                                "Requerimentos Em andamento",
                                style: TextStyles.titleListTile,
                              ),
                            ),
                            Obx(
                              () {
                                return Container(
                                  height: size.height * 0.80,
                                  child: controller.updateScreen.value?
                                  CircularProgressIndicator():
                                  GetRequerimentsAndando(),
                                );
                              }
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.24,
                        color: Colors.white70,
                        height: size.height * 0.85,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Requerimentos Concluídos",
                                style: TextStyles.titleListTile,
                              ),
                            ),
                            Obx(
                               () {
                                return Container(
                                  height: size.height*0.8,
                                  child:controller.updateScreen.value?
                                  CircularProgressIndicator():
                                  GetRequerimentsConcluido(),
                                );
                              }
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: size.width*0.02),
                        height: size.height*0.8,
                        width: size.width / 5,
                        child: Column(
                          children:<Widget> [
                            Localizations.override(
                              context: context,
                              locale: Locale('pt'),
                              child: SfCalendar(
                                view: CalendarView.month,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),

        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RequerimentController.req.linkPhoto.value="https://img.icons8.com/external-flatart-icons-lineal-color-flatarticons/64/000000/external-photo-appliances-flatart-icons-lineal-color-flatarticons.png";
          RequerimentController.req.StudantFullName.value="";
          showAlertDialog(context);
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: AppColors.primary,
      ),
    );

  }
}
