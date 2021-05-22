import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
class MessagingPage extends StatefulWidget {
  MessagingPage(this.itemId);
  final String itemId;
  @override
  _MessagingPageState createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {

  Item _item;
  StreamSubscription<Item> _subscription;

  @override
  void initState() {

    super.initState();
    _item = _items[widget.itemId];
    _subscription = _item.onChanged.listen((Item item) {
      if (!mounted) {
        _subscription.cancel();
      } else {
        setState(() { _item = item; });
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Match ID ${_item.itemId}"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[

                          Text('Today match:', style: TextStyle(color: Colors.black.withOpacity(0.8))),

                          Text( _item.matchteam, style: Theme.of(context).textTheme.bodyText1)

                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[

                          Text('Score:', style: TextStyle(color: Colors.black.withOpacity(0.8))),

                          Text( _item.score, style: Theme.of(context).textTheme.bodyText1)

                        ],
                      ),
                    ),

                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}*/
