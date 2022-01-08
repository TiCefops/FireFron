import 'package:cefops/Shared/Security/Controller/user_controller.dart';
import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/controller/app/navigator_controller.dart';
import 'package:cefops/app/controller/app/status_app_controller.dart';
import 'package:cefops/app/data/model/model_publication.dart';
import 'package:cefops/app/services/post_service.dart';
import 'package:cefops/shared/error/page_error_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';

///detecta se é obscuro
bool obscure = true;

///detecta se é mobile
final bool ismobile = GetPlatform.isMobile;

///alutura para mobile
double heightforMobile = 0.9;

///
class HomePageStudant extends StatefulWidget {
  ///
  const HomePageStudant({Key? key}) : super(key: key);

  @override
  _HomePageStudantState createState() => _HomePageStudantState();
}

class _HomePageStudantState extends State<HomePageStudant> {
  late Future<PostModel> futurePost;
  PostService service = PostService();

  @override
  void initState() {
    futurePost = service.getPost();
    MenuDescicion(UserController.user.role.first);

    if (statusApp.status.closeDialog.value == 1) {
      if (statusApp.status.devendo.value == true) {
        delay();
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.04,
            ),
            FutureBuilder<PostModel>(
              future: futurePost,
              builder:
                  (BuildContext context, AsyncSnapshot<PostModel> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.title.length >= 2) {
                    obscure = false;
                  }

                  return
                    Container(
                    width: size.width * verifyMobile(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: obscure ? Colors.white : AppColors.orange,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            snapshot.data!.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.orange,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          SizedBox(
                            height: size.height / 1.5,
                            width: size.width,
                            child: SingleChildScrollView(
                              child: Text(
                                snapshot.data!.poste,
                                style: TextStyles.titleRegular,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const ErrorInfo();
                }

                return CircularProgressIndicator(
                  color: AppColors.background,
                  backgroundColor: AppColors.orange,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
///verifica se é mobile
double verifyMobile() {
  if (ismobile == true) {
    return heightforMobile = 0.9;
  } else {
    return heightforMobile = 0.6;
  }
}
///usado para mostrar mensagens popup para alunos
Future delay() async {
  await Future.delayed(const Duration(seconds: 5), () {});
}
