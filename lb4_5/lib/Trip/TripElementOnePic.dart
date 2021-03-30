import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripElementOnePic extends StatelessWidget {

  final String name;
  final String seasonAndDuration;
  final Color textColor;
  final String backgroundImageName;
  final String seasonImage;
  final String peopleImageOne;
  final String peopleImageTwo;

  const TripElementOnePic(
      {
        Key key,
        this.name,
        this.textColor,
        this.seasonAndDuration,
        this.backgroundImageName,
        this.seasonImage,
        this.peopleImageOne,
        this.peopleImageTwo,
      } ) : super(key: key);

  /*const TripElement.twoPictures(
      {
        Key key,
        this.name,
        this.textColor,
        this.seasonAndDuration,
        this.backgroundImageName,
        this.seasonImage,
        this.peopleImageOne,
        this.peopleImageTwo,
      } ) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.45),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 8),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 25),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          Container(
            width: 500,
            height: 255,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(backgroundImageName,
                fit: BoxFit.fill,
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
              style: TextStyle(
                  fontSize: 40,
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
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Assistant'),
            ),
          ),
          Positioned(
            top: 180,
            right: 25,
            child:
            Container(
              padding: EdgeInsets.all(3.0),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.black,
                    width: 3.0,
                    style: BorderStyle.solid
                ),
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    peopleImageOne,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}