import 'dart:ui';

import 'package:flutter/material.dart';

class Trip {
  final String slogan;
  final String description;
  final String name;
  final String seasonAndDuration;
  final Color textColor = Colors.white;
  final String backgroundImageName;
  final String seasonImage;
  final List<String> peopleImages;

  const Trip(
      {
        this.slogan,
        this.description,
        this.name,
        this.seasonAndDuration,
        this.backgroundImageName,
        this.seasonImage,
        this.peopleImages
      }
  );

  List<Trip> createDefaultCollection(){
    List<Trip> defCollection = <Trip>[
      Trip(
        slogan: "Luksemburg - good place to take new friends with you",
        description: "A perfect place to spend "
            "your summer in county of castles and jokes about "
            "who is actually german here.",
        name: "Luksemburg",
        seasonAndDuration: "Summer 2021 - 6 days",
        backgroundImageName: "images/Luksemburg.jpg",
        seasonImage: "images/icons/summer_icon.png",
        peopleImages: ["images/peoples/girl2.jpg", "images/peoples/man2.jpg"]
      ),
      Trip(
          slogan: "London is the capital of Great Britian",
          description: "A perfect place to spend "
              "your summer in county of castles and jokes about "
              "who is actually german here.",
          name: "London",
          seasonAndDuration: "Autumn 2020 - 12 days",
          backgroundImageName: "images/London.jpg",
          seasonImage: "images/icons/autumn_icon.png",
          peopleImages: ["images/peoples/girl1.jpg"]
      ),
      Trip(
          slogan: "SCOTLAND FOREVAAAR!!!",
          description: "A perfect place to spend "
              "your summer in county of castles and jokes about "
              "who is actually german here.",
          name: "Scotland",
          seasonAndDuration: "Winter 2019 - 10 days",
          backgroundImageName: "images/Scotland.jpg",
          seasonImage: "images/icons/winter_icon.png",
          peopleImages: ["images/peoples/man3.jpg"]
      ),
      Trip(
          slogan: "Wood here is red, and I don't know why",
          description: "A perfect place to spend "
              "your summer in county of castles and jokes about "
              "who is actually german here.",
          name: "Redwood",
          seasonAndDuration: "Spring 2020 - 3 days",
          backgroundImageName: "images/Redwood.jpg",
          seasonImage: "images/icons/spring_icon.png",
          peopleImages: ["images/peoples/man1.jpg"]
      )
    ];
    return defCollection;
  }
}