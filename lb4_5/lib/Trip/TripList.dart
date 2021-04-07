import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Trip.dart';
import 'TripElement.dart';

class TripList extends StatelessWidget {

  final List<Trip> tripCollection;

  const TripList(
      {
        Key key,
        this.tripCollection,
      } ) : super(key: key);

  ListView fillList(){
    return ListView.builder(
        itemCount: tripCollection.length,
        itemBuilder: (context, index) {
          return TripElement(
            trip: tripCollection.elementAt(index),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560,
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: fillList()
    );
  }
}