/// name : "Emison"
/// dataNanscimento : "1999-11-26T02:00:00.000+00:00"
/// genero : "Masculino"
/// estadoCivil : "Solteiro"
/// enabled : true
/// photo : "https://media.istockphoto.com/photos/astronaut-lying-in-the-meadow-picture-id1304263738?s=612x612"
/// id : "testeMock"
/// email : "ti4.eas@gmail.com"
/// lastName : "ti"
/// teleFoneCelular : "11981173620"
/// teleFone : "111234578"
/// nacionalidade : "Brasilerio"

class OneStudantModel {
  OneStudantModel({
      String? name, 
      String? dataNanscimento, 
      String? genero, 
      String? estadoCivil, 
      bool? enabled, 
      String? photo, 
      String? id, 
      String? email, 
      String? lastName, 
      String? teleFoneCelular, 
      String? teleFone, 
      String? nacionalidade,}){
    _name = name;
    _dataNanscimento = dataNanscimento;
    _genero = genero;
    _estadoCivil = estadoCivil;
    _enabled = enabled;
    _photo = photo;
    _id = id;
    _email = email;
    _lastName = lastName;
    _teleFoneCelular = teleFoneCelular;
    _teleFone = teleFone;
    _nacionalidade = nacionalidade;
}

  OneStudantModel.fromJson(dynamic json) {
    _name = json['name'];
    _dataNanscimento = json['dataNanscimento'];
    _genero = json['genero'];
    _estadoCivil = json['estadoCivil'];
    _enabled = json['enabled'];
    _photo = json['photo'];
    _id = json['id'];
    _email = json['email'];
    _lastName = json['lastName'];
    _teleFoneCelular = json['teleFoneCelular'];
    _teleFone = json['teleFone'];
    _nacionalidade = json['nacionalidade'];
  }
  String? _name;
  String? _dataNanscimento;
  String? _genero;
  String? _estadoCivil;
  bool? _enabled;
  String? _photo;
  String? _id;
  String? _email;
  String? _lastName;
  String? _teleFoneCelular;
  String? _teleFone;
  String? _nacionalidade;

  String? get name => _name;
  String? get dataNanscimento => _dataNanscimento;
  String? get genero => _genero;
  String? get estadoCivil => _estadoCivil;
  bool? get enabled => _enabled;
  String? get photo => _photo;
  String? get id => _id;
  String? get email => _email;
  String? get lastName => _lastName;
  String? get teleFoneCelular => _teleFoneCelular;
  String? get teleFone => _teleFone;
  String? get nacionalidade => _nacionalidade;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['dataNanscimento'] = _dataNanscimento;
    map['genero'] = _genero;
    map['estadoCivil'] = _estadoCivil;
    map['enabled'] = _enabled;
    map['photo'] = _photo;
    map['id'] = _id;
    map['email'] = _email;
    map['lastName'] = _lastName;
    map['teleFoneCelular'] = _teleFoneCelular;
    map['teleFone'] = _teleFone;
    map['nacionalidade'] = _nacionalidade;
    return map;
  }

}