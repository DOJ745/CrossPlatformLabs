import 'DeepHouse.dart';

class MusicAlbumStandard implements Iterator{
  String copyrited;
  String label;
  List<String> productions = new List<String>();

  set setCopyrited(String value) => copyrited = value;
  set setLabel(String value) => label = value;

  void showInfo(){
    print("LABEL - $label; Copyrited - $copyrited");
  }

  @override
  get current => this.productions.last;

  @override
  bool moveNext() {
    if(current != this.productions.first) {
      this.productions.removeLast();
      return true;
    }
    else return false;
  }
}

class MusicAlbum with MusicAlbumStandard {
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