import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb4_5/Trip/TripInfoText.dart';
import '../Trip/TripInfoPicture.dart';

class InfoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              TripInfoPicture(
                name: "Luksemburg",
                seasonAndDuration: "Summer 2021 - 6 days",
                textColor: Colors.white,
                backgroundImageName: "images/Luksemburg.jpg",
                seasonImage: "images/icons/summer_icon.png",
                peopleImage: "images/catapult.png",
              ),
              TripInfoText(
                slogan: "Luksemburg - good place to take new friends with you",
                description: "some description",
              )
            ],
          )
        ),
      ),
    );
  }
}