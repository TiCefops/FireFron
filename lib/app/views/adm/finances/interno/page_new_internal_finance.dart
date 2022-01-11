import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/widgets/views/adm/finances/internal/widget_finance_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


///Pagina para visualizar As financias internas
class NewInternalFinance extends StatelessWidget {
  ///inicio
  const NewInternalFinance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[

                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: Get.height ,
                        width: Get.width * 0.58,
                        color: AppColors.blue,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Nova Movimentação",
                                style: TextStyles.titleWithe,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: Get.height * 0.94,
                        width: Get.width * 0.2,
                        color: AppColors.background,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Localizations.override(
                                context: context,
                                locale: Locale('pt'),
                                child: SfCalendar(
                                  view: CalendarView.month,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.orange,
          child: const Icon(Icons.add),
          onPressed: () {
            NewFinanceInternal(context);

          },
        ),
      ),
    );
  }
}


