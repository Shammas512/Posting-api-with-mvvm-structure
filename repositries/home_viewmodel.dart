import 'package:code_x/named_para/paymentStatus.dart';
import 'package:code_x/working/modelclass/usersModel.dart';
import 'package:code_x/working/repositries/home_repo.dart';
import 'package:code_x/working/status.dart';
import 'package:get/get.dart';

class HomeViewmodel extends GetxController {
  final _api = HomeRepo();
  final rxRequestStatus = Sta.LOADING.obs;
  final userlist = UserModel().obs;

  void setrxRequest(Sta _value) => rxRequestStatus.value = _value;
  void setuserlist(UserModel user) => userlist.value = user;

  void getusers() {
    _api
        .getApi()
        .then((v) {
          setrxRequest(Sta.COMPLETED);
          setuserlist(v);
        })
        .onError(((error, stackTrace) {
          setrxRequest(Sta.ERROR);
        }));
  }
}
