import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lb7_8/model/DeepHouseTrack.dart';
import 'package:lb7_8/pages/SQFLitePage.dart';
import 'package:lb7_8/pages/SharedPreferPage.dart';

import 'dart:math';

import 'db/DBProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageViewerWidget(),
      ),
    );
  }
}

class PageViewerWidget extends StatelessWidget {

  const PageViewerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[
        Center(
            child: SQFLitePage()
        ),
        Center(
            child: SharedPreferPage()
        ),
        Center(
          child:
          Text(
            "Page view element",
            style: TextStyle(
                color: Colors.black
            ),
          ),
        ),
      ],
    );
  }
}
