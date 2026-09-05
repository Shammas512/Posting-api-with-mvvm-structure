import 'package:code_x/working/modelclass/mymodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefences {
  Future saveuser(LoginResponseModel model) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", model.token.toString());
  }

  Future<LoginResponseModel> getuser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    return LoginResponseModel(token: token);
  }

  Future removeuser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
