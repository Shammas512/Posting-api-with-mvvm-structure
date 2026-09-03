import 'package:code_x/working/data/utils_working/common_utils.dart';
import 'package:code_x/working/repositries/login_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginViewmodel extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  FocusNode emailFocus = FocusNode();
  TextEditingController passwordcontroller = TextEditingController();
  FocusNode passwordfocus = FocusNode();
  final _api = LoginRepo();

  void loginapi() {
    Map data = {
      'email': emailcontroller.value.text,
      'password': passwordcontroller.value.text,
    };
    _api
        .postapi(data)
        .then((value) {
          CommonUtils.showsnackbar("Login");
        })
        .onError((error, StackTrace) {
          CommonUtils.showsnackbar(error.toString());
        });
  }
}
