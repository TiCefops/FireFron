import 'dart:typed_data';
import 'package:cefops/Shared/Security/Controller/userController.dart';
import 'package:cefops/Src/module/pdf/http/itemmodel.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'ComprovanteMatriculaPDFModel.dart';
import  'mobile.dart' if(dart.library.html)"web.dart";

class pdfHome extends StatefulWidget {
  const pdfHome({Key ?key}) : super(key: key);



  @override
  _pdfHomeState createState() => _pdfHomeState();
}
late Future<ItemModel> futureAluno;

class _pdfHomeState extends State<pdfHome> {
  final dia = new DateTime.now();

  bool isloading = false;
  final textControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Center(
          child: Column(

            children: [
              SizedBox(
                height: size.height * 0.4,
              ),
              Container(
                width: size.width / 2,

                child: TextFormField(
                  controller: textControl,

                ),
              ),
              ElevatedButton(

                child: isloading ? CircularProgressIndicator(
                  color: Colors.red,
                  backgroundColor: Colors.amber,
                ) : Text("Gerar PDf"),
                onPressed: () {
                  setState(() {
                    isloading = true;
                  });
                  Future.delayed(Duration(milliseconds: 800), () {
                    print(textControl.text);

                    ComprovMatricula();

                    setState(() {
                      isloading = false;
                    });
                  });
                },
              ),
            ],
          )
      ),
    );
  }
}