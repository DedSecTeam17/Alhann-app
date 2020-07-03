import 'package:music_app/models/error.dart';
import 'package:music_app/models/user.dart';

class SignInResponse {
  Login login;

  SignInResponse({this.login});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    login = json['login'] != null ? new Login.fromJson(json['login']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.login != null) {
      data['login'] = this.login.toJson();
    }
    return data;
  }
}

class Login {
  String jwt;
  User user;

  Login({this.jwt, this.user});

  Login.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = this.jwt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}
