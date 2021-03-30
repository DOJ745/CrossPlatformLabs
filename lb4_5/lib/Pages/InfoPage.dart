import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Trip/TripInfo.dart';

class InfoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: 500,
          child: TripInfo(
            name: "Luksemburg",
            seasonAndDuration: "Summer trip 2021 - 6 days",
            textColor: Colors.white,
            backgroundImageName: "images/Luksemburg.jpg",
            seasonImage: "images/icons/summer_icon.png",
            peopleImage: "images/catapult.png",
          ),
        ),
      ),
    );
  }
}