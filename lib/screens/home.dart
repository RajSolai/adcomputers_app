import 'package:adcomputers_app/screens/tabs/buyp.dart';
import 'package:adcomputers_app/screens/tabs/repair.dart';
import 'package:adcomputers_app/screens/tabs/sell.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:flutter/material.dart";
import 'package:adcomputers_app/screens/tabs/buy.dart';
import 'package:adcomputers_app/screens/tabs/contact.dart';
import 'package:cupertino_icons/cupertino_icons.dart' as cuicons;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _screens = [
    Center(
      child: Repair(),
    ),
    Center(
      child: Buy(),
    ),
    Center(
      child: BuyPeri(),
    ),
    Center(
      child: Sell(),
    ),
    Center(
      child: Contact(),
    )
  ];

  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.transparent,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              title: Text(
                "Repair & Service",
                style: TextStyle(
                    color: Color(0xff232b2b)
                ),
              ),
              icon: Icon(
                Icons.home,
                  size: 30.0,
                  color: Color(0xff232b2b)
              )),
          BottomNavigationBarItem(
              title: Text(
                "Buy Computers",
                style: TextStyle(
                    color: Color(0xff232b2b)
                ),
              ),
              icon: Icon(
                  Icons.laptop,
                  size: 30.0,
                  color: Color(0xff232b2b)
              )),
          BottomNavigationBarItem(
              title: Text(
                "Buy Peripherals",
                style: TextStyle(
                    color: Color(0xff232b2b)
                ),
              ),
              icon: Icon(
                Icons.mouse,
                  size: 30.0,
                  color: Color(0xff232b2b)
              )
          ),
          BottomNavigationBarItem(
              title: Text(
                "Sell Computers",
                style: TextStyle(
                    color: Color(0xff232b2b)
                ),
              ),
              icon: Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Color(0xff232b2b)
              )),
          BottomNavigationBarItem(
              title: Text(
                "Chat",
                style: TextStyle(
                  color: Color(0xff232b2b)
                ),
              ),
              icon: Icon(
                Icons.chat_bubble_outline,
                color: Color(0xff232b2b)
              )),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}