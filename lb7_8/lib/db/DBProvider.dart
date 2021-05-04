import 'dart:io';

import 'package:lb7_8/model/DeepHouseTrack.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {

  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB2.db");

    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE Track("
          "id INTEGER PRIMARY KEY, "
          "name TEXT, "
          "length_in_minutes TEXT)",
      );
    });
  }

  newTrack(DeepHouseTrack newTrack) async {
    final db = await database;
    var res = await db.insert("Track", newTrack.toMap());
    return res;
  }

  Future<DeepHouseTrack> getTrack(int id) async {
    final db = await database;
    var res = await  db.query("Track", where: "id = ?", whereArgs: [id]);
    DeepHouseTrack someTrack = res.isNotEmpty ? DeepHouseTrack.fromMap(res.first) : Null ;
    return someTrack;
  }

  Future<List<DeepHouseTrack>> getAllTracks() async {
    final db = await database;
    var res = await db.query("Track");
    List<DeepHouseTrack> list =
    res.isNotEmpty ? res.map((c) => DeepHouseTrack.fromMap(c)).toList() : [];
    return list;
  }

  updateTrack(DeepHouseTrack newTrack) async {
    final db = await database;
    var res = await db.update("Track", newTrack.toMap(),
        where: "id = ?", whereArgs: [newTrack.id]);
    return res;
  }

  deleteTrack(int id) async {
    final db = await database;
    db.delete("Track", where: "id = ?", whereArgs: [id]);
  }
}