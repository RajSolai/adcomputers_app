import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adcomputers_app/components/clickcard.dart';

class Repair extends StatefulWidget {
  @override
  _RepairState createState() => _RepairState();
}

class _RepairState extends State<Repair> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => print("hello"),
            icon: Icon(
              CupertinoIcons.profile_circled,
              size: 30.0,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 180, 0),
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "AD Computers",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  ClickCard(
                      content: "Physical Damage Repairs",
                      coverimg: "assets/lapbro.jpg",
                      textcolor: Colors.black),
                  ClickCard(
                      content: "RAM/HDD Upgrade",
                      coverimg: "assets/rampic.jpg",
                      textcolor: Colors.white),
                ],
              ),
              Row(
                children: [
                  ClickCard(
                      content: "Data Recovery",
                      coverimg: "assets/datar.jpg",
                      textcolor: Colors.white),
                  ClickCard(
                      content: "Trouble shooting",
                      coverimg: "assets/tshoot.jpg",
                      textcolor: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
