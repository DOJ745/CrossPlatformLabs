import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb4_5/Trip/Card/TripInfoText.dart';
import 'package:lb4_5/Trip/Trip.dart';
import '../Trip/Card/TripInfoCard.dart';

class InfoPage extends StatelessWidget{

  Trip testTrip = new Trip();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              TripInfoCard(
                trip: Trip.createDefaultCollection().elementAt(0),
              ),
              TripInfoText(
                trip: Trip.createDefaultCollection().elementAt(0),
              )
            ],
          )
        ),
      ),
    );
  }
}