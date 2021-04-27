import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lb7_8/model/DeepHouseTrack.dart';

class SQFLitePage extends StatelessWidget {

  final DeepHouseTrack track;
  final _queryResultController = TextEditingController();

  SQFLitePage(
      {
        Key key,
        this.track,
      } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "ID",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22
          ),
        ),
        TextFormField(
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
        ),
        ElevatedButton(
            child: Text("Update Track", style: TextStyle(fontSize: 22)),
            onPressed:() {

            }
        ),
        ElevatedButton(
            child: Text("Delete Track", style: TextStyle(fontSize: 22)),
            onPressed:() {

            }
        ),
        TextField(
          controller: _queryResultController,
          style: TextStyle(fontSize: 22),
          enabled: false,
          maxLines: 6,
          decoration: InputDecoration(
            hintText: 'Query result',
          ),
        ),
      ],
    );
  }

}