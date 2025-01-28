import 'package:app_wktest/app/data/dtos/idade_por_tipo_sanguineo_dto.dart';
import 'package:app_wktest/app/data/dtos/imc_por_faixa_etaria_dto.dart';
import 'package:app_wktest/app/data/dtos/pessoas_por_uf_dto.dart';
import 'package:app_wktest/app/data/dtos/qtd_por_tipo_sanguineo_dto.dart';
import 'package:app_wktest/app/data/repositories/indicadores_repository.dart';
import 'package:get/get.dart';

class IndicadoresController extends GetxController {
  final IndicadoresRepository repository;
  IndicadoresController(this.repository);

  final _pessoasPorUF = <ResponsePessoasPorUFDTO>[].obs;
  final _imcPorFaixaEtaria = <ResponseIMCPorFaixaEtariaDTO>[].obs;
  final _idadePorTipoSanguineo = <ResponseIdadePorTipoSanguineoDTO>[].obs;
  final _qtdPorTipoSanguineo = <ResponseQtdPorTipoSanguineoDTO>[].obs;
  final _percentObedidadeMasculina = 0.0.obs;
  final _percentObedidadeFeminina = 0.0.obs;

  List<ResponsePessoasPorUFDTO> get pessoasPorUF => _pessoasPorUF;
  List<ResponseIMCPorFaixaEtariaDTO> get imcPorFaixaEtaria => _imcPorFaixaEtaria;
  List<ResponseIdadePorTipoSanguineoDTO> get idadePorTipoSanguineo => _idadePorTipoSanguineo;
  List<ResponseQtdPorTipoSanguineoDTO> get qtdPorTipoSanguineo => _qtdPorTipoSanguineo;
  double get percentObedidadeMasculina => _percentObedidadeMasculina.value;
  double get percentObedidadeFeminina => _percentObedidadeFeminina.value;

  @override
  void onInit() {
    loadPessoasPorUF();
    loadImcMedioFaixaEtaria();
    loadPercentualObesosPorGenero();
    loadMediaIdadePorTipoSanguineo();
    loadQtdDoadoresPorTipoSanguineo();
    super.onInit();
  }

  void loadPessoasPorUF() {
    repository.pessoasPorUF().then((response) {
      _pessoasPorUF.addAll(response);
    });
  }

  void loadImcMedioFaixaEtaria() {
    repository.imcMedioFaixaEtaria().then((response) {
      _imcPorFaixaEtaria.addAll(response);
    });
  }

  void loadPercentualObesosPorGenero() {
    repository.percentualObesosPorGenero().then((response) {
      if(response.isEmpty) return;
      _percentObedidadeMasculina.value = response.where((e) => e.genero == 'MASCULINO').first.percentual;
      _percentObedidadeFeminina.value = response.where((e) => e.genero == 'FEMININO').first.percentual;
    });
  }

  void loadMediaIdadePorTipoSanguineo() {
    repository.mediaIdadePorTipoSanguineo().then((response) {
      _idadePorTipoSanguineo.addAll(response);
    });
  }

  void loadQtdDoadoresPorTipoSanguineo() {
    repository.qtdDoadoresPorTipoSanguineo().then((response) {
      _qtdPorTipoSanguineo.addAll(response);
    });
  }
}
