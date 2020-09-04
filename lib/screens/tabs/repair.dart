import 'package:flutter/material.dart';

class Repair extends StatefulWidget {
  @override
  _RepairState createState() => _RepairState();
}

class _RepairState extends State<Repair> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repair Computers"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(

          ),
        ),
      ),
    );
  }
}
