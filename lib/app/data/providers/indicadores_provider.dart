import 'dart:async';
import 'dart:io';
import 'package:app_wktest/app/data/dtos/idade_por_tipo_sanguineo_dto.dart';
import 'package:app_wktest/app/data/dtos/imc_por_faixa_etaria_dto.dart';
import 'package:app_wktest/app/data/dtos/obesidade_por_genero_dto.dart';
import 'package:app_wktest/app/data/dtos/pessoas_por_uf_dto.dart';
import 'package:app_wktest/app/data/providers/api_provider.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

class IndicadoresProvider extends ApiConnect {
  //

  Future pessoasPorUF() async {
    try {
      final response = await get("/indicadores/pessoasPorUF");
      if (response.statusCode == 200) {
        List<ResponsePessoasPorUFDTO> pessoas = (response.body as List)
            .map((item) => ResponsePessoasPorUFDTO.fromJson(item))
            .toList();
        return pessoas;
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw HttpException(
            "Falha interna no servidor! Code: ${response.statusCode}");
      }
    } on SocketException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } on TimeoutException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } catch (err) {
      throw HttpException("Falha interna no servidor! ${err.toString()}");
    }
  }

  Future<List<ResponseIMCPorFaixaEtariaDTO>> imcMedioFaixaEtaria() async {
    try {
      final response = await get("/indicadores/imcMedioFaixaEtaria");
      if (response.statusCode == 200) {
        List<ResponseIMCPorFaixaEtariaDTO> lista = (response.body as List)
            .map((item) => ResponseIMCPorFaixaEtariaDTO.fromJson(item))
            .toList();
        return lista;
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw HttpException(
            "Falha interna no servidor! Code: ${response.statusCode}");
      }
    } on SocketException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } on TimeoutException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } catch (err) {
      throw HttpException("Falha interna no servidor! ${err.toString()}");
    }
  }

  Future<List<ResponseObesidadePorGeneroDTO>>
      percentualObesosPorGenero() async {
    try {
      final response = await get("/indicadores/percentualObesosPorGenero");
      if (response.statusCode == 200) {
        List<ResponseObesidadePorGeneroDTO> percentuais =
            (response.body as List)
                .map((item) => ResponseObesidadePorGeneroDTO.fromJson(item))
                .toList();
        return percentuais;
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw HttpException(
            "Falha interna no servidor! Code: ${response.statusCode}");
      }
    } on SocketException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } on TimeoutException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } catch (err) {
      throw HttpException("Falha interna no servidor! ${err.toString()}");
    }
  }

  Future mediaIdadePorTipoSanguineo() async {
    try {
      final response = await get("/indicadores/mediaIdadePorTipoSanguineo");
      if (response.statusCode == 200) {
        List<ResponseIdadePorTipoSanguineoDTO> list = (response.body as List)
            .map((item) => ResponseIdadePorTipoSanguineoDTO.fromJson(item))
            .toList();
        return list;
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw HttpException(
            "Falha interna no servidor! Code: ${response.statusCode}");
      }
    } on SocketException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } on TimeoutException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } catch (err) {
      throw HttpException("Falha interna no servidor! ${err.toString()}");
    }
  }

  Future qtdDoadoresPorTipoSanguineo() async {
    try {
      final response = await get("/indicadores/qtdDoadoresPorTipoSanguineo");
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw HttpException(
            "Falha interna no servidor! Code: ${response.statusCode}");
      }
    } on SocketException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } on TimeoutException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } catch (err) {
      throw HttpException("Falha interna no servidor! ${err.toString()}");
    }
  }
}
