import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb4_5/Trip/TripList.dart';

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 65, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "My trips",
                          style: TextStyle(
                            fontSize: 42,
                            fontFamily: 'Assistant',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 105),
                          child: Icon(
                            Icons.dehaze_outlined,
                            color: Colors.black,
                            size: 45,
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          child: Image.asset(
                            "images/icons/earth.png",
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                  TripList(
                    itemCount: 4,
                    names: ["Luksemburg", "London", "Scotland", "Redwood"],
                    seasonsAndDurations: [
                      "Summer 2021 - 6 days",
                      "Autumn 2020 - 12 days",
                      "Winter 2019 - 10 days",
                      "Spring 2020 - 3 days"
                    ],
                    textColors: [Colors.white, Colors.white, Colors.white, Colors.white],
                    backgroundImagesNames: [
                      "images/Luksemburg.jpg",
                      "images/London.jpg",
                      "images/Scotland.jpg",
                      "images/Redwood.jpg"
                    ],
                    seasonsImages: [
                      "images/icons/summer_icon.png",
                      "images/icons/autumn_icon.png",
                      "images/icons/winter_icon.png",
                      "images/icons/spring_icon.png"
                    ],
                    peoplesImages: [
                      ["images/peoples/girl2.jpg", "images/peoples/man2.jpg"],
                      ["images/peoples/girl1.jpg"],
                      ["images/peoples/man3.jpg"],
                      ["images/peoples/man1.jpg"]
                    ],
                  ),
               ]
           ),
          ),
        ),
    );
  }
}