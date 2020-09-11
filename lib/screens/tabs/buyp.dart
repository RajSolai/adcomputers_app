import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:adcomputers_app/components/card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:adcomputers_app/screens/filterresults.dart';

class BuyPeri extends StatefulWidget {
  @override
  _BuyPeriState createState() => _BuyPeriState();
}

class _BuyPeriState extends State<BuyPeri> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppBar(),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 180, 0),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
            child: Text(
              "Buy Peripherals",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0
              ),
            ),
          ),
          Container(
            child: Expanded(
                child: ListView(
                  children: [
                    Cards(),
                    Cards(),
                    Cards()
                  ],
                )),
          )
        ],
      ),
    );
  }
}
