import 'package:cloud_firestore/cloud_firestore.dart';

class DeepHouseTrack {

  int id;
  String lengthInMinutes;
  String name;

  DeepHouseTrack({
    this.name,
    this.lengthInMinutes,
    this.id
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

  static DeepHouseTrack fromDoc(QueryDocumentSnapshot doc) {
    return DeepHouseTrack(
      id: doc['id'],
      name: doc['name'],
      lengthInMinutes: doc['lengthInMinutes'],
    );
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