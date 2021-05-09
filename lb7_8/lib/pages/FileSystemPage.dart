import 'dart:io';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb7_8/file_operations/FileMethods.dart';

class FileSystemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyFileSysPage(title: 'LB7_8(File System)', storage: FileMethods()),
    );
  }
}

class MyFileSysPage extends StatefulWidget {

  final String title;
  final FileMethods storage;

  MyFileSysPage(
      {
        Key key,
        this.title,
        this.storage
      }) : super(key: key);

  @override
  _FileSysPageState createState() => _FileSysPageState();
}

class _FileSysPageState extends State<MyFileSysPage> {

  int _counter;
  TextEditingController outputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState( () {_counter = value;} );
    });
  }

  Future<File> _incrementCounter() {
    setState(() {_counter++;});
    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text(widget.title)),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
                    style: TextStyle(fontSize: 22, color: Colors.black)
                ),
                ElevatedButton(
                  child: Text("Get default file path", style: TextStyle(fontSize: 22)),
                  onPressed:() async {
                      widget.storage.getDefaultPath().then((value) =>
                      outputController.text = "Current app path - " + value.toString() + "\n"
                      );
                  },
                ),
                ElevatedButton(
                    child: Text("Get cache file path", style: TextStyle(fontSize: 22)),
                    onPressed: () async {
                      widget.storage.getCachePath().then((value) =>
                      outputController.text = "Current cache path - " + value.toString() + "\n");
                    },
                ),
                ElevatedButton(
                  child: Text("Get external file path", style: TextStyle(fontSize: 22)),
                  onPressed: () async {
                    widget.storage.getExternalPath().then((value) =>
                    outputController.text = "Current external path - " + value.toString() + "\n");
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
        )
    );
  }
}