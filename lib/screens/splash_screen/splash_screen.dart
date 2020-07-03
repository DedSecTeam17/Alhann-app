import 'package:flutter/material.dart';
import 'package:music_app/models/user_model.dart';
import 'package:music_app/screens/main_screen/main_screen.dart';
import 'package:music_app/screens/splash_screen/onboarding_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

class AppSplashScreen extends StatefulWidget {
  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds:
          context.watch<UserModel>().isAuth ? MainScreen() : OnBoardingScreen(),
      image: Image.asset("assets/images/logo.png"),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Colors.red,
    );
  }
}
