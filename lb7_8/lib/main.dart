import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lb7_8/model/DeepHouseTrack.dart';
import 'package:lb7_8/pages/SQFLitePage.dart';
import 'package:lb7_8/pages/SharedPreferPage.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:math';
import 'package:path/path.dart';

import 'db/DBProvider.dart';

void main() async {

  /*WidgetsFlutterBinding.ensureInitialized();

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
    version: 1, );*/

  //DBProvider.db.initDB();
  runApp(SQFTest());
}

class SQFTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Hash',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'LB7_8'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _SQLPageState createState() => _SQLPageState();
}

class _SQLPageState extends State<MyHomePage> {

  List<DeepHouseTrack> testTracks = [
    DeepHouseTrack(id: 1, name: "Blow up", lengthInMinutes: "3:15"),
    DeepHouseTrack(id: 2, name: "New one", lengthInMinutes: "2:59"),
    DeepHouseTrack(id: 3, name: "Monke again", lengthInMinutes: "3:13"),
    DeepHouseTrack(id: 4, name: "1,2,3,4,5", lengthInMinutes: "4:06"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text(widget.title)
        ),
        body: FutureBuilder<List<DeepHouseTrack>>(
          future: DBProvider.db.getAllTracks(),
          builder: (BuildContext context, AsyncSnapshot<List<DeepHouseTrack>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      DeepHouseTrack item = snapshot.data[index];
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(color: Colors.red),
                        onDismissed: (direction) {
                          DBProvider.db.deleteTrack(item.id);
                        },
                        child: ListTile(
                          title: Text("Track Name: " + item.name),
                          subtitle: Text(item.lengthInMinutes),
                          leading: Text("ID: " + item.id.toString()),
                        ),
                      );
                    },
                  ),
                  Text(
                    "ID",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22
                    ),
                  ),
                  /*TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("\\d")),
                    ],
                    validator: (value) {
                      if(value.isEmpty){
                        return "Enter the id!";
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: "Numbers like 1, 2, 3...",
                        labelText: "Enter id"
                    ),
                  ),
                  Text(
                    "Name of track",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22
                    ),
                  ),
                  TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[\\w]")),
                    ],
                    validator: (value) {
                      if(value.isEmpty){
                        return "Enter the name of track!";
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    maxLength: 50,
                    decoration: InputDecoration(
                        hintText: "Any character symbol",
                        labelText: "Enter name"
                    ),
                  ),
                  Text(
                    "Length in minutes",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22
                    ),
                  ),
                  TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[\\d{1,3}:{1}\\d{2}]")),
                    ],
                    validator: (value) {
                      if(value.isEmpty){
                        return "Enter the length!";
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    maxLength: 6,
                    decoration: InputDecoration(
                        hintText: "Use standard like 'minutes:seconds'",
                        labelText: "Enter length (minutes:seconds)"
                    ),
                  ),
                  ElevatedButton(
                      child: Text("Insert Track", style: TextStyle(fontSize: 22)),
                      onPressed:() {

                      }
                  ),*/
                ]
              );ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  DeepHouseTrack item = snapshot.data[index];
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(color: Colors.red),
                    onDismissed: (direction) {
                      DBProvider.db.deleteTrack(item.id);
                    },
                    child: ListTile(
                      title: Text("Track Name: " + item.name),
                      subtitle: Text(item.lengthInMinutes),
                      leading: Text("ID: " + item.id.toString()),
                    ),
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
            var random = new Random();
            DeepHouseTrack rnd = new DeepHouseTrack(id: random.nextInt(100), name:
            "test", lengthInMinutes: "3:00");
            await DBProvider.db.newTrack(rnd);
          },
        ),
      ),
    );
  }
}

/*
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
                    subtitle: Text(item.lengthInMinutes),
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
            DeepHouseTrack rnd = new DeepHouseTrack(id: 1, name:
                "test", lengthInMinutes: "3:00");
            await DBProvider.db.newTrack(rnd);
          },
        ),
      ),
    );
  }
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
}*/
