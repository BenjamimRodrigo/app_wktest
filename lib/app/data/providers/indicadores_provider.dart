import 'dart:async';
import 'dart:io';

import 'package:app_wktest/app/data/providers/api_provider.dart';

class IndicadoresProvider extends ApiConnect {
  //

  Future pessoasPorUF() async {
    try {
      final response = await get("/indicadores/pessoasPorUF");
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
