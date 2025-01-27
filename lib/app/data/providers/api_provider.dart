import 'dart:convert';

import 'package:get/get.dart';
import 'package:app_wktest/app/global/constants.dart';

class ApiConnect extends GetConnect {
  ApiConnect() {
    httpClient.timeout = Duration(seconds: 30);
    httpClient.defaultContentType = 'application/json';
    httpClient.baseUrl = API_HOST;
    final credentials = base64Encode(utf8.encode('$API_USER:$API_PASS'));
    httpClient.addAuthenticator<Object?>((request) {
      request.headers['Authorization'] = "Basic $credentials";
      return request;
    });
  }
}