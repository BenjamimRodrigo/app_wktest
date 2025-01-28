import 'dart:async';
import 'dart:io';
import 'package:app_wktest/app/data/dtos/result_list_dto.dart';
import 'package:app_wktest/app/data/models/pessoa_model.dart';
import 'package:app_wktest/app/data/providers/api_provider.dart';

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
        print(response.statusText);
        return Future.error("UNAUTHORIZED_USER");
      } else {
        print(response.statusText);
        return Future.error("SERVER_ERROR");
      }
    } on SocketException catch (e) {
      print(e.toString());
      return Future.error("TIMEOUT_ERROR");
    } on TimeoutException catch (e) {
      print(e.toString());
      return Future.error("TIMEOUT_ERROR");
    } catch (err) {
      print(err.toString());
      return Future.error("CONNECTION_ERROR");
    }
  }

  Future<void> postData(tipo, data) async {
    try {
      final response = await post("/pessoas", data);
      if (response.statusCode == 201) {
        return;
      } else if (response.statusCode == 401) {
        print(response.statusText);
        return Future.error("UNAUTHORIZED_USER");
      } else {
        print(response.statusText);
        return Future.error("SERVER_ERROR");
      }
    } on SocketException catch (e) {
      print(e.toString());
      return Future.error("TIMEOUT_ERROR");
    } on TimeoutException catch (e) {
      print(e.toString());
      return Future.error("TIMEOUT_ERROR");
    } catch (err) {
      print(err.toString());
      return Future.error("CONNECTION_ERROR");
    }
  }
}
