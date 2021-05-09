import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  TextEditingController outputController = TextEditingController();

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
                    intController: intController,
                    strController: strController,
                    doubleController: doubleController
                  ),
                  ElevatedButton(
                      child: Text("Set value", style: TextStyle(fontSize: 22)),
                      onPressed:() async {

                        if(intController.text != ""){
                          sfMethods.addIntToSF(keyController.text, int.parse(intController.text));
                          outputController.text = keyController.text + " ---- " + intController.text;
                        }
                        if(strController.text != ""){
                          sfMethods.addStringToSF(keyController.text, strController.text);
                          outputController.text = keyController.text + " ---- " + strController.text;
                        }
                        if(doubleController.text != ""){
                          sfMethods.addDoubleToSF(keyController.text, double.parse(doubleController.text));
                          outputController.text = keyController.text + " ---- " + doubleController.text;
                        }
                        else{
                        }
                      }
                  ),
                  ElevatedButton(
                    child: Text("Delete value", style: TextStyle(fontSize: 22)),
                    onPressed:() async {
                      if(keyController.text != ""){
                        sfMethods.removeValue(keyController.text).then((value) =>
                        outputController.text = "Value with key --" + keyController.text + "-- delete status - " +
                            value.toString()
                        );
                      }
                    },
                  ),
                  ElevatedButton(
                    child: Text("Check value", style: TextStyle(fontSize: 22)),
                    onPressed:() async {
                      if(keyController.text != ""){
                        sfMethods.checkValue(keyController.text).then((value) =>
                        outputController.text = "Value with key --" + keyController.text + "-- exists?\n" +
                            value.toString()
                        );
                      }
                    },
                  ),
                  Divider(
                    thickness: 4,
                  ),
                  TextField(
                      controller: outputController,
                      style: TextStyle(fontSize: 22, color: Colors.black),
                      enabled: false,
                      maxLines: 10,
                      minLines: 5
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }

}