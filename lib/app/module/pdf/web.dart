import 'package:cefops/app/controller/views/adm/shared/home_emplooyes_controller.dart';
import 'package:universal_html/html.dart';
import 'dart:convert';



Future <void>saveAndLaunche(List<int> bytes, String fileName) async{
  HomeEmployesController.c.updating.value=true;

  AnchorElement(href: "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
  ..setAttribute("download", fileName)..click();
  HomeEmployesController.c.updating.value=false;


}