import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TripElement.dart';

class TripList extends StatelessWidget {

  final List<String> names;
  final List<String> seasonsAndDurations;
  final List<Color> textColors;
  final List<String> backgroundImagesNames;
  final List<String> seasonsImages;
  final List< List<String> > peoplesImages;

  const TripList(
      {
        Key key,
        this.names,
        this.seasonsAndDurations,
        this.textColors,
        this.backgroundImagesNames,
        this.seasonsImages,
        this.peoplesImages,
      } ) : super(key: key);

  ListView fillList(int elementAmount){
    return ListView.builder(
        itemCount: elementAmount,
        itemBuilder: (context, index){
          return TripElement(
            name: names.elementAt(index),
            seasonAndDuration: seasonsAndDurations.elementAt(index),
            textColor: textColors.elementAt(index),
            backgroundImageName: backgroundImagesNames.elementAt(index),
            seasonImage: seasonsAndDurations.elementAt(index),
            peopleImages: peoplesImages.elementAt(index),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560,
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: /*ListView(
        children: <Widget>[
          TripElement(
            name: "Luksemburg",
            seasonAndDuration: "Summer 2021 - 6 days",
            textColor: Colors.white,
            backgroundImageName: "images/Luksemburg.jpg",
            seasonImage: "images/icons/summer_icon.png",
            peopleImages: ["images/peoples/girl2.jpg", "images/peoples/man2.jpg"],
          ),
          TripElement(
            name: "London",
            seasonAndDuration: "Autumn 2020 - 12 days",
            textColor: Colors.white,
            backgroundImageName: "images/London.jpg",
            seasonImage: "images/icons/autumn_icon.png",
            peopleImages: ["images/peoples/girl1.jpg"],
          ),
          TripElement(
            name: "Scotland",
            seasonAndDuration: "Winter 2019 - 10 days",
            textColor: Colors.white,
            backgroundImageName: "images/Scotland.jpg",
            seasonImage: "images/icons/winter_icon.png",
            peopleImages: ["images/peoples/man3.jpg"],
          ),
          TripElement(
            name: "Redwood",
            seasonAndDuration: "Spring 2020 - 3 days",
            textColor: Colors.white,
            backgroundImageName: "images/Redwood.jpg",
            seasonImage: "images/icons/spring_icon.png",
            peopleImages: ["images/peoples/man1.jpg"],
          )
        ],
      ),*/
    );
  }
}