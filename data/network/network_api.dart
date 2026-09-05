import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:code_x/dashboard/app_exceptions.dart';
import 'package:code_x/working/data/network/base_api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions('');
    } on TimeoutException {
      throw RequestTimeout('');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postapi(String url, var data) async {
    dynamic responseJson;

    try {
      final response = await http.post(
        headers: {'Content-Type': 'application/json'},
        Uri.parse(url),
        body: jsonEncode(data),
      );
      if (kDebugMode) {
        print(data);
      }
      responseJson = returnResponse(response);
    } on SocketException {
      InternetExceptions("");
    } on TimeoutException {
      RequestTimeout("");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw ServerExceptions('');
    }
  }
}
