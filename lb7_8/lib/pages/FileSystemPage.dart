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
      home: MyFileSysPage(title: 'LB7_8(File System)'),
    );
  }
}

class MyFileSysPage extends StatefulWidget {

  final String title;
  //final FileMethods storage;

  MyFileSysPage(
      {
        Key key,
        this.title,
        //this.storage
      }) : super(key: key);

  @override
  _FileSysPageState createState() => _FileSysPageState();
}

class _FileSysPageState extends State<MyFileSysPage> {

  FileMethods storage = new FileMethods();

  String _counterDef = "1D";
  String _counterCache = "1C";
  String _counterExternal = "1E";

  String defaultPath;
  String cachePath;
  String externalPath;


  TextEditingController outputController = TextEditingController();

  @override
  Future<void> initState() {

    super.initState();

    storage.writeDefCounter(_counterDef);
    storage.writeCacheCounter(_counterCache);
    storage.writeExternalCounter(_counterExternal);

    storage.readDefCounter().then((String value) {
      setState(() { _counterDef = value; });
    });

    storage.readCacheCounter().then((String value) {
      setState(() { _counterCache = value;} );
    });

    storage.readExternalCounter().then((String value) {
      setState(() { _counterExternal = value;} );
    });
  }

  Future<File> _incrementDefCounter()  {
    setState(() {
      _counterDef += "_1";
      outputController.text = _counterDef;
    });
    return storage.writeDefCounter(_counterDef);
  }

  Future<File> _incrementCacheCounter()  {
    setState(() {
      _counterCache += "_1c";
      outputController.text = _counterCache;
    });
    return storage.writeCacheCounter(_counterCache);
  }

  Future<File> _incrementExternalCounter()  {
    setState(() {
      _counterExternal += "_1e";
      outputController.text = _counterExternal;
    });
    return storage.writeExternalCounter(_counterExternal);
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
                  onPressed: _incrementCacheCounter,
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
                      storage.getDefaultPath().then((String value) {
                        defaultPath = value;
                        outputController.text = "Current app path - " + defaultPath  + "\n";
                      });
                  },
                ),
                ElevatedButton(
                    child: Text("Get cache file path", style: TextStyle(fontSize: 22)),
                    onPressed: () async {
                      storage.getCachePath().then((String value) {
                        cachePath = value;
                        outputController.text = "Current cache path - " + cachePath + "\n";
                      });
                    },
                ),
                ElevatedButton(
                  child: Text("Get external file path", style: TextStyle(fontSize: 22)),
                  onPressed: () async {
                    storage.getExternalPath().then((String value) {
                      externalPath = value;
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