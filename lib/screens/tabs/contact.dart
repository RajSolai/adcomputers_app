import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppBar(
            title: Text("Contact"),
          ),
          Container(
            child: Expanded(
              child: Center(
                child: Text("Contact"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
