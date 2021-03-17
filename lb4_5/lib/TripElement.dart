import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripElement extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      color: Colors.green,
      child: Text(
        "Trip element test",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 24, color: Colors.indigoAccent),
        textAlign: TextAlign.center,
      ),
    );
  }

}