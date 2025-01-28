import 'package:app_wktest/app/data/providers/indicadores_provider.dart';
import 'package:app_wktest/app/data/repositories/indicadores_repository.dart';
import 'package:app_wktest/app/modules/indicadores/controllers/indicadores_controller.dart';
import 'package:get/get.dart';

class IndicadoresBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IndicadoresController>(
      IndicadoresController(
        IndicadoresRepository(IndicadoresProvider()),
      ),
    );
  }
}
