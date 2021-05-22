import 'package:flutter/material.dart';
import 'package:lb10/pages/FirestorePage.dart';
import 'package:lb10/pages/MessagingPage.dart';
import 'package:lb10/pages/auth_pages/AuthPage.dart';

import 'package:overlay_support/overlay_support.dart';

// https://blog.logrocket.com/flutter-push-notifications-with-firebase-cloud-messaging/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: PageViewerWidget(),
        ),
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
            child: FirestorePage()
        ),

        Center(
            child: AuthPage()
        ),

        Center(
            child: MessagingPage()
        ),
      ],
    );
  }
}