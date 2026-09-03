import 'package:code_x/working/data/appurls/apiurl.dart';
import 'package:code_x/working/data/network/network_api.dart';
import 'package:get/get.dart';

class LoginRepo extends GetxController {
  final _apiservice = NetworkApiService();

  Future<dynamic> postapi(var data) async {
    dynamic response = _apiservice.postapi(Apiurl.loginurl, data);
    return response;
  }
}
