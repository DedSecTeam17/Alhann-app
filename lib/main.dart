import 'package:flutter/material.dart';
import 'package:music_app/screens/auth/sign_in.dart';
import 'package:music_app/screens/auth/sign_up.dart';
import 'package:music_app/screens/main_screen/state/MainScreenModel.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:music_app/screens/splash_screen/onboarding_screen.dart';
import 'package:music_app/screens/splash_screen/splash_screen.dart';
import 'package:music_app/screens/splash_screen/state/splash_model.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:provider/provider.dart';

import 'models/album_model.dart';
import 'models/artist_model.dart';
import 'models/track_model.dart';
import 'models/user_model.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashModel()),
        ChangeNotifierProvider(create: (_) => MainScreenModel()),
        ChangeNotifierProvider(create: (_) => HomeModel()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => TrackModel()),
        ChangeNotifierProvider(create: (_) => AlbumModel()),
        ChangeNotifierProvider(create: (_) => ArtistModel()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<UserModel>().checkIfAuth());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wanassa',
      theme: ThemeData(primarySwatch: Colors.red),
      home:  AppSplashScreen(),
    );
  }
}
