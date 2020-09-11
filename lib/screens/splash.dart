import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  _checkLogin() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if(_prefs.get("uid")==null){
      _prefs.setString("uid", randomString(10));
      _prefs.setString("name", "");
      _navigator();
    }else{
      _navigator();
    }
  }

  _navigator() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 400),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "AD Computers",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 200,
              ),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    ));
  }
}
