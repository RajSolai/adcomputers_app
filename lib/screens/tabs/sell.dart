import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Sell extends StatefulWidget {
  @override
  _SellState createState() => _SellState();
}

class _SellState extends State<Sell> {
  var frontImage;
  var backImage;
  var sideImage;
  ImagePicker picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      frontImage = File(pickedFile.path).readAsBytesSync();
    });
  }

  String base64Encode(bytes) => base64.encode(bytes);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sell Old Computers"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Upload Images of Computer",
                style: TextStyle(
                  fontSize: 16.0
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(
                      onPressed: ()=>getImage(),
                      icon: FaIcon(
                        FontAwesomeIcons.image
                      ),
                      label: Text("Front")
                  ),
                  FlatButton.icon(
                      onPressed: ()=>getImage(),
                      icon: FaIcon(
                          FontAwesomeIcons.image
                      ),
                      label: Text("Side")
                  ),
                  FlatButton.icon(
                      onPressed: ()=>getImage(),
                      icon: FaIcon(
                          FontAwesomeIcons.image
                      ),
                      label: Text("Back")
                  )
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Computer's Brand"
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter Computer's Model"
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter Computer's Processor"
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter your Name(for contact)"
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter your contact number"
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              CupertinoButton.filled(
                  child: Text("Sell Product"),
                  onPressed: ()=>print("hello")
              )
            ],
          ),
        ),
      ),
    );
  }
}
