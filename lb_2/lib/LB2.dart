import 'package:flutter/material.dart';

main(List<String> args) {

  DeepHouseTrack test2 = new DeepHouseTrack.belahoTrack("Nothing to see", "BRUH");

  test2.summaryInfo();
  test2.setCost = 5.99;
  test2.setDate = "21.04.2021";

  print("Release date - ${test2.getReleaseDate}");
  print("Track cost - ${test2.getCost}");
  print("Bought one copy - ${test2.buyOne()}");
  print("Buy some - ${test2.buySome(amount: 3, buyer: "ME")}");

  print("Buy with bela rubles( - ${test2.buyWithBelRubles(costInRubles, 6)}");
}

double costInRubles(double amount){
  return 2.61 * amount;
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

class DeepHouseTrack extends DeepHouse {
  String artistName;
  String album;
  String lengthInMinutes;
  String name;

  static double cost;
  static String releaseDate;

  set setCost(double value) => cost = value;
  double get getCost => cost;

  set setDate(String release) => releaseDate = release;
  String get getReleaseDate => releaseDate;

  DeepHouseTrack(this.name, this.artistName, this.album, this.lengthInMinutes);

  DeepHouseTrack.nonamed()
      : artistName = "unknown",
        album = "none",
        lengthInMinutes = "none",
        name = "none";

  DeepHouseTrack.belahoTrack(String _name, String _album)
      : artistName = "Belaho",
        lengthInMinutes = "4:20",
        album = _album,
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
        "Artist --- $artistName\n" +
        "Album --- $album\n" +
        "Length --- $lengthInMinutes\n");
  }
}
