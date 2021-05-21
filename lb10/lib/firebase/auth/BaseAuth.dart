import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String password);
  Future<User> getCurrentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth {

  //final FirebaseAuth firebaseAuth;
  //Auth(this.firebaseAuth);

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    User user = (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)) as User;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    User user = (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)) as User;
    return user.uid;
  }

  Future<User> getCurrentUser() async {
    User user = firebaseAuth.currentUser;
    return user;
  }

  Future<void> signOut() async {
    return firebaseAuth.signOut();
  }
}