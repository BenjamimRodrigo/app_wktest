import 'dart:ffi';

import 'package:app_wktest/app/data/repositories/indicadores_repository.dart';
import 'package:get/get.dart';

class IndicadoresController extends GetxController {
  final IndicadoresRepository repository;
  IndicadoresController(this.repository);

  final _pessoasPorUF = [].obs;

  List get pessoasPorUF => _pessoasPorUF;

  @override
  void onInit() {
    loadPessoasPorUF();
    /* loadImcMedioFaixaEtaria();
    loadPercentualObesosPorGenero();
    loadMediaIdadePorTipoSanguineo();
    loadQtdDoadoresPorTipoSanguineo(); */
    super.onInit();
  }

  void loadPessoasPorUF() {
    repository.pessoasPorUF().then((response) {
      _pessoasPorUF.addAll(response);
    });
  }

  void loadImcMedioFaixaEtaria() {
    repository.imcMedioFaixaEtaria().then((response) {
      print(response);
    });
  }

  void loadPercentualObesosPorGenero() {
    repository.percentualObesosPorGenero().then((response) {
      print(response);
    });
  }

  void loadMediaIdadePorTipoSanguineo() {
    repository.mediaIdadePorTipoSanguineo().then((response) {
      print(response);
    });
  }

  void loadQtdDoadoresPorTipoSanguineo() {
    repository.qtdDoadoresPorTipoSanguineo().then((response) {
      print(response);
    });
  }
}
