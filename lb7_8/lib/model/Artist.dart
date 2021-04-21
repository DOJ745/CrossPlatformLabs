import 'MusicAlbum.dart';

class Artist implements Comparable {

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

  @override
  int compareTo(Object _artist) {
    int result = 0;
    if(_artist != null) {
      Artist compareArtist = _artist;
      result = this.name == compareArtist.name ? 1 : 0;
    }
    else { result = 0; }
    return result;
  }

}