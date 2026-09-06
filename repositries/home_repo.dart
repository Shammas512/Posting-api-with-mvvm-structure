import 'package:code_x/working/data/appurls/apiurl.dart';
import 'package:code_x/working/data/network/network_api.dart';
import 'package:code_x/working/modelclass/usersModel.dart';
import 'package:flutter/foundation.dart';

class HomeRepo {
  final _apiservice = NetworkApiService();

  Future<UserModel> getApi() async {
    final response = await _apiservice.getApi(Apiurl.userlisturl);
    if (kDebugMode) {
      print(response);
      print("hello");
    }
    return UserModel.fromJson(response);
  }
}
