import 'package:app_wktest/app/modules/indicadores/controllers/indicadores_controller.dart';
import 'package:app_wktest/app/themes/colors_palete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Container(
      ),
    );
  }

}
