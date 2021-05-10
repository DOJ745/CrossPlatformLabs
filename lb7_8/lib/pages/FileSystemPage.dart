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

  String _counterDef = "1D";
  String _counterCache = "1C";
  String _counterExternal = "1E";

  String cachePath;
  String externalPath;

  TextEditingController outputController = TextEditingController();

  @override
  void initState() {

    super.initState();

    widget.storage.writeDefCounter(_counterDef);
    widget.storage.writeCacheCounter(_counterCache);
    widget.storage.writeExternalCounter(_counterExternal);

    widget.storage.readDefCounter().then((String value) {
      setState(() { _counterDef = value; });
    });

    widget.storage.readCacheCounter().then((String value) {
      setState(() { _counterCache = value;} );
    });

    widget.storage.readExternalCounter().then((String value) {
      setState(() { _counterExternal = value;} );
    });
  }

  Future<File> _incrementDefCounter() {
    setState(() {
      _counterDef += "_1";
      outputController.text = _counterDef;
    });
    return widget.storage.writeDefCounter(_counterDef);
  }

  Future<File> _incrementCacheCounter() {
    setState(() {
      _counterCache += "_1c";
      outputController.text = _counterCache;
    });
    return widget.storage.writeCacheCounter(_counterCache);
  }

  Future<File> _incrementExternalCounter() {
    setState(() {
      _counterExternal += "_1e";
      outputController.text = _counterExternal;
    });
    return widget.storage.writeExternalCounter(_counterExternal);
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
          body: Container(
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  child: Text("Counter default", style: TextStyle(fontSize: 22)),
                  onPressed: _incrementDefCounter,
                ),
                ElevatedButton(
                  child: Text("Counter cache", style: TextStyle(fontSize: 22)),
                  onPressed: _incrementCacheCounter,/*() async {
                    widget.storage.readCacheCounter().then((String value) => _counterCache = value);
                    _counterCache += "_1c";
                    outputController.text = _counterCache;
                  }*/
                ),
                ElevatedButton(
                  child: Text("Counter external", style: TextStyle(fontSize: 22)),
                  onPressed: _incrementExternalCounter,
                ),
                Divider(
                  thickness: 4,
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
                      widget.storage.getCachePath().then((value) {
                        cachePath = value.toString();
                        outputController.text = "Current cache path - " + cachePath + "\n";
                      });
                    },
                ),
                ElevatedButton(
                  child: Text("Get external file path", style: TextStyle(fontSize: 22)),
                  onPressed: () async {
                    widget.storage.getExternalPath().then((value) {
                      externalPath = value.toString();
                      outputController.text = "Current external path - " + externalPath + "\n";
                    });
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