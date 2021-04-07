import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb4_5/Trip/Trip.dart';
import 'package:lb4_5/Trip/TripInfoText.dart';
import '../Trip/TripInfoCard.dart';

class TripInfoSummary extends StatelessWidget{

  final Trip trip;

  const TripInfoSummary(
      {
        Key key,
        this.trip,
      } ) : super(key: key);

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
                  trip: trip
                ),
                TripInfoText(
                  trip: trip
                )
              ],
            )
        ),
      ),
    );
  }
}