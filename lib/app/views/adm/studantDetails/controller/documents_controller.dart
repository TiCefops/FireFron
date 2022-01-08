import 'package:cefops/app/data/model/aluno/documentos/document_model.dart';
import 'package:cefops/app/data/repository/aluno/documentos/documents_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class DocumentsController extends GetxController {
  static DocumentsController data = DocumentsController();
  DocumentsRepository _repository = DocumentsRepository();

  RxString cpf = "".obs;
  RxString rg = "".obs;
  RxString estadoEmissorRg = "".obs;
  RxString dataEmissorRg = "".obs;
  RxString titulo = "".obs;
  RxString estadoEmissortitulo = "".obs;
  RxString zona = "".obs;
  RxString secao = "".obs;
  RxString dataEmissorTitulo = "".obs;
  RxBool loading = false.obs;
  RxString nomeMae = "".obs;
  RxString nomePai = "".obs;
  RxString orgaoEmissorRg="".obs;

  deleteAllData() {
    cpf.value = "";
    rg.value = "";
    estadoEmissorRg.value = "";
    dataEmissorRg.value = "";
    titulo.value = "";
    estadoEmissortitulo.value = "";
    zona.value = "";
    secao.value = "";
    dataEmissorTitulo.value = "";
  }

  setDocuments(
    DocumentModel data,
  ) {
    DateFormat formated = DateFormat('dd/M/yyyy');
    cpf.value = data.cpf;
    rg.value = data.rg;
    estadoEmissorRg.value = data.estadoemissorrg;
    dataEmissorRg.value = formated.format(data.dataemissaorg);
    titulo.value = data.tituloeleitor;
    estadoEmissortitulo.value = data.estadoemissortitulo;
    zona.value = data.zona;
    secao.value = data.secao;
    dataEmissorTitulo.value =formated.format(data.dataemissaotitulo).toString();
    orgaoEmissorRg.value=data.orgaoemissorrg;
    nomePai.value=data.nomedopai;
    nomeMae.value=data.nomedamae;
  }
Future <void> getByid(String id)async {
    await _repository.GetDocumentsById(id);
}

  ///chama o repository para  criar documento
  Future<void> createDocuments(
    String cpf,
    String rg,
    String dataemissao,
    String orgaoemissor,
    String estadoemissor,
    String tituloeleitor,
    String zona,
    String secao,
    String dataemissaotitulo,
    String estemissortitulo,
    String nomedamae,
    String nomedopai,
    String alunosId,
  ) async {
    // loading.value=true;
    // Future.delayed(Duration(seconds: 3),(){
    //   loading.value=false;
    //
    // });

    await _repository.CreateDocuments(
        cpf,
        rg,
        dataemissao,
        orgaoemissor,
        estadoemissor,
        tituloeleitor,
        zona,
        secao,
        dataemissaotitulo,
        estemissortitulo,
        nomedamae,
        nomedopai,
        cpf);
  }
  Future<void> updateDocuments(
      String cpf,
      String rg,
      String dataemissao,
      String orgaoemissor,
      String estadoemissor,
      String tituloeleitor,
      String zona,
      String secao,
      String dataemissaotitulo,
      String estemissortitulo,
      String nomedamae,
      String nomedopai,
      String alunosId,
      ) async {
    // loading.value=true;
    // Future.delayed(Duration(seconds: 3),(){
    //   loading.value=false;
    //
    // });
    await _repository.updateDocuments(
        cpf,
        rg,
        dataemissao,
        orgaoemissor,
        estadoemissor,
        tituloeleitor,
        zona,
        secao,
        dataemissaotitulo,
        estemissortitulo,
        nomedamae,
        nomedopai,
        cpf);


  }
}
