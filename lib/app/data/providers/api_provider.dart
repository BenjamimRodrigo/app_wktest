import 'package:get/get.dart';
import 'package:app_wktest/app/global/constants.dart';

class ApiConnect extends GetConnect {
  ApiConnect() {
    httpClient.timeout = Duration(seconds: 30);
    httpClient.defaultContentType = 'application/json';
    httpClient.baseUrl = API_HOST;
  }
}