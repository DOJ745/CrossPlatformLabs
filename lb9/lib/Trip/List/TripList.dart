import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb9/Trip/Element/TripElement.dart';

import '../Trip.dart';

class TripList extends StatelessWidget {

  final List<Trip> tripCollection;

  const TripList(
      {
        Key key,
        this.tripCollection,
      } ) : super(key: key);

  ListView fillList(){
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return TripElementNew();
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