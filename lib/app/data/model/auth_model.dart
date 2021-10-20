import 'user_model.dart';

class Auth {
  User user;
  String accessToken;
  String tokenType;
  int expiresIn;

  Auth(
      {required this.user,
      required this.accessToken,
      required this.tokenType,
      required this.expiresIn});

  // Auth.fromJson(Map<String, dynamic> json) {
  //   user = json['user'] != null ? User.fromJson(json['user']) : null;
  //   accessToken = json['access_token'];
  //   tokenType = json['token_type'];
  //   expiresIn = json['expires_in'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   if (this.user != null) {
  //     data['user'] = this.user.toJson();
  //   }
  //   data['access_token'] = this.accessToken;
  //   data['token_type'] = this.tokenType;
  //   data['expires_in'] = this.expiresIn;
  //   return data;
  // }
}
