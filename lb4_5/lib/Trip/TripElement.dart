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
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              color: Colors.amber,
              child: Image.asset(
                "images/cat.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            top: 85,
            left: 35,
            child: Image.asset("images/catapult.png"),
          ),
          Positioned(
            top: 145,
            left: 35,
            child:
            Text(
              name,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 40, color: myColor),
              textAlign: TextAlign.left,
            ),
          ),
          Positioned(
            top: 195,
            left: 35,
            child:
            Text(
              "Winter 2021 - 11 days",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Positioned(
              top: 200,
              right: 25,
              child:
              ClipOval(
                child:
                Container(
                    padding: EdgeInsets.all(8.0),
                    height: 60,
                    width: 60,
                    color: Colors.white,
                    child: ClipOval(
                      child: Image.asset("images/catapult.png"),
                  )
              ),)
          ),
        ],
      ),
    );
  }
}