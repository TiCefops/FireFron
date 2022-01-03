import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';
import 'mobile.dart' if (dart.library.html) "web.dart";

Future<void> pdfCreate(String text, String title) async {
  final dia = new DateTime.now();
  var timeformat = DateFormat(" dd/MM/yyyy  hh:mm").format(dia);
  PdfDocument document = PdfDocument();
  final page = document.pages.add();

  page.graphics
      .drawString("${text}", PdfStandardFont(PdfFontFamily.helvetica, 22));

  // page.graphics.drawImage(PdfBitmap( await _readImageData("contosirma.jpg")),
  //     Rect.fromLTWH(0, 100, 300, 450));

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

  List<int> bytes = document.save();
  document.dispose();
  saveAndLaunche(bytes, "${title}.pdf");
  print("iniciou Com sucesso");
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load("images/$name");
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
