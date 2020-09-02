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
      child: Buy(),
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
                "Home",
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
                "Tech",
                style: TextStyle(
                  color: Color(0xff0f4c75)
                ),
              ),
              icon: FaIcon(
                FontAwesomeIcons.phoneAlt,
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