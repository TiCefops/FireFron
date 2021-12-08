import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/views/studants/requeriment/widget_requeriment_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequeriViews extends StatelessWidget {
  const RequeriViews({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            items("Meus Requerimentos"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: items("Secretaria"),
                  ),

                  items("Financeiro"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: items("Estágio"),
                ),
                items("Documentação"),
              ],
            ),




          ],
        ),
      ),

    );
  }
}

Widget items(String text){
  return InkWell(
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.orange,
          border: Border.all(color: AppColors.blue,width: 5)
      ),
      width: Get.width*0.3,
      height: Get.height*0.2,
      child: Center(
          child: Text("$text",
            style:TextStyles.titleListTile3Black,)),
    ),
    onTap: (){
      Get.to(() => RequerimentViewer(text));

    },
  );
}