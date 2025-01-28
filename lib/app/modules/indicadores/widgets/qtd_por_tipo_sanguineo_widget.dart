import 'package:app_wktest/app/modules/indicadores/controllers/indicadores_controller.dart';
import 'package:app_wktest/app/themes/colors_palete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QtdPorTipoSanguineoWidget extends GetView<IndicadoresController> {
  @override
  Widget build(BuildContext context) {
    final items = controller.qtdPorTipoSanguineo;
    return Obx(() {
      if (items.isEmpty) {
        return CircularProgressIndicator(color: SECONDARY_COLOR);
      }
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          int totalGeral = items.fold(0, (sum, e) => sum + e.totalDoadores);
          return LinearPercentIndicator(
            lineHeight: 12.0,
            percent: item.totalDoadores / totalGeral,
            leading: SizedBox(
              width: 60,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Icon(Icons.bloodtype, size: 14, color: SECONDARY_COLOR),
                    Text(item.sigla),
                  ],
                ),
              ),
            ),
            alignment: MainAxisAlignment.center,
            trailing: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                "${item.totalDoadores} pessoas",
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
            animation: true,
            animationDuration: 500,
            barRadius: const Radius.circular(2.0),
            progressColor: SECONDARY_COLOR,
          );
        },
      );
    });
  }
}
