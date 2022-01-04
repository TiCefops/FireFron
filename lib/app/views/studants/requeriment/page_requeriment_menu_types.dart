import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/views/studants/requeriment/widget_requeriment_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
///
class RequerimentMenuTypes extends StatelessWidget {
  ///
  const RequerimentMenuTypes({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: Get.height*0.02,
              ),
              items("Meus Requerimentos"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:GetPlatform.isMobile?
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: items("Secretaria"),
                        ),

                        items("Financeiro"),
                      ],
                    ):
                Row(
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
              GetPlatform.isMobile?
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: items("Estágio"),
                      ),
                      items("Documentação"),
                    ],
                  ):
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
      width:GetPlatform.isMobile?Get.width*0.9: Get.width*0.3,
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