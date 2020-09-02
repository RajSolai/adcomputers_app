import 'package:adcomputers_app/screens/filterresults.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  String brandName = "Dell";
  String priceRange = "20,000-30,000";
  String computerType = "Desktop Computer";

  List<String> brandNames = <String>[
    "Dell","Lenovo","Apple","HP","Toshiba","Any Brand"
  ];
  List<String> priceRanges = <String>[
    "5,000-10,000","10,000-20,000","20,000-30,000","Any Price Range"
  ];
  List<String> computerTypes = <String>[
    "Desktop Computer","Laptop Computer","Tablet Computer"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Products"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                "Select Brand",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: DropdownButton<String>(
                value: brandName,
                isExpanded: true,
                icon: Icon(Icons.arrow_downward),
                iconSize: 30,
                elevation: 16,
                itemHeight: 80.0,
                underline: Container(
                  height: 2,
                  color: Color(0xff0f4c75),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    brandName = newValue;
                  });
                },
                items: brandNames
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: TextStyle(
                        fontSize: 22.0
                    ),),
                  );
                }).toList(),
              ),
            ),
            Center(
              child: Text(
                "Select Price Range",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: DropdownButton<String>(
                value: priceRange,
                isExpanded: true,
                icon: Icon(Icons.arrow_downward),
                iconSize: 30,
                elevation: 16,
                itemHeight: 80.0,
                underline: Container(
                  height: 2,
                  color: Color(0xff0f4c75),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    priceRange = newValue;
                  });
                },
                items: priceRanges
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: TextStyle(
                        fontSize: 22.0
                    ),),
                  );
                }).toList(),
              ),
            ),
            Center(
              child: Text(
                "Select Computer Type",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: DropdownButton<String>(
                value: computerType,
                isExpanded: true,
                icon: Icon(Icons.arrow_downward),
                iconSize: 30,
                elevation: 16,
                itemHeight: 80.0,
                underline: Container(
                  height: 2,
                  color: Color(0xff0f4c75),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    computerType = newValue;
                  });
                },
                items: computerTypes
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: TextStyle(
                        fontSize: 22.0
                    ),),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: CupertinoButton(
                  color: Color(0xff0f4c75),
                  child: Text("Search"),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (BuildContext context)=>FilterResults(
                          price: priceRange,
                          brand: brandName,
                        )
                      )
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
