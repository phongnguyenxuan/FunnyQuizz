import 'package:something/config/player.dart';
import 'package:sqflite/sqflite.dart';

class PlayerDB {
  static Database? _database;
  static const String kTableName = "scoreTable";
  static const String kScore = "score";
  static const String kName = "name";

  static Future<void> initDB() async {
    if (_database != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + "highscore.db";
      _database = await openDatabase(
        _path,
        version: 1,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE $kTableName("
            "$kScore INTEGER, "
            "$kName TEXT)",
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Player? player) async {
    print("insert");
    return await _database?.insert(kTableName, player!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _database!.query(kTableName);
  }
}
