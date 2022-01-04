import 'package:basic_utils/basic_utils.dart';
import 'package:cefops/Shared/Security/Services/auth_service.dart';
import 'package:cefops/app/controller/studants/studant_info_controller.dart';
import 'package:cefops/app/data/model/aluno/aluno_model.dart';
import 'package:cefops/app/data/model/aluno/one_studant_model.dart';
import 'package:cefops/app/data/repository/aluno/AlunosRepository.dart';

import 'package:intl/intl.dart';


///calse service de studantsListViewer
class StudantService {
  StudantRepository _repository = StudantRepository();
  AuthService _authService = AuthService();

  ///criar aluno
  Future<void> createStudant() async {
    StudantInfoController data = StudantInfoController.data;
    data.loading.value = false;
    DateTime dateTime1 = DateFormat('dd/M/yyyy').parse(data.birthDate.value);
    int day1 = dateTime1.day;
    int moth = dateTime1.month;
    int yeer = dateTime1.year;
    String dayBri = "$yeer" + "-" + "$moth" + "-" + "$day1";
    await _repository.createStudant(
        data.name.value,
        data.lastName.value,
        data.cpf.value,
        data.email.value,
        dateTime1.toIso8601String(),
        data.phoneHome.value,
        data.phoneCell.value,
        data.gender.value,
        data.stsCivil.value,
        data.nation.value,
        data.activi);

    ///função para gerar a senha
    String passwordGenerate() {
      String password = "";
      password=
      "${data.name.toString().toLowerCase()}@${
          data.cpf.value.substring(7, 11)}";
      String generatedPassword = StringUtils.capitalize(password);
      print(generatedPassword);
      return generatedPassword;
    }

    ///criando usuário para acessar
    await _authService.singup(
        email: data.email.value,
        password: passwordGenerate(),
        fristName: data.name.value,
        lastName: data.lastName.value,
        alunoId: data.cpf.value,
        cpf: data.cpf.value);

  }
///buscar todos alunos
  Future<StudantModel> getAllStudats() {
    return _repository.getAllStudants();
  }
///busacar aluno por id
  Future<OneStudantModel> getStudantById(String id) {
    return _repository.getStudantById(id);
  }
///alualizar aluno
  Future<void> updateStudant() async {

  }
}
