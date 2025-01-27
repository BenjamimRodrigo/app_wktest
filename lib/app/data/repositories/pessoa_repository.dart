import 'package:app_wktest/app/data/dtos/result_list_dto.dart';
import 'package:app_wktest/app/data/providers/pessoa_provider.dart';

class PessoaRepository {
  final PessoaProvider api;

  PessoaRepository(this.api);

  Future<ResponsePessoaDTO> search(filter, int page) {
    return api.search(filter, page);
  }

  Future<void> postData(data) {
    return api.postData('pessoas', data);
  }

}
