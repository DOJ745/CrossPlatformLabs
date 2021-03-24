import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripElement extends StatelessWidget {

  final String name;
  final String seasonAndDuration;
  final Color myColor;

  const TripElement( {Key key,
    this.name,
    this.myColor,
    this.seasonAndDuration} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        color: Colors.amber,
        child: Image.asset(
            "images/cat.jpg",
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  /*Text(
  name,
  textDirection: TextDirection.ltr,
  style: TextStyle(fontSize: 24, color: myColor),
  textAlign: TextAlign.left,
  ),*/

/*
 Stack(
          children: <Widget>[
            Image.asset("images/catapult.png"),
            Text(
              name,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 24, color: myColor),
              textAlign: TextAlign.left,
            ),
            Text(
              name,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 24, color: myColor),
              textAlign: TextAlign.left,
            ),
            Image.asset("images/catapult.png"),
          ],
        ),
*/


}