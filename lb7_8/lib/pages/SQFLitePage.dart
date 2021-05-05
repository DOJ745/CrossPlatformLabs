import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lb7_8/db/DBProvider.dart';
import 'package:lb7_8/model/DeepHouseTrack.dart';
import 'package:lb7_8/pages/input_fields/UpdateSQLFiedls.dart';

class SQFLitePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MySQLPage(title: 'LB7_8(SQL)'),
    );
  }
}

class MySQLPage extends StatefulWidget {

  final String title;

  MySQLPage({Key key, this.title}) : super(key: key);

  @override
  _SQLPageState createState() => _SQLPageState();
}

class _SQLPageState extends State<MySQLPage> {

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lengthInMinutesController = TextEditingController();

  DeepHouseTrack trackForUpdate;

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
              return Container(
                height: 800,
                width: 500,
                child:
                SingleChildScrollView(
                  child: Column(
                      children: <Widget>[
                        ListView.builder(
                          shrinkWrap: true,
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
                        Divider(
                          thickness: 2,
                        ),
                        UpdateSQLFields(
                          idController: idController,
                          nameController: nameController,
                          lengthInMinutesController: lengthInMinutesController,
                        ),
                        ElevatedButton(
                            child: Text("Update Track", style: TextStyle(fontSize: 22)),
                            onPressed:() async {

                              DBProvider.db.getTrack(int.parse(idController.text)).then((value) {
                                setState(() {this.trackForUpdate = value;});
                              });

                              this.trackForUpdate.name = nameController.text;
                              this.trackForUpdate.lengthInMinutes = lengthInMinutesController.text;
                              DBProvider.db.updateTrack(this.trackForUpdate);
                            }
                        ),
                      ]
                  ),
                ),
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
            DeepHouseTrack rnd = new DeepHouseTrack(
                id: random.nextInt(100), name: "test", lengthInMinutes: "3:00"
            );
            await DBProvider.db.newTrack(rnd);
          },
        ),
      ),
    );
  }
}