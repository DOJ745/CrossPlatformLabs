import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb10/firebase/auth/BaseAuth.dart';

import 'HomePage.dart';
import 'LoginSignUpPage.dart';


// https://coderlessons.com/articles/mobilnaia-razrabotka-articles/uchebnik-po-autentifikatsii-flutter-firebase

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyAuthPage(auth: new Auth(), title: 'LB10 (Firestore)'),
    );
  }
}

class MyAuthPage extends StatefulWidget {

  final BaseAuth auth;
  final String title;

  MyAuthPage({this.auth, this.title});

  @override
  State<StatefulWidget> createState() => new _MyAuthPageState();
}

enum AuthStatus {
  NOT_DETERMINED,
  LOGGED_OUT,
  LOGGED_IN,
}

class _MyAuthPageState extends State<MyAuthPage> {

  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState() {

    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        //else{
          authStatus = user?.uid == null ? AuthStatus.LOGGED_OUT : AuthStatus.LOGGED_IN;
        //}
      });
    });
  }

  void _onLoggedIn() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void _onSignedOut() {
    setState(() {
      authStatus = AuthStatus.LOGGED_OUT;
      _userId = "";
    });
  }

  Widget progressScreenWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {

      case AuthStatus.NOT_DETERMINED:
        return progressScreenWidget();
        break;

      case AuthStatus.LOGGED_OUT:
        return LoginSignupPage(
          auth: widget.auth,
          onSignedIn: _onLoggedIn,
        );
        break;

      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          return HomePage(
            userId: _userId,
            auth: widget.auth,
            onSignedOut: _onSignedOut,
          );
        }
        else
          return progressScreenWidget();
        break;

      default:
        return progressScreenWidget();
    }
  }
}

