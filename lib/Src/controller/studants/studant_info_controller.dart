
import 'package:cefops/Src/model/aluno/aluno_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StudantInfoController extends GetxController{
  static StudantInfoController data=StudantInfoController();
  var name="".obs;
  var lastName="".obs;
  var fullName="".obs;
  var email="".obs;
  var cpf="".obs;
  var photo="https://img.icons8.com/external-flatart-icons-lineal-color-flatarticons/64/000000/external-photo-appliances-flatart-icons-lineal-color-flatarticons.png".obs;
  var birthDate="".obs;
  var gender="".obs;
  var activi=true;
  var stsCivil="".obs;
  var phoneCell="".obs;
  var phoneHome="".obs;
  var nation="".obs;
  var loading=false.obs;


setInfos(StudantModel data,int Index){

  final DateTime now = data.content[Index].dataNanscimento;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(now);
  fullName.value=data.content[Index].name+" "+data.content[Index].lastName;
  name.value=data.content[Index].name;
  lastName.value=data.content[Index].lastName;
  email.value=data.content[Index].email;
  photo.value=data.content[Index].photo;
  phoneCell.value=data.content[Index].teleFoneCelular;
  phoneHome.value=data.content[Index].teleFone;
  birthDate.value=formatted.toString();
  gender.value=data.content[Index].genero;
  nation.value=data.content[Index].nacionalidade;
  stsCivil.value=data.content[Index].estadoCivil;
}

}