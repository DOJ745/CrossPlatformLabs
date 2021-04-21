import 'DeepHouse.dart';

class MusicAlbumStandard implements Iterator {

  String copyrited;
  String label;
  List<String> productions = new List<String>();

  set setCopyrited(String value) => copyrited = value;
  set setLabel(String value) => label = value;

  void showInfo(){
    print("LABEL - $label; Copyrited - $copyrited");
  }

  var _index = 0;

  @override
  get current => this.productions[_index++];
  @override
  bool moveNext() => _index < this.productions.length;

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
}