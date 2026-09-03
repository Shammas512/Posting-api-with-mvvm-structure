import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:code_x/dashboard/app_exceptions.dart';
import 'package:code_x/working/data/network/base_api.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future <dynamic> getApi (String url)async{
    
  }
  @override
  Future<dynamic> postapi(String url, var data) async {
    dynamic responseJson;

    try {
      final response = await http.post(Uri.parse(url),
      body: jsonEncode(data)
      );
      responseJson = returnResponse(response);
    } on SocketException {
      InternetExceptions("");
    } on TimeoutException{
      RequestTimeout("");
      }
      return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      

        case 400:
         throw InvalidUrlExcepion('');
        
      default:  throw ServerExceptions('');
    }
  }
} 
