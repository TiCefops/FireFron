import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/app/widgets/app/widget_background.dart';
import 'package:flutter/material.dart';
///
class MyCourse extends StatefulWidget {
  @override
  _MyCourseState createState() => _MyCourseState();
}

// ignore: camel_case_types
class _MyCourseState extends State<MyCourse> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: backgroundColor(
        size.width,
        size.height,
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
              const Center(
                child: Text(
                  "Ola Emison ",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Center(
                child: Text(
                  "Essa é sua grade Curricular  ",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColors.textOnPrimary,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Center(
                child: Text(
                  "CURSO DE AUXILIAR DE ENFERMAGEM  ",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColors.textOnPrimary,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Container(
                child: criaTabela(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///
Table criaTabela() {
  return Table(
    defaultColumnWidth: const FixedColumnWidth(200.0),
    border: const TableBorder(
      horizontalInside: BorderSide(
      ),
      verticalInside: BorderSide(

      ),
    ),
    children: <TableRow>[
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

///cria as tabelas
TableRow _criarLinhaTable(String listaNomes) {
  return TableRow(
    children: listaNomes.split(',').map((String name) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: TextStyle(fontSize: 20.0, color: AppColors.textOnPrimary),
        ),
      );
    }).toList(),
  );
}
