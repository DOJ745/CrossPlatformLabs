import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SPFields extends StatelessWidget {

  final TextEditingController keyController;
  final TextEditingController intController;
  final TextEditingController strController;
  final TextEditingController doubleController;

  const SPFields(
      {
        Key key,
        this.keyController,
        this.intController,
        this.strController,
        this.doubleController,
      } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Text(
            "Key",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22
            ),
          ),
          TextFormField(
            controller: keyController,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp("\\w")),
            ],
            validator: (value) {
              if(value.isEmpty){
                return "Enter the key!";
              }
              return null;
            },
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
            maxLines: 1,
            decoration: InputDecoration(
                hintText: "Input any string",
                labelText: "Enter key"
            ),
          ),

          Text(
            "String value",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22
            ),
          ),

          Text(
            "Int value",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22
            ),
          ),

          Text(
            "Double value",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22
            ),
          ),

          Text(
            "Bool value",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22
            ),
          ),
        ]
    );
  }
}