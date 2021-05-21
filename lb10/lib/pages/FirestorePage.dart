import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb10/firebase/firestore/ReadTracks.dart';
import 'package:lb10/pages/fields/FirestoreFields.dart';

import '../firebase/firestore/AddTrack.dart';

class FirestorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyFirestorePage(title: 'LB10 (Firestore)'),
    );
  }
}

class MyFirestorePage extends StatefulWidget {

  MyFirestorePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyFirestorePageState createState() => _MyFirestorePageState();
}

class _MyFirestorePageState extends State<MyFirestorePage> {

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lengthInMinutesController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          visualDensity:VisualDensity.adaptivePlatformDensity
        ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {

              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[

                      Container(
                        height: 300,
                        child: ReadTracks(),
                      ),

                      FirestorageFields(
                        idController: idController,
                        nameController: nameController,
                        lengthInMinutesController: lengthInMinutesController,),

                      ElevatedButton(
                          child: Text("Delete Track", style: TextStyle(fontSize: 22)),
                          onPressed:() async {
                            CollectionReference tracks = FirebaseFirestore.instance.collection('tracks');
                            deleteTrack(tracks, idController.text);
                          }
                      ),

                      ElevatedButton(
                          child: Text("Update Track", style: TextStyle(fontSize: 22)),
                          onPressed:() async {
                            CollectionReference tracks = FirebaseFirestore.instance.collection('tracks');
                            updateTrack(tracks,
                                idController.text,
                                nameController.text,
                                lengthInMinutesController.text);
                          }
                      ),

                      Container(
                        height: 50,
                        child: AddTrack("3:15", "Test name"),
                      ),

                    ],
                  ),
                ),
              );
            }

            else if (snapshot.connectionState == ConnectionState.none) {
              return Text("No data");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<void> deleteTrack(CollectionReference tracks, String id) {
    return tracks
        .doc(id)
        .delete()
        .then((value) => print("Track Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> updateTrack(
      CollectionReference tracks,
      String id, String _name,
      String _lengthInMinutes) {
    return tracks
        .doc(id)
        .update({'name': _name, 'lengthInMinutes': _lengthInMinutes})
        .then((value) => print("Track Updated!"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection("tracks").doc().get();
  }
}