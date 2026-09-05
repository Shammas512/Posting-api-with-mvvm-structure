import 'dart:async';

import 'package:code_x/routes/routes_name.dart';
import 'package:code_x/working/repositries/user_prefences.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CheckViewmodel extends GetxController {
  UserPrefences user = UserPrefences();

  void islogin() {
    user.getuser().then((value) {
      if (value.token.toString() == "null" || value.token!.trim().isEmpty) {
        Timer(
          const Duration(seconds: 3),
          () => Get.offNamed(RoutesNa me.loginScreen),
        );
      } else {
        if (kDebugMode) {
          print(value.token);
        }
        Timer(
          const Duration(seconds: 3),
          () => Get.offNamed(RoutesName.homeScreen),
        );
      }
    });
  }
}
