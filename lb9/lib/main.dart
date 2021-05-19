import 'package:flutter/material.dart';
import 'package:lb9/BLoC/TripBloc.dart';
import 'BLoC/BlocProvider.dart';
import 'Pages/InfoPage.dart';
import 'Pages/MainPage.dart';

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
        body: PageViewer(),//PageViewerWidget(),
      ),
    );
  }
}

class PageViewer extends StatefulWidget {

  PageViewer({Key key}) : super(key: key);

  @override
  _PageViewerState createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {

  @override
  Widget build(BuildContext context) {

    // создаем Bloc и экран для него
    final TripBloc bloc = TripBloc();
    final PageController controller = PageController(initialPage: 0);

    return BlocProvider(
      child:
      PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Center(
              child: MainPage()
          ),
          Center(
              child: InfoPage()
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
      ),
      bloc: bloc,
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
            child: MainPage()
        ),
        Center(
            child: InfoPage()
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