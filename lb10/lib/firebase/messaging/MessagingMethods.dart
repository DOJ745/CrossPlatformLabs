import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb10/pages/MessagingPage.dart';

/*
class MessagingMethods {

  Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      final dynamic notification = message['notification'];
    }
  }

  final Map<String, Item> _items = <String, Item>{};
  Item _itemForMessage(Map<String, dynamic> message) {
    final dynamic data = message['data'] ?? message;
    final String itemId = data['id'];
    final Item item = _items.putIfAbsent(itemId, () => Item(itemId: itemId))
      .._matchteam = data['matchteam']
      .._score = data['score'];
    return item;
  }
}



class Item {

  Item({this.itemId});

  final String itemId;

  StreamController<Item> _controller = StreamController<Item>.broadcast();

  Stream<Item> get onChanged => _controller.stream;

  String _matchteam;

  String get matchteam => _matchteam;

  set matchteam(String value) {
    _matchteam = value;
    _controller.add(this);
  }

  String _score;

  String get score => _score;

  set score(String value) {
    _score = value;
    _controller.add(this);
  }

  static final Map<String, Route<void>> routes = <String, Route<void>>{};

  Route<void> get route {
    final String routeName = '/detail/$itemId';
    return routes.putIfAbsent(
      routeName,
          () =>
          MaterialPageRoute<void>(
            settings: RouteSettings(name: routeName),
            builder: (BuildContext context) => MessagingPage(itemId),
          ),
    );
  }

}*/