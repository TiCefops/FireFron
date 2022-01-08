// To parse this JSON data, do
//
//     final documentModel = documentModelFromMap(jsonString);

import 'dart:convert';

DocumentModel documentModelFromMap(String str) => DocumentModel.fromMap(json.decode(str));

String documentModelToMap(DocumentModel data) => json.encode(data.toMap());

class DocumentModel {
  DocumentModel({
   required this.id,
   required this.cpf,
   required this.rg,
   required this.dataemissaorg,
   required this.orgaoemissorrg,
   required this.estadoemissorrg,
   required this.tituloeleitor,
   required this.zona,
   required this.secao,
   required this.dataemissaotitulo,
   required this.estadoemissortitulo,
   required this.nomedamae,
   required this.nomedopai,
  });

  int id;
  String cpf;
  String rg;
  DateTime dataemissaorg;
  String orgaoemissorrg;
  String estadoemissorrg;
  String tituloeleitor;
  String zona;
  String secao;
  DateTime dataemissaotitulo;
  String estadoemissortitulo;
  String nomedamae;
  String nomedopai;

  factory DocumentModel.fromMap(Map<String, dynamic> json) => DocumentModel(
    id: json["id"],
    cpf: json["cpf"],
    rg: json["rg"],
    dataemissaorg: DateTime.parse(json["dataemissaorg"]),
    orgaoemissorrg: json["orgaoemissorrg"],
    estadoemissorrg: json["estadoemissorrg"],
    tituloeleitor: json["tituloeleitor"],
    zona: json["zona"],
    secao: json["secao"],
    dataemissaotitulo: DateTime.parse(json["dataemissaotitulo"]),
    estadoemissortitulo: json["estadoemissortitulo"],
    nomedamae: json["nomedamae"],
    nomedopai: json["nomedopai"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "cpf": cpf,
    "rg": rg,
    "dataemissaorg": dataemissaorg.toIso8601String(),
    "orgaoemissorrg": orgaoemissorrg,
    "estadoemissorrg": estadoemissorrg,
    "tituloeleitor": tituloeleitor,
    "zona": zona,
    "secao": secao,
    "dataemissaotitulo": dataemissaotitulo.toIso8601String(),
    "estadoemissortitulo": estadoemissortitulo,
    "nomedamae": nomedamae,
    "nomedopai": nomedopai,
  };
}
