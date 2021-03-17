import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TripElement.dart';

class TripList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TripElement(
            name: "Some text",
            myColor: Colors.indigoAccent),
        TripElement(
            name: "Some text",
            myColor: Colors.indigoAccent),
        TripElement(
            name: "Some text",
            myColor: Colors.indigoAccent),
      ],
    );
  }
}