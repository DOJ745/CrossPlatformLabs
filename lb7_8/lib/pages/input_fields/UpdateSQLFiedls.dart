import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdateSQLFields extends StatelessWidget {

  final TextEditingController idController;
  final TextEditingController nameController;
  final TextEditingController lengthInMinutesController;

  const UpdateSQLFields(
      {
        this.idController,
        this.nameController,
        this.lengthInMinutesController,
        Key key,
      } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "ID",
          style: TextStyle(
              color: Colors.black,
              fontSize: 22
          ),
        ),
        TextFormField(
          controller: idController,
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
          controller: nameController,
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
          controller: lengthInMinutesController,
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
      ],
    );
  }
}