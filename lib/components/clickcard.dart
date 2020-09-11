import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickCard extends StatelessWidget {
  final coverimg, textcolor, content;
  ClickCard({this.coverimg, this.textcolor, this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(3.0),
        child: GestureDetector(
          onTap: ()=>print("hello"),
          child: Container(
            height: 200,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(coverimg),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Color(0xff232b2b),
                        BlendMode.dst
                    )
                ),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Text(
                content,
                style: TextStyle(
                    color: textcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ));
  }
}
