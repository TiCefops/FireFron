import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/Src/model/aluno/aluno_model.dart';
import 'package:cefops/Src/repository/aluno/AlunosRepository.dart';
import 'package:cefops/Src/widgets/widget_FormsForAll.dart';
import 'package:cefops/res.dart';
import 'package:flutter/material.dart';

class SiginStudant extends StatefulWidget {
  @override
  _SiginStudantState createState() => _SiginStudantState();
}

bool isplataform = false;

class _SiginStudantState extends State<SiginStudant> {
  final _formKey = GlobalKey<FormState>();

  final NameController = TextEditingController();
  final LastNameController = TextEditingController();
  final grupeController = TextEditingController();
  final passwController = TextEditingController();
  final emailController = TextEditingController();
  final raController = TextEditingController();
  final telController = TextEditingController();
  final cursoController = TextEditingController();
  final turmaController = TextEditingController();

  String dropdownValue = 'Auxiliar';
  Future<StudantModel>? criarAluno;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var SizeForm = MediaQuery.of(context).size.width * 0.4;
    var space = MediaQuery.of(context).size.height * 0.01;

    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(

                  child: Center(
                   child: Image.asset(Res.logo2),
                  ),
                ),
                _space(space),
                Row(
                  children: [
                    Container(
                        width: size.width/3,

                        child: inputsForms(NameController, "Insira o nome Aluno ",
                            "Nome Aluno", "Por favor preencha o nome do aluno")),
                    SizedBox(width: size.width*0.02,),
                    Container(
                        width: size.width/3,

                        child: inputsForms(
                            LastNameController,
                            "Insira o Sobrenome Aluno ",
                            "Sobrenome do Aluno",
                            "Por favor preencha o Sobrenome do aluno")),
                  ],
                ),


                _space(space),
                Row(
                  children: [
                    Container(
                        width: size.width/3,
                        alignment: Alignment.center,
                        child: inputsForms(
                            raController,
                            "Insira o CPF do Aluno ",
                            "Nome CPF do Aluno",
                            "Por favor preencha o CPF do Aluno")),
                    SizedBox(width: size.width*0.02,),
                    Container(
                        width: size.width/3,
                        alignment: Alignment.center,
                        child: inputsForms(
                            emailController,
                            "Insira o E-mail do Aluno ",
                            "Nome o E-mail do Aluno",
                            "Por favor preencha o E-mail do Aluno")),

                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: SizeForm,
                        alignment: Alignment.center,
                        child: inputsForms(
                            grupeController,
                            "Insira a Turma do Aluno ",
                            "Turma do Aluno",
                            "Por favor preencha a Turma do aluno")),
                    SizedBox(width: size.width*0.02,),

                    Container(
                        width: SizeForm,
                        alignment: Alignment.center,
                        child: inputsForms(
                            passwController,
                            "A senha do Aluno ",
                            "Nome senha do Aluno",
                            "Por favor preencha o senha do Aluno")),
                  ],
                ),



                _space(space),
                Center(
                  child: Container(
                    width: SizeForm,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Center(child: Text("Selecione Um Curso")),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Container(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyles.buttonPrimary,
                            underline: Container(
                              height: 2,
                              color: AppColors.blue,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                                print(dropdownValue);
                              });
                            },
                            items: <String>[
                              'Auxiliar',
                              'Técnico',
                              'Cuidador de Idosos',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        Text(
                          "Modalidade de Ensino EAD ?",
                          overflow: TextOverflow.ellipsis,
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Switch(
                              value: isplataform,
                              onChanged: (value) {
                                setState(() {
                                  isplataform = !isplataform;
                                  print(isplataform);
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                if (isplataform == true)
                  Container(
                    width: SizeForm,
                    child: inputsForms(
                        cursoController,
                        "Insira o Link Da Turma na Plataforma",
                        "Insira o Link",
                        "error"),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.orange,

                    border: Border.all(
                      color: AppColors.orange,
                      width: 8,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.07,
                  child: TextButton(
                    child: Text(
                      "Cadastrar",overflow: TextOverflow.visible,
                      style: TextStyles.buttonBoldBackground,
                    ),
                    onPressed: () {
                      var idcontroller = int.parse(raController.text);

                      setState(() {
                        criarAluno = createAluno(
                            idcontroller,
                            NameController.text,
                            LastNameController.text,
                            idcontroller,
                            emailController.text,
                            1);
                      });
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}

_space(double space) {
  return SizedBox(height: space);
}
