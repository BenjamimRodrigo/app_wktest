import 'package:app_wktest/app/modules/indicadores/controllers/indicadores_controller.dart';
import 'package:app_wktest/app/themes/colors_palete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ObesidadePorGeneroWidget extends GetView<IndicadoresController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.percentObedidadeMasculina == 0) {
        return CircularProgressIndicator(color: SECONDARY_COLOR);
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 15.0,
            animation: true,
            percent: controller.percentObedidadeMasculina / 100,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Homens"),
                Text("${controller.percentObedidadeMasculina}%"),
              ],
            ),
            progressColor: Colors.blue,
          ),
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 15.0,
            animation: true,
            percent: controller.percentObedidadeFeminina / 100,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Mulheres"),
                Text("${controller.percentObedidadeFeminina}%"),
              ],
            ),
            progressColor: Colors.pink,
          ),
        ],
      );
    });
  }
}
