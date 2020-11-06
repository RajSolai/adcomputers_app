import 'dart:convert';
import 'dart:async';
import 'package:adcomputers_app/components/msgbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  List data;
  String message;
  Timer timer;
  bool isLoading = true;
  bool userFlag = true;
  ScrollController _scrollController = new ScrollController();
  TextEditingController _messageCtrl = new TextEditingController();

  Future<void> get() async {
    await http
        .get("http://fast-atoll-71004.herokuapp.com/api/chat/my69uid")
        .then((res) {
      data = json.decode(res.body);
      setState(() {
        data = data;
        isLoading = false;
      });
    });
  }

  send() async {
    await http
        .post("http://fast-atoll-71004.herokuapp.com/api/chat/my69uid", body: {
      "message": message,
      "uid": "my69uid", //TODO: put uid of the user
      "timestamp": DateTime.now().toIso8601String()
    }).then((value) {
      _messageCtrl.clear();
      scroll2Bottom();
    });
  }

  Future<void> _getName() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.get("name").toString() == "") {
      print(_prefs.get("name"));
      setState(() {
        userFlag = false;
      });
    }
  }

  checkUser() {
    if (!userFlag) {
      print("hey not logged");
    }
  }

  Future<void> showNotUserDialog() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Center(
              child: Icon(
                CupertinoIcons.profile_circled,
                size: 50.0,
              ),
            ),
            content: Text(
                "Hey, Please Provide your Name and Contact Number for the further Procedure"),
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

  void checkChat() {
    if (message != null) {
      if (!userFlag) {
        showNotUserDialog();
      } else {
        send();
      }
    } else {
      print("message is null bro");
    }
  }

  void scroll2Bottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getName().then((value) => checkUser());
    timer = Timer.periodic(Duration(milliseconds: 150), (_) => get());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppBar(
            title: isLoading
                ? Text("Loading....")
                : Text(
                    "Chat",
                    style: TextStyle(color: Colors.black),
                  ),
            backgroundColor: isLoading ? Colors.red : Color(0xfffafafa),
          ),
          Container(
            child: Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(0),
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: data == null ? 0 : data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MessageBox(
                        message: data[index]["message"],
                        peeruid: data[index]["peerid"],
                      );
                    })),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: _messageCtrl,
              onChanged: (value) {
                setState(() {
                  message = value;
                });
                scroll2Bottom();
              },
              onTap: () => scroll2Bottom(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Message to Chat",
                  suffixIcon: IconButton(
                      color: Color(0xff53d769),
                      onPressed: () => checkChat(),
                      icon: Icon(
                        Icons.send,
                      ))),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
}
