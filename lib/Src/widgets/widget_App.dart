import 'package:cefops/Src/views/Security/Page_Login.dart';
import 'package:cefops/Src/views/adm/financeiro/interno/page_internal_finance.dart';
import 'package:cefops/Src/views/adm/page_home_employes.dart';
import 'package:cefops/Src/views/adm/secretaria/page_list_studants.dart';
import 'package:cefops/Src/views/adm/secretaria/page_update_news.dart';
import 'package:cefops/Src/views/Security/page_Login-android.dart';
import 'package:cefops/Src/views/studants/page_Socre.dart';
import 'package:cefops/Src/views/adm/secretaria/page_sigin_studant.dart';

import 'package:cefops/Src/widgets/widget_Navegation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:websafe_platform/websafe_platform.dart';
var websafePlatform = WebsafePlatform();

bool isIos = websafePlatform.isIOS();
bool isWeb = websafePlatform.isWeb();
bool isAndroid=websafePlatform.isAndroid();

final testt=GetPlatform.isMobile;
final windows=GetPlatform.isDesktop;



class AppWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),

      ],
      locale: const Locale('zh'),

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      getPages: [
        GetPage(
            name: "/",
            page: ()=> _viewDetect()
        ),

        GetPage(
            name: "/notes",
            page: ()=> NotesPage()),GetPage(
            name: "/navegation",
            page: ()=> MyApp()),
        GetPage(
            name: "/cadastrarAluno",
            page: ()=> SiginStudant()),
        GetPage(
            name: "/editNews",
            page: ()=> EditNews()),
        GetPage(
            name: "/home",
            page: ()=> EmployeesPage()),
        GetPage(
            name: "/ListAlunos",
            page: ()=> ListUSers()),
        GetPage(
            name: "/home",
            page: ()=> EmployeesPage()),



      ],

    );
  }
}
 _viewDetect(){

  try{
    if(windows==false){
    return loginPage_Mobile();

  }
    else return loginPage();

  } catch(e){return loginPage();}
}

