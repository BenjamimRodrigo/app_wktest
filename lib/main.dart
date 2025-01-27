import 'package:app_wktest/app/modules/home/bindings/home_binding.dart';
import 'package:app_wktest/app/modules/home/views/home_page.dart';
import 'package:app_wktest/app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "WK Test - Banco de sangue",
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      defaultTransition: Transition.fade,
      home: HomePage(),
      initialBinding: HomeBinding(),
      theme: appThemeData,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale('pt', 'BR')],
    ),
  );
}
