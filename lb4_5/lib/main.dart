import 'package:flutter/material.dart';
import 'Pages/MainPage.dart';
import 'Trip/TripElement.dart';

void main() {
  runApp(
      TripElement(
      name: "Some text",
      myColor: Colors.indigoAccent)
  );
}

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white10),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CustomWidget(),
        ),
      ),
    );
  }
}*/
