import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/data/model/views/adm/secretaria/requerimentos/requeriment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

///
StudantRequerimentDetails(BuildContext context, RequerimentModel data) {
  final DateFormat dateFormate = DateFormat(" dd/MM/yyyy 'às' HH:mm");
  final DateFormat dateDoneFormate = DateFormat(" dd/MM/yyyy");
  Widget cancelButton = TextButton(
    child: const Text('Canceler'),
    onPressed: () {
      Get.back();
    },
  );
  Widget continueButton = TextButton(
    child: Text('Salvar'),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(
      child: SelectableText.rich(
        TextSpan(
          text: 'Protocolo:',
          style: TextStyle(color: AppColors.blue), // default text style
          children: <TextSpan>[
            TextSpan(
                text: ' ${data.protocolo}',
                style: TextStyle(
                    fontStyle: FontStyle.normal, color: AppColors.orange)),
          ],
        ),
      ),
    ),
    content: Container(
      decoration: BoxDecoration(border: Border.all(color: AppColors.blue)),
      width: Get.width / 1.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: AppColors.blue, width: 1),
                    bottom: BorderSide(color: AppColors.blue, width: 1)),
              ),
              child: Text(
                data.tipo.name,
                style: TextStyle(
                    color: AppColors.heading,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            "Responsável: ${data.responsavel}",
            style: TextStyles.trailingRegular,
          ),
          Text(
            "Status: ${data.status}",
            style: TextStyles.trailingRegular,
          ),
          Text(
            "Status Pagamento: ${data.statusPagameto}",
            style: TextStyles.trailingRegular,
          ),
          Text(
            "Valor R\$:${data.tipo.valor}",
            style: TextStyles.trailingRegular,
          ),
          Text(
            "Aberto em:${dateFormate.format(data.abertoem.toLocal())}",
            style: TextStyles.trailingRegular,
          ),
          Text(
            "Última Atualização:${dateFormate.format(data.dataatualizacao.toLocal())}",
            style: TextStyles.trailingRegular,
          ),
          Text(
            "Concluído Em:${dateDoneFormate.format(data.entregue.toLocal())}",
            style: TextStyles.trailingRegular,
          ),
          Text(
            "Observação",
            style: TextStyles.trailingRegular,
          ),
          Container(
              height: Get.height * 0.2,
              width: Get.width * 0.25,
              decoration:
                  BoxDecoration(border: Border.all(color: AppColors.orange)),
              child: Center(
                child: Text(
                  " ${data.observacao}",
                  style: TextStyles.trailingRegular,
                ),
              )),
          IconButton(
              onPressed: () {},
              iconSize: Get.height * 0.1,
              icon: Icon(
                Icons.picture_as_pdf,
                color: Colors.red,
              ))
        ],
      ),
    ),
    actions: <Widget>[
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
