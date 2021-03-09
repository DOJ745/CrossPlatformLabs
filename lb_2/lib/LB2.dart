//import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'Artist.dart';
import 'DeepHouse.dart';
import 'MusicAlbum.dart';
import 'IterableCollection.dart';

main(List<String> args) {
  print("======== LB2 PART ========\n");
  DeepHouseTrack numberOne = new DeepHouseTrack("2", "3:14");
  DeepHouseTrack numberTwo = new DeepHouseTrack.belahoTrack(
      "Concrete Jungles", "5:09");
  DeepHouseTrack numberThree = new DeepHouseTrack("1", "3:33");

  List<DeepHouseTrack> randomTracks = new List<DeepHouseTrack>();
  randomTracks.add(numberOne);
  randomTracks.add(numberTwo);
  randomTracks.add(numberThree);

  randomTracks.removeAt(0);
  print("Deleted first track from tracklist. It is still here? ${randomTracks
      .contains(numberOne)}");

  print("RandomTracks List - $randomTracks");
  Set <DeepHouseTrack> someSet = Set.from(randomTracks);
  print("Something from SET - ${someSet.first.name}\n");
  print("Something from SET - ${someSet
      .elementAt(1)
      .name} + ${someSet
      .elementAt(1)
      .lengthInMinutes}");

  MusicAlbum bruh = new MusicAlbum(randomTracks, "BRUH");
  List<MusicAlbum> belahoAlbums = new List<MusicAlbum>();

  MusicAlbum.setPrice = 79.99;
  MusicAlbum.checkPrice();

  belahoAlbums.add(bruh);

  Artist belaho = new Artist(belahoAlbums, "BELAHO");
  belaho.showSongsInAlbum("BRUH");

  List<String> command = new List<String>();
  command.add("first");
  command.add("next");
  command.add("last");


  try {
    for (int i = 0; i < bruh.tracks.length; i++) {
      bruh.playTracks(command[6]);
    }
  }
  on RangeError {
    print("How does it happened?");
    print("Fixed with ON!");
    for (int i = 0; i < bruh.tracks.length; i++) {
      bruh.playTracks(command[i]);
    }
  }
  catch (e) {
    print("Fixed with CATCH!");
    for (int i = 0; i < bruh.tracks.length; i++) {
      bruh.playTracks(command[i]);
    }
  }

  print("======== LB3 PART ========\n");

  print("======== MIXINS ========\n");
  numberOne.showMusicService();
  bruh.setCopyrited = "@Belaho";
  bruh.setLabel = "American Radio";

  MusicAlbumStandard someAlbumStandart = new MusicAlbumStandard();
  someAlbumStandart.setLabel = "123";
  List<String> forAlbum = new List<String>();
  forAlbum.add("HJ");
  forAlbum.add("PJ");
  forAlbum.add("AAC");
  someAlbumStandart.productions = forAlbum;

  print("======== COMPARABLE ========\n");
  Artist fakeBelaho = new Artist(belahoAlbums, "BELAHO123");
  if (belaho.compareTo(fakeBelaho) == 0) {
    print("Compare result - ${ belaho.compareTo(
        fakeBelaho) } => we found fake artist");
  }
  else {
    print("Compare result - ${ belaho.compareTo(
        fakeBelaho) } => we found same artist");
  }

  print("======== ITERATOR ========\n");
  while (someAlbumStandart.moveNext()) {
    print("IRERATOR - ${ someAlbumStandart.current.toString() }");
  }

  print("======== ITERABLE ========\n");
  var iterableClass = IterableCollection();
  iterableClass.iterableCollection.add(IterableCollection());
  iterableClass.iterableCollection.add(IterableCollection());
  iterableClass.iterableCollection.add(IterableCollection());
  iterableClass.iterableCollection.add(IterableCollection());

  print("Length of iterable class - ${iterableClass.length}");
  print("Iterable class - ${iterableClass.elementAt(0)}");

  print("======== JSON ========\n");
  print(" ${jsonEncode(numberOne.toJson())} \n");

  print("======== FUTURE ========\n");
  Future<double> future1 = Future( () { return 2015.2510; } );
  future1.then((value){ print("Somethings coming from Future ONE: $value"); });

  getDataFromFuture();

  Future<String> future2 = Future.delayed(Duration(seconds: 5), () => "Hello from Future");
  future2.then((value){ print("Somethings coming from Future TWO: $value");});

  print("======== STREAMS ========\n");


  print("======== SINGLE ========\n");
  Stream<String> stream = new Stream.fromFuture(getDataFromFuture());
  print("Created the stream");

   stream.listen((data) { print("DataReceived: " + data); },
       onDone: () { print("--- Task Done ---"); },
       onError: (error) { print("Some Error"); });

  print("Code Controller 1 Is Here");

  print("======== BROADCAST ========\n");
  StreamController<String> streamController = new StreamController.broadcast();
  print("Created a broadcast StreamController");

  print("======== SUBSCRIPTION ONE ========\n");
  streamController.stream.listen((data) { print("DataReceived ONE: " + data); },
      onDone: () { print("--- Task ONE Done ---"); },
      onError: (error) { print("Some Error ONE"); });

  print("======== SUBSCRIPTION TWO ========\n");
  streamController.stream.listen((data) { print("DataReceived TWO: " + data); },
      onDone: () { print("--- Task TWO Done ---"); },
      onError: (error) { print("Some Error TWO"); });

  streamController.add("TEST");
  print("\n=== Code Controller 2 Is Here ===\n");
}


double costInRubles(int amount) {
  return 2.61 * 5.99 * amount;
}

Future<String> getDataFromFuture() async {
  await Future.delayed(Duration(seconds: 10));
  print("Fetched Future Data");
  return "Future is now";
}

