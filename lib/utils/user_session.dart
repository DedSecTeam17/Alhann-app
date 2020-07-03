import 'dart:async';

import 'package:music_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSessionHandler {
  static UserSessionHandler _singleton = new UserSessionHandler._internal();

  factory UserSessionHandler() {
    return _singleton;
  }

  static UserSessionHandler getInstance() {
    if (_singleton == null) {
      _singleton = new UserSessionHandler._internal();
      return _singleton;
    }
    return _singleton;
  }

  UserSessionHandler._internal();

  static const String EMAIL = "EMAIL";
  static const String USER_NAME = "EMAIL";
  static const String ID = "ID";
  static const String TOKEN = "TOKEN";

  SharedPreferences sharedPreferences;

  Future<void> setUserData(User user, String jwt) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(EMAIL, user.email);
    await sharedPreferences.setString(USER_NAME, user.username);
    await sharedPreferences.setString(ID, user.id);
    await sharedPreferences.setString(TOKEN, jwt);
  }

  Future<void> destroyUser() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(EMAIL);
    await sharedPreferences.remove(USER_NAME);
    await sharedPreferences.remove(ID);
    await sharedPreferences.remove(TOKEN);
  }

//getCurrentUserInformation
  Future<User> getUser() async {
    sharedPreferences = await SharedPreferences.getInstance();

    return User(
        id: sharedPreferences.get(ID),
        email: sharedPreferences.get(EMAIL),
        username: sharedPreferences.get(USER_NAME));
  }

  Future<String> getToken() async {
    sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.get(TOKEN);
  }

  Future<bool> isAuth() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(TOKEN) != null;
  }
}
