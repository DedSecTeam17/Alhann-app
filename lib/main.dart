import 'package:flutter/material.dart';
import 'package:music_app/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OK",
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("items"),
            leading: FlatButton(onPressed: () {}, child: Text("Click me ")),
          )
        ],
      ),
    );
  }
}
