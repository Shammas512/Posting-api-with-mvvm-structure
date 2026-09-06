import 'package:code_x/routes/routes_name.dart';
import 'package:code_x/working/data/utils_working/common_utils.dart';
import 'package:code_x/working/modelclass/mymodel.dart';
import 'package:code_x/working/repositries/login_repo.dart';
import 'package:code_x/working/repositries/user_prefences.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginViewmodel extends GetxController {
  UserPrefences user = UserPrefences();
  RxBool isLoading = false.obs;
  TextEditingController emailcontroller = TextEditingController();
  FocusNode emailFocus = FocusNode();
  TextEditingController passwordcontroller = TextEditingController();
  FocusNode passwordfocus = FocusNode();
  final _api = LoginRepo();

  void loginapi() {
    isLoading.value = true;
    Map data = {
      'email': emailcontroller.text.trim(),
      'password': passwordcontroller.text.trim(),
    };
    _api
        .postapi(data)
        .then((value) {
          if (value["error"] ==
              'Note: Only defined users succeed registration') {
            CommonUtils.showsnackbar("Enter correct Email or password");
            isLoading.value = false;
          } else {
            user.saveuser(LoginResponseModel.fromJson(value)).then((v) {
               Get.delete<LoginViewmodel>();
          
              Get.toNamed(RoutesName.homeScreen);
            });
            isLoading.value = false;
            CommonUtils.showsnackbar("Login succesfull");
          }
        })
        .onError((error, StackTrace) {
          isLoading.value = false;
          CommonUtils.showsnackbar(error.toString());
        });
  }
}
