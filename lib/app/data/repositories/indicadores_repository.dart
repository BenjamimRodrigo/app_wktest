import 'package:app_wktest/app/data/dtos/obesidade_por_genero_dto.dart';
import 'package:app_wktest/app/data/providers/indicadores_provider.dart';

class IndicadoresRepository {
  final IndicadoresProvider api;

  IndicadoresRepository(this.api);

  Future pessoasPorUF() {
    return api.pessoasPorUF();
  }

  Future imcMedioFaixaEtaria() {
    return api.imcMedioFaixaEtaria();
  }

  Future<List<ResponseObesidadePorGeneroDTO>> percentualObesosPorGenero() {
    return api.percentualObesosPorGenero();
  }

  Future mediaIdadePorTipoSanguineo() {
    return api.mediaIdadePorTipoSanguineo();
  }

  Future qtdDoadoresPorTipoSanguineo() {
    return api.qtdDoadoresPorTipoSanguineo();
  }
}
