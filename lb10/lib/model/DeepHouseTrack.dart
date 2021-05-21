class DeepHouseTrack {

  String lengthInMinutes;
  String name;

  DeepHouseTrack({
    this.name,
    this.lengthInMinutes
  });

  DeepHouseTrack.nonamed()
      : lengthInMinutes = "none",
        name = "none";

  DeepHouseTrack.belahoTrack(String _name, String _album)
      : lengthInMinutes = "4:20",
        name = _name;

  void showGenre() {
    print("Deep House");
  }

  factory DeepHouseTrack.fromMap(Map<String, dynamic> json) => new DeepHouseTrack(
    name: json["name"],
    lengthInMinutes: json["length_in_minutes"],
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'length_in_minutes': lengthInMinutes,
    };
  }

  @override
  String toString() {
    return 'DeepHouse {'
        'LengthInMinutes: $lengthInMinutes, '
        'Name: $name}';
  }
}