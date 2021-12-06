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
  });

  int id;
  String name;
  String grupo;
  int diasPentregar;

  factory RequerimentTypeModel.fromJson(Map<String, dynamic> json) => RequerimentTypeModel(
    id: json["id"],
    name: json["name"],
    grupo: json["grupo"],
    diasPentregar: json["diasPentregar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "grupo": grupo,
    "diasPentregar": diasPentregar,
  };
}
