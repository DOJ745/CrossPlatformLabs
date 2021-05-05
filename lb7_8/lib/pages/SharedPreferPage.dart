import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lb7_8/pages/input_fields/SPFields.dart';
import 'package:lb7_8/shared_pref/SharedPreferencesMethods.dart';

class SharedPreferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MySFPage(title: 'LB7_8(SF)'),
    );
  }
}

class MySFPage extends StatefulWidget {

  final String title;

  MySFPage({Key key, this.title}) : super(key: key);

  @override
  _SFPageState createState() => _SFPageState();
}

class _SFPageState extends State<MySFPage> {

  SharedPreferencesMethods sfMethods = new SharedPreferencesMethods();

  TextEditingController keyController = TextEditingController();
  TextEditingController intController = TextEditingController();
  TextEditingController strController = TextEditingController();
  TextEditingController doubleController = TextEditingController();

  bool selectedBool;

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
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  SPFields(
                    keyController: keyController,
                  ),
                  DropdownButton<String>(
                    hint: Text("Select bool value"),
                    onChanged: (String value) {
                      setState(() {
                        if(value == "true")
                          selectedBool = true;
                        else
                          selectedBool = false;
                      });
                    },
                    items: <String>['true', 'false'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }

}