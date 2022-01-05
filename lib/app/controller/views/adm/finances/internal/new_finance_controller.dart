import 'package:cefops/app/data/model/views/adm/finances/internal/finance_internal_model.dart';
import 'package:get/get.dart';
///controlador da views
class NewFinanceInternalController extends GetxController{
  static NewFinanceInternalController data=NewFinanceInternalController();

  RxInt id=0.obs;
  RxString nome="".obs;
  RxString formaPagamento="Dinheiro".obs;
  RxString condicaoPagamento="".obs;
  RxString parcelaAtual="".obs;
  RxInt totalparcelas=1.obs;
  RxDouble valor=0.0.obs;
  RxDouble valorInicialCaixa=0.0.obs;
  RxDouble valorPago=0.0.obs;
  RxBool   pago=false.obs;
  RxString entidade="CEFOPS".obs;
  RxString status="".obs;
  RxString dataPagamento="".obs;
  RxString dataVencimento="".obs;
  RxInt page=0.obs;
  RxBool parcelado=false.obs;
  RxString statusDeMovimentacao="Entrada".obs;
  RxBool aluno=false.obs;
  RxBool updating=false.obs;


  ///
  setNewFinance(FinanceInernalModel data){
    id.value=data.id;
    nome.value=data.descricao;
    formaPagamento.value=data.meioPagamento;
    parcelaAtual.value=data.parcelaAtual;
    totalparcelas.value=data.parcelas;
    valor.value=data.valor;
    valorPago=data.valorPago as RxDouble;
    pago.value=data.pago;
    entidade.value=data.unidade;
    status.value=data.status;
    dataPagamento.value=data.dataPagamento as String;
    dataVencimento.value=data.dataVencimento as String;

  }

  void deleteAll(){
    id.value=0;
    nome.value="";
    formaPagamento.value="";
    parcelaAtual.value="";
    totalparcelas.value=0;
    valor.value=0;
    valorPago.value=0.0;
    pago.value=false;
    entidade.value="";
    status.value="";
    dataPagamento.value="";
    dataVencimento.value="";
  }




}