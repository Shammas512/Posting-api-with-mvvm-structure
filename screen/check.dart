import 'package:code_x/working/repositries/check_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class Check extends StatefulWidget {
  const Check({super.key});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  CheckViewmodel cont =  Get.put(CheckViewmodel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     cont.islogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Icon(Icons.h_mobiledata)));
  }
}
