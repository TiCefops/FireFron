import 'dart:typed_data';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Src/controller/home_emplooyes_controller.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import  'mobile.dart' if(dart.library.html)"web.dart";

Future<void> ComprovMatricula() async{
  HomeEmployesController.c.updating.value=true;

  final  data = new DateTime.now() ;

  var timeformat = DateFormat(" dd/MM/yyyy  hh:mm").format(data);
  var timeformat2 = DateFormat(" d 'de' MMMM 'de' y", "pt_BR").format(data);
  double marginEsquerda=40.0;

  PdfDocument document = PdfDocument();
  final page = document.pages.add();



  page.graphics.drawImage(PdfBitmap(await _readImageData("novohead.png")),
      Rect.fromLTWH(0, -0, 520, 90));

  page.graphics.drawString("DECLARAÇÃO  DE MATRÍCULA",
    PdfStandardFont(PdfFontFamily.timesRoman, 12),
    bounds: Rect.fromLTWH(155, 90, 400, 120),);
  page.graphics.drawString("Declaro para os devidos fins que ${UserController.user.Fullname}, portador(a) do CPF:${UserController.user.id.toString()}",
    PdfStandardFont(PdfFontFamily.timesRoman, 12),
    bounds: Rect.fromLTWH(marginEsquerda, 130, 600, 120),);
  page.graphics.drawString("é aluno (a) regularmente matriculado (a) no Curso de Educação Profissional de",
    PdfStandardFont(PdfFontFamily.timesRoman, 12),
    bounds: Rect.fromLTWH(marginEsquerda, 148, 600, 120),);
  page.graphics.drawString("Nível Técnico de Enfermagem, Módulo Auxiliar de Enfermagem, na Turma 235,",
    PdfStandardFont(PdfFontFamily.timesRoman, 12),
    bounds: Rect.fromLTWH(marginEsquerda, 166, 600, 120),);
  page.graphics.drawString("período noturno, com aulas de 2ª feira a 6ª feira das 19h às 23h com início em 11/09/2020.",
    PdfStandardFont(PdfFontFamily.timesRoman, 12),
    bounds: Rect.fromLTWH(marginEsquerda, 184, 600, 120),);

  page.graphics.drawString("São Paulo,${timeformat2}.",
    PdfStandardFont(PdfFontFamily.timesRoman, 12),
    bounds: Rect.fromLTWH(340, 226, 600, 120),);

  page.graphics.drawImage(PdfBitmap(await _readImageData("asssinatura.png")),
      Rect.fromLTWH(340, 242, 120, 60));

  page.graphics.drawString("DIREITOR PEDAGÓGICO",
    PdfStandardFont(PdfFontFamily.timesRoman, 12),
    bounds: Rect.fromLTWH(340, 310, 600, 120),);

  // PdfGrid grid= PdfGrid();
  // grid.style= PdfGridStyle(
  //   font: PdfStandardFont(PdfFontFamily.helvetica,30),
  //   cellPadding: PdfPaddings(left: 5,right: 5,top: 5,bottom: 5)
  // );
  //
  // grid.columns.add(count: 3);
  // grid.headers.add(1);
  //
  // PdfGridRow header=grid.headers[0];
  //
  // header.cells[0].value= "Teste 1";
  // header.cells[1].value= "Teste 2 ";
  // header.cells[2].value= "Teste 3";
  //
  // PdfGridRow row=grid.rows.add();
  // row.cells[0].value="1";
  // row.cells[1].value="2";
  // row.cells[2].value="3";

  // grid.draw(page: document.pages.add(),bounds: const Rect.fromLTWH(0,0,0,0));

  page.graphics.drawString(
    " ${timeformat}",
    PdfStandardFont(PdfFontFamily.helvetica, 22),
    bounds: Rect.fromLTWH(323, 740, 400, 90),
  );

  List<int> bytes= document.save();
  document.dispose();
  saveAndLaunche(bytes, "Output.pdf");


  statusApp.status.loading.value=false;
  HomeEmployesController.c.updating.value=false;


}


Future<Uint8List> _readImageData(String name) async{
  final data =await rootBundle.load("assets/images/$name");
  return data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
}
