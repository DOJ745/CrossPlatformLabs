import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTrack extends StatelessWidget {

  final String lengthInMinutes;
  final String name;

  AddTrack(this.lengthInMinutes, this.name);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    //Firebase.initializeApp();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tracks = firestore.collection('tracks');

    Future<void> addTrack() {
      // Call the user's CollectionReference to add a new user
      return tracks
          .add({
        'lengthInMinutes': lengthInMinutes,
        'name': name
      })
          .then((value) => print("Track has been  added!"))
          .catchError((error) => print("Failed to add track: $error"));
    }

    return TextButton(
      onPressed: addTrack,
      child: Text("Add Track",),
    );
  }
}
