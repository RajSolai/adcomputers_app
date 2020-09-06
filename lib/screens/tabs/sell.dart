import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Sell extends StatefulWidget {
  @override
  _SellState createState() => _SellState();
}

class _SellState extends State<Sell> {
  var frontImage;
  var backImage;
  var sideImage;
  String brand;
  String model;
  String cpu;
  String name;
  String contact;
  bool isImageUploaded1 = false;
  bool isImageUploaded2 = false;
  bool isImageUploaded3 = false;
  ImagePicker picker = ImagePicker();

  Future getImage(int number) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      frontImage = File(pickedFile.path).readAsBytesSync();
      if (number == 1) {
        isImageUploaded1 = true;
      } else if (number == 2) {
        isImageUploaded2 = true;
      } else {
        isImageUploaded3 = true;
      }
    });
  }

  Future postProduct() async{
    await http.post(
      "http",
      body: {
        "frontimg":base64Encode(frontImage),
        "sideimg":base64Encode(sideImage),
        "backimg":base64Encode(backImage),
        "brand":brand,
        "model":model,
        "cpu":cpu,
        "name":name,
        "contact":contact
      }
    );
  }

  String base64Encode(bytes) => base64.encode(bytes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sell Old Computers",
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Upload Images of Computer",
                style: TextStyle(fontSize: 16.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(
                      onPressed: () => getImage(1),
                      color: isImageUploaded1 ? Colors.green : Colors.red,
                      icon: FaIcon(FontAwesomeIcons.image,
                          color: Color(0xfffafafa)),
                      label: Text(
                        "Front",
                        style: TextStyle(color: Color(0xfffafafa)),
                      )),
                  SizedBox(width: 8.0),
                  FlatButton.icon(
                      onPressed: () => getImage(2),
                      color: isImageUploaded2 ? Colors.green : Colors.red,
                      icon: FaIcon(FontAwesomeIcons.image,
                          color: Color(0xfffafafa)),
                      label: Text(
                        "Side",
                        style: TextStyle(color: Color(0xfffafafa)),
                      )),
                  SizedBox(width: 8.0),
                  FlatButton.icon(
                      onPressed: () => getImage(3),
                      color: isImageUploaded3 ? Colors.green : Colors.red,
                      icon: FaIcon(
                        FontAwesomeIcons.image,
                        color: Color(0xfffafafa),
                      ),
                      label: Text(
                        "Back",
                        style: TextStyle(color: Color(0xfffafafa)),
                      ))
                ],
              ),
              TextField(
                onChanged: (String value){
                  setState(() {
                    brand = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Provide your Name"),              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                onChanged: (String value){
                  setState(() {
                    model = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Provide your Name"),              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                onChanged: (String value){
                  setState(() {
                    cpu = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Provide your Name"),              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                onChanged: (String value){
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Provide your Name"),              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                onChanged: (String value){
                  setState(() {
                    contact = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Provide your Name"),              ),
              SizedBox(
                height: 10.0,
              ),
              CupertinoButton.filled(
                  child: Text("Sell Product"), onPressed: () => print("hello"))
            ],
          ),
        ),
      ),
    );
  }
}
