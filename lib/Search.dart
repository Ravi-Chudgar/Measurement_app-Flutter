import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:measurement_app/databasehelper.dart';

import 'package:measurement_app/detailes.dart';
import 'package:measurement_app/main.dart';

class Search extends StatefulWidget {
  _searchState createState() => _searchState();
}

class _searchState extends State<Search> {
  final dbhelper = Databasehelper.instance;
  final name = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getData() async {
    var dat = await dbhelper.getCustomer(name.text.toLowerCase());
    if (dat.length == 1) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => detailes(
                    name: name.text,
                  )),
          (route) => false);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "NAME ALERT ",
                style: TextStyle(fontSize: 30.0, color: Colors.yellow),
              ),
              content: Text(
                "NO DATA WITH  NAME ${name.text}",
                style: TextStyle(fontSize: 40.0),
              ),
              actions: [
                FlatButton(
                  onPressed: () {
                    print("clicked ");

                    Navigator.pop(context);
                  },
                  child: Text("RETRY "),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Container(
                child: Column(
                  children: [
                    Form(
                        child: Container(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25),
                                ),
                                labelText: "ENTER NAME"),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            height: 60.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.blueAccent,
                              color: Colors.blue,
                              elevation: 10.0,
                              child: GestureDetector(
                                onTap: () async {
                                  getData();
                                  print("CLICK");
                                },
                                child: Text(
                                  "SEARCH",
                                  style: TextStyle(
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 80.0, 10.0, 0.0),
                      // color: Colors.blueGrey,
                      // height: 20.0,
                      child: Material(
                        elevation: 10.0,
                        color: Colors.blue,
                        shadowColor: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homepage()),
                                (route) => false);
                          },
                          child: Icon(
                            Icons.home,
                            size: 90.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
