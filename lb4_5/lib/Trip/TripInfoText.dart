import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TripInfoText extends StatelessWidget {
  final String slogan;
  final String description;

  const TripInfoText(
      {
        Key key,
        this.slogan,
        this.description,
      } ) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            slogan,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Assistant'
            ),
          ),
          Text(
            description,
            style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontFamily: 'Assistant'
            ),
          )
        ],
      ),
    );
  }
}