import 'dart:async';
import 'dart:io';
import 'package:app_wktest/app/data/dtos/result_list_dto.dart';
import 'package:app_wktest/app/data/models/pessoa_model.dart';
import 'package:app_wktest/app/data/providers/api_provider.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

class PessoaProvider extends ApiConnect {
  Future<ResponsePessoaDTO> search(filter, page) async {
    try {
      final response = await get("/pessoas?pesquisa=$filter&page=$page");
      if (response.statusCode == 200) {
        var results = ResponsePessoaDTO(
          totalElements: response.body['totalElements'],
          totalPages: response.body['totalPages'],
          size: response.body['size'],
          number: response.body['number'],
          list: response.body['content']
              .map<Pessoa>((map) => Pessoa.fromJson(map))
              .toList(),
        );
        return results;
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw HttpException(
            "Erro desconhecido! Code: ${response.statusCode}");
      }
    } on SocketException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } on TimeoutException catch (e) {
      throw TimeoutException("Tempo de conexão excedido! ${e.message}");
    } catch (err) {
      throw HttpException("Falha interna no servidor!");
    }
  }

  Future<void> postData(tipo, data) async {
    try {
      final response = await post("/pessoas", data);
      if (response.statusCode == 201) {
        return;
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
