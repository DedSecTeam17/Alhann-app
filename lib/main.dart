import 'package:flutter/material.dart';
import 'package:music_app/screens/auth/sign_in.dart';
import 'package:music_app/screens/main_screen/state/MainScreenModel.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:music_app/screens/splash_screen/splash_screen.dart';
import 'package:music_app/screens/splash_screen/state/splash_model.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashModel()),
        ChangeNotifierProvider(create: (_) => MainScreenModel()),
        ChangeNotifierProvider(create: (_) => HomeModel()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wanassa',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: SplashScreen(),
    );
  }
}

