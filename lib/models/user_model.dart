import 'package:flutter/material.dart';
import 'package:music_app/models/user.dart';
import 'package:music_app/services/auth_service.dart';
import 'package:music_app/services/responses/create_user_response.dart';
import 'package:music_app/services/responses/login_response.dart';
import 'package:music_app/utils/user_session.dart';

class UserModel with ChangeNotifier {
  bool _isSignIn = false;
  bool _isSignUp = false;
  bool _isAuth = false;
  User _currentUser;

//  getters
  bool get isSignIn => _isSignIn;

  bool get isSignUp => _isSignUp;

  User get currentUser => _currentUser;

  bool get isAuth => _isAuth;

  checkIfAuth() async {
    _isAuth = await UserSessionHandler.getInstance().isAuth();
    if (_isAuth) {
      _currentUser = await UserSessionHandler.getInstance().getUser();
    }
    notifyListeners();
  }

  void signIn(String identifier, String password, Function onExecuted) async {
    _isSignIn = true;
    notifyListeners();
    try {
      SignInResponse signInResponse = await AuthService.getInstance()
          .login(identifier: identifier, password: password);
      _isSignIn = false;
      _currentUser = signInResponse.login.user;
      await UserSessionHandler.getInstance()
          .setUserData(_currentUser, signInResponse.login.jwt);
      _isAuth = await UserSessionHandler.getInstance().isAuth();

      notifyListeners();
      onExecuted(true, "done");
    } catch (e) {
      _isSignIn = false;
      notifyListeners();
      onExecuted(false, e.toString());
    }
  }

  void signUp(String userName, String email, String password,
      Function onExecuted) async {
    _isSignUp = true;
    notifyListeners();
    try {
      SignUpResponse signInResponse = await AuthService.getInstance()
          .createUser(userName: userName, email: email, password: password);
      _isSignIn = false;
      _currentUser = signInResponse.register.user;
      await UserSessionHandler.getInstance()
          .setUserData(_currentUser, signInResponse.register.jwt);
      _isAuth = await UserSessionHandler.getInstance().isAuth();
      notifyListeners();

      onExecuted(true, "User created successfully");
    } catch (e) {
      _isSignIn = false;
      notifyListeners();
      onExecuted(false, e.toString());
    }
  }

  signOut() async {
    _isAuth = false;
    _currentUser = null;
    await UserSessionHandler.getInstance().destroyUser();
    notifyListeners();
  }
}
