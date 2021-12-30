import 'package:cefops/Shared/Security/Model/SignUpModel.dart';
import 'package:cefops/Shared/Security/Model/login_model.dart';
import 'package:cefops/Shared/Security/Repository/AuthRepository.dart';

///
class AuthService {
  AuthRepository _authRepository = AuthRepository();

  ///
  Future<LoginModel> login({required String email, required String password}) {
    return _authRepository.login(email, password);
  }
///
  Future<SignUpModel> singup({
    required String email,
    required String password,
    required String fristName,
    required String lastName,
    required String alunoId,
    required String cpf}) {
    return _authRepository.singUpNewUser(email: email,
        password: password,
        fristName: fristName,
        lastName: lastName,
        alunoId: alunoId,
        cpf: cpf);
  }

}