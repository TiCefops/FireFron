// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    required this.id,
    required this.title,
    required this.poste,
    required this.datadeCriacao,
  });

  int id;
  String title;
  String poste;
  DateTime datadeCriacao;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json["id"],
    title: json["title"],
    poste: json["poste"],
    datadeCriacao: DateTime.parse(json["datadeCriacao"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "poste": poste,
    "datadeCriacao": datadeCriacao.toIso8601String(),
  };
}
