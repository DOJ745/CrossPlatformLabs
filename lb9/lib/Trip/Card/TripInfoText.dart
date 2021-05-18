import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Trip.dart';

class TripInfoText extends StatelessWidget {

  final Trip trip;

  const TripInfoText(
      {
        Key key,
        this.trip
      } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            trip.slogan,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Assistant'
            ),
          ),
          Text(
            trip.description,
            style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontFamily: 'Assistant'
            ),
          )
        ],
      ),
    );
  }
}