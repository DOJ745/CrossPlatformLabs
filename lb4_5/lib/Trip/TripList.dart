import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TripElementOnePic.dart';
import 'TripElementTwoPic.dart';

class TripList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560,
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: ListView(
        children: [
          TripElementOnePic(
            name: "Luksemburg",
            seasonAndDuration: "Summer 2021 - 6 days",
            textColor: Colors.white,
            backgroundImageName: "images/Luksemburg.jpg",
            seasonImage: "images/icons/summer_icon.png",
            peopleImageOne: "images/peoples/girl1.jpg",
          ),
          TripElementTwoPic(
            name: "London",
            seasonAndDuration: "Autumn 2020 - 12 days",
            textColor: Colors.white,
            backgroundImageName: "images/London.jpg",
            seasonImage: "images/icons/autumn_icon.png",
            peopleImageOne: "images/peoples/girl2.jpg",
            peopleImageTwo: "images/peoples/man2.jpg",
          ),
          TripElementOnePic(
            name: "Scotland",
            seasonAndDuration: "Winter 2019 - 10 days",
            textColor: Colors.white,
            backgroundImageName: "images/Scotland.jpg",
            seasonImage: "images/icons/winter_icon.png",
            peopleImageOne: "images/peoples/man3.jpg",
          ),
          TripElementOnePic(
            name: "Redwood",
            seasonAndDuration: "Spring 2020 - 3 days",
            textColor: Colors.white,
            backgroundImageName: "images/Redwood.jpg",
            seasonImage: "images/icons/spring_icon.png",
            peopleImageOne: "images/peoples/man1.jpg",
          )
        ],
      ),
    );
  }
}