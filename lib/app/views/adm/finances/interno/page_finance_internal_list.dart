import 'package:cefops/app/controller/adm/finance/internal/finance_internal_controller.dart';
import 'package:cefops/app/data/model/adm/finance/internal/finance_model.dart';
import 'package:cefops/shared/error/page_error_info.dart';
import 'package:cefops/shared/themes/app_colors.dart';
import 'package:cefops/shared/themes/app_textstayle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinanceInternalList extends GetView<FinanceInternalController> {
  const FinanceInternalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FinanceInternalController ct = Get.put(FinanceInternalController());
    return Scaffold(
        body: SingleChildScrollView(
      child: FutureBuilder(
        future: controller.getAllFinances(),
        builder:
            (BuildContext context, AsyncSnapshot<List<FinanceModel>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: Get.height / 3,
                    width: Get.width * 0.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColors.primary),
                            child: Text(
                              "Receita: R\$:500",
                              style: TextStyles.titleListTile2,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.width * 0.005,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColors.primary),
                            child: Text(
                              "Entrada: R\$:700",
                              style: TextStyles.titleListTile2,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.width * 0.005,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration:
                                BoxDecoration(color: AppColors.secondary),
                            child: Text(
                              "Saida: R\$:200",
                              style: TextStyles.titleListTile3Blackf,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.width * 0.005,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColors.primary),
                            child: Text(
                              "Total: R\$:900",
                              style: TextStyles.titleListTile2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.05,
                  ),
                  SizedBox(
                    width: Get.width / 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: Get.width * 0.85,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Column(
                            children: [
                              Text("Movimentações"),
                              SizedBox(
                                height: Get.height * 0.85,
                                child: ListView.builder(
                                    itemCount: snapshot.data?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        child: Column(
                                          children: <Widget>[
                                            Text(snapshot.data![index].descricao),

                                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children:<Widget> [
                                                Text(snapshot.data![index].tipoMovimentacao),
                                              Text("R\$: ${snapshot.data![index].valor.toString()}"),
                                                Text(snapshot.data![index].status),




                                              ],)


                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return ErrorInfo();
          }
          return CircularProgressIndicator();
        },
      ),
    ));
  }
}
