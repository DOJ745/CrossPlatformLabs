import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb4_5/Trip/TripElement.dart';
import 'package:lb4_5/Trip/TripList.dart';

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white10),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: TripList(),
        ),
      ),
    );
  }
}

/*
extension WidgetModifier on Widget {

  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(50)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  // Fill
  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }

  // Round borders
  Widget cornerRadius(BorderRadiusGeometry radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  // Alignment
  Widget align([AlignmentGeometry alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

}

class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello, World!', style: Theme.of(context).textTheme.headline4)
        .padding()
        .background(Colors.lightBlue)
        .cornerRadius(BorderRadius.all(Radius.circular(12)))
        .padding(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
        .background(Colors.purple);
  }
}*/