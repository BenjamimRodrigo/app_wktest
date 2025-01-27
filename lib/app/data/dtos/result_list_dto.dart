import 'package:app_wktest/app/data/models/pessoa_model.dart';

class ResponsePessoaDTO {
  int totalElements = 0;
  int totalPages = 0;
  int size = 0;
  int number = 0;
  var list = <Pessoa>[];

  ResponsePessoaDTO({
    required this.totalElements,
    required this.totalPages,
    required this.size,
    required this.number,
    required this.list,
  });
}
