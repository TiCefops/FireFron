import 'dart:convert';

List<RequerimentModel> requerimentModelFromJson(String str) => List<RequerimentModel>.from(json.decode(str).map((x) => RequerimentModel.fromJson(x)));

String requerimentModelToJson(List<RequerimentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequerimentModel {
  RequerimentModel({
   required this.id,
   required this.tipo,
   required this.nomeAluno,
   required this.idaluno,
   required this.dataatualizacao,
   required this.statusPagameto,
   required this.observacao,
   required this.protocolo,
   required this.pdfLink,
   required this.responsavel,
   required this.status,
   required this.entregue,
   required this.abertoem,
   required this.concluido,
  });

  int id;
  Tipo tipo;
  String nomeAluno;
  String idaluno;
  DateTime dataatualizacao;
  String statusPagameto;
  String observacao;
  String protocolo;
  String pdfLink;
  String responsavel;
  String status;
  DateTime entregue;
  DateTime abertoem;
  bool concluido;

  factory RequerimentModel.fromJson(Map<String, dynamic> json) => RequerimentModel(
    id: json["id"],
    tipo: Tipo.fromJson(json["tipo"]),
    nomeAluno: json["nomeAluno"],
    idaluno: json["idaluno"],
    dataatualizacao: DateTime.parse(json["dataatualizacao"]),
    statusPagameto: json["statusPagameto"],
    observacao: json["observacao"],
    protocolo: json["protocolo"],
    pdfLink: json["pdfLink"],
    responsavel: json["responsavel"],
    status: json["status"],
    entregue: DateTime.parse(json["entregue"]),
    abertoem: DateTime.parse(json["abertoem"]),
    concluido: json["concluido"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tipo": tipo.toJson(),
    "nomeAluno": nomeAluno,
    "idaluno": idaluno,
    "dataatualizacao": dataatualizacao.toIso8601String(),
    "statusPagameto": statusPagameto,
    "observacao": observacao,
    "protocolo": protocolo,
    "pdfLink": pdfLink,
    "responsavel": responsavel,
    "status": status,
    "entregue": entregue.toIso8601String(),
    "abertoem": abertoem.toIso8601String(),
    "concluido": concluido,
  };
}

class Tipo {
  Tipo({
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

  factory Tipo.fromJson(Map<String, dynamic> json) => Tipo(
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
