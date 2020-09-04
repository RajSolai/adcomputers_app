import 'package:flutter/material.dart';
import 'package:adcomputers_app/components/card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterResults extends StatefulWidget {

  @override
  _FilterResultsState createState() => _FilterResultsState();
}

class _FilterResultsState extends State<FilterResults> {
  String searchKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Results"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
              child: Container(
                color: Color(0xffcccccc),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Color(0xffcccccc),
                filled: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                    left: 15.0
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.search
                  ), // myIcon is a 48px-wide widget.
                ),
                hintText: "Search Products here"
              ),
              onChanged: (String value) {
                searchKey = value;
              }
            ),
            SizedBox(
             height: 10.0,
            ),
            Expanded(
              child: ListView(
                children: [
                  Cards(),
                  Cards(),
                  Cards()
                ],
              )
            )
          ],
        ),
      )
    );
  }
}
