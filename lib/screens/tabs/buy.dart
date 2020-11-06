import 'dart:convert';
import 'package:adcomputers_app/screens/filterresults.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:adcomputers_app/components/card.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class Buy extends StatefulWidget {
  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  String apiUri = "https://fast-atoll-71004.herokuapp.com/api/sell";
  Map data;
  List products;
  Future<void> get() async{
    http.get(apiUri).then((value) => {
      data = json.decode(value.body),
      setState((){
        products = data['data'];
      })
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AppBar(
            actions: [
              IconButton(
                iconSize: 20.0,
                icon: FaIcon(FontAwesomeIcons.search,color: Colors.black,),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) => FilterResults()));
                },
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 180, 0),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
            child: Text(
              "Buy Computers",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            child: Expanded(
                child: ListView.builder(
                  itemCount: products==null?0:products.length,
                  itemBuilder: (BuildContext context,int index){
                    return Cards(
                      desc: products[index]['brand'],
                      title: products[index]['model'],
                    );
                  }
            )),
          )
        ],
      ),
    );
  }
}
