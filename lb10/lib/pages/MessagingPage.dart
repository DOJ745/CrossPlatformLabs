import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb10/firebase/messaging/PushNotification.dart';
import 'package:overlay_support/overlay_support.dart';

class MessagingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyMessagingPage(title: 'LB10 (Messaging)'),
    );
  }
}

class MyMessagingPage extends StatefulWidget {

  final String title;
  MyMessagingPage({Key key, this.title}) : super(key: key);


  @override
  _MyMessagingPageState createState() => _MyMessagingPageState();
}

class _MyMessagingPageState extends State<MyMessagingPage> {

  int _totalNotifications;
  PushNotification _notificationInfo = new PushNotification();

  @override
  void initState() {
    super.initState();

    _totalNotifications = 0;

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {

      if (message != null) {

        setState(() {
          _notificationInfo.title = message.data["title"];
          _notificationInfo.body = message.data["body"];
          _notificationInfo.dataTitle = message.data["dataTitle"];
          _notificationInfo.dataBody = message.data["dataBody"];
          _totalNotifications++;
        });
      }
    });

    /*FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      print('GOT a message whilst in the foreground!');
      print('MESSAGE data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');

        setState(() {
          _notificationInfo.title = message.data["title"];
          _notificationInfo.body = message.data["body"];
          _notificationInfo.dataTitle = message.data["dataTitle"];
          _notificationInfo.dataBody = message.data["dataBody"];
          _totalNotifications++;
        });
      }

    });*/

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            visualDensity:VisualDensity.adaptivePlatformDensity
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            brightness: Brightness.light,
          ),
          body: /*FutureBuilder(
            future: getMsgData(),
            builder: (context, AsyncSnapshot<RemoteMessage> snapshot){
              if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {

                _totalNotifications++;
                _notificationInfo.title = snapshot.data.data["title"];
                _notificationInfo.body = snapshot.data.data["body"];
                _notificationInfo.dataTitle = snapshot.data.data["dataTitle"];
                _notificationInfo.dataBody = snapshot.data.data["dataBody"];

                return Column(
                  children: <Widget>[
                    Text("Data BODY: ${_notificationInfo.body}"),
                    Text("Data TITLE: ${_notificationInfo.title}"),
                    Text("dataBody: ${_notificationInfo.dataBody}"),
                    Text("dataTitle: ${_notificationInfo.dataTitle}"),
                    Text("Count: $_totalNotifications"),
                  ],
                );
              }

              else if (snapshot.connectionState == ConnectionState.none) {
                return Text("No data");
              }

              return CircularProgressIndicator();
            }

          )*/ Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                'App for capturing Firebase Push Notifications',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 16.0),
              NotificationBadge(totalNotifications: _totalNotifications),
              SizedBox(height: 16.0),

              _notificationInfo != null ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'TITLE: ${_notificationInfo.title}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 8.0),

                  Text(
                    'DATA TITLE: ${_notificationInfo.dataTitle}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 8.0),

                  Text(
                    'BODY: ${_notificationInfo.body}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 8.0),

                  Text(
                    'DATA BODY: ${_notificationInfo.dataBody}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                ],
              )
                  : Container(),
            ],
          ),
        ),
    );
  }
}

class NotificationBadge extends StatelessWidget {

  final int totalNotifications;
  const NotificationBadge({@required this.totalNotifications});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$totalNotifications',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

Future<RemoteMessage> getMsgData() async {
  return FirebaseMessaging.instance.getInitialMessage();
}
