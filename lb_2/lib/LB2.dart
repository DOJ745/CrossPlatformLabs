main(List<String> args) {

  DeepHouseTrack test2 = new DeepHouseTrack.belahoTrack("Nothing to see", "BRUH");

  test2.summaryInfo();
  test2.setCost = 5.99;
  test2.setDate = "21.04.2021";

  print("Release date - ${DeepHouseTrack.releaseDate}");
  print("Track cost - ${test2.getCost}");
  print("Bought one copy - ${test2.buyOne()}");
  print("Buy some - ${test2.buySome(amount: 3, buyer: "ME")}");

  print("Buy with belarussian rubles :-( - ${test2.buyWithBelRubles(costInRubles, 6)}");

  DeepHouseTrack numberOne = new DeepHouseTrack("2", "Belaho", "BRUH", "3:14");
  DeepHouseTrack numberTwo = new DeepHouseTrack.belahoTrack("Concrete Jungles", "BRUH");
  DeepHouseTrack numberThree = new DeepHouseTrack("1", "Belaho", "BRUH", "3:33");

  List<DeepHouseTrack> randomTracks = new List<DeepHouseTrack>();
  randomTracks.add(numberOne);
  randomTracks.add(numberTwo);
  randomTracks.add(numberThree);

  randomTracks.removeAt(0);
  print("Deleted first track from tracklist. It is still here? ${randomTracks.contains(numberOne)}");

  print("RandomTracks List - $randomTracks");
  Set <DeepHouseTrack> someSet = Set.from(randomTracks);
  print("Something from SET - ${someSet.first.artistName}\n");
  print("Something from SET - ${someSet.elementAt(1).name} + ${someSet.elementAt(1).lengthInMinutes}");

  MusicAlbum bruh = new MusicAlbum(randomTracks, "BRUH");
  List<MusicAlbum> belahoAlbums = new List<MusicAlbum>();

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
  on Exception{
    print("How does it happened?");
  }
  catch (e){
    print("Fixed!");
    for(int i = 0; i < bruh.tracks.length; i++) {
      bruh.playTracks(command[i]);
    }
  }
}

double costInRubles(int amount){
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

class MusicAlbum {
  List<DeepHouseTrack> tracks;
  String albumName;
  static double price;

  set setPrice(double value) => price = value;
  set setTracks(List<DeepHouseTrack> value) => tracks = value;

  static void checkPrice(){
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

          N1: case "first":
            print("Current track: ${this.tracks[0].name}");
            currentTrack = 0;
            break;

          case "next":
            if(this.tracks.length > currentTrack - 1) {
              print("Current track: ${this.tracks[currentTrack + 1].name}");
              currentTrack++;
            } else { continue N1; }
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
