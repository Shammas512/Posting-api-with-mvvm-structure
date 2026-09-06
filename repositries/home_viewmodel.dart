import 'package:code_x/named_para/paymentStatus.dart';
import 'package:code_x/routes/routes_name.dart';
import 'package:code_x/working/modelclass/usersModel.dart';
import 'package:code_x/working/repositries/home_repo.dart';
import 'package:code_x/working/repositries/user_prefences.dart';
import 'package:code_x/working/status.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeViewmodel extends GetxController {
  final _api = HomeRepo();
  final rxRequestStatus = Sta.LOADING.obs;
  final userlist = UserModel().obs;
  UserPrefences user = UserPrefences();
  RxString error = ''.obs;

  void setrxRequest(Sta _value) => rxRequestStatus.value = _value;
  void setuserlist(UserModel user) => userlist.value = user;
  void seterror(String _value) => error.value = _value;

  void getusers() {
    _api
        .getApi()
        .then((v) {
          setrxRequest(Sta.COMPLETED);
          setuserlist(v);
        })
        .onError(((error, stackTrace) {
          seterror(error.toString());
          if (kDebugMode) {
            print(error);
          }
          setrxRequest(Sta.ERROR);
        }));
  }

  void getusersagain() {
    setrxRequest(Sta.LOADING);
    _api
        .getApi()
        .then((v) {
          setrxRequest(Sta.COMPLETED);
          setuserlist(v);
        })
        .onError(((error, stackTrace) {
          seterror(error.toString());
          if (kDebugMode) {
            print(error);
          }
          setrxRequest(Sta.ERROR);
        }));
  }

  void logoutuser() {
    user.removeuser().then((v) {
      Get.offAllNamed(RoutesName.loginScreen);
    });
  }
}
