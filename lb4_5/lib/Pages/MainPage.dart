import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb4_5/Trip/Trip.dart';
import 'package:lb4_5/Trip/TripList.dart';

class MainPage extends StatelessWidget{

  Trip testTrip = new Trip();

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
                    tripCollection: testTrip.createDefaultCollection(),
                  ),
               ]
           ),
          ),
        ),
    );
  }
}