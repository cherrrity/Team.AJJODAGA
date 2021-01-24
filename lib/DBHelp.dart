import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:project_moonhwadiary/name.dart';

final String tableName = 'diarys';

class DBHelper {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
        join(await getDatabasesPath(), 'diary.db'),

        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE tasks(생성할 열 이름 자료형)',
          );
        },
        version: 1);
    return _db;
  }
  Future<void> insertDiary(Diary diary) async {
    final db = await database;

    await db.insert(
      tableName,
      diary.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Diary>> diarys() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('diarys');

    // List<Map<String, dynamic>를 List<diary>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return Diary(
        dateTime: maps[i]['dateTime'],
        feel: maps[i]['feel'],
      );
    });
  }


  Future<void> updateDiary(Diary diary) async {
    final db = await database;

    // 주어진 Diary를 수정합니다.
    await db.update(
      tableName,
      diary.toMap(),
      // Diary의 dateTime가 일치하는 지 확인합니다.
      where: "dateTime = ?",
      // Diary의 dateTime를 whereArg로 넘겨 SQL injection을 방지합니다.
      whereArgs: [diary.dateTime],
    );
  }

  Future<void> deleteDiary(String day) async {
    final db = await database;

    // 데이터베이스에서 Diary를 삭제합니다.
    await db.delete(
      tableName,
      // 특정 diary를 제거하기 위해 `where` 절을 사용하세요
      where: "dateTime = ?",
      // Diary의 dateTime를 where의 인자로 넘겨 SQL injection을 방지합니다.
      whereArgs: [day],
    );
  }

  Future<List<Diary>> findDiary(String dateTime) async {
    final db = await database;

    // 모든 Diary를 얻기 위해 테이블에 질의합니다.
    final List<Map<String, dynamic>> maps =
    await db.query('diarys', where: 'dateTime = ?', whereArgs: [dateTime]);

    // List<Map<String, dynamic>를 List<Diary>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return Diary(
        dateTime: maps[i]['dateTime'],
        feel: maps[i]['feel'],
      );
    });
  }


}
