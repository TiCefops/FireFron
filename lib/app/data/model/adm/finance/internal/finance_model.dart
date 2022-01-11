// To parse this JSON data, do
//
//     final financeModel = financeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FinanceModel financeModelFromJson(String str) => FinanceModel.fromJson(json.decode(str));

String financeModelToJson(FinanceModel data) => json.encode(data.toJson());

class FinanceModel {
  FinanceModel({
   required this.id,
   required this.parcelaAtual,
   required this.unidade,
   required this.meioPagamento,
   required this.valorPago,
   required this.status,
   required this.datadeCriacao,
   required this.valor,
   required this.dataVencimento,
   required this.dataPagamento,
   required this.pago,
   required this.parcelas,
   required this.tipoMovimentacao,
   required this.descricao,
  });

  int id;
  int parcelaAtual;
  String unidade;
  String meioPagamento;
  double valorPago;
  String status;
  DateTime datadeCriacao;
  double valor;
  DateTime dataVencimento;
  DateTime dataPagamento;
  bool pago;
  int parcelas;
  String tipoMovimentacao;
  String descricao;

  factory FinanceModel.fromJson(Map<String, dynamic> json) => FinanceModel(
    id: json["id"],
    parcelaAtual: json["parcelaAtual"],
    unidade: json["unidade"],
    meioPagamento: json["meioPagamento"],
    valorPago: json["valorPago"],
    status: json["status"],
    datadeCriacao: DateTime.parse(json["datadeCriacao"]),
    valor: json["valor"],
    dataVencimento: DateTime.parse(json["dataVencimento"]),
    dataPagamento: DateTime.parse(json["dataPagamento"]),
    pago: json["pago"],
    parcelas: json["parcelas"],
    tipoMovimentacao: json["tipoMovimentacao"],
    descricao: json["descricao"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parcelaAtual": parcelaAtual,
    "unidade": unidade,
    "meioPagamento": meioPagamento,
    "valorPago": valorPago,
    "status": status,
    "datadeCriacao": datadeCriacao.toIso8601String(),
    "valor": valor,
    "dataVencimento": dataVencimento.toIso8601String(),
    "dataPagamento": dataPagamento.toIso8601String(),
    "pago": pago,
    "parcelas": parcelas,
    "tipoMovimentacao": tipoMovimentacao,
    "descricao": descricao,
  };
}
