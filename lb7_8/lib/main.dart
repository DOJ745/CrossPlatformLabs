import 'package:flutter/material.dart';
import 'package:lb7_8/pages/SQFLitePage.dart';
import 'package:lb7_8/pages/SharedPreferPage.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tracks(id INTEGER PRIMARY KEY, name TEXT, lengthInMinutes TEXT)",
        );
        },
    version: 1, );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
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
        /*Center(
            child: SharedPreferPage()
        ),*/
      ],
    );
  }
}
