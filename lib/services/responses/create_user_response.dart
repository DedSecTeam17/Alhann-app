import 'package:music_app/models/error.dart';
import 'package:music_app/models/user.dart';


class SignUpResponse {
  Register register;

  SignUpResponse({this.register});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    register = json['register'] != null
        ? new Register.fromJson(json['register'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.register != null) {
      data['register'] = this.register.toJson();
    }
    return data;
  }
}

class Register {
  String jwt;
  User user;

  Register({this.jwt, this.user});

  Register.fromJson(Map<String, dynamic> json) {
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
