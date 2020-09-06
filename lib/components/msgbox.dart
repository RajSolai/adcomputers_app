import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class MessageBox extends StatefulWidget {
  final peeruid , message;

  MessageBox({this.peeruid,this.message});

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  String uid = "my69uid"; //TODO: change in production or testing

  Future<void> _getUID() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = _prefs.get("uid");
    });
  }

  @override
  void initState() {
    // TODO: implement uid getter here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (uid == widget.peeruid) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              border: Border.all(
                width: 1.5,
                color: Color(0xff0f4c75)
              ),
              color: Color(0xFFfafafa),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            child: Text(widget.message,
                style: TextStyle(
                    fontSize: 14,
                   ),
            )
          ),
        ],
      );
    } else if(uid!=widget.peeruid) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Color(0xff0f4c75),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            child: Text(widget.message,
                style: TextStyle(fontSize: 14, color: Colors.white)),
          )
        ],
      );
    }else{
      return Text("hello");
    }
  }
}
