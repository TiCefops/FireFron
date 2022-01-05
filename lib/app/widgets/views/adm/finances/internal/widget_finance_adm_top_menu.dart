import 'package:cefops/app/controller/views/adm/finances/internal/finance_menu_controller.dart';
import 'package:cefops/shared/themes/app_textstayle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FinanceAdmTopMenu extends StatelessWidget {
  const FinanceAdmTopMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FinanceMenuController _controller =FinanceMenuController();
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
}
