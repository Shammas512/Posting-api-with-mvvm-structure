class LoginResponseModel {
  final String? token;

  LoginResponseModel({this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'],
    );
  }
  

  Map<String, dynamic> toJson() {
    return {
      
      'token': token,
    };
  }
}