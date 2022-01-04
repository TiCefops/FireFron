import 'package:cefops/app/views/Security/page_login.dart';
import 'package:cefops/app/views/Security/page_login_android.dart';
import 'package:cefops/app/views/adm/secretaria/page_update_news.dart';
import 'package:cefops/app/views/adm/shared/page_home_employes.dart';
import 'package:cefops/app/views/adm/shared/page_list_studants.dart';
import 'package:cefops/app/views/studants/page_socre.dart';
import 'package:cefops/app/widgets/app/widget_navegation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:websafe_platform/websafe_platform.dart';

///Deteca dispositivo
WebsafePlatform websafePlatform = WebsafePlatform();

///Detectar se è windows
final bool windows = GetPlatform.isDesktop;

///
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const <LocalizationsDelegate>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const <Locale>[
        Locale('pt', 'BR'),
      ],
      locale: const Locale('zh'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      getPages: <GetPage>[
        GetPage(
          name: "/",
          page: () => _viewDetect(),
        ),
        GetPage(
          name: "/notes",
          page: () => NotesPage(),
        ),
        GetPage(
          name: "/navegation",
          page: () => MyApp(),
        ),
        GetPage(name: "/editNews", page: () => const UpdateNews()),
        GetPage(name: "/home", page: () => const EmployeesPage()),
        GetPage(name: "/ListAlunos", page: () => const ListUSers()),
      ],
    );
  }
}

StatefulWidget _viewDetect() {
  try {
    if (windows == false) {
      return LoginPageMobile();
    } else {
      return loginPage();
    }
  } catch (e) {
    return loginPage();
  }
}
