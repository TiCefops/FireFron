import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/home_emplooyes_controller.dart';
import 'package:cefops/Src/controller/requeriment_controller.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/widgets/widget_new_requeriment.dart';
import 'package:cefops/Src/widgets/widget_GetRequeriments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

///
class EmployeesPage extends GetView<HomeEmployesController> {
  const EmployeesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: <Widget>[
              Container(
                width: Get.width / 2,
                height: Get.height * 0.01,
                margin: EdgeInsets.only(left: 60),
                child: LinearProgressIndicator(
                  value: HomeEmployesController.c.calcProgress(),
                  backgroundColor: AppColors.secondary,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                width: Get.width,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: Get.width * 0.24,
                      color: Colors.white70,
                      height: Get.height * 0.85,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Requerimentos Aberto"
                              " ${statusApp.status.requerimentosAberto}",
                              style: TextStyles.titleListTile,
                            ),
                          ),
                          Obx(() {
                            return Container(
                              height: Get.height * 0.80,
                              child: controller.updateScreen.value
                                  ? CircularProgressIndicator()
                                  : GetRequeriments(),
                            );
                          }),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width * 0.24,
                      color: Colors.white70,
                      height: Get.height * 0.85,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Requerimentos Em andamento",
                              style: TextStyles.titleListTile,
                            ),
                          ),
                          Obx(() {
                            return Container(
                              height: Get.height * 0.80,
                              child: controller.updateScreen.value
                                  ? CircularProgressIndicator()
                                  : GetRequerimentsAndando(),
                            );
                          }),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width * 0.24,
                      color: Colors.white70,
                      height: Get.height * 0.85,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Requerimentos Concluídos",
                              style: TextStyles.titleListTile,
                            ),
                          ),
                          Obx(() {
                            return Container(
                              height: Get.height * 0.8,
                              child: controller.updateScreen.value
                                  ? CircularProgressIndicator()
                                  : GetRequerimentsConcluido(),
                            );
                          })
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Get.width * 0.02),
                      height: Get.height * 0.8,
                      width: Get.width / 5,
                      child: Column(
                        children: <Widget>[
                          Localizations.override(
                            context: context,
                            locale: Locale('pt'),
                            child: SfCalendar(
                              view: CalendarView.week,
                              dataSource:MeetingDataSource(_getAppointments()) ,
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
          RequerimentController.req.linkPhoto.value =
              "https://img.icons8.com/external-flatart-icons-lineal-color-flatarticons/64/000000/external-photo-appliances-flatart-icons-lineal-color-flatarticons.png";
          RequerimentController.req.StudantFullName.value = "";
          showAlertDialog(context);
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
List<Appointment> _getAppointments(){
  List<Appointment> meetings=<Appointment>[];
  final DateTime today=DateTime.now();
  final DateTime  startTime=DateTime(today.year,today.month,today.day,8,0,0);
  final endTime=startTime.add(const Duration(hours: 12));

  meetings.add(Appointment(startTime: startTime, endTime: endTime,
    subject: "Teste",
    color: AppColors.orange
  ));
  return meetings;
  


}

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source){
    appointments=source;
  }

}