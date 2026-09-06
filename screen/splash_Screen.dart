
import 'package:code_x/localization/utils/app_fonts.dart';
import 'package:code_x/localization/utils/app_images.dart';
import 'package:code_x/working/repositries/login_viewmodel.dart';
import 'package:code_x/working/res/round.dart';
import 'package:code_x/working/screen/widget_spalsh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  
  LoginViewmodel cont = LoginViewmodel();
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "email_hint".tr,
          style: TextStyle(fontFamily: AppFonts.myFont),
        ),
      ),
      body: Column(
        children: [
          Image(image: AssetImage(AppImages.animeimg), height: 300, width: 300),
          SizedBox(height: 30),
          TextFormField(
            controller: cont.emailcontroller,
            focusNode: cont.emailFocus,
          ),
          TextFormField(
            controller: cont.passwordcontroller,
            focusNode: cont.passwordfocus,
          ),
          SizedBox(height: 30,),
          WidgetSpalsh(),
        ],
      ),
    );
  }
}
