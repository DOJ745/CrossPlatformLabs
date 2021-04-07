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
  final int itemCount;

  const TripList(
      {
        Key key,
        this.names,
        this.seasonsAndDurations,
        this.textColors,
        this.backgroundImagesNames,
        this.seasonsImages,
        this.peoplesImages,
        this.itemCount
      } ) : super(key: key);

  ListView fillList(int elementAmount){
    return ListView.builder(
        itemCount: elementAmount,
        itemBuilder: (context, index) {
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
      child: fillList(itemCount)
    );
  }
}