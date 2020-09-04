import 'dart:convert';
import 'dart:async';
import 'package:adcomputers_app/classes/chat.dart';
import 'package:adcomputers_app/components/msgbox.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  List data;
  String message;
  Timer timer;

  Future<void> get() async {
    await http
        .get("http://fast-atoll-71004.herokuapp.com/api/chat/my69uid")
        .then((res) {
      data = json.decode(res.body);
      setState(() {
        data = data;
      });
    });
  }

  send() async{
    await http.post(
        "http://fast-atoll-71004.herokuapp.com/api/chat/my69uid",
        body: {
          "message":message,
          "peerid": "my62uid", //TODO: put uid of the user
          "timestamp": DateTime.now().toIso8601String()
        }
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 150), (_) => get());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppBar(
            title: Text("Chat"),
          ),
          Container(
            child: Expanded(
                child: ListView.builder(
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
          TextField(
            onChanged: (value){
              setState(() {
                message = value;
              });
            },
            decoration: InputDecoration(
                hintText: "Enter Message to Chat",
                suffixIcon: IconButton(
                    onPressed: () => send(),
                    icon: Icon(
                      Icons.send,
                    ))),
          )
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

