import 'dart:convert';
List<FinanceInernalModel> financeInernalModelFromJson(String str) => List<FinanceInernalModel>.from(json.decode(str).map((x) => FinanceInernalModel.fromJson(x)));

String financeInernalModelToJson(List<FinanceInernalModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
///
class FinanceInernalModel {
  ///
  FinanceInernalModel({
    required this.id,
    required this.parcelaAtual,
    required this.unidade,
    required this.meioPagamento,
    required this.valorPago,
    required this.status,
    required this.aberturaCaiaxa,
    required this.fechamentoCaixa,
    required this.datadeCriacao,
    required this.valor,
    required this.parcelas,
    required this.pagoNaData,
    required this.descricao,
    required this.pago,
    required this.dataPagamento,
    required this.dataVencimento,
  });

  int id;
  String parcelaAtual;
  String unidade;
  String meioPagamento;
  double valorPago;
  String status;
  bool aberturaCaiaxa;
  bool fechamentoCaixa;
  DateTime datadeCriacao;
  double valor;
  int parcelas;
  bool pagoNaData;
  String descricao;
  bool pago;
  DateTime dataPagamento;
  DateTime dataVencimento;

  factory FinanceInernalModel.fromJson(Map<String, dynamic> json) => FinanceInernalModel(
    id: json["id"],
    parcelaAtual: json["parcelaAtual"],
    unidade: json["unidade"],
    meioPagamento: json["meioPagamento"],
    valorPago: json["valorPago"],
    status: json["status"],
    aberturaCaiaxa: json["aberturaCaiaxa"],
    fechamentoCaixa: json["fechamentoCaixa"],
    datadeCriacao: DateTime.parse(json["datadeCriacao"]),
    valor: json["valor"],
    parcelas: json["parcelas"],
    pagoNaData: json["pagoNaData"],
    descricao: json["descricao"],
    pago: json["pago"],
    dataPagamento: DateTime.parse(json["dataPagamento"]),
    dataVencimento: DateTime.parse(json["dataVencimento"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parcelaAtual": parcelaAtual,
    "unidade": unidade,
    "meioPagamento": meioPagamento,
    "valorPago": valorPago,
    "status": status,
    "aberturaCaiaxa": aberturaCaiaxa,
    "fechamentoCaixa": fechamentoCaixa,
    "datadeCriacao": datadeCriacao.toIso8601String(),
    "valor": valor,
    "parcelas": parcelas,
    "pagoNaData": pagoNaData,
    "descricao": descricao,
    "pago": pago,
    "dataPagamento": dataPagamento.toIso8601String(),
    "dataVencimento": dataVencimento.toIso8601String(),
  };
}
