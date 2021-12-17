
import 'package:cefops/Src/controller/studants/studant_all_info_controller.dart';
import 'package:cefops/Src/model/aluno/aluno_model.dart';
import 'package:cefops/Src/repository/aluno/AlunosRepository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StudantInfoController extends GetxController{
  static StudantInfoController data=StudantInfoController();
  var id="".obs;
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
  var status="".obs;

  SetAll( data1){
  var  data=Content.fromJson(data1);
  final DateTime now = data.dataNanscimento;
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  final String formatted = formatter.format(now);
  fullName.value=data.name+" "+data.lastName;
  name.value=data.name;
  lastName.value=data.lastName;
  email.value=data.email;
  photo.value=data.photo;
  phoneCell.value=data.teleFoneCelular;
  phoneHome.value=data.teleFone;
  birthDate.value=formatted.toString();
  gender.value=data.genero;
  nation.value=data.nacionalidade;
  stsCivil.value=data.estadoCivil;
  cpf.value=data.id;
  id.value=data.id;

  }

  clearAll(){
    fullName.value="";
    name.value="";
    lastName.value="";
    email.value="";
    photo.value="https://img.icons8.com/external-flatart-icons-lineal-color-flatarticons/64/000000/external-photo-appliances-flatart-icons-lineal-color-flatarticons.png";
    phoneCell.value="";
    phoneHome.value="";
    birthDate.value="";
    gender.value="";
    nation.value="";
    stsCivil.value="";
    cpf.value="";
    StudantAllInfoController.data.anddress.clarAndress();



  }


    singInStudant(){
      StudantInfoController.data.loading.value=false;
      var dateTime1 = DateFormat('dd/M/yyyy').parse(birthDate.value);
      var day1=dateTime1.day;
      var moth=dateTime1.month;
      var yeer=dateTime1.year;
      String dayBri="$yeer"+"-"+"$moth"+"-"+"$day1";

      CreateStudant(
          name.value, lastName.value, cpf.value,
          email.value, dateTime1.toIso8601String(),phoneHome.value,
          phoneCell.value, gender.value, stsCivil.value,
          nation.value, activi);
    }

}


class Content {
  Content({
    required this.id,
    required this.name,
    required this.lastName,
    required this.dataNanscimento,
    required this.email,
    required this.teleFone,
    required this.teleFoneCelular,
    required this.photo,
    required this.enabled,
    required this.genero,
    required this.estadoCivil,
    required this.nacionalidade,
    required this.links,
  });

  String id;
  String name;
  String lastName;
  DateTime dataNanscimento;
  String email;
  String teleFone;
  String teleFoneCelular;
  String photo;
  bool enabled;
  String genero;
  String estadoCivil;
  String nacionalidade;
  List<Link> links;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    name: json["name"],
    lastName: json["lastName"],
    dataNanscimento: DateTime.parse(json["dataNanscimento"]),
    email: json["email"],
    teleFone: json["teleFone"],
    teleFoneCelular: json["teleFoneCelular"],
    photo: json["photo"],
    enabled: json["enabled"],
    genero: json["genero"],
    estadoCivil: json["estadoCivil"],
    nacionalidade: json["nacionalidade"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastName": lastName,
    "dataNanscimento": dataNanscimento.toIso8601String(),
    "email": email,
    "teleFone": teleFone,
    "teleFoneCelular": teleFoneCelular,
    "photo": photo,
    "enabled": enabled,
    "genero": genero,
    "estadoCivil": estadoCivil,
    "nacionalidade": nacionalidade,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
  };
}
