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
  String price;
  String name;
  String contact;
  bool isImageUploaded1 = false;
  bool isImageUploaded2 = false;
  bool isImageUploaded3 = false;
  ImagePicker picker = ImagePicker();

  Future getImage(int number) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (number == 1) {
        frontImage = File(pickedFile.path).readAsBytesSync();
        isImageUploaded1 = true;
      } else if (number == 2) {
        sideImage = File(pickedFile.path).readAsBytesSync();
        isImageUploaded2 = true;
      } else {
        backImage = File(pickedFile.path).readAsBytesSync();
        isImageUploaded3 = true;
      }
    });
  }

  Future<void> showNullValueDialog() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Center(
              child: Icon(
                CupertinoIcons.add_circled,
                size: 50.0,
              ),
            ),
            content: Text(
                "Hey, Please Provide all the Values"),
            actions: <Widget>[
              CupertinoButton(
                  child: Text("Okay"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              CupertinoButton(
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  void checkAndPost(data) {
    if (data['frontimg'] == null ||
        data['backimg'] == null ||
        data['sideimg'] == null ||
        data['name'] == null ||
        data['price'] == null ||
        data['contact'] == null ||
        data['brand'] == null ||
        data['model'] == null ||
        data['cpu'] == null) {
      showNullValueDialog();
    } else {
      postProduct(data);
    }
  }

  Future<void> postProduct(data) async {
    showUploadingDialog();
    String url = "http://fast-atoll-71004.herokuapp.com/api/sell";
    await http.post(url, body: data).then((value) {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      if (value.statusCode != 200) {
        showUploadErrorDialog();
      } else {
        showUploadSuccessDialog();
      }
      print(value.statusCode);
    });
  }

  Future<void> showUploadSuccessDialog() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Center(
              child: Icon(
                CupertinoIcons.check_mark_circled,
                size: 50.0,
              ),
            ),
            content: Text("Product Uploaded Successfully"),
            actions: <Widget>[
              CupertinoButton(
                  child: Text("Okay"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  Future<void> showUploadErrorDialog() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Center(
              child: Icon(
                CupertinoIcons.minus_circled,
                size: 50.0,
                color: Colors.redAccent,
              ),
            ),
            content: Text("Product Upload Failed"),
            actions: <Widget>[
              CupertinoButton(
                  child: Text("Okay"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  Future<void> showUploadingDialog() async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Icon(
              CupertinoIcons.share,
              size: 50.0,
            ),
            content: Row(
              children: <Widget>[
                Text(
                  "Posting Your Product Please Wait !",
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        });
  }

  String base64Encode(bytes) => base64.encode(bytes);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 180, 0),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                child: Text(
                  "Sell Computers",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Upload Images of Computer you are Selling",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      onPressed: () => getImage(1),
                      color: isImageUploaded1 ? Colors.green : Colors.red,
                      icon: FaIcon(FontAwesomeIcons.image,
                          color: Color(0xfffafafa)),
                      label: Text(
                        "Front",
                        style: TextStyle(color: Color(0xfffafafa)),
                      )),
                  SizedBox(width: 10.0),
                  FlatButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      onPressed: () => getImage(2),
                      color: isImageUploaded2 ? Colors.green : Colors.red,
                      icon: FaIcon(FontAwesomeIcons.image,
                          color: Color(0xfffafafa)),
                      label: Text(
                        "Side",
                        style: TextStyle(color: Color(0xfffafafa)),
                      )),
                  SizedBox(width: 10.0),
                  FlatButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
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
              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    brand = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Provide Brand Name of Computer"),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    model = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Provide Model Name of Computer"),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    cpu = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Provide Processor Name of Computer"),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    price = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Determine the Price of Computer"),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Provide your Name"),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    contact = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Provide your Contact Number"),
              ),

              SizedBox(
                height: 20.0,
              ),
              CupertinoButton.filled(
                  child: Text("Sell Product"),
                  onPressed: () {
                    var data = {
                      "frontimg": base64Encode(frontImage),
                      "sideimg": base64Encode(sideImage),
                      "backimg": base64Encode(backImage),
                      "brand": brand,
                      "model": model,
                      "cpu": cpu,
                      "price": price,
                      "name": name,
                      "contact": contact
                    };
                    checkAndPost(data);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
