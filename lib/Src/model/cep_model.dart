import 'dart:convert';

CepModel cepModelFromJson(String str) => CepModel.fromJson(json.decode(str));

String cepModelToJson(CepModel data) => json.encode(data.toJson());

class CepModel {
  CepModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  factory CepModel.fromJson(Map<String, dynamic> json) => CepModel(
    cep: json["cep"],
    logradouro: json["logradouro"],
    complemento: json["complemento"],
    bairro: json["bairro"],
    localidade: json["localidade"],
    uf: json["uf"],
    ibge: json["ibge"],
    gia: json["gia"],
    ddd: json["ddd"],
    siafi: json["siafi"],
  );

  Map<String, dynamic> toJson() => {
    "cep": cep,
    "logradouro": logradouro,
    "complemento": complemento,
    "bairro": bairro,
    "localidade": localidade,
    "uf": uf,
    "ibge": ibge,
    "gia": gia,
    "ddd": ddd,
    "siafi": siafi,
  };
}
