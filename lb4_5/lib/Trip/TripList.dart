import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TripElement.dart';

class TripList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: ListView(
        children: [
          TripElement(
              name: "Some text1",
              myColor: Colors.red),
          TripElement(
              name: "Some text2",
              myColor: Colors.red),
          TripElement(
              name: "Some text3",
              myColor: Colors.red),
        ],
      ),
    );
  }
}