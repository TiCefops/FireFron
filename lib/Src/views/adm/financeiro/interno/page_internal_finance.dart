import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/views/adm/financeiro/interno/controller/new_finance_controller.dart';
import 'package:cefops/Src/views/adm/financeiro/interno/widgets/widget_get_next_finance.dart';
import 'package:cefops/Src/views/adm/financeiro/interno/widgets/widget_finance_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'controller/finance_menu_controller.dart';


FinanceMenuController _controller =FinanceMenuController();
///Pagina para visualizar As financias internas
class InternalFinance extends StatelessWidget {
  ///inicio
  const InternalFinance({Key? key}) : super(key: key);

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
                      Container(
                        height: Get.height ,
                        width: Get.width / 6,
                        color: AppColors.background,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Contas Com Vencimentos Próximo",
                                style: TextStyles.titleListTile,
                              ),
                            ),
                            Container(
                              height: Get.height *0.94,
                              child: GetNextFinance(),
                            ),
                          ],
                        ),
                      )
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
                            _customMenu(),
                            Center(
                              child: Text(
                                "Todas Entradas e Saida",
                                style: TextStyles.titleListTile,
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
            NewFinanceInterna(context);

          },
        ),
      ),
    );
  }
}

Widget _customMenu() {
  double _width = Get.width * 0.09;
  double _height = 30;
  return Row(
    children: <Widget>[
      Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: Get.width / 2,
          height: Get.height * 0.06,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(0.04),
                alignment: Alignment.center,
                height: _height,
                width: _width,
                color: Colors.amber,
                child: Obx(
                  () {
                    return Text("Abertura R\$:${_controller.valorAbertura}",
                        style: TextStyles.titleWithe, textAlign: TextAlign.center);
                  }
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: _height,
                width: _width,
                color: Colors.deepOrangeAccent,
                child: Text(
                  "Saída R\$:500",
                  style: TextStyles.titleWithe,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: _height,
                width: _width,
                color: Colors.green,
                child: Text("Entrada R\$:900",
                    style: TextStyles.titleWithe, textAlign: TextAlign.center),
              ),
              Container(
                alignment: Alignment.center,
                height: _height,
                width: _width,
                color: Colors.orange,
                child: Text("Deposito R\$:300",
                    style: TextStyles.titleWithe, textAlign: TextAlign.center),
              ),
              Container(
                alignment: Alignment.center,
                height: _height,
                width: _width,
                color: Colors.deepOrange,
                child: Text("Devoluções R\$:30",
                    style: TextStyles.titleWithe, textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
