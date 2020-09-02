import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cards extends StatelessWidget {
  final cardImage =
      "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/macbook-air-space-gray-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=80&.v=1539386809517";
  final title;
  final id;
  final desc;
  Cards({@required this.title,@required this.desc,@required this.id});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
        height: 370.0,
        width: 355.0,
        child: Card(
          elevation: 2.0,
          child: Column(
            children: [
              Image.network(
                cardImage,
                height: 200.0,
                width: 300.0,
              ),
              Text("Macbook Air",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 5.0,
              ),
              Text("Short Description for the product"),
              Container(
                padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          color: Color(0xff0f4c75),
                          onPressed: () => print("hello"),
                          child: Text(
                            "View Deal",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xfffafafa)
                            ),
                          ),
                        ),
                      ),
                    Container(
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        borderSide: BorderSide(
                          color: Color(0xff0f4c75),
                          width: 2.0
                        ),
                        onPressed: () => print("hello"),
                        child: Text(
                          "Share Deal",
                          style: TextStyle(
                            fontSize: 18.0
                          ),
                        ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
