import 'package:app_wktest/app/modules/indicadores/controllers/indicadores_controller.dart';
import 'package:app_wktest/app/themes/colors_palete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PessoasPorUFWidget extends GetView<IndicadoresController> {
  @override
  Widget build(BuildContext context) {
    final items = controller.pessoasPorUF;
    return Obx(() => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            int totalGeral = items.fold(0, (sum, e) => sum + e.total);
            return LinearPercentIndicator(
              lineHeight: 12.0,
              percent: item.total / totalGeral,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Image(image: AssetImage(item.bandeira), width: 22),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text("${item.estado} :: ${item.total} pessoas",
                    style: const TextStyle(fontSize: 14.0)),
              ),
              animation: true,
              animationDuration: 1000,
              barRadius: const Radius.circular(30.0),
              progressColor: SECONDARY_COLOR,
            );
          },
        ));
  }
}
