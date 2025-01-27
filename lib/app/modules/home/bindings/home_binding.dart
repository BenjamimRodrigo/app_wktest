import 'package:app_wktest/app/data/providers/pessoa_provider.dart';
import 'package:app_wktest/app/data/repositories/pessoa_repository.dart';
import 'package:app_wktest/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(PessoaRepository(PessoaProvider())));
  }
}
