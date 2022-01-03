// To parse this JSON data, do
//
//     final requerimentTypeModel = requerimentTypeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<RequerimentTypeModel> requerimentTypeModelFromJson(String str) => List<RequerimentTypeModel>.from(json.decode(str).map((x) => RequerimentTypeModel.fromJson(x)));

String requerimentTypeModelToJson(List<RequerimentTypeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequerimentTypeModel {
  RequerimentTypeModel({
    required this.id,
    required this.name,
    required this.grupo,
    required this.diasPentregar,
    required this.valor,
    required this.linkpagamento,
  });

  int id;
  String name;
  String grupo;
  int diasPentregar;
  double valor;
  String linkpagamento;

  factory RequerimentTypeModel.fromJson(Map<String, dynamic> json) => RequerimentTypeModel(
    id: json["id"],
    name: json["name"],
    grupo: json["grupo"],
    diasPentregar: json["diasPentregar"],
    valor: json["valor"],
    linkpagamento: json["linkpagamento"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "grupo": grupo,
    "diasPentregar": diasPentregar,
    "valor": valor,
    "linkpagamento": linkpagamento,
  };
}
