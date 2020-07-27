import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:measurement_app/addDetailes.dart';

import 'package:measurement_app/Search.dart';
import 'package:measurement_app/databasehelper.dart';

import 'package:path_provider/path_provider.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // Directory doc = await getApplicationDocumentsDirectory();
  // Hive.init(doc.path);
  // await Hive.openBox<String>('measurement');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),
    );
  }
}

// ignore: camel_case_types
class homepage extends StatefulWidget {
  _homepageState createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  final dbhelper = Databasehelper.instance;

  @override
  void initState() {
    super.initState();
  }

  _getr() async {
    var data = await dbhelper.getK();
    for (int i = 0; i < data.length; i++) {
      print(data[i]);
    }
  }

  @override
  Widget build(BuildContext zcontext) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: new Container(
                padding: EdgeInsets.fromLTRB(80.0, 80.0, 45.0, 0.0),
                child: Column(
                  children: [
                    Material(
                      elevation: 10.0,
                      color: Colors.blue,
                      shadowColor: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                        onTap: () {
                          // _getr();
                          // getData();
                          // getData1();
                          // DeleteData();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddDetailes()));
                        },
                        child: Icon(
                          Icons.add_circle_outline,
                          size: 90,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Expanded(
                      child: Container(
                        // padding: EdgeInsets.all(4.0),
                        child: Text(
                          "NEW CUSTOMER",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: new Container(
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                child: Column(
                  children: [
                    Material(
                      elevation: 10.0,
                      color: Colors.blue,
                      shadowColor: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Search()),
                              (route) => false);
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Icon(
                                Icons.search,
                                size: 90.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Expanded(
                      child: Text(
                        "SEARCH",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
