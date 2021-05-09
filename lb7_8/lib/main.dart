import 'package:flutter/material.dart';
import 'package:lb7_8/pages/FileSystemPage.dart';
import 'package:lb7_8/pages/SQFLitePage.dart';
import 'package:lb7_8/pages/SharedPreferPage.dart';

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
          child: FileSystemPage()
        ),
      ],
    );
  }
}
