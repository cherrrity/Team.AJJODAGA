import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:project_moonhwadiary/photo.dart';

final String tableName = 'pic';

class DBHelper2 {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
        join(await getDatabasesPath(), 'pic.db'),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE pic(id TEXT PRIMARY KEY, pic TEXT)",
          );
        },
        version: 1);
    return _db;
  }
  Future<void> insertPhoto(Photo photo) async {
    final db = await database;

    await db.insert(
      tableName,
      photo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Photo>> pic() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('pic');

    return List.generate(maps.length, (i) {
      return Photo(
        id: maps[i]['id'],
        pic: maps[i]['pic'],
      );
    });
  }

  Future<void> updatePhoto(Photo photo) async {
    final db = await database;

    await db.update(
      tableName,
      photo.toMap(),

      where: "id = ?",

      whereArgs: [photo.id],
    );
  }

  Future<void> deletePhoto(String id) async {
    final db = await database;

    await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<Photo>> findPhoto(String id) async {
    final db = await database;

    final List<Map<String, dynamic>> maps =
    await db.query('photos', where: 'pic = ?', whereArgs: [id]);

    return List.generate(maps.length, (i) {
      return Photo(
        id: maps[i]['id'],
        pic: maps[i]['pic'],
      );
    });
  }


}
