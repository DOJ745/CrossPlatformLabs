import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Trip.dart';

class TripInfoCard extends StatelessWidget {

  final Trip trip;

  const TripInfoCard(
      {
        Key key,
        this.trip
      } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.45),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 9),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 25),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Colors.deepOrangeAccent,
              image: DecorationImage(
                  image: AssetImage(trip.backgroundImageName),
                  fit: BoxFit.fitHeight
              ),
            ),
          ),
          Positioned(
            top: 225,
            left: 35,
            child: Image.asset(trip.seasonImage),
          ),
          Positioned(
            top: 325,
            left: 35,
            child:
            Text(
              trip.name,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 40,
                  color: trip.textColor,
                  fontFamily: 'Assistant',
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Positioned(
            top: 375,
            left: 35,
            child: Text(
              trip.seasonAndDuration,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Assistant',
              ),
            ),
          ),
        ],
      ),
    );
  }
}