import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReadTracks extends StatefulWidget {
  @override
  _ReadTracksState createState() => _ReadTracksState();
}

class _ReadTracksState extends State<ReadTracks> {

  final Stream<QuerySnapshot> _tracksStream = FirebaseFirestore.instance.collection('tracks').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _tracksStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return ListTile(
              title: Text((document.data() as Map<String, dynamic>)['name']),
              subtitle: Text((document.data() as Map<String, dynamic>)['lengthInMinutes']),
            );
          }).toList(),
        );
      },
    );
  }
}