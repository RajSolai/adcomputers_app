import 'package:flutter/material.dart';
import 'package:adcomputers_app/components/card.dart';

class FilterResults extends StatefulWidget {
  final String brand,price,type;
  final String apiUri = "https://adcomputerapi";
  FilterResults({this.brand,this.price,this.type});

  @override
  _FilterResultsState createState() => _FilterResultsState();
}

class _FilterResultsState extends State<FilterResults> {

  String genUri(){
    String uri;
    if(widget.brand!="Any Brand" && widget.price!="Any Price Range"){
      uri = widget.apiUri+"/"+widget.brand+"/"+widget.price;
    }else{
      uri = widget.apiUri+"/";
    }
    return uri;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(genUri());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Results"),
      ),
      body: Container(
        child: ListView(
          children: [
            Cards(),
            Cards(),
            Cards()
          ],
        ),
      )
    );
  }
}
