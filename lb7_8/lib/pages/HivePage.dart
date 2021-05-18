import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'ContactPage.dart';

class HivePage extends StatefulWidget {
  @override
  _HiveState createState() => _HiveState();
}

class _HiveState extends State<HivePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hive Page',
        home: FutureBuilder(
            future: Hive.openBox('contacts',
                compactionStrategy: (int total, int deleted) {
                  return deleted > 20;
                }),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError)
                  return Text(snapshot.error.toString());
                else
                  return ContactPage();
              }
              else return Scaffold();
            }
        )
    );
  }

  @override
  void dispose() {
    Hive.box('contacts').compact();
    Hive.close();
    super.dispose();
  }
}