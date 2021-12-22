import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Src/widgets/background.dart';
import 'package:flutter/material.dart';
class myCourse extends StatefulWidget {
  @override
  _myCourseState createState() => _myCourseState();
}

// ignore: camel_case_types
class _myCourseState extends State<myCourse> {

  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;

    return Scaffold(
      body: backgroundColor(
          size.width,
         size.height,
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/9,),
                  Center(child: Text("Ola Emison ",style: TextStyle(fontSize: 22),),),
                  SizedBox(height: MediaQuery.of(context).size.height/50,),

                  Center(child: Text("Essa é sua grade Curricular  ",style: TextStyle(fontSize: 22,color: AppColors.textOnPrimary),),),
                  SizedBox(height: MediaQuery.of(context).size.height/40,),

                  Center(child: Text("CURSO DE AUXILIAR DE ENFERMAGEM  ",style: TextStyle(fontSize: 22,color: AppColors.textOnPrimary),),),

                  SizedBox(height: MediaQuery.of(context).size.height/20,),

                  Container(
                    child: criaTabela(),
                  )
                ],
              ),
            ),
          ))
    );
  }
}


criaTabela() {
  return Table(
    defaultColumnWidth: FixedColumnWidth(200.0),
    border: TableBorder(
      horizontalInside: BorderSide(
        color: Colors.black,
        style: BorderStyle.solid,
        width: 1.0,
      ),
      verticalInside: BorderSide(
        color: Colors.black,
        style: BorderStyle.solid,
        width: 1.0,
      ),
    ),
    children: [
      _criarLinhaTable(" Disciplina , CARGA HORARIA  "),
      _criarLinhaTable("GINECOLÓGICA E OBSTETRÍCIA,16 H "),
      _criarLinhaTable("ORTOPEDIA, 5 H"),
      _criarLinhaTable("PRONTO SOCORRO , 6 H"),
      _criarLinhaTable("GINECOLÓGICA E OBSTETRÍCIA , 6 H"),
      _criarLinhaTable("ENFERMAGEM EM NEONATOLOGIA  , 40 H"),
      _criarLinhaTable("ENFERMAGEM EM PEDIATRIA  , 40 H"),
      _criarLinhaTable("SAÚDE PÚBLICA I   , 40 H"),
      _criarLinhaTable("ASSISTÊNCIA DOMICILIAR    , 10 H"),





    ],
  );
}
_criarLinhaTable(String listaNomes) {
  return TableRow(
    children: listaNomes.split(',').map((name) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(fontSize: 20.0,color: AppColors.textOnPrimary),
        ),
        padding: EdgeInsets.all(8.0),
      );
    }).toList(),
  );
}

