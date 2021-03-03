import 'package:flutter/material.dart';

main(List<String> args) {

  DeepHouseTrack numberOne = new DeepHouseTrack("2", "3:14");
  DeepHouseTrack numberTwo = new DeepHouseTrack.belahoTrack("Concrete Jungles", "5:09");
  DeepHouseTrack numberThree = new DeepHouseTrack("1", "3:33");

  List<DeepHouseTrack> randomTracks = new List<DeepHouseTrack>();
  randomTracks.add(numberOne);
  randomTracks.add(numberTwo);
  randomTracks.add(numberThree);

  randomTracks.removeAt(0);
  print("Deleted first track from tracklist. It is still here? ${randomTracks.contains(numberOne)}");

  print("RandomTracks List - $randomTracks");
  Set <DeepHouseTrack> someSet = Set.from(randomTracks);
  print("Something from SET - ${someSet.first.name}\n");
  print("Something from SET - ${someSet.elementAt(1).name} + ${someSet.elementAt(1).lengthInMinutes}");

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
    for(int i = 0; i < bruh.tracks.length; i++) {
      bruh.playTracks(command[6]);
    }
  }
  on RangeError{
    print("How does it happened?");
    print("Fixed with ON!");
    for(int i = 0; i < bruh.tracks.length; i++) {
      bruh.playTracks(command[i]);
    }
  }
  catch (e){
    print("Fixed with CATCH!");
    for(int i = 0; i < bruh.tracks.length; i++) {
      bruh.playTracks(command[i]);
    }
  }

  // MIXINS WHERE
  numberOne.showMusicService();
  bruh.setCopyrited = "@Belaho";
  bruh.setLabel = "American Radio";

  MusicAlbumStandard someAlbumStandart = new MusicAlbumStandard();
  someAlbumStandart.setLabel = "123";
}

double costInRubles(int amount) {
  return 2.61 * 5.99 * amount;
}

abstract class Genre {
  void showGenre();
}

class DeepHouse implements Genre {
  @override
  void showGenre() {
    print("Deep House");
  }
}

mixin TrackStandardSpotify{
  String standardLength = "3:00";
  String musicService = "Spotify";

  void showMusicService() => print("You can listen this track on $musicService");
}

class MusicAlbumStandard {
  String copyrited;
  String label;

  set setCopyrited(String value) => copyrited = value;
  set setLabel(String value) => label = value;

  void showInfo(){
    print("LABEL - $label; Copyrited - $copyrited");
  }
}

class DeepHouseTrack extends DeepHouse with TrackStandardSpotify {
  String lengthInMinutes;
  String name;

  static double cost;
  static String releaseDate;

  static set setCost(double value) => cost = value;
  double get getCost => cost;

  set setDate(String release) => releaseDate = release;
  String get getReleaseDate => releaseDate;

  DeepHouseTrack(this.name, this.lengthInMinutes);

  DeepHouseTrack.nonamed()
      : lengthInMinutes = "none",
        name = "none";

  DeepHouseTrack.belahoTrack(String _name, String _album)
      : lengthInMinutes = "4:20",
        name = _name;

  double buyOne({int amount = 1}) {
    return cost * amount;
  }

  double buySome( {int amount, String buyer} ) {
    print("Thanks for buying, $buyer!");
    return cost * amount;
  }

  double buyWithBelRubles(Function someFunc, int amount) {
    return someFunc(amount);
  }

  void summaryInfo() {
    print("Name --- $name\n" +
        "Length --- $lengthInMinutes\n");
  }
}

class MusicAlbum with MusicAlbumStandard{
  List<DeepHouseTrack> tracks;
  String albumName;
  static double price;

  static set setPrice(double value) => price = value;
  set setTracks(List<DeepHouseTrack> value) => tracks = value;

  static void checkPrice() {
    if(price > 59.99) { print("Price is too high!"); } else { print("Price is affordable"); }
  }

  MusicAlbum(this.tracks, this.albumName);
  MusicAlbum.template()
    : tracks = null,
      albumName = "noname";

  void playTracks(String select) {
    int currentTrack = 0;
    try {

      if(this.tracks.isNotEmpty) {

        switch(select){

          firstOne: case "first":
            print("Current track: ${this.tracks[0].name}");
            currentTrack = 0;
            break;

          case "next":
            if(this.tracks.length > currentTrack - 1) {
              print("Current track: ${this.tracks[currentTrack + 1].name}");
              currentTrack++;
            } else { continue firstOne; }
            break;

          case "last":
            print("Last one: ${this.tracks[this.tracks.length - 1].name}");
            currentTrack = this.tracks.length - 1;
            break;

          case "back":
            print(this.tracks[currentTrack - 1].name);
            currentTrack--;
            break;

          default:
            break;
        }
      }
    }
    on Exception{ print("Error!"); }
  }
}

class Artist {
  List<MusicAlbum> albums;
  String name;

  Artist(this.albums, this.name);

  void showSongsInAlbum(String _albumName) {
    print("==== Presenting you the tracks of artist ${this.name} ====");
    for (int i = 0; i < albums.length; i++) {

      if(albums.elementAt(i).albumName == _albumName) {

        for(int j = 0; j < albums.elementAt(i).tracks.length; j++) {
          print("Track name - ${albums.elementAt(i).tracks.elementAt(j).name}");
          print("Length(min) - ${albums.elementAt(i).tracks.elementAt(j).lengthInMinutes}\n");
        }
      }
      else { print("No such album"); }
    }
  }

}
