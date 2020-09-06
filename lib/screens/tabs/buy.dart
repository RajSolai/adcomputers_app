import 'package:adcomputers_app/screens/filterresults.dart';
import 'package:adcomputers_app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:adcomputers_app/components/card.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Buy extends StatefulWidget {
  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppBar(
            title: Text(
              "Buy Computers",
              style: TextStyle(
                color: Colors.black
              ),
            ),
            actions: [
              IconButton(
                iconSize: 20.0,
                icon: FaIcon(FontAwesomeIcons.search,color: Colors.black,),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) => FilterResults()));
                },
              )
            ],
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
