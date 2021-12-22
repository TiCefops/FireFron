
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/controller/home_emplooyes_controller.dart';
import 'package:cefops/Src/model/adm/requeriment_type_model.dart';
import 'package:cefops/Src/module/pdf/ComprovanteMatriculaPDFModel.dart';
import 'package:cefops/Src/repository/adm/RequerimentsRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
///d
class NewRequerimentFromStudant extends GetView<HomeEmployesController> {
  final RequerimentTypeModel data;
///
  const NewRequerimentFromStudant(this.data,{Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var controller1 =UserController.user;
    Get.lazyPut(() => HomeEmployesController());

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.blue,),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: Get.height*0.01,
            ),
           Center(
             child: Container(
               width: GetPlatform.isMobile?Get.width*0.9 :Get.width/3,
               height: Get.height*0.4,
               decoration: BoxDecoration(
                 border: Border.all(
                   color: AppColors.blue
                 ),
                 borderRadius: BorderRadius.circular(10)
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text("Nome: ${data.name}",style: TextStyles.titleListTile3Black,),
                   Text("Entrega prevista em ${data.diasPentregar.toString()+
                       "  Dias"
                       " uteis"}",style: TextStyles.titleListTile3Black),
                   Text("Valor R\$:${data.valor}",style: TextStyles.titleListTile3Black),
                 ],
               ),
             ),
           ),
            SizedBox(
              height: Get.height*0.01,
            ),
            Obx(
               () {
                return  controller.updating.value
                    ? CircularProgressIndicator() :ElevatedButton.icon(
                    onPressed:controller.click.value?null:()async{
                 if(data.valor !=0.0)
                 {

                 }else{
                   await  CreateRequeriment(
                       data.id,
                       controller1.id.value,
                       controller1.Fullname.value,
                       "aberto pelo app");
                   if(data.name=="Comprovante De Matrícula"){
                     await ComprovMatricula();

                   }
                 }
                 controller.click.value=true;

                },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.blue,
                        textStyle: TextStyles.titleListTile2,
                        fixedSize: Size(GetPlatform.isMobile?Get.width*0.5: Get.width*0.1, Get.height*0.05)),
                    icon:Icon(Icons.shopping_cart),
                    label: Text("Continuar"));
              }
            ),
            Obx((){
              return Center(
                child: HomeEmployesController.c.click.value? Container(
                  child: RichText(
                    text: TextSpan(
                      text: 'Requerimento Cadastrado Com sucesso. \n '
                          'Acompanhe o status na aba ',
                      style: TextStyles.titleListTile3Black,
                      children: const <TextSpan>[
                        TextSpan(text: '\"Meus Requerimentos\"',
                            style: TextStyle(
                              color: Colors.blue,
                            )),

                      ],
                    ),
                  ),
                )
                    :Text(""),
              );
            })
          ],
        ),
      ),
    );
  }
}

