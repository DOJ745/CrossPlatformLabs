import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripElement extends StatelessWidget {

  final String name;
  final String seasonAndDuration;
  final Color textColor;
  final String backgroundImageName;
  final String seasonImage;
  final String peopleImage;

  const TripElement( {Key key,
    this.name,
    this.textColor,
    this.seasonAndDuration,
    this.backgroundImageName,
    this.seasonImage,
    this.peopleImage } ) : super(key: key);

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
              width: 500,
              height: 255,
              color: Colors.amber,
              child: Image.asset(backgroundImageName,
                fit: BoxFit.fitWidth,
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
          Positioned(
              top: 180,
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
                      child: Image.asset(peopleImage),
                    ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}