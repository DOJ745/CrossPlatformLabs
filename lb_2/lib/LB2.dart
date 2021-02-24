main(List<String> args) {
  DeepHouseTrack test2 =
  new DeepHouseTrack.belahoTrack("Nothing to see", "BRUH");

  test2.summaryInfo();
  test2.setCost = 5.99;
  print("Track cost - ${test2.getCost}");
  print("Bought - ${test2.buyOne()}");
  //test2.showGenre("1234");

  House test3 = new House();
  test3.showGenre("444");
}

abstract class Genre {
  void showGenre();
}

class House extends Genre {
  void showGenre(String customGenre) {
    print("CUSTOM SHOW - $customGenre");
  }
}

class DeepHouse implements Genre {
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

  double buySome({int amount, String buyer}) {
    print("Thanks for buying $buyer!");
    return cost * amount;
  }

  double buyWithBelRubles(double _buySome()) {}

  void summaryInfo() {
    print("Name --- $name\n" +
        "Artist --- $artistName\n" +
        "Album --- $album\n" +
        "Length --- $lengthInMinutes\n");
  }
}
