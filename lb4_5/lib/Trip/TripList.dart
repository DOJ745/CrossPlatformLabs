import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TripElement.dart';

class TripList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560,
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: ListView(
        children: [
          TripElement(
            name: "Luksemburg",
            seasonAndDuration: "Summer 2021 - 6 days",
            textColor: Colors.white,
            backgroundImageName: "images/Luksemburg.jpg",
            seasonImage: "images/icons/summer_icon.png",
            peopleImage: "images/catapult.png",
          ),
          TripElement(
            name: "London",
            seasonAndDuration: "Autumn 2020 - 12 days",
            textColor: Colors.white,
            backgroundImageName: "images/London.jpg",
            seasonImage: "images/icons/autumn_icon.png",
            peopleImage: "images/catapult.png",
          ),
          TripElement(
            name: "Scotland",
            seasonAndDuration: "Winter 2019 - 10 days",
            textColor: Colors.white,
            backgroundImageName: "images/Scotland.jpg",
            seasonImage: "images/icons/winter_icon.png",
            peopleImage: "images/catapult.png",
          ),
          TripElement(
            name: "Redwood",
            seasonAndDuration: "Spring 2020 - 3 days",
            textColor: Colors.white,
            backgroundImageName: "images/Redwood.jpg",
            seasonImage: "images/icons/spring_icon.png",
            peopleImage: "images/catapult.png",
          )
        ],
      ),
    );
  }
}