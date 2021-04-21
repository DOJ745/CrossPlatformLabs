class DeepHouseTrack {

  int id;
  String lengthInMinutes;
  String name;

  DeepHouseTrack(this.name, this.lengthInMinutes);

  DeepHouseTrack.nonamed()
      : lengthInMinutes = "none",
        name = "none";

  DeepHouseTrack.belahoTrack(String _name, String _album)
      : lengthInMinutes = "4:20",
        name = _name;

  void showGenre() {
    print("Deep House");
  }

  @override
  String toString() {
    return 'DeepHouse {Id: $id, '
        'LengthInMinutes: $lengthInMinutes, '
        'Name: $name}';
  }
}