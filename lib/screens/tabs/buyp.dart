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
          AppBar(
            title: Text(
              "Buy Peripherals",
              style: TextStyle(
                  color: Colors.black
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
