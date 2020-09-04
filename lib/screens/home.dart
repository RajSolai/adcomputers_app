import 'package:adcomputers_app/screens/tabs/buyp.dart';
import 'package:adcomputers_app/screens/tabs/repair.dart';
import 'package:adcomputers_app/screens/tabs/sell.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:flutter/material.dart";
import 'package:adcomputers_app/screens/tabs/buy.dart';
import 'package:adcomputers_app/screens/tabs/contact.dart';


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
                    color: Color(0xff0f4c75)
                ),
              ),
              icon: FaIcon(
                FontAwesomeIcons.tools,
                color: Color(0xff0f4c75),
              )),
          BottomNavigationBarItem(
              title: Text(
                "Buy Computers",
                style: TextStyle(
                    color: Color(0xff0f4c75)
                ),
              ),
              icon: FaIcon(
                FontAwesomeIcons.laptop,
                color: Color(0xff0f4c75),
              )),
          BottomNavigationBarItem(
              title: Text(
                "Buy Peripherals",
                style: TextStyle(
                    color: Color(0xff0f4c75)
                ),
              ),
              icon: FaIcon(
                FontAwesomeIcons.microchip,
                color: Color(0xff0f4c75),
              )),
          BottomNavigationBarItem(
              title: Text(
                "Sell Computers",
                style: TextStyle(
                    color: Color(0xff0f4c75)
                ),
              ),
              icon: FaIcon(
                  FontAwesomeIcons.rupeeSign,
                  color: Color(0xff0f4c75)
              )),
          BottomNavigationBarItem(
              title: Text(
                "Chat",
                style: TextStyle(
                  color: Color(0xff0f4c75)
                ),
              ),
              icon: FaIcon(
                FontAwesomeIcons.solidPaperPlane,
                color: Color(0xff0f4c75)
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