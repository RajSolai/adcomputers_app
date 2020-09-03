import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  _navigator() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  void initState() {
    super.initState();
    _navigator();
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
