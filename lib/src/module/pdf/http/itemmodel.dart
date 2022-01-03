import 'package:meta/meta.dart';
import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  ItemModel({
    required this.nome,
    required this.produto,
    required this.valor,
    required this.id,
  });

  String nome;
  String produto;
  String valor;
  String id;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    nome: json["Nome"],
    produto: json["produto"],
    valor: json["valor"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "Nome": nome,
    "produto": produto,
    "valor": valor,
    "id": id,
  };
}
