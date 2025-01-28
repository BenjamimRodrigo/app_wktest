import 'package:app_wktest/app/modules/indicadores/controllers/indicadores_controller.dart';
import 'package:app_wktest/app/themes/colors_palete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class IndicadoresPage extends GetView<IndicadoresController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Indicadores gerais',
            style: TextStyle(color: PRIMARY_COLOR),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Center(child: Text("Candidatos à doação por UF", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
              _pessoasPorUF(),
              const SizedBox(height: 15),
              Center(child: Text("IMC médio em cada faixa de idade", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pessoasPorUF() {
    return Obx(() {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.pessoasPorUF.length,
        itemBuilder: (context, index) {
          final item = controller.pessoasPorUF[index];
          final String uf = item['estado'];
          final String bandeira = 'assets/images/bandeiras_estados/$uf.png';
          final int totalPorUF = item['total'];
          int totalGeral = 0;
          for (var element in controller.pessoasPorUF) {
            totalGeral += int.parse(element['total'].toString());
          }
          double porcentagem = totalPorUF / totalGeral;
          return LinearPercentIndicator(
            lineHeight: 12.0,
            percent: porcentagem,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Image(image: AssetImage(bandeira), width: 22),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text("$uf :: $totalPorUF pessoas",
                  style: const TextStyle(fontSize: 14.0)),
            ),
            animation: true,
            animationDuration: 1000,
            barRadius: const Radius.circular(30.0),
            progressColor: SECONDARY_COLOR,
          );
        },
      );
    });
  }
}
