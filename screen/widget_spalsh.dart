import 'package:code_x/working/repositries/login_viewmodel.dart';
import 'package:code_x/working/res/round.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class WidgetSpalsh extends StatelessWidget {
  WidgetSpalsh({super.key});
  LoginViewmodel cont = LoginViewmodel();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Roundbtn(
        isloading: cont.isLoading.value,
        btnText: "Login",
        ontap: () {
          cont.loginapi();
        },
      );
    });
  }
}
