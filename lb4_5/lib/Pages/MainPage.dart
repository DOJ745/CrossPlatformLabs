import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white10),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CustomWidget(),
        ),
      ),
    );
  }
}

extension WidgetModifier on Widget {

  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(50)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  Widget background(Color color) { // Fill
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }

  Widget cornerRadius(BorderRadiusGeometry radius) { // Round borders
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  Widget align([AlignmentGeometry alignment = Alignment.center]) { // Aligment
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
}