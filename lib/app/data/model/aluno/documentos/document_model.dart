
import 'dart:convert';

DocumentModel documentModelFromJson(String str) => DocumentModel.fromJson(json.decode(str));

String documentModelToJson(DocumentModel data) => json.encode(data.toJson());

class DocumentModel {
  DocumentModel({
    required this.id,
    required this.cpf,
    required this.rg,
    required this.dataemissao,
    required this.orgaoemissor,
    required this.estadoemissor,
    required this.tituloeleitor,
    required this.zona,
    required this.secao,
    required this.dataemissaotitulo,
    required this.estemissortitulo,
    required this.reservista,
    required this.categoriamilitar,
    required this.circoinscricaomitlitar,
    required this.regiaomilitar,
    required this.dataemissaoreservista,
    required this.orgaoemissorreservista,
    required this.situacaomilitar,
    required this.nomedamae,
    required this.nomedopai,
    required this.alunosId,
  });

  int id;
  String cpf;
  String rg;
  DateTime dataemissao;
  String orgaoemissor;
  String estadoemissor;
  String tituloeleitor;
  String zona;
  String secao;
  DateTime dataemissaotitulo;
  String estemissortitulo;
  String reservista;
  String categoriamilitar;
  String circoinscricaomitlitar;
  String regiaomilitar;
  DateTime dataemissaoreservista;
  String orgaoemissorreservista;
  String situacaomilitar;
  String nomedamae;
  String nomedopai;
  AlunosId alunosId;

  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
    id: json["id"],
    cpf: json["cpf"],
    rg: json["rg"],
    dataemissao: DateTime.parse(json["dataemissao"]),
    orgaoemissor: json["orgaoemissor"],
    estadoemissor: json["estadoemissor"],
    tituloeleitor: json["tituloeleitor"],
    zona: json["zona"],
    secao: json["secao"],
    dataemissaotitulo: DateTime.parse(json["dataemissaotitulo"]),
    estemissortitulo: json["estemissortitulo"],
    reservista: json["reservista"],
    categoriamilitar: json["categoriamilitar"],
    circoinscricaomitlitar: json["circoinscricaomitlitar"],
    regiaomilitar: json["regiaomilitar"],
    dataemissaoreservista: DateTime.parse(json["dataemissaoreservista"]),
    orgaoemissorreservista: json["orgaoemissorreservista"],
    situacaomilitar: json["situacaomilitar"],
    nomedamae: json["nomedamae"],
    nomedopai: json["nomedopai"],
    alunosId: AlunosId.fromJson(json["alunosId"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cpf": cpf,
    "rg": rg,
    "dataemissao": dataemissao.toIso8601String(),
    "orgaoemissor": orgaoemissor,
    "estadoemissor": estadoemissor,
    "tituloeleitor": tituloeleitor,
    "zona": zona,
    "secao": secao,
    "dataemissaotitulo": dataemissaotitulo.toIso8601String(),
    "estemissortitulo": estemissortitulo,
    "reservista": reservista,
    "categoriamilitar": categoriamilitar,
    "circoinscricaomitlitar": circoinscricaomitlitar,
    "regiaomilitar": regiaomilitar,
    "dataemissaoreservista": dataemissaoreservista.toIso8601String(),
    "orgaoemissorreservista": orgaoemissorreservista,
    "situacaomilitar": situacaomilitar,
    "nomedamae": nomedamae,
    "nomedopai": nomedopai,
    "alunosId": alunosId.toJson(),
  };
}

class AlunosId {
  AlunosId({
    required this.id,
  });

  String id;

  factory AlunosId.fromJson(Map<String, dynamic> json) => AlunosId(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
