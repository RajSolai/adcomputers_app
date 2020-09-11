import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0)
              ),
              color: Color(0xFF8e8e93),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            child: Text(widget.message,
                style: TextStyle(
                    fontSize: 14,
                  color: Colors.white
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
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0)
              ),
              color: Color(0xff53d769),
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
