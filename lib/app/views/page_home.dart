import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/controller/navigator_controller.dart';
import 'package:cefops/app/controller/status_app_controller.dart';
import 'package:cefops/app/data/model/model_publication.dart';
import 'package:cefops/app/widgets/school_management/requeriments/widget_new_requeriment.dart';
import 'package:cefops/app/services/post_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';


bool obscure=true;
final ismobile=GetPlatform.isMobile;
 double heightforMobile=0.9;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<PostModel> futurePost;
  PostService service=PostService();

  @override
  void initState() {

    futurePost = service.getPost() as Future<PostModel>;
    MenuDescicion(UserController.user.role.first);

if (statusApp.status.closeDialog==1) {
      if (statusApp.status.devendo==true) {
        delay(context);
      }  
}  

    super.initState();



  }

  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //     begin: Alignment.topRight,
    //     end: Alignment.bottomLeft,
    //     colors: <Color>[
    //       AppColors.primary,
    //     AppColors.primaryDark,
    //
    //     ],
    // )
      ),


      child: Center(

        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height:size.height*0.04,),
              FutureBuilder<PostModel>(
                future: futurePost,
                builder: (BuildContext context, AsyncSnapshot<PostModel> snapshot) {

                  if (snapshot.hasData) {
                    if(snapshot.data!.title.length >=2){
                      obscure=false;

                    }

                    return Container(
                        width: size.width*verifyMobile(),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                          BoxShadow(color: obscure? Colors.white :AppColors.orange, spreadRadius: 3),
                      ]
                    )
                  ,

                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(snapshot.data!.title,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                color:AppColors.orange,

                              ),),
                            SizedBox(height: size.height*0.04,),

                        Container( height: size.height/1.5,
                          width: size.width,
                              child: SingleChildScrollView(

                                  child: Text(snapshot.data!.poste,style:TextStyles.titleRegular,
                                  ),),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {


                  return Text("${snapshot.error}");
                  }

                  return CircularProgressIndicator(
                    color: AppColors.background,
                    backgroundColor: AppColors.orange,
                  );
                },
              ),

            ],
          ),
        )
      ),
    );
  }
}

verifyMobile( ){
    if(ismobile==true) {
    return  heightforMobile=0.9;
    }else{
      return heightforMobile=0.6;
    }
}
Future delay(context) async{
  await new Future.delayed(new Duration(seconds: 5), ()
  {
    showAlertDialog(context);
  });
  }