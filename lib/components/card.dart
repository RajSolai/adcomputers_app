import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
          ),
          child: Container(
            padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.network(cardImage,height: 180,width: 350),
              SizedBox(
                height: 20.0,
              ),
              Text("Macbook Air",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  )),
              Text("Short Description for the product"),
              Container(
                padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: CupertinoButton.filled(
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
                      child: CupertinoButton(
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
        )));
  }
}
