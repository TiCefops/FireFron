// To parse this JSON data, do
//
//     final andressModel = andressModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AndressModel andressModelFromJson(String str) => AndressModel.fromJson(json.decode(str));

String andressModelToJson(AndressModel data) => json.encode(data.toJson());

class AndressModel {
  AndressModel({
    required this.id,
    required this.cep,
    required this.rua,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.uf,
  });

  int id;
  String cep;
  String rua;
  String numero;
  String complemento;
  String bairro;
  String cidade;
  String estado;
  String uf;

  factory AndressModel.fromJson(Map<String, dynamic> json) => AndressModel(
    id: json["id"],
    cep: json["cep"],
    rua: json["rua"],
    numero: json["numero"],
    complemento: json["complemento"],
    bairro: json["bairro"],
    cidade: json["cidade"],
    estado: json["estado"],
    uf: json["uf"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cep": cep,
    "rua": rua,
    "numero": numero,
    "complemento": complemento,
    "bairro": bairro,
    "cidade": cidade,
    "estado": estado,
    "uf": uf,
  };
}

class Aluno {
  Aluno({
    required this.id,
  });

  String id;

  factory Aluno.fromJson(Map<String, dynamic> json) => Aluno(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
