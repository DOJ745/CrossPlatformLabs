import 'package:flutter/material.dart';
import 'package:lb7_8/model/DeepHouseTrack.dart';
import 'package:lb7_8/pages/SQFLitePage.dart';
import 'package:lb7_8/pages/SharedPreferPage.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:math';
import 'package:path/path.dart';

import 'db/Database.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE Tracks("
              "id INTEGER PRIMARY KEY, "
              "name TEXT, "
              "lengthInMinutes TEXT)",
        );
        },
    version: 1, );

  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  List<DeepHouseTrack> testTracks = [
    DeepHouseTrack(id: 1, name: "Blow up", lengthInMinutes: "3:15"),
    DeepHouseTrack(id: 2, name: "New one", lengthInMinutes: "2:59"),
    DeepHouseTrack(id: 3, name: "Monke again", lengthInMinutes: "3:13"),
    DeepHouseTrack(id: 4, name: "1,2,3,4,5", lengthInMinutes: "4:06"),
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text("LB7_8")
        ),
        body: FutureBuilder<List<DeepHouseTrack>>(
          future: DBProvider.db.getAllTracks(),
          builder: (BuildContext context, AsyncSnapshot<List<DeepHouseTrack>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  DeepHouseTrack item = snapshot.data[index];
                  return ListTile(
                    title: Text(item.name),
                    leading: Text(item.id.toString()),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            DeepHouseTrack rnd = testTracks[Random().nextInt(testTracks.length)];
            await DBProvider.db.newTrack(rnd);
          },
        ),
      ),
    );
  }
}
/*
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
}*/
