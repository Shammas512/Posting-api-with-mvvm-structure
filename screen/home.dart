import 'package:code_x/working/data/utils_working/common_utils.dart';
import 'package:code_x/working/repositries/login_viewmodel.dart';
import 'package:code_x/working/res/round.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = LoginViewmodel();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      CommonUtils.showsnackbar("fillout form");
                    }
                  },
                  controller: controller.emailcontroller,
                  focusNode: controller.emailFocus,
                  decoration: InputDecoration(hintText: "email_hint".tr),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: controller.passwordcontroller,
                  focusNode: controller.passwordfocus,
                  decoration: InputDecoration(hintText: "pass_hint".tr),
                ),
                SizedBox(height: 30),

                Roundbtn(
                  btnText: "Login",
                  ontap: () {
                    if (_formkey.currentState!.validate()) {
                       controller.loginapi();
                    }
                   
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
