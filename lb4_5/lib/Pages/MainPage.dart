import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb4_5/Trip/TripList.dart';

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: TripList(),
        ),
      ),
    );
  }
}