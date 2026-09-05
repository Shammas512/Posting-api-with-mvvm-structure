import 'package:code_x/working/data/utils_working/common_utils.dart';
import 'package:code_x/working/repositries/home_viewmodel.dart';
import 'package:code_x/working/repositries/login_viewmodel.dart';
import 'package:code_x/working/res/round.dart';
import 'package:code_x/working/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller2 = Get.put(HomeViewmodel());
  final controller = LoginViewmodel();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomeView"), centerTitle: true),
      body: Obx(() {
        switch (controller2.rxRequestStatus.value) {
          case Sta.LOADING:
            return Center(child: CircularProgressIndicator());

          case Sta.ERROR:
            return Center(child: Text("Something is wrong"));

          case Sta.COMPLETED:
            return ListView.builder(
              itemCount: controller2.userlist.value.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller2.userlist.value.data![index].email.toString()),
                );
              },
            );
        }
      }),
    );
  }
}
