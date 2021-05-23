import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb10/firebase/messaging/PushNotification.dart';
import 'package:overlay_support/overlay_support.dart';

/*
Future<dynamic> _firebaseMessagingBackgroundHandler(
    Map<String, dynamic> message,) async {
  await Firebase.initializeApp();
  print('onBackgroundMessage received: $message');
}*/

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

  // Test
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  int _totalNotifications;
  PushNotification _notificationInfo;

  void testMethod() async {

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      print('GOT a message whilst in the foreground!');
      print('MESSAGE data: ${message.data}');

      //_notificationInfo.body = message.data.toString();
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');


        setState(() {
          _notificationInfo.body = message.messageId;
          _totalNotifications++;
        });
      }

    });

  }

  /*void registerNotification() async {

    // For handling the received notifications
    _messaging.configure(

        onBackgroundMessage: _firebaseMessagingBackgroundHandler,

        onLaunch: (message) async {
          print('onLaunch: $message');

          PushNotification notification = PushNotification.fromJson(message);

          setState(() {
            _notificationInfo = notification;
            _totalNotifications++;
          });
        },

        onResume: (message) async {
          print('onResume: $message');

          PushNotification notification = PushNotification.fromJson(message);

          setState(() {
            _notificationInfo = notification;
            _totalNotifications++;
          });
        },

        onMessage: (message) async {

          print('onMessage received: $message');

          // For displaying the notification as an overlay
          showSimpleNotification(
            Text(_notificationInfo.title),
            leading: NotificationBadge(totalNotifications: _totalNotifications),
            subtitle: Text(_notificationInfo.body),
            background: Colors.cyan[700],
            duration: Duration(seconds: 5),
          );

          // Parse the message received
          PushNotification notification = PushNotification.fromJson(message);

          setState(() {
            _notificationInfo = notification;
            _totalNotifications++;
          });

        });

    _messaging.getToken().then((token) { print('Token: $token'); } )
        .catchError((e) { print(e); } );
  }*/

  @override
  void initState() {
    _totalNotifications = 0;
    super.initState();

    /*RemoteMessage initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();


    if (initialMessage?.data['type'] == 'chat') {
      Navigator.pushNamed(context, '/chat',
          arguments: ChatArguments(initialMessage));*/
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
          body: Column(
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
                    'TITLE: ${_notificationInfo.title ?? _notificationInfo.dataTitle}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 8.0),

                  Text(
                    'BODY: ${_notificationInfo.body ?? _notificationInfo.dataBody}',
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
