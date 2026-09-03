import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class CommonUtils {
   static void showsnackbar(String message) {
    Get.snackbar("Message", "$message succesful");
  }
}
