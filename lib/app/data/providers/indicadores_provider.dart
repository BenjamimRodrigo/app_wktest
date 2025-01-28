import 'dart:async';
import 'dart:io';
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
        throw HttpException("Falha interna no servidor! Code: ${response.statusCode}");
      }
    } on SocketException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } on TimeoutException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } catch (err) {
      throw HttpException("Falha interna no servidor! ${err.toString()}");
    }
  }

  Future imcMedioFaixaEtaria() async {
    try {
      final response = await get("/indicadores/imcMedioFaixaEtaria");
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 401) {
        return Future.error("UNAUTHORIZED_USER");
      } else {
        return Future.error("SERVER_ERROR");
      }
    } on SocketException catch (e) {
      return Future.error("TIMEOUT_ERROR");
    } on TimeoutException catch (e) {
      throw TimeoutException("");
    } catch (err) {
      return Future.error("CONNECTION_ERROR");
    }
  }

  Future percentualObesosPorGenero() async {
    try {
      final response = await get("/indicadores/percentualObesosPorGenero");
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 401) {
        return Future.error("UNAUTHORIZED_USER");
      } else {
        return Future.error("SERVER_ERROR");
      }
    } on SocketException catch (e) {
      return Future.error("TIMEOUT_ERROR");
    } on TimeoutException catch (e) {
      throw TimeoutException("");
    } catch (err) {
      return Future.error("CONNECTION_ERROR");
    }
  }

  Future mediaIdadePorTipoSanguineo() async {
    try {
      final response = await get("/indicadores/mediaIdadePorTipoSanguineo");
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 401) {
        return Future.error("UNAUTHORIZED_USER");
      } else {
        return Future.error("SERVER_ERROR");
      }
    } on SocketException catch (e) {
      return Future.error("TIMEOUT_ERROR");
    } on TimeoutException catch (e) {
      throw TimeoutException("");
    } catch (err) {
      return Future.error("CONNECTION_ERROR");
    }
  }

  Future qtdDoadoresPorTipoSanguineo() async {
    try {
      final response = await get("/indicadores/qtdDoadoresPorTipoSanguineo");
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 401) {
        return Future.error("UNAUTHORIZED_USER");
      } else {
        return Future.error("SERVER_ERROR");
      }
    } on SocketException catch (e) {
      return Future.error("TIMEOUT_ERROR");
    } on TimeoutException catch (e) {
      throw TimeoutException("");
    } catch (err) {
      return Future.error("CONNECTION_ERROR");
    }
  }
}
