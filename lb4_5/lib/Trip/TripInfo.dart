import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TripInfo extends StatelessWidget {

  final String name;
  final String seasonAndDuration;
  final Color textColor;
  final String backgroundImageName;
  final String seasonImage;
  final String peopleImage;

  const TripInfo( {Key key,
    this.name,
    this.textColor,
    this.seasonAndDuration,
    this.backgroundImageName,
    this.seasonImage,
    this.peopleImage } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.45),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 5),
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
                  image: AssetImage(backgroundImageName),
                  fit: BoxFit.fitHeight
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 35,
            child: Image.asset(seasonImage),
          ),
          Positioned(
            top: 145,
            left: 35,
            child:
            Text(
              name,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 40,
                  color: textColor,
                  fontFamily: 'Assistant',
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Positioned(
            top: 195,
            left: 35,
            child:
            Text(
              seasonAndDuration,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 20, color:
              Colors.white,
                  fontFamily: 'Assistant'),
            ),
          ),
        ],
      ),
    );
  }
}