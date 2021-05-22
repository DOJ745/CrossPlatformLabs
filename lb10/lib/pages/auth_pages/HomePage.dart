import 'package:flutter/material.dart';
import 'package:lb10/firebase/auth/BaseAuth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    }
    catch (e) { print(e); }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('LB10 (Home)'),
        actions: <Widget>[
          new FlatButton(
              child: Text('Logout',
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white
                  )
              ),
              onPressed: _signOut)
        ],
      ),
      body: Center(
        child: Text(
            "Hello user",
          style: TextStyle(
            fontSize: 22,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}