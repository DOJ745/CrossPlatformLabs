abstract class Genre {
  void showGenre();
}

class DeepHouse implements Genre {
  @override
  void showGenre() {
    print("Deep House");
  }
}

mixin TrackStandardSpotify {
  String standardLength = "3:00";
  String musicService = "Spotify";

  void showMusicService() => print("You can listen this track on $musicService");
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

  double buySome({int amount, String buyer}) {
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

  DeepHouseTrack.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        lengthInMinutes = json['lengthInMinutes'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lengthInMinutes': lengthInMinutes,
    };
  }
}