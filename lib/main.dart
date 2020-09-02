import 'package:flutter/material.dart';
import 'package:adcomputers_app/screens/splash.dart';
import 'package:adcomputers_app/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: {
        "/home": (context) => Home(),
      },
      theme: ThemeData(
        accentColor: Color(0xff0f4c75),
        accentColorBrightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xfffafafa),
        cardColor: Color(0xfffafafa),
        buttonColor: Color(0xff0f4c75),
        appBarTheme: AppBarTheme(
          color: Color(0xff0f4c75),
          centerTitle: true
        )
      ),
    );
  }
}
