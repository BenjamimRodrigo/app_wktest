import 'package:app_wktest/app/modules/indicadores/controllers/indicadores_controller.dart';
import 'package:app_wktest/app/modules/indicadores/widgets/imc_por_faixa_etaria_widget.dart';
import 'package:app_wktest/app/modules/indicadores/widgets/obesidade_por_genero_widget.dart';
import 'package:app_wktest/app/modules/indicadores/widgets/pessoas_por_uf_widget.dart';
import 'package:app_wktest/app/themes/colors_palete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndicadoresPage extends GetView<IndicadoresController> {
  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

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
          child: Column(
            children: [
              Center(
                child: Text(
                  "Candidatos à doação por UF",
                  style: titleStyle,
                ),
              ),
              PessoasPorUFWidget(),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  "IMC médio em cada faixa de idade",
                  style: titleStyle,
                ),
              ),
              IMCPorFaixaEtariaWidget(),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  "Obesidade entre os homens e as mulheres",
                  style: titleStyle,
                ),
              ),
              ObesidadePorGeneroWidget(),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  "Média de idade para cada tipo sanguíneo",
                  style: titleStyle,
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  "Possíveis doadores para cada tipo sanguíneo",
                  style: titleStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
